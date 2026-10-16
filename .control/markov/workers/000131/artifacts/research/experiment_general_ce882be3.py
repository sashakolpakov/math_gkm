"""Machine-authored exact subtractive-source scan; experiments are not proofs."""
from pathlib import Path
import sys,json,time
from math import comb
sys.path.insert(0,str(Path('/Users/sasha/math_gkm/evidence/markov')))
from scan import generate
from experiment_terminal_263d8c71 import pair
O=Path('/Users/sasha/math_gkm/evidence/markov-ce882be3')
def main():
 start=time.monotonic();fails=[];counts=dict(fractions=0,word_comparisons=0,strip_inequalities=0,zero_triples=0,low_slope_fractions=0,low_scaled_identities=0,general_scaled_identities=0)
 for path,(a,b,p) in generate(32):
  w=tuple((r+1)*a//b-r*a//b for r in range(b));wp=pair(w)[1]
  counts['fractions']+=1;counts['word_comparisons']+=1
  if p!=wp:fails.append(['word',a,b])
  low=3*a<=b
  counts['low_slope_fractions']+=low
  for i in range(a+b+4):
   c1,c2,c3=(p.get((i,j),0) for j in [1,2,3])
   counts['strip_inequalities']+=1;counts['zero_triples']+=int(0 in [c1,c2,c3])
   if c1*c3>c2*c2:fails.append(['strip',a,b,i,[c1,c2,c3]])
   if not (a>=2 and b>=7 and a<=i and i+3<=a+b-1):continue
   k=i-a;l=b-2-k;N=k+l;C=comb(N,k)
   D=9*a*a-5*a+2;E=6*a*a+6*a*b-16*a+4;F=(a+b-1)*(a+b-2)
   T=(3*a-1)*l+(a+b-1)*k
   q=max(2*a-b,0);t=min(b-a,max(3*a-b,0));u=max(3*a-2*b,0)
   cs=[24*u,24*t+(72*a-120)*q,27*a**3-18*a*a+21*a-6+24*(a+b-7)*q,
       27*a**3+27*a*a*b-114*a*a+3*a*b+33*a+6*b-18,
       9*a**3+18*a*a*b-54*a*a+9*a*b*b-51*a*b+87*a+3*b*b-3*b-18,
       (a+b-1)*(a+b-2)*(a+b-3)]
   def fall(x,n):
    z=1
    for r in range(n):z*=x-r
    return z
   J=8*q*fall(l-1,3)+(k+1)*(D*fall(l-1,2)+E*k*(l-1)+F*fall(k,2))
   H=sum(cs[r]*fall(k+2,r)*fall(l-2,5-r) for r in range(6))
   tests=[N*c1==C*T,2*fall(N,3)*(k+1)*c2==C*l*J,6*fall(N,5)*(k+1)*(k+2)*c3==C*l*(l-1)*H]
   counts['general_scaled_identities']+=3
   if not all(tests):fails.append(['general_scaled',a,b,i,tests])
   if low:
    J0=D*fall(l-1,2)+E*k*(l-1)+F*fall(k,2)
    H0=cs[2]*fall(l-2,3)+cs[3]*k*fall(l-2,2)+cs[4]*fall(k,2)*(l-2)+cs[5]*fall(k,3)
    tests=[2*fall(N,3)*c2==C*l*J0,6*fall(N,5)*c3==C*l*(l-1)*H0]
    counts['low_scaled_identities']+=2
    if not all(tests):fails.append(['low_scaled',a,b,i,tests])
 out=dict(status='Finite exact checks, not a universal proof',denominator_bound=32,counts=counts,failures=fails,seconds=time.monotonic()-start)
 (O/'general-strip-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
