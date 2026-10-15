"""Machine-authored uniform-run interpolation experiment. No universal identity is assumed.
Uses exact finite differences and truncated matrix jets; all evidence is finite.
"""
from pathlib import Path
from itertools import product
from functools import lru_cache
from math import comb
import json,time
import probe_adb2 as base
from third_cert_75ad import P,expr
O=Path('evidence/markov-8bbb934e')
def pmul(a,b):
 d={}
 for (i,j),v in a.items():
  for (k,l),w in b.items():
   if i+k<=3:d[i+k,j+l]=d.get((i+k,j+l),0)+v*w
 return {k:v for k,v in d.items() if v}
def padd(a,b):
 d=dict(a)
 for k,v in b.items():d[k]=d.get(k,0)+v
 return {k:v for k,v in d.items() if v}
def mm(a,b):return [[padd(pmul(a[i][0],b[0][j]),pmul(a[i][1],b[1][j])) for j in range(2)] for i in range(2)]
@lru_cache(None)
def jet(n,p,q):
 M=base.A
 for _ in range(n+q):M=mm(M,base.B)
 prev={(0,k):2 for k in range(1,n+p+1)};curr={(0,k):-2 for k in range(1,n+q+1)}
 G=mm(mm([[{(0,0):1},{}],[prev,{(0,0):1}]],M),[[{(0,0):1},{}],[curr,{(0,0):1}]])
 def c(i,j,s):
  d={k:v for (u,k),v in G[i][j].items() if u==s}
  return base.trim([d.get(k,0) for k in range(max(d,default=-1)+1)])
 return dict(a=c(0,0,1),b=c(0,1,1),c=c(1,0,1),d=c(1,1,1),b2=c(0,1,2),c2=c(1,0,2),d2=c(1,1,2),d3=c(1,1,3))
original_jets=base.jets
for n in range(5):
 for p,q in product((0,1),repeat=2):assert jet(n,p,q)==original_jets(n,p,q)
base.jets=jet
x=P({(1,0):1});y=P({(0,1):1})
chambers=[('low',3*(x+1)+y,x+1,0,0,0),
 ('midlow',2*(x+1)+3*(y+1),(x+1)+(y+1),0,x+1,0),
 ('midhigh',3*(x+1)+2*(y+1),2*(x+1)+(y+1),x+1,x+y+2,0),
 ('high',(x+1)+3*(y+1),(x+1)+2*(y+1),x+y+2,y+1,x+1)]
@lru_cache(None)
def coeffs(n,ch):return base.candidate(n,*chambers[ch][1:])
def gap(s,t,ch):
 j=t+5;n=j+s+1;C=coeffs(n,ch)
 return C[j]**2-C[j-1]*C[j+1]
def diff(xs):return [b-a for a,b in zip(xs,xs[1:])]
def newton_grid(vals):
 out=[];row=vals
 while row:
  col=row[0];ds=[]
  while col:
   ds.append(col[0]);col=diff(col)
  out.append(ds)
  row=[diff([row[i][j] for i in range(len(row))]) for j in range(len(row[0]))]
  row=[list(z) for z in zip(*row)] if row and row[0] else []
 return out
def evaluate(grid,s,t):
 out=P()
 for i,row in enumerate(grid):
  for j,v in enumerate(row):out=out+v*(comb(s,i) if s>=i else 0)*(comb(t,j) if t>=j else 0)
 return out
def serial(p):return [[list(k),v] for k,v in sorted(p.items())]
def main():
 start=time.monotonic();records=[];checks=0
 for ch in range(4):
  # Deliberately one extra difference in both proposed degrees.
  grid=newton_grid([[gap(s,t,ch) for t in range(12)] for s in range(8)])
  negatives=[dict(s=i,t=j,terms=serial(P({k:v for k,v in p.items() if v<0}))) for i,row in enumerate(grid) for j,p in enumerate(row) if any(v<0 for v in p.values())]
  boundary=[(i,j) for i,row in enumerate(grid) for j,p in enumerate(row) if p and (i==7 or j==11)]
  assert not boundary,boundary
  independent=[]
  for s,t in [(8,0),(0,12),(8,12),(11,17),(2,19),(17,2),(9,9)]:
   ok=evaluate(grid,s,t)==gap(s,t,ch);assert ok,(ch,s,t);checks+=1;independent.append([s,t,ok])
  records.append(dict(chamber=chambers[ch][0],coefficient_basis='x^a y^b binom(s,i) binom(t,j)',
    interpretation='n=s+t+6, center coefficient j=t+5; gap C_j^2-C_(j-1)C_(j+1)',
    nonzero_entries=[dict(s=i,t=j,polynomial=serial(p)) for i,row in enumerate(grid) for j,p in enumerate(row) if p],
    negative_entries=negatives,independent_checks=independent))
  print(json.dumps(dict(chamber=chambers[ch][0],negative_entries=len(negatives),boundary=boundary)),flush=True)
 (O/'uniform-lower-interior.json').write_text(json.dumps(dict(status='finite interpolation candidate; universal coefficient formula and degree bound NOT proved',records=records,independent_symbolic_checks=checks,seconds=time.monotonic()-start),indent=2)+'\n')
 print(json.dumps(dict(seconds=time.monotonic()-start,checks=checks)),flush=True)
if __name__=='__main__':main()
