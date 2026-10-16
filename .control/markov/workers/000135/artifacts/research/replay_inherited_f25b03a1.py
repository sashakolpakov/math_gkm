"""Machine-authored: complete individually the interrupted M81F replay checks.
Read-only inputs; all new receipts written under current request.
"""
from validate_f25b03a1 import R,O,sha,env,binary
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import subprocess,time,json,re,sys
v=json.loads((R/'evidence/markov-81f80b2d/validation.json').read_text())
mods=sys.argv[1:] or [m for m,d in v['modules'].items() if not d['replay']]
checker=R/'research/ReplayIsolatedM81F.lean'
def check(m):
 s=R/'research'/f'{m}.lean'; h=sha(s)
 assert v['modules'][m]['source_sha256']==h
 assert v['modules'][m]['olean_sha256']==sha(R/'evidence/markov-81f80b2d'/f'{m}.olean')
 names=re.findall(r'^(?:theorem|def|abbrev)\s+(\w+)',s.read_text(),re.M)
 assert all(n.endswith('M81F') for n in names)
 cmd=[binary,'-s','131072','--run',str(checker),m];start=time.monotonic()
 try:
  p=subprocess.run(cmd,cwd=R,env=env,capture_output=True,text=True,timeout=180)
  d=dict(returncode=p.returncode,stdout=p.stdout,stderr=p.stderr)
 except subprocess.TimeoutExpired as e:d=dict(timeout=True,stdout=str(e.stdout),stderr=str(e.stderr))
 d.update(module=m,source_sha256=h,checker_sha256=sha(checker),command=cmd,seconds=time.monotonic()-start,declared_names=names,scope='One inherited module replayed over its imports; selected M81F names checked absent before replay.')
 p=O/f'inherited-replay-{m}-{time.time_ns()}.json';p.write_text(json.dumps(d,indent=2)+'\n')
 print(json.dumps(dict(module=m,returncode=d.get('returncode'),timeout=d.get('timeout',False),seconds=d['seconds'])),flush=True)
 return d
with ThreadPoolExecutor(max_workers=2) as pool: results=list(pool.map(check,mods))
sys.exit(0 if all(d.get('returncode')==0 for d in results) else 1)
