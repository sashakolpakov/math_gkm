"""Machine-authored final immutable evidence checks; does not change control records."""
from pathlib import Path
import json,hashlib,re,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-7e2e958e'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
sources={m:sha(R/'research'/f'{m}.lean') for m in mods}
builds=[]
for m in mods:
 ok=[]
 for p in O.glob('build-*.json'):
  d=json.loads(p.read_text())
  if d.get('returncode')==0 and d.get('modules')=={m:sources[m]}:ok.append(p)
 assert ok,m
 builds.append(str(sorted(ok)[-1].relative_to(R)))
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if d.get('returncode')==0 and d.get('modules')==sources:replays.append(p)
assert replays,'matching successful joint replay missing'
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if d.get('sources')==sources:audits.append(p)
assert audits,'matching closure audit missing'
audit=sorted(audits)[-1];ad=json.loads(audit.read_text())
assert all(set(v)<={'propext','Classical.choice','Quot.sound'} for v in ad['declarations'].values())
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|native_decide)\b|^\s*(axiom|unsafe|partial)\s',s,re.M),m
validation={'request_id':'7e2e958e791546e6988c1db8eaecb1c3','modules':mods,'sources':sources,'compiled_sha256':{m:sha(O/f'{m}.olean') for m in mods},'build_receipts':builds,'replay_receipt':str(sorted(replays)[-1].relative_to(R)),'axioms_receipt':str(audit.relative_to(R)),'closures':len(ad['declarations']),'permitted_axioms_only':True,'completion':None,'limits':'Inherited compiled imports reused. Not a fresh whole-source rebuild or independent source/English completion audit.'}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before_all=json.loads((O/'before.json').read_text())
owned_before={p:h for p,h in before_all.items() if p in ['research/setup_7e2e958e.py','research/markov-7e2e958e-checkpoint.md']}
before={p:h for p,h in before_all.items() if p not in owned_before}
changed=[p for p,h in before.items() if sha(R/p)!=h]
assert not changed,changed
idx=json.loads((R/'.control/markov/inherited.json').read_text())
assert all(sha(R/p)==v['sha256'] for p,v in idx.items())
root=sha(R/'MathGKM/Markov.lean');contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
assert contract=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
failures=[str(p.relative_to(R)) for p in O.glob('build-*.json') if json.loads(p.read_text()).get('returncode')!=0]
check={'request_id':validation['request_id'],'before_count':len(before),'changed_inputs':changed,'run_owned_files_already_present_at_snapshot':list(owned_before),'changed_run_owned_files':[p for p,h in owned_before.items() if sha(R/p)!=h],'inherited_bindings_verified':len(idx),'root_sha256':root,'contract_sha256':contract,'failed_builds_preserved':failures,'stop_file_present':(R/'.control/markov/STOP.json').exists(),'checked_at_ns':time.time_ns()}
(O/'final-check.json').write_text(json.dumps(check,indent=2)+'\n')
manifest={}
for p in O.iterdir():
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:manifest[str(p.relative_to(R))]=sha(p)
for p in (R/'research').glob('*'):
 if p.is_file() and ('7e2e958e' in p.name or 'M7E2' in p.name):manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
(O/'last-verification.json').write_text(json.dumps({'artifacts_verified':len(manifest),'unchanged_inherited_inputs':len(before),'manifest_sha256':sha(O/'manifest.json'),'root_sha256':root,'contract_sha256':contract,'completion':None},indent=2)+'\n')
print(json.dumps({'modules':len(mods),'closures':len(ad['declarations']),'artifacts':len(manifest),'unchanged_inputs':len(before),'failed_builds':len(failures),'stop_file_present':check['stop_file_present']}))
