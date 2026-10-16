"""Machine-authored source/receipt binding and preservation checks."""
from validate_ce882be3 import R,O,sha
import json,re,time
mods=json.loads((O/'mathematical-modules.json').read_text())
receipts=[]
for p in O.glob('*.json'):
 if p.name.startswith(('build-','replay-')):
  d=json.loads(p.read_text());receipts.append((p,d))
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
validation={'modules':{},'completion':None,'scope':'New-source compilation and isolated kernel replay over inherited compiled imports; no fresh whole-source rebuild or independent completion audit.'}
for m in mods:
 s=R/'research'/f'{m}.lean';h=sha(s);txt=s.read_text()
 assert not re.search(r'\b(sorry|admit|native_decide|unsafe|partial)\b|^axiom\b',txt,re.M),m
 ds=re.findall(r'^theorem\s+(\w+)',txt,re.M)
 builds=[(p,d) for p,d in receipts if d.get('mode')=='build' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 replays=[(p,d) for p,d in receipts if d.get('mode')=='replay' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 axs=[(p,d) for p,d in audits if d['sources'].get(m)==h and all(n in d['declarations'] for n in ds)]
 assert builds and replays and axs,(m,len(builds),len(replays),len(axs))
 validation['modules'][m]={'source':str(s.relative_to(R)),'source_sha256':h,'olean_sha256':sha(O/f'{m}.olean'),'build':str(builds[-1][0].relative_to(R)),'replay':str(replays[-1][0].relative_to(R)),'axiom_audit':str(axs[-1][0].relative_to(R)),'theorems':ds}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before=json.loads((O/'before.json').read_text());changed=[];checked=0
for p,h in before.items():
 if 'ce882be3' in p or 'MCE8' in p:continue
 checked+=1
 if not (R/p).exists() or sha(R/p)!=h:changed.append(p)
assert not changed,changed
root=sha(R/'MathGKM/Markov.lean')
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=json.loads((R/'.control/markov/contract.json').read_text())
import hashlib
ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc',ch
oldchecks={}
for tag in ['263d8c71','b9d0d341']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text())
 bad=[p for p,h in man.items() if not (R/p).exists() or sha(R/p)!=h]
 assert not bad,bad
 oldchecks[tag]=len(man)
summary={'request_id':'ce882be3be764bbea0eaabd905e3bf18','compiled_and_replayed_mathematical_modules':len(mods),'audited_theorem_closures':sum(len(x['theorems']) for x in validation['modules'].values()),'unchanged_prior_inputs':checked,'changed_prior_inputs':changed,'rechecked_inherited_artifacts':oldchecks,'unsuccessful_build_receipts':sum(d.get('mode')=='build' and d.get('returncode')!=0 for p,d in receipts),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None,'scope':validation['scope']}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
manifest={}
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:manifest[str(p.relative_to(R))]=sha(p)
for p in (R/'research').iterdir():
 if p.is_file() and ('ce882be3' in p.name or 'MCE8' in p.name):manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists()},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
