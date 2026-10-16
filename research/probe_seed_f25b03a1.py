"""Machine-authored source-only higher-row residual probe.
The prescribed binomial factor is a candidate, not inferred from raw LC.
"""
from pathlib import Path
from math import gcd
import json,time,sys
sys.path.insert(0,'evidence/markov')
from scan import initial,child
O=Path('evidence/markov-f25b03a1')
def generate(bound):
 stack=[('',initial)]
 while stack:
  path,f=stack.pop();yield path,f[1]
  if f[1][1]+f[2][1]<=bound:stack.append((path+'R',child(f,True)))
  if f[0][1]+f[1][1]<=bound:stack.append((path+'L',child(f,False)))
def divide(a):
 if len(a)<=1:return [0] if not any(a) else None
 q=[a[0]]
 for x in a[1:-1]:q.append(x-q[-1])
 return q if a[-1]==q[-1] else None
def run(bound=48):
 start=time.monotonic();counts=dict(sources=0,rows=0,divisions=0,seed_tests=0,raw_tests=0)
 failures={};first={};byrow={}
 for path,(a,b,p) in generate(bound):
  counts['sources']+=1
  for r in range(1,min(a+1,(b-1)//2)+1):
   counts['rows']+=1;byrow[r]=byrow.get(r,0)+1
   shift=a-r+1;n=b-2*r-1
   row=[p.get((i,r),0) for i in range(a+b-r)]
   if any(row[:shift]):failures['monomial']=failures.get('monomial',0)+1;continue
   q=row[shift:]
   for _ in range(n):
    counts['divisions']+=1;q=divide(q)
    if q is None:break
   if q is None:
    failures['division']=failures.get('division',0)+1
    first.setdefault('division',dict(path=path,a=a,b=b,r=r));continue
   if any(x<0 for x in q):
    failures['negative_seed']=failures.get('negative_seed',0)+1
    first.setdefault('negative_seed',dict(path=path,a=a,b=b,r=r,seed=q))
   for k in range(len(q)-2):
    counts['seed_tests']+=1
    if q[k+1]**2<q[k]*q[k+2]:
     failures['seed_lc']=failures.get('seed_lc',0)+1
     first.setdefault('seed_lc',dict(path=path,a=a,b=b,r=r,k=k,seed=q,raw=row,shift=shift,binomial_power=n))
   for k in range(len(row)-2):
    counts['raw_tests']+=1
    if row[k+1]**2<row[k]*row[k+2]:
     failures['raw_lc']=failures.get('raw_lc',0)+1
     first.setdefault('raw_lc',dict(path=path,a=a,b=b,r=r,k=k,row=row))
 out=dict(status='Finite exact source experiment, no universal divisibility or LC claim.',bound=bound,counts=counts,rows=byrow,failures=failures,first=first,seconds=time.monotonic()-start)
 (O/'higher-seed-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
