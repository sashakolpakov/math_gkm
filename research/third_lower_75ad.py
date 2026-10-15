"""Machine-authored 75ad68f9. Exact symbolic third-cut investigation.
Interpolation suggests identities; it does not prove universal source formulas.
"""
from fractions import Fraction as Q
from itertools import product
from pathlib import Path
import json,time
from activity_b485 import transfer
O=Path('evidence/markov-75ad68f9')
features=[(0,0,0,0,0),(1,0,0,0,0),(0,1,0,0,0),(2,0,0,0,0),(1,1,0,0,0),(0,2,0,0,0),(3,0,0,0,0),(2,1,0,0,0),(1,2,0,0,0),(0,3,0,0,0),(0,0,1,0,0),(1,0,1,0,0),(0,1,1,0,0),(0,0,0,1,0),(0,0,0,0,1)]
def stats(v):
 n=len(v);return (n,sum(v),sum(v[i]*v[(i+1)%n] for i in range(n)),sum(v[i]*(1-v[(i+1)%n])*v[(i+2)%n] for i in range(n)),sum(v[i]*v[(i+1)%n]*v[(i+2)%n] for i in range(n)))
def vals(st):return [Q(prod(st[k]**e for k,e in enumerate(f))) for f in features]
def prod(xs):
 a=1
 for x in xs:a*=x
 return a
def polyadd(p,q):
 d=dict(p)
 for k,v in q.items():d[k]=d.get(k,0)+v
 return {k:v for k,v in d.items() if v}
def polymul(p,q):
 d={}
 for (s,j),a in p.items():
  for (t,k),b in q.items():
   if s+t<=3:d[s+t,j+k]=d.get((s+t,j+k),0)+a*b
 return {k:v for k,v in d.items() if v}
def matmul(A,B):return [[polyadd(polymul(A[i][0],B[0][j]),polymul(A[i][1],B[1][j])) for j in range(2)] for i in range(2)]
A=[[{(1,1):1},{(1,0):1}],[{(1,1):1},{(0,0):1,(1,0):1}]]
B=[[{(0,1):1,(1,1):1,(1,2):1},{(1,0):1,(1,1):1}],[{(0,1):2,(1,1):1,(1,2):1},{(0,0):1,(1,0):1,(1,1):1}]]
AB=matmul(A,B)
def trace(v):
 M=[[{(0,0):1},{}],[{},{(0,0):1}]]
 for r in v:M=matmul(M,AB if r else A)
 return polyadd(M[0][0],M[1][1])
def raw3(v):
 T=trace(v);out=[]
 for j in range(7):
  from math import comb
  out.append(sum((-1)**k*comb(k,h)*T.get((3-k,j-h),0) for k in range(4) for h in range(k+1)))
 return out
def fit():
 rows={};samples=0;checks=0
 for n in range(4,10):
  for v in product((0,1),repeat=n):
   row=vals(stats(v))+list(map(Q,raw3(v)));samples+=1
   for i,r in rows.items():
    c=row[i]
    if c:row=[a-c*b for a,b in zip(row,r)]
   piv=next((i for i,x in enumerate(row[:len(features)]) if x),None)
   if piv is None:
    assert all(x==0 for x in row[len(features):]),(v,row);checks+=1
   else:
    c=row[piv];row=[x/c for x in row]
    for i,r in list(rows.items()):
     c=r[piv]
     if c:rows[i]=[a-c*b for a,b in zip(r,row)]
    rows[piv]=row;rows=dict(sorted(rows.items()))
 coeff=[[rows[i][len(features)+j] if i in rows else Q(0) for i in range(len(features))] for j in range(7)]
 rec=dict(status='exact interpolation and finite validation; universal identity not yet proved',features=features,coefficients=[[str(x) for x in row] for row in coeff],rank=len(rows),samples=samples,dependent_checks=checks)
 (O/'third-fit.json').write_text(json.dumps(rec,indent=2));print(json.dumps(rec))
 return coeff
if __name__=='__main__':fit()
