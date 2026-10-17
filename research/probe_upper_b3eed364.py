"""Machine-authored exact exploratory upper-row tests; experiments, not proofs."""
from pathlib import Path
from three_probe_9e205206 import frame
from fractions import Fraction as F
from math import comb
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-b3eed364')
def trim(p):
 while p and p[-1]==0:p.pop()
 return p
def rem(p,q):
 p=list(p)
 while len(p)>=len(q):
  z=p[-1]/q[-1];d=len(p)-len(q)
  for i,x in enumerate(q):p[d+i]-=z*x
  trim(p)
 return p
def real_count(p):
 p=trim([F(x) for x in p])
 while p and p[0]==0:p=p[1:]
 if len(p)<2:return len(p)-1,len(p)-1
 seq=[p,[i*p[i] for i in range(1,len(p))]]
 while seq[-1]:
  r=rem(seq[-2],seq[-1])
  if not r:break
  scale=abs(r[-1]);seq.append([-x/scale for x in r])
 def variations(negative):
  s=[(1 if p[-1]>0 else -1)*(-1 if negative and (len(p)-1)%2 else 1) for p in seq]
  return sum(s[i]!=s[i+1] for i in range(len(s)-1))
 return variations(True)-variations(False),len(p)-1
def run():
 t=time.monotonic();out=dict(status='finite exact Sturm and coefficient tests only',rows=0,newton_failures=[],non_real_rows=[],examples=[])
 for q in range(1,11):
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r])
   for j in range((b+1)//2,b+3):
    row=[p.get((i,j),0) for i in range(b+3-j)]
    row=trim(row)
    if not row:continue
    while row[0]==0:row=row[1:]
    out['rows']+=1;n=len(row)-1
    for i in range(1,n):
     if row[i]**2*i*(n-i)<row[i-1]*row[i+1]*(i+1)*(n-i+1):
      out['newton_failures'].append([q,r,j,i,row]);break
    if n<=14:
     nr,deg=real_count(row)
     if nr<deg:out['non_real_rows'].append([q,r,j,nr,deg,row])
    if q<=3:out['examples'].append([q,r,j,row])
 out['seconds']=time.monotonic()-t
 (O/'upper-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':run()
