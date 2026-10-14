"""Machine-authored local receipt inventory; not an independent admission gate."""
import pathlib,json,hashlib,time,re
root=pathlib.Path('/Users/sasha/math_gkm');out=root/'evidence/markov-3556cd95'
names=["MarkovSquares3556","MarkovFibJets3556","MarkovSecondColumn3556","MarkovSeries3556","MarkovCubicLC3556","MarkovVerticalTwo3556","MarkovDiagonalExample3556"]
records=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
entries=[]
for name in names:
 src=root/'research'/f'{name}.lean';data=src.read_bytes();sha=hashlib.sha256(data).hexdigest()
 good=[(p,r) for p,r in records if r['source']==str(src.relative_to(root)) and
       r['sha256']==sha and r.get('returncode')==0]
 builds=[(p,r) for p,r in good if r['command'][0].endswith('/lean')]
 kernels=[(p,r) for p,r in good if r['command'][0].endswith('/leanchecker')]
 assert builds and kernels,name
 assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',data.decode())
 for _,r in good:
  assert 'sorryAx' not in r['stdout']
  for closure in re.findall(r'depends on axioms: \[([^]]*)\]',r['stdout']):
   assert set(closure.split(', '))<={'propext','Classical.choice','Quot.sound'}
 direct=[]
 for imp in re.findall(r'^import (\S+)',data.decode(),re.M):
  for loc in builds[-1][1]['lean_path'].split(':'):
   artifact=pathlib.Path(loc)/(imp.replace('.','/')+'.olean')
   if artifact.is_file():
    direct.append(dict(module=imp,path=str(artifact),sha256=hashlib.sha256(artifact.read_bytes()).hexdigest()))
    break
  else:raise AssertionError(imp)
 entries.append(dict(module=name,sha256=sha,
   builds=[str(p.relative_to(root)) for p,_ in builds],
   kernels=[str(p.relative_to(root)) for p,_ in kernels],direct_import_binaries=direct))
root_hash=hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest()
assert root_hash=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
result=dict(request_id='3556cd95416f4d45a52269fa60ee7779',modules=entries,
 root_sha256=root_hash,rejected_attempts=[str(p.relative_to(root)) for p,r in records if r.get('returncode')!=0],
 scope='Fresh named source modules and kernel replay using inherited compiled imports; not independent full-source validation',completion=None)
dest=out/f'validation-{time.time_ns()}.json';dest.write_text(json.dumps(result,indent=2)+'\n')
print(str(dest.relative_to(root)));print('All seven modules have matching successful builds and kernel replays.')
