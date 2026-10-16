"""Machine-authored exact polynomial certificates for the remaining v=0 band.
These candidates are not asserted as Lean theorems or source inequalities.
"""
from pathlib import Path
from fractions import Fraction as F
from column_five_4687d03f import Padd,Pmul,Pscale,Ppow,subst,lean
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-7e2e958e')
one={(0,0):F(1)};T={(1,0):F(1)};J={(0,1):F(1)}
def c(n):return Pscale(one,n)
def add(*p):return Padd(*p)
def mul(*p):
 z=one
 for a in p:z=Pmul(z,a)
 return z
def D(v,m):return mul(add(T,c(v+m+4)),add(T,c(v+m+5)))
def E(v,m):return add(D(v,m),Pscale(mul(add(J,c(-m)),add(T,J,c(v+4))),4))
def main():
 start=time.monotonic();a=add(T,J,c(4));b=add(T,J,c(5));u=add(T,c(4));v=add(T,c(5))
 gaps=[
 add(Pscale(mul(Ppow(J,2),Ppow(a,2),Ppow(E(1,1),2),D(0,0),D(2,2),v),2),Pscale(mul(J,add(J,c(-1)),a,b,u,E(0,0),E(2,2),Ppow(D(1,1),2)),-1)),
 add(Pscale(mul(J,Ppow(a,2),E(1,1),E(1,0),D(0,0),D(2,1),v),2),Pscale(mul(J,a,b,u,E(0,0),E(2,1),D(1,1),D(1,0)),-1)),
 add(mul(Ppow(a,2),Ppow(E(1,0),2),D(0,0),D(2,0),v),Pscale(mul(a,b,u,E(0,0),E(2,0),Ppow(D(1,0),2)),-1))]
 out={'status':'exact algebraic candidates only; not Lean validated','parameter_substitution':'t=T>=0,j=S+2>=2; B0=C(t+j+3,j) is divided out and positive rational denominators are cleared','gap_meanings':['L(j,t+1,1)^2-L(j,t,0)*L(j,t+2,2)','2*L(j,t+1,1)*L(j,t+1,0)-L(j,t,0)*L(j,t+2,1)','L(j,t+1,0)^2-L(j,t,0)*L(j,t+2,0)'],'certificates':[]}
 for i,g in enumerate(gaps):
  p=subst(g,T,add(J,c(2)))
  neg=[[*k,str(v)] for k,v in p.items() if v<0]
  out['certificates'].append({'index':i,'terms':len(p),'negative_coefficients':neg,'expression':lean(p,'t'),'coefficients':[[*k,str(v)] for k,v in sorted(p.items())]})
 out['seconds']=time.monotonic()-start;(O/'boundary-candidates.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({'status':out['status'],'certificates':[{k:v for k,v in a.items() if k not in ['expression','coefficients']} for a in out['certificates']],'seconds':out['seconds']}))
if __name__=='__main__':main()
