"""Machine-authored final research-only validation manifest and input check."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text());sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
receipts=[]
for p in O.glob('build-*.json'):
 d=json.loads(p.read_text());receipts.append((p,d))
builds={}
for m,h in sources.items():
 matches=[p for p,d in receipts if d.get('returncode')==0 and d.get('modules',{}).get(m)==h]
 assert matches,m
 builds[m]=str(max(matches).relative_to(R))
 text=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide|axiom)\b',text),m
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d.get('modules')==sources and 'replay union passed' in d.get('stdout',''):replays.append(p)
assert replays
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if d.get('sources')==sources:audits.append((p,d))
assert audits
ap,ad=max(audits,key=lambda x:x[0])
assert all(set(v)<= {'propext','Classical.choice','Quot.sound'} for v in ad['declarations'].values())
decls=[n for m in mods for n in re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M)]
assert set(decls)==set(ad['declarations'])
validation={'request_id':'fee405c8897249a786084298201a14aa','modules':mods,'source_sha256':sources,'successful_builds':builds,'compiled_sha256':{m:sha(O/f'{m}.olean') for m in mods},'joint_replay':str(max(replays).relative_to(R)),'axiom_audit':str(ap.relative_to(R)),'theorem_closures':len(decls),'permitted_axioms_only':True,'unvalidated_candidate':'research/MarkovPairClearedMFEE.lean: compilation timed out; excluded from theorem modules and replay','completion':None,'limits':'Inherited compiled imports reused; not a fresh whole-source rebuild or independent English/source completion audit.'}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before=json.loads((O/'before.json').read_text());changes=[p for p,h in before.items() if sha(R/p)!=h]
assert not changes,changes
prior=json.loads((R/'evidence/markov-7e2e958e/manifest.json').read_text());prior_changes=[p for p,h in prior.items() if sha(R/p)!=h]
assert not prior_changes,prior_changes
root=sha(R/'MathGKM/Markov.lean');assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest();assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
fails=[{'receipt':str(p.relative_to(R)),'timeout':d.get('timeout',False),'returncode':d.get('returncode')} for p,d in receipts if d.get('returncode')!=0]
check={'input_files':len(before),'changed_inputs':changes,'predecessor_artifacts':len(prior),'changed_predecessor_artifacts':prior_changes,'root_sha256':root,'contract_sha256':contract,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'rejected_builds':fails,'foreground_status':'All mathematical build, replay, audit, Python and GAP sessions have terminated; no detached jobs were launched.','completion':None}
(O/'final-check.json').write_text(json.dumps(check,indent=2)+'\n')
manifest={}
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:manifest[str(p.relative_to(R))]=sha(p)
for p in (R/'research').iterdir():
 if p.is_file() and ('fee405c8' in p.name or 'MFEE' in p.name):manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
bad=[p for p,h in manifest.items() if sha(R/p)!=h];assert not bad
last={'artifacts':len(manifest),'artifact_mismatches':bad,'unchanged_inputs':len(before),'unchanged_predecessor_artifacts':len(prior),'root_sha256':root,'contract_sha256':contract,'validation_sha256':sha(O/'validation.json'),'manifest_sha256':sha(O/'manifest.json'),'completion':None}
(O/'last-verification.json').write_text(json.dumps(last,indent=2)+'\n')
print(json.dumps({'modules':len(mods),'theorem_closures':len(decls),'last_verification':last,'rejected_builds':len(fails)}))
