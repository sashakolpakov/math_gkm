"""Machine-authored evidence manifest, not independent admission."""
import pathlib,json,hashlib,re
r=pathlib.Path('/Users/sasha/math_gkm');o=r/'evidence/markov-061840e8'
mods=['MarkovPellMatching0618','MarkovPellShear0618','MarkovPellDiagonal0618','MarkovPellSource0618','MarkovPellRawLC0618','MarkovSiteObstruction0618']
runs=[(p,json.loads(p.read_text())) for p in o.glob('run-*.json')];records=[]
for m in mods:
 p=r/'research'/f'{m}.lean';sha=hashlib.sha256(p.read_bytes()).hexdigest();rr=[(q,d) for q,d in runs if d['source']==str(p.relative_to(r)) and d['sha256']==sha]
 builds=[(q,d) for q,d in rr if d.get('returncode')==0 and d['command'][0].endswith('/lean')]
 kernels=[(q,d) for q,d in rr if d.get('returncode')==0 and d['command'][0].endswith('/leanchecker')]
 imports=[]
 if builds:
  lp=builds[-1][1]['lean_path'].split(':')
  for name in re.findall(r'^import (\S+)',p.read_text(),re.M):
   found=next((pathlib.Path(d)/(name.replace('.','/')+'.olean') for d in lp if (pathlib.Path(d)/(name.replace('.','/')+'.olean')).is_file()),None)
   if found:imports.append(dict(module=name,path=str(found),sha256=hashlib.sha256(found.read_bytes()).hexdigest()))
 records.append(dict(module=m,source=str(p.relative_to(r)),sha256=sha,status='compiled and kernel-replayed' if builds and kernels else 'incomplete',builds=[str(q.relative_to(r)) for q,d in builds],kernels=[str(q.relative_to(r)) for q,d in kernels],direct_import_binaries=imports,axiom_output=builds[-1][1]['stdout'] if builds else None))
v=dict(request_id='061840e8bcb9466891906a9db3f46cc3',modules=records,root_sha256=hashlib.sha256((r/'MathGKM/Markov.lean').read_bytes()).hexdigest(),rejected_attempts=[str(p.relative_to(r)) for p,d in runs if d.get('returncode',1)!=0],scope='Fresh named-source builds and kernel replay using inherited compiled imports. Not independent or full dependency rebuild.',completion=None)
(o/'validation.json').write_text(json.dumps(v,indent=2)+'\n')
print(json.dumps([(x['module'],x['status']) for x in records]))
