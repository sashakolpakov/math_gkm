"""Machine-authored final local evidence binding. Does not modify control records."""
from session_3ae33435 import R,O,sha,save
import json,re,time
mods=json.loads((O/'mathematical-modules.json').read_text())
builds={}
failed=[]
for p in sorted(O.glob('build-*.json')):
 d=json.loads(p.read_text())
 if d.get('returncode')!=0:failed.append(str(p.relative_to(R)))
 for m,h in d.get('modules',{}).items():
  if m in mods and d.get('returncode')==0 and h==sha(R/'research'/f'{m}.lean'):
   builds[m]=str(p.relative_to(R))
assert set(builds)==set(mods),(mods,builds)
audits=[]
for p in O.glob('axioms-*.json'):
 d=json.loads(p.read_text())
 if set(d['sources'])==set(mods) and all(h==sha(R/'research'/f'{m}.lean') for m,h in d['sources'].items()):audits.append((p,d))
assert audits
ap,ad=audits[-1]
replays=[]
for p in O.glob('replay-*.json'):
 d=json.loads(p.read_text())
 if set(d['modules'])==set(mods) and d.get('returncode')==0 and all(h==sha(R/'research'/f'{m}.lean') for m,h in d['modules'].items()):replays.append(p)
assert replays
save('validation.json',{'modules':{m:sha(R/'research'/f'{m}.lean') for m in mods},'build_receipts':builds,
 'kernel_replay':str(replays[-1].relative_to(R)),'axiom_audit':str(ap.relative_to(R)),
 'theorem_closures':len(ad['declarations']),'permitted_axioms_only':True,'fresh_whole_source_rebuild':False,
 'independent_completion_audit':False,'completion':None})
save('failed-build-index.json',failed)
inputs=json.loads((O/'input-hashes.json').read_text())
changed=[p for p,h in inputs.items() if sha(R/p)!=h]
assert not changed,changed
save('last-verification.json',{'unchanged_inputs':len(inputs),'changed':changed,'stop_present':(R/'.control/markov/STOP.json').exists(),
 'root_sha256':sha(R/'MathGKM/Markov.lean'),'contract_sha256':sha(R/'.control/markov/contract.json')})
artifacts=[p for p in O.iterdir() if p.is_file() and p.name!='manifest.json']
artifacts += list((R/'research').glob('*3ae33435*'))+list((R/'research').glob('*M3AE.lean'))
save('manifest.json',{str(p.relative_to(R)):sha(p) for p in artifacts})
print(json.dumps({'modules':len(mods),'closures':len(ad['declarations']),'failed_builds':len(failed),'artifacts':len(artifacts),'unchanged_inputs':len(inputs)}))
