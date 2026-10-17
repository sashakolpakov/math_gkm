"""Machine-authored 09fffb56, adapted from predecessor. Assemble immutable source-bound receipts and preserve inputs."""
from pathlib import Path
import json,hashlib,re,sys,subprocess,os,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-09fffb56'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
mods=json.loads((O/'mathematical-modules.json').read_text())
builds={};replays=[];rejected=[]
for p in sorted(O.glob('build-*.json')):
 x=json.loads(p.read_text())
 if x.get('returncode')!=0:rejected.append(str(p.relative_to(R)))
 else:
  for m,h in x['modules'].items():
   if m in mods and sha(R/'research'/f'{m}.lean')==h:builds[m]={'receipt':str(p.relative_to(R)),'source_sha256':h,'olean_sha256':sha(O/f'{m}.olean')}
assert set(builds)==set(mods),(set(mods)-set(builds))
for p in sorted(O.glob('replay-*.json')):
 x=json.loads(p.read_text())
 if x.get('returncode')==0 and all(sha(R/'research'/f'{m}.lean')==h for m,h in x['modules'].items()):
  replays.append({'receipt':str(p.relative_to(R)),'modules':list(x['modules'])})
covered=set(m for r in replays for m in r['modules'])
assert set(mods)<=covered,set(mods)-covered
axioms={};audit_receipts=[]
for p in sorted(O.glob('axioms-*.json')):
 x=json.loads(p.read_text())
 if all(sha(R/'research'/f'{m}.lean')==h for m,h in x['sources'].items()):
  axioms.update(x['declarations']);audit_receipts.append(str(p.relative_to(R)))
names=[]
for m in mods:
 s=(R/'research'/f'{m}.lean').read_text()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',re.sub(r'/-.*?-/|--[^\n]*','',s,flags=re.S)),(m,'forbidden token')
 names+=re.findall(r'^theorem\s+(\w+)',s,re.M)
assert set(names)<=set(axioms),set(names)-set(axioms)
assert all(set(axioms[n])<={'propext','Classical.choice','Quot.sound'} for n in names)
validation={'request_id':'09fffb56626d410db28e496da5a3241c','compiled':builds,'replays':replays,'successfully_replayed':mods,'axiom_receipts':audit_receipts,'theorem_closures':len(names),'permitted_axioms_only':True,'rejected_builds':rejected,'limits':'Inherited compiled imports reused. No fresh whole-source rebuild, closed full root proof, or independent hash-bound completion audit.','completion':None}
(O/'validation.json').write_text(json.dumps(validation,indent=2)+'\n')
before=json.loads((O/'input-hashes.json').read_text())
owned_at_snapshot=set()  # Setup excluded this request-owned prefix before snapshotting.
mismatches=[p for p,h in before.items() if p not in owned_at_snapshot and (not (R/p).is_file() or sha(R/p)!=h)]
assert not mismatches,mismatches
prev=json.loads((R/'evidence/markov-be355177/manifest.json').read_text())
assert all(sha(R/p)==h for p,h in prev.items())
rec=json.loads((O/'reconciliation.json').read_text())
root=sha(R/'MathGKM/Markov.lean')
contract=hashlib.sha256(json.dumps(json.loads((R/'.control/markov/contract.json').read_text()),sort_keys=True,separators=(',',':')).encode()).hexdigest()
assert root==rec['root_sha256'] and contract==rec['contract_sha256']
env=dict(os.environ,GIT_CONFIG_NOSYSTEM='1',GIT_CONFIG_GLOBAL='/dev/null',PATH='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin')
version=subprocess.run(['/Users/sasha/.elan/toolchains/leanprover--lean4---v4.32.2/bin/lean','--version'],capture_output=True,text=True,env=env,timeout=15)
(O/'versions.json').write_text(json.dumps({'python':sys.version,'lean':version.stdout,'lean_returncode':version.returncode,'environment':{'GIT_CONFIG_NOSYSTEM':'1','GIT_CONFIG_GLOBAL':'/dev/null','PATH':env['PATH']}},indent=2)+'\n')
manifest={}
for p in (R/'research').rglob('*'):
 if p.is_file() and ('09fffb56' in p.name or 'M09F' in p.name or str(p.relative_to(R)) not in before):manifest[str(p.relative_to(R))]=sha(p)
for p in O.rglob('*'):
 if p.is_file() and p.name not in ['manifest.json','last-verification.json']:manifest[str(p.relative_to(R))]=sha(p)
(O/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
assert all(sha(R/p)==h for p,h in manifest.items())
final={'artifacts':len(manifest),'artifact_mismatches':[],'unchanged_inputs':sum(p not in owned_at_snapshot for p in before),'owned_files_created_before_snapshot':sorted(owned_at_snapshot),'unchanged_predecessor_artifacts':len(prev),'root_sha256':root,'contract_sha256':contract,'validation_sha256':sha(O/'validation.json'),'manifest_sha256':sha(O/'manifest.json'),'stop_file_present':(R/'.control/markov/STOP.json').exists(),'completion':None}
(O/'last-verification.json').write_text(json.dumps(final,indent=2)+'\n')
print(json.dumps({'modules':len(mods),'theorem_closures':len(names),'rejected_builds':len(rejected),'preservation':final},indent=2))
