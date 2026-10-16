"""Machine-authored exact symbolic coefficient/gap exploration; not proof."""
from generate_7584c5d0 import *
import time
L=sum((hcoeff(0,k)*cubic(v-k+3) for k in range(9)),sp.poly(0))
M=sum((hcoeff(i,k)*cubic(v-i*q-k+3) for i in range(2) for k in range(9)),sp.poly(0))
def sub(p,j,qq=q,aa=a,rr=r,ss=s):return p.subst([aa,rr,ss,qq,j,0])
def atshift(m):
 # Index m*q+z, with all offsets z requested explicitly below.
 pass
def special(jj):
 # jj is q+2 or 2q+{2,3,4}; these formulas apply q>=3.
 if jj=='bridge':return sub(L,q+2)+6*hcoeff(1,2)
 z=int(jj)
 return sub(M,2*q+z)+sum((hcoeff(2,k)*cubic(z-k+3) for k in range(2,z+1)),sp.poly(0))
C=special('bridge');T=[special(i) for i in [2,3,4]]
def coeff_exprs():
 return dict(low=L,mid=M,bridge=C,tail2=T[0],tail3=T[1],tail4=T[2])
def main():
 start=time.monotonic();x,y,z,w=a,r,s,t
 gaps={
  'first':sub(L,2)**2-48*s*sub(L,3),
  'low':L**2-sub(L,v-1)*sub(L,v+1),
  'cross1':sub(L,q+1)**2-sub(L,q)*C,
  'cross2':C**2-sub(L,q+1)*sub(M,q+3),
  'cross3':sub(M,q+3)**2-C*sub(M,q+4),
  'mid':M**2-sub(M,v-1)*sub(M,v+1),
  'tail1':sub(M,2*q+1)**2-sub(M,2*q)*T[0],
  'tail2':T[0]**2-sub(M,2*q+1)*T[1],
  'tail3':T[1]**2-T[0]*T[2]}
 out={}
 for name,p in gaps.items():
  out[name]={}
  for side in ['low','high']:
   aa=2*(x+1)+y;rr=x+1 if side=='low' else x+1+y;ss=0 if side=='low' else y
   jj=z+3 if name=='low' else 2*z+w+8
   qq=z+3 if name not in ['mid'] else z+w+4
   pp=p.subst([aa,rr,ss,qq,jj,0])
   neg=[(e,str(c)) for e,c in pp.items() if c<0]
   out[name][side]=dict(terms=len(pp),negative=len(neg),examples=neg[:8])
 print(json.dumps(out,indent=2))
 (O/'symbolic-gap-scan.json').write_text(json.dumps(dict(status='Exact symbolic exploration, not a proof',gaps=out,formulas={k:expr(p) for k,p in coeff_exprs().items()},seconds=time.monotonic()-start),indent=2)+'\n')
if __name__=='__main__':main()
