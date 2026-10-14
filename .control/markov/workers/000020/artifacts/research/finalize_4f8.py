"""Machine-authored evidence aggregation; checks receipts, never certifies root."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm');out=root/'evidence/markov-4f8ceeeb'
mods=['MarkovCubicJet4f8','MarkovQuarticJet4f8','MarkovQuarticBounds4f8','MarkovQuarticSource4f8']
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
runs=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
accepted=[]
for m in mods:
 src=root/'research'/f'{m}.lean';digest=sha(src)
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',src.read_text())
 matching=[(p,d) for p,d in runs if d['sha256']==digest and d.get('returncode')==0]
 builds=[str(p.relative_to(root)) for p,d in matching if '/leanchecker' not in d['command'][0]]
 kernels=[str(p.relative_to(root)) for p,d in matching if '/leanchecker' in d['command'][0]]
 assert builds and kernels,(m,builds,kernels)
 assert all('sorryAx' not in d.get('stdout','') for p,d in matching)
 envpath=matching[-1][1]['lean_path'].split(':')
 imports=[]
 for name in re.findall(r'^import\s+(\S+)',src.read_text(),re.M):
  ps=[pathlib.Path(q)/(name.replace('.','/')+'.olean') for q in envpath]
  found=next((p for p in ps if p.exists()),None)
  imports.append(dict(module=name,path=str(found) if found else None,sha256=sha(found) if found else None))
 accepted.append(dict(module=m,sha256=digest,builds=builds,kernels=kernels,direct_import_binaries=imports))
rootsha=sha(root/'MathGKM/Markov.lean')
assert rootsha=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
rec=dict(request_id='4f8ceeeb08e4428892713ab6457705dd',modules=accepted,root_sha256=rootsha,
 rejected_attempts=[str(p.relative_to(root)) for p,d in runs if d.get('returncode')!=0],
 scope='Fresh named source modules and kernel replay using inherited compiled imports; not independent full-source validation',completion=None)
name=f'validation-{time.time_ns()}.json';(out/name).write_text(json.dumps(rec,indent=2)+'\n')

print(json.dumps(dict(validation=str(out/name),modules=mods,rejected=rec['rejected_attempts'])))
