"""Machine-authored exact polynomial certificates; Lean independently checks ring identities."""
from pathlib import Path
from fractions import Fraction as F
import json,math
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1bb0aa1e'
class P:
 def __init__(self,c): self.c={k:F(v) for k,v in (c.items() if isinstance(c,dict) else [(0,c)]) if v}
 def __add__(self,b):
  b=b if isinstance(b,P) else P(b);c=self.c.copy()
  for k,v in b.c.items():c[k]=c.get(k,0)+v
  return P(c)
 __radd__=__add__
 def __neg__(self):return P({k:-v for k,v in self.c.items()})
 def __sub__(self,b):return self+-1*b
 def __rsub__(self,b):return -self+b
 def __mul__(self,b):
  b=b if isinstance(b,P) else P(b);c={}
  for i,a in self.c.items():
   for j,v in b.c.items():c[i+j]=c.get(i+j,0)+a*v
  return P(c)
 __rmul__=__mul__
 def __truediv__(self,b):return self*F(1,b)
 def __pow__(self,n):
  a=P(1)
  for _ in range(n):a=a*self
  return a
def l3(x):return (x+1)*(x+2)*(x+3)*(x*x+4*x+5)/30
def l4(n,x):return (x+1)*(x+2)*(x+3)*(x+4)*(7*(n-1)*(2*x*x+10*x+15)-x*(18*x*x+100*x+155))/2520
def expr(p):
 den=math.lcm(*(v.denominator for v in p.c.values()))
 return '('+' + '.join(str(int(v*den))+(' * x' if k==1 else f' * x^{k}' if k else '') for k,v in sorted(p.c.items()))+f') / {den}'
def main():
 x=P({1:1});checks={}
 header='''import MarkovTailSourceM1BB
/-! Machine-authored 1bb0aa1e. Exact polynomial certificates for crossing LC.
Generated rational expressions are checked by Lean ring, not an oracle. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

''';s=header
 for i in [3,4]:
  for r in [False,True]:
   n=3*(x+1)+(1 if r else 2)
   base=lambda j:l3(j) if i==3 else l4(n,j)
   corr=(8*(x-1) if r else 4*x) if i==3 else (4*(x-1)*(x-2) if r else 2*x*(x-1))
   gap=base(x+1)**2-base(x)*(base(x+2)+corr)
   name=f'crossGap{i}{"T" if r else "F"}M1BB';b=str(r).lower()
   term=lambda j:f'lowThreeME9C ({j})' if i==3 else f'lowFourME9C (3*(x+1)+{1 if r else 2}) ({j})'
   s+=f'def {name} (x : ℚ) : ℚ := {expr(gap)}\n\n'
   s+=f'theorem cross_identity{i}{"T" if r else "F"}M1BB (x : ℚ) :\n {term("x+1")}^2-{term("x")}*({term("x+2")}+tail{"Three" if i==3 else "Four"}M1BB (x+1) {b})={name} x := by\n simp only [lowThreeME9C,lowFourME9C,tailThreeM1BB,tailFourM1BB,{name}]\n norm_num only [Bool.false_eq_true,if_false,if_true]\n ring\n\n'
   s+=f'theorem cross_positive{i}{"T" if r else "F"}M1BB (x : ℚ) (hx : 0 ≤ x) : 0 < {name} x := by\n unfold {name}\n positivity\n\n'
   checks[name]={'coefficients':{k:str(v) for k,v in gap.c.items()},'all_coefficients_positive':all(v>0 for v in gap.c.values())}
 gap=l3(x+1)**2-l3(x)*l3(x+2)
 s+=f'def lowThreeGapM1BB (x : ℚ) : ℚ := {expr(gap)}\n\ntheorem low_three_strictM1BB (x : ℚ) (hx : 0 ≤ x) :\n lowThreeME9C x*lowThreeME9C (x+2)<lowThreeME9C (x+1)^2 := by\n have he : lowThreeME9C (x+1)^2-lowThreeME9C x*lowThreeME9C (x+2)=lowThreeGapM1BB x := by\n  unfold lowThreeME9C lowThreeGapM1BB\n  ring\n have hp : 0<lowThreeGapM1BB x := by unfold lowThreeGapM1BB; positivity\n linarith\n\n'
 s+='end\nend MathGKM.Markov\n'
 (R/'research/MarkovCrossCertificateM1BB.lean').write_text(s)
 (O/'crossing-certificates.json').write_text(json.dumps(checks,indent=2)+'\n')
 print(json.dumps({k:v['all_coefficients_positive'] for k,v in checks.items()}))
if __name__=='__main__':main()
