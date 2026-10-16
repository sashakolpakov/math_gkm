"""Machine-authored exact source binding. Replay and compile statuses stay distinct."""
from validate_81f80b2d import R,O,sha
import json,re,hashlib
receipts=[(p,json.loads(p.read_text())) for p in sorted(O.glob('*.json')) if p.name.startswith(('build-','replay-'))]
audits=[(p,json.loads(p.read_text())) for p in O.glob('axioms-*.json')]
validation={'request_id':'81f80b2ddbc44c6e86d8079cfc7a8e81','modules':{},'excluded':{},'completion':None,'scope':'Fresh compilation of new sources over inherited compiled imports. Kernel replay status is separate per module. No whole-source rebuild or independent completion audit.'}
for s in sorted((R/'research').glob('*M81F.lean')):
 m=s.stem
 if m.startswith(('Replay','MarkovAudit')):continue
 h=sha(s);txt=s.read_text();ds=re.findall(r'^theorem\s+(\w+)',txt,re.M)
 assert not re.search(r'\b(sorry|admit|native_decide|unsafe|partial)\b|^axiom\b',txt,re.M),m
 bs=[(p,d) for p,d in receipts if d.get('mode')=='build' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 rs=[(p,d) for p,d in receipts if d.get('mode')=='replay' and d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 axs=[(p,d) for p,d in audits if d['sources'].get(m)==h and all(n in d['declarations'] for n in ds)]
 if not bs or not axs:
  validation['excluded'][m]={'source_sha256':h,'compiled':bool(bs),'axiom_audited':bool(axs),'reason':'Not in final checked set; missing matching successful source compile or axiom receipt.'};continue
 validation['modules'][m]={'source':str(s.relative_to(R)),'source_sha256':h,'olean_sha256':sha(O/f'{m}.olean'),'build':str(bs[-1][0].relative_to(R)),'replay':str(rs[-1][0].relative_to(R)) if rs else None,'axiom_audit':str(axs[-1][0].relative_to(R)),'theorems':ds}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before={p:h for p,h in json.loads((O/'before.json').read_text()).items() if '81f80b2d' not in p and 'M81F' not in p};changed=[p for p,h in before.items() if not (R/p).exists() or sha(R/p)!=h]
assert not changed,changed
oldchecks={}
for tag in ['d11e335e','5703599b']:
 man=json.loads((R/f'evidence/markov-{tag}/manifest.json').read_text());assert all((R/p).exists() and sha(R/p)==h for p,h in man.items());oldchecks[tag]=len(man)
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
c=json.loads((R/'.control/markov/contract.json').read_text());ch=hashlib.sha256(json.dumps(c,sort_keys=True,separators=(',',':')).encode()).hexdigest();assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
summary={'request_id':validation['request_id'],'compiled_and_axiom_audited_modules':len(validation['modules']),'replayed_modules':sum(v['replay'] is not None for v in validation['modules'].values()),'audited_theorem_closures':sum(len(v['theorems']) for v in validation['modules'].values()),'excluded_sources':list(validation['excluded']),'unchanged_prior_inputs':len(before),'inherited_artifacts':oldchecks,'unsuccessful_receipts':sum(d.get('returncode')!=0 for p,d in receipts),'root_sha256':root,'canonical_contract_hash':ch,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None}
(O/'final-check.json').write_text(json.dumps(summary,indent=2)+'\n')
manifest={str(p.relative_to(R)):sha(p) for p in O.rglob('*') if p.is_file() and p.name not in ['manifest.json','last-verification.json']}
manifest.update({str(p.relative_to(R)):sha(p) for p in (R/'research').iterdir() if p.is_file() and ('81f80b2d' in p.name or 'M81F' in p.name)})
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'verified_artifacts':len(manifest),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'canonical_contract_hash':ch},indent=2)+'\n')
print(json.dumps(summary));print('Verified artifacts',len(manifest))
