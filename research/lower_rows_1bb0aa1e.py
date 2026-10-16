"""Machine-authored exploratory row recurrence, exact finite verification only."""
from pathlib import Path
from math import comb
import json,time
from alternate_shape_e9cdd527 import lower
from row_probe_e9cdd527 import divide_one
O=Path('/Users/sasha/math_gkm/evidence/markov-1bb0aa1e')
def add(*ps):
 c=[0]*max(map(len,ps),default=0)
 for p in ps:
  for i,v in enumerate(p):c[i]+=v
 return c
def mul(a,b):
 if not a or not b:return []
 c=[0]*(len(a)+len(b)-1)
 for i,v in enumerate(a):
  for j,w in enumerate(b):c[i+j]+=v*w
 return c
def scale(a,c):return [c*x for x in a]
def trim(a):
 while a and a[-1]==0:a.pop()
 return a
def J(n,j):
 if j<0:return []
 a=[]
 for s in range(j+1):
  a=add(a,[0]*s+[comb(j+3,j-s)*comb(n-j-1,s)*comb(j-s,t) for t in range(j-s+1)])
 return a
def Hrows(n,b):
 h={-1:[],-2:[]};a=[1,1];a2=[1,2,1]
 for j in range(b+1):
  h[j]=trim(add(J(n,j),scale(mul(a,J(n,j-1)),2),mul(a2,J(n,j-2)),
    scale(mul([1,-1],h[j-1]),2),scale(mul(a2,h[j-2]),-1)))
 return h
def main():
 t=time.monotonic();out={'status':'unproved row recurrence/source factorization; finite exact checks','row_checks':0,'residual_lc_checks':0,'failures':[]}
 for n in range(4,81):
  b=(n-1)//3;h=Hrows(n,b);raw=lower(n,n+2,b)
  for j in range(b+1):
   target=[raw[i,j] for i in range(3,n+3-j)]
   for _ in range(n-2*j-1):target=divide_one(target)
   out['row_checks']+=1
   if h[j]!=target:out['failures'].append(['identity',n,j,h[j],target])
   if any(x<0 for x in h[j]):out['failures'].append(['negative',n,j])
   for k in range(len(h[j])-2):
    out['residual_lc_checks']+=1
    if h[j][k]*h[j][k+2]>h[j][k+1]**2:out['failures'].append(['lc',n,j,k])
 a,b,c,d=Hrows(10,3)[3]
 disc=b*b*c*c-4*a*c**3-4*b**3*d-27*a*a*d*d+18*a*b*c*d
 out['cubic_obstruction']={'source':'3/10','row':3,'residual':[a,b,c,d],'discriminant':disc,'meaning':'negative cubic discriminant; this route cannot require all residual zeros to be real. Not a source LC refutation.'}
 out['seconds']=time.monotonic()-t
 (O/'lower-row-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
