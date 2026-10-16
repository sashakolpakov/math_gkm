"""Machine-authored finite checks of the next-strip candidate against raw source."""
from pathlib import Path
import sys,json,time
from math import comb
sys.path.insert(0,str(Path('/Users/sasha/math_gkm/evidence/markov')))
from scan import generate
def fall(x,n):
 z=1
 for r in range(n):z*=x-r
 return z
def main():
 start=time.monotonic();counts=dict(source_fractions=0,low_cone_fractions=0,identities=0,inequalities=0,zeros=0,gaps=0);fails=[]
 for path,(a,b,p) in generate(48):
  counts['source_fractions']+=1
  if not (2*a<=b<=3*a and b>=9):continue
  counts['low_cone_fractions']+=1
  for i in range(a+b+3):
   c2,c3,c4=[p.get((i,j),0) for j in [2,3,4]]
   counts['inequalities']+=1;counts['zeros']+=int(0 in [c2,c3,c4])
   if c2*c4>c3*c3:fails.append(['raw',a,b,i,[c2,c3,c4]])
   if not a<=i<=a+b-5:continue
   k=i-a;l=b-2-k;N=k+l;C=comb(N,k)
   J=(9*a*a-5*a+2)*fall(l-1,2)+(6*a*a+6*a*b-16*a+4)*k*(l-1)+(a+b-1)*(a+b-2)*fall(k,2)
   h=[27*a**3-18*a*a+21*a-6,
      27*a**3+27*a*a*b-114*a*a+3*a*b+33*a+6*b-18,
      9*a**3+18*a*a*b-54*a*a+9*a*b*b-51*a*b+87*a+3*b*b-3*b-18,
      (a+b-1)*(a+b-2)*(a+b-3)]
   v=[24-78*a+147*a*a-54*a**3+81*a**4,
      96-456*a+144*a*a-612*a**3+108*a**4+96*a*b+36*a*a*b+108*a**3*b,
      144-96*a+1098*a*a-480*a**3+54*a**4-120*b-150*a*b-438*a*a*b+108*a**3*b+24*b*b+42*a*b*b+54*a*a*b*b,
      96-536*a+432*a*a-124*a**3+12*a**4+40*b+384*a*b-240*a*a*b+36*a**3*b-48*b*b-108*a*b*b+36*a*a*b*b+8*b**3+12*a*b**3,
      (a+b-1)*(a+b-2)*(a+b-3)*(a+b-4)]
   H=sum(vv*fall(k,r)*fall(l-2,3-r) for r,vv in enumerate(h))
   I=sum(vv*fall(k,r)*fall(l-3,4-r) for r,vv in enumerate(v))
   Hnew=(k+1)*H+24*(3*a-b)*fall(l-2,4)
   Inew=(k+1)*I+(-480*(3*a-b)+288*a*(3*a-b)+96*(b-2*a))*fall(l-3,5)+(-864+96*a+96*b)*(3*a-b)*(k+1)*fall(l-3,4)
   tests=[2*fall(N,3)*c2==C*l*J,6*fall(N,5)*(k+1)*c3==C*l*(l-1)*Hnew,24*fall(N,7)*(k+1)*c4==C*l*(l-1)*(l-2)*Inew]
   counts['identities']+=3
   if not all(tests):fails.append(['identities',a,b,i,tests])
   G=4*(N-5)*(N-6)*(l-1)*Hnew*Hnew-3*(N-3)*(N-4)*(l-2)*(k+1)*J*Inew
   counts['gaps']+=1
   if G<0:fails.append(['gap',a,b,i,G])
   if 144*fall(N,5)**2*(N-5)*(N-6)*(k+1)**2*(c3*c3-c2*c4)!=C*C*l*l*(l-1)*G:fails.append(['transfer',a,b,i])
 out=dict(status='Finite source checks only; separate Lean result must be checked',bound=48,counts=counts,failures=fails,seconds=time.monotonic()-start)
 Path('evidence/markov-5703599b/next-cone-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
