"""Machine-authored reproducer for the already executed source-all-entry scan.
The initial execution used this loop inline in exec_command; no extra run implied.
"""
import sys,json,pathlib,time
from balanced_f80 import A,B,mm,failure
from scan import generate
t=time.monotonic();fs=[];count=0
for path,(a,b,p) in generate(40):
 lo,hi=A,B
 for c in path:
  m=mm(lo,hi)
  if c=='L':hi=m
  else:lo=m
 m=mm(lo,hi);count+=1
 for k,q in enumerate(m):
  f=failure(q)
  if f:fs.append(dict(a=a,b=b,path=path,entry=k,**f))
res=dict(bound=40,count=count,failures=fs,seconds=time.monotonic()-t)
pathlib.Path(f'evidence/markov-f80fb8bc/source-all-entry-40-rerun-{time.time_ns()}.json').write_text(json.dumps(res,indent=2))
print(res)
