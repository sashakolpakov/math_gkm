"""Machine-authored exact finite validation of the sparse formula.
Not proof evidence. Prior modules are imported only for their pure functions.
"""
from pathlib import Path
import json,math,time
from second_envelope_bf38 import formula
data=json.loads(Path('evidence/markov-e27336bc/sparse-kernel.json').read_text())['groups']
groups=[(tuple(map(int,k.strip('()').split(','))),compile(v.replace('^','**'),'<own sparse polynomial>','eval')) for k,v in data.items()]
def explicit(n,c,r,j):
 q=max(2*r-c,0)
 return sum(eval(f,{'__builtins__':{}},dict(N=n,c=c,r=r,q=q))*math.comb(j-a*(n+1)-b+3,3) for (a,b),f in groups if a*(n+1)+b<=j)+ (2 if c==2 and j==2*n+3 else 0)
start=time.monotonic();count=0;fail=[];lc=0;bad=[]
for n in range(0,22):
 for c in range(2,22):
  for r in range(1,c):
   p=formula(n,c,r,max(2*r-c,0));vals=[]
   for j in range(2*n+8):
    actual=2*p.get((0,j),0)+(2 if c==2 and j==2*n+3 else 0)
    v=explicit(n,c,r,j);count+=1;vals.append(v)
    if actual!=v:fail.append(dict(n=n,c=c,r=r,j=j,actual=actual,formula=v))
   for j in range(len(vals)-2):
    lc+=1
    if vals[j]*vals[j+2]>vals[j+1]**2:bad.append(dict(n=n,c=c,r=r,j=j,triple=vals[j:j+3]))
rec=dict(status='Finite exact parameter check, not a proof or source witness',coefficient_checks=count,coefficient_failures=fail,adjacent_checks=lc,adjacent_failures=bad,seconds=time.monotonic()-start,range=dict(n=[0,21],c=[2,21],r='1..c-1'),two_run_correction='Retained explicitly at c=2,j=2n+3')
Path('evidence/markov-e27336bc/explicit-experiment.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
