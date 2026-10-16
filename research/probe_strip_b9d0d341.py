"""Machine-authored exact j=1 strip algebra; candidate certificates only."""
import horizontal_third_13d40bd7 as sp
from fractions import Fraction
from pathlib import Path
import json
sp.N=6
a,k,l,q,t,u=[sp.var(i) for i in range(6)]
N=k+l;b=N+2
def fall(x,n):
 r=sp.poly(1)
 for j in range(n):r=r*(x-j)
 return r
D=9*a*a-5*a+2
E=6*a*a+6*a*b-16*a+4
F=(a+b-1)*(a+b-2)
T=(3*a-1)*l+(a+b-1)*k
J=8*q*fall(l-1,3)+(k+1)*(D*fall(l-1,2)+E*k*(l-1)+F*fall(k,2))
cs=[24*u,24*t+(72*a-120)*q,27*a**3-18*a*a+21*a-6+24*(a+b-7)*q,
27*a**3+27*a*a*b-114*a*a+3*a*b+33*a+6*b-18,
9*a**3+18*a*a*b-54*a*a+9*a*b*b-51*a*b+87*a+3*b*b-3*b-18,
(a+b-1)*(a+b-2)*(a+b-3)]
H=sum((cs[r]*fall(k+2,r)*fall(l-2,5-r) for r in range(6)),sp.poly(0))
G=3*(N-3)*(N-4)*(k+2)*l*J**2-2*(N-1)*(N-2)*(k+1)*(l-1)*T*H
def report(name,p):
 neg=[(e,str(c)) for e,c in p.items() if c<0]
 return dict(name=name,terms=len(p),negative=len(neg),examples=neg[:3])
def main():
 out=[]
 for kk in [0,1,2,k+3]:
  for ll in [2,3,4,5,6,l+7]:
   if isinstance(kk,int) and isinstance(ll,int) and kk+ll<5:continue
   for name,qq,tt,uu in [('zero',0,0,0),('low_bound',0,a+2,0),('actual_high',2*(a+2)-kk-ll-2,kk+ll+2-(a+2),3*(a+2)-2*(kk+ll+2))]:
    p=G.subst([a+2,kk,ll,qq,tt,uu])
    out.append(report(f'{name},k={kk if isinstance(kk,int) else "K+3"},l={ll if isinstance(ll,int) else "L+7"}',p))
 Path('evidence/markov-b9d0d341/strip-candidates.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
