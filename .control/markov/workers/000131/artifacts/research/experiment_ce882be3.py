"""Machine-authored independent exact recurrence checks; experiments are not proofs."""
from pathlib import Path
import sys,json,time
from math import comb
sys.path.insert(0,str(Path('/Users/sasha/math_gkm/evidence/markov')))
from scan import generate
from experiment_terminal_263d8c71 import pair
O=Path('/Users/sasha/math_gkm/evidence/markov-ce882be3')
def main():
 start=time.monotonic();fails=[];counts=dict(fractions=0,word_comparisons=0,strip_inequalities=0,zero_triples=0,middle_fractions=0,middle_scaled_identities=0,middle_gap_checks=0)
 for path,(a,b,p) in generate(48):
  w=tuple((r+1)*a//b-r*a//b for r in range(b));wp=pair(w)[1]
  counts['fractions']+=1;counts['word_comparisons']+=1
  if p!=wp:fails.append(['word',a,b])
  middle=2*a<=b<=3*a
  counts['middle_fractions']+=middle
  for i in range(a+b+4):
   c1,c2,c3=(p.get((i,j),0) for j in [1,2,3])
   counts['strip_inequalities']+=1;counts['zero_triples']+=int(0 in [c1,c2,c3])
   if c1*c3>c2*c2:fails.append(['strip',a,b,i,[c1,c2,c3]])
   if not (middle and a>=2 and b>=7 and a<=i and i+3<=a+b-1):continue
   k=i-a;l=b-2-k;N=k+l;C=comb(N,k);t=3*a-b
   D=9*a*a-5*a+2;E=6*a*a+6*a*b-16*a+4;F=(a+b-1)*(a+b-2)
   T=(3*a-1)*l+(a+b-1)*k
   cs=[27*a**3-18*a*a+21*a-6,
       27*a**3+27*a*a*b-114*a*a+3*a*b+33*a+6*b-18,
       9*a**3+18*a*a*b-54*a*a+9*a*b*b-51*a*b+87*a+3*b*b-3*b-18,
       (a+b-1)*(a+b-2)*(a+b-3)]
   def fall(x,n):
    z=1
    for r in range(n):z*=x-r
    return z
   J=D*fall(l-1,2)+E*k*(l-1)+F*fall(k,2)
   H0=sum(cs[r]*fall(k,r)*fall(l-2,3-r) for r in range(4))
   H=(k+1)*H0+24*t*fall(l-2,4)
   tests=[N*c1==C*T,2*fall(N,3)*c2==C*l*J,6*fall(N,5)*(k+1)*c3==C*l*(l-1)*H]
   counts['middle_scaled_identities']+=3
   if not all(tests):fails.append(['scaled',a,b,i,tests])
   G=3*(N-3)*(N-4)*(k+1)*l*J**2-2*(N-1)*(N-2)*(l-1)*T*H
   counts['middle_gap_checks']+=1
   if G<0:fails.append(['gap',a,b,i,G])
 out=dict(status='Finite exact checks, not a universal proof',denominator_bound=48,counts=counts,failures=fails,seconds=time.monotonic()-start)
 (O/'strip-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
