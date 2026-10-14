"""Machine-authored validation inventory; it does not admit or close the root."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm'); out=root/'evidence/markov-18ae9bbc'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
recs=[]
for p in sorted(out.glob('run-*.json')):
 r=json.loads(p.read_text()); r['receipt']=str(p.relative_to(root)); recs.append(r)
modules={}; axioms={}
for s in sorted((root/'research').glob('Markov*18.lean')):
 h=sha(s); matches=[r for r in recs if r.get('sha256')==h and r.get('returncode')==0]
 builds=[r['receipt'] for r in matches if r['command'][0].endswith('/lean')]
 kernels=[r['receipt'] for r in matches if r['command'][0].endswith('/leanchecker')]
 modules[s.stem]=dict(source=str(s.relative_to(root)),sha256=h,builds=builds,kernels=kernels)
 for r in matches:
  for name,ax in re.findall(r"'([^']+)' depends on axioms: \[([^]]*)\]",r.get('stdout','')):
   axioms[name]=[a.strip() for a in ax.split(',')]
olean_hashes={}
for r in recs:
 for d in r.get('lean_path','').split(':'):
  p=pathlib.Path(d)
  if p.is_relative_to(root/'evidence'):
   for o in p.rglob('*.olean'): olean_hashes[str(o.relative_to(root))]=sha(o)
manifest=dict(request_id='18ae9bbc80dc488c816e56bdde0bc2ff',completion=None,
 status='local builds and kernel replays against inherited compiled imports; no independent completion audit',
 modules=modules,axioms=axioms,permitted_axioms_only=all(set(a)<={'propext','Classical.choice','Quot.sound'} for a in axioms.values()),
 all_new_modules_rebuilt_and_replayed=all(m['builds'] and m['kernels'] for m in modules.values()),
 rejected_receipts=[r['receipt'] for r in recs if r.get('returncode')!=0],
 project_olean_hashes=olean_hashes,root_sha256=sha(root/'MathGKM/Markov.lean'),
 root_unchanged=sha(root/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe')
p=out/f'validation-{time.time_ns()}.json';p.write_text(json.dumps(manifest,indent=2)+'\n')
print(json.dumps(dict(path=str(p.relative_to(root)),modules={n:bool(m['builds'] and m['kernels']) for n,m in modules.items()},
 permitted_axioms_only=manifest['permitted_axioms_only'],root_unchanged=manifest['root_unchanged'])))
