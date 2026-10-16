"""Machine-authored finite band factorization experiment; no universal claim."""
from pathlib import Path
from math import comb
import json,time
from lower_rows_1bb0aa1e import add,mul,scale,trim
from sparse_probe_96ada19b import solve
from alternate_shape_e9cdd527 import lower
O=Path('/Users/sasha/math_gkm/evidence/markov-1bb0aa1e')
def R(n,j):
 if j<0:return []
 a=[]
 for s in range(j+1):a=add(a,[0]*s+[comb(j+1,j-s)*comb(n-j-1,s)*comb(j-s,t) for t in range(j-s+1)])
 return a
def Trows(q,r,b):
 a=[1,1];a2=[1,2,1];T={-1:[],-2:[]}
 for t in range(b+1):
  G=add(R(q,t),R(q+1,t),mul(a,R(q,t-1))) if r else add(R(q,t-1),R(q+1,t),mul(a,R(q+1,t-1)))
  T[t]=trim(add(G,scale(mul([1,-1],T[t-1]),2),scale(mul(a2,T[t-2]),-1)))
 return T
def main():
 start=time.monotonic();out={'status':'finite exact tests of proposed correction-band factorization','rows':0,'coefficients':0,'lc_tests':0,'failures':[],'examples':[]}
 for q in range(2,41):
  for r in [False,True]:
   b=(q-(2 if r else 1))//2;n=3*q+(1 if r else 2);I=n+5;J=q+1+b
   a=solve(q,r,I,J);l=lower(n,I,J);ts=Trows(q,r,b)
   for t in range(b+1):
    e=q-2*t-(2 if r else 1);pred=[0,0]+scale(mul([comb(e,k) for k in range(e+1)],ts[t]),4)
    out['rows']+=1
    for i in range(I+1):
     out['coefficients']+=1
     if a[i,q+1+t]-l[i,q+1+t]!=(pred[i] if i<len(pred) else 0):out['failures'].append(['identity',q,r,t,i])
    if any(v<0 for v in ts[t]):out['failures'].append(['negative',q,r,t,ts[t]])
    for k in range(len(ts[t])-2):
     out['lc_tests']+=1
     if ts[t][k]*ts[t][k+2]>ts[t][k+1]**2:out['failures'].append(['LC',q,r,t,k])
    if q in [6,10] and t<=3:out['examples'].append({'q':q,'r':r,'t':t,'residual':ts[t]})
 out['seconds']=time.monotonic()-start;(O/'correction-band-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='examples'}))
if __name__=='__main__':main()
