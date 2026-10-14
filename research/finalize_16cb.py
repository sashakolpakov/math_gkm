"""Machine-authored local validation inventory; not independent admission."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm'); out=root/'evidence/markov-16cb07ce'
modules=['MarkovDiagonal16cb','MarkovQuotient16cb','MarkovMatrix16cb',
         'MarkovPositive16cb','MarkovScaling16cb']
records=[]; ax={}
for p in sorted(out.glob('run-*.json')):
 r=json.loads(p.read_text()); r['receipt']=str(p.relative_to(root)); records.append(r)
 if r.get('returncode')==0:
  for name,items in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]",r.get('stdout','')):
   names=[s.strip() for s in items.split(',') if s.strip()]
   assert set(names)<= {'propext','Classical.choice','Quot.sound'},(name,names)
   ax[name]=names
summary={}
for m in modules:
 p=root/'research'/f'{m}.lean'; data=p.read_bytes(); sha=hashlib.sha256(data).hexdigest()
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',data.decode())
 rs=[r for r in records if r.get('sha256')==sha and r.get('returncode')==0]
 builds=[r['receipt'] for r in rs if r['command'][0].endswith('/lean')]
 kernels=[r['receipt'] for r in rs if r['command'][0].endswith('/leanchecker')]
 summary[m]=dict(source=str(p.relative_to(root)),sha256=sha,builds=builds,kernels=kernels,
  olean_sha256=hashlib.sha256((out/f'{m}.olean').read_bytes()).hexdigest())
imports={}
for parent in ['evidence/markov-de6ce8a9','evidence/markov-4b57f2c3']:
 for p in (root/parent).rglob('*.olean'):
  imports[str(p.relative_to(root))]=hashlib.sha256(p.read_bytes()).hexdigest()
rh=hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest()
result=dict(request_id='16cb07cef5ee44828a8b722ba3203632',completion=None,
 status='local checks only; inherited compiled project imports; no independent completion audit',
 modules=summary,axioms=ax,inherited_import_hashes=imports,
 root_sha256=rh,root_unchanged=rh=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe',
 successful_receipts=[r['receipt'] for r in records if r.get('returncode')==0],
 rejected_receipts=[r['receipt'] for r in records if r.get('returncode')!=0],
 all_new_modules_rebuilt_and_replayed=all(v['builds'] and v['kernels'] for v in summary.values()))
p=out/f'validation-{time.time_ns()}.json'; p.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(path=str(p.relative_to(root)),all_new_modules_rebuilt_and_replayed=result['all_new_modules_rebuilt_and_replayed'],root_unchanged=result['root_unchanged'],successes=len(result['successful_receipts']),rejections=len(result['rejected_receipts']),axioms=ax)))
