"""Machine-authored generation of ring-checked real polynomial certificates."""
from weighted_beta_symbolic_ca9709f2 import P,var,expr,div_exact
from fractions import Fraction as F
from pathlib import Path
import json,math
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-20825094'
raw=json.loads((O/'stein-bound-symbolic.json').read_text())
ps={name:P({tuple(k):F(v) for k,v in vals}) for name,vals in raw.items()}
a,m,H,z=[var(j) for j in range(4)]
ps['reduced']=div_exact(ps['num'],a*m*(m-1))
vs=['a','m','H','z'];defs={n:'stein'+n+'M208' for n in ps}
text='''import MarkovTopEndGroupsMCA9
/-! Machine-authored 20825094. Exact generator identities and positive
certificates for the additional wedge. Auxiliary quantities are not raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
def steinBM208 (a m H k : ℝ) : ℝ := (a+k)*(H+k)*(m-k)*(H-a-3+m-k)
def steinDM208 (a m H k : ℝ) : ℝ := k*(H-a-3+k)*(a+m-k)*(H+m-k)
def steinLM208 (a m H k : ℝ) : ℝ :=
 steinBM208 a m H k*(m-2*k-1)+steinDM208 a m H k*(2*k-m-1)
def steinScalarM208 (a H k l : ℝ) : ℝ :=
 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*
 (k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
'''
for n in ['E','F','C0','Cp','den','reduced']:
 text+=f'def {defs[n]} (a m H : ℝ) : ℝ :=\n  '+expr(ps[n],vs)+'\n'
text+='''
theorem stein_generator_radialM208 (a m H k : ℝ) :
 steinLM208 a m H k=steinFM208 a m H+steinEM208 a m H*(k*(m-k))-
 (8*a+14)*(k*(m-k))^2 := by
 unfold steinLM208 steinBM208 steinDM208 steinFM208 steinEM208
 ring
theorem stein_scalar_generatorM208 (a m H k : ℝ) :
 (4*a+7)*steinScalarM208 a H k (m-k)=
 -2*(a+2)*steinLM208 a m H k+steinC0M208 a m H+steinCpM208 a m H*(k*(m-k)) := by
 unfold steinScalarM208 steinLM208 steinBM208 steinDM208 steinC0M208 steinCpM208
 ring
theorem stein_den_identityM208 (a m H : ℝ) :
 steindenM208 a m H=(8*a+14)*m^2-4*steinEM208 a m H := by
 unfold steindenM208 steinEM208
 ring
theorem stein_certificate_identityM208 (a m H : ℝ) :
 steinC0M208 a m H*steindenM208 a m H+4*steinCpM208 a m H*steinFM208 a m H=
 a*m*(m-1)*steinreducedM208 a m H := by
 unfold steinC0M208 steindenM208 steinCpM208 steinFM208 steinreducedM208
 ring
'''
stats={}
for n in ['den','Cp','reduced']:
 x,y,z,w=[var(j) for j in range(4)];aa=x+2*(y+2);mm=y+2;HH=3*aa+mm*F(1,2)+4+z
 p=ps[n].ev([aa,mm,HH,w]);lcm=math.lcm(*(v.denominator for v in p.d.values()));p=p*lcm
 assert all(v>0 for v in p.d.values()),n
 stats[n]=dict(terms=len(p.d),denominator=lcm)
 ee=expr(p,['x','y','z','w'])
 text+=f'''theorem stein_{n}_shift_positiveM208 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < {defs[n]} (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
 have he : {lcm}*{defs[n]} (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z)=
  {ee} := by unfold {defs[n]}; ring
 have hp : 0 < {lcm}*{defs[n]} (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
  rw [he]
  positivity
 linarith
theorem stein_{n}_positiveM208 (a m H : ℝ)
 (hm : 2 ≤ m) (ha : 2*m ≤ a) (hH : 6*a+m+8 ≤ 2*H) :
 0 < {defs[n]} a m H := by
 have h := stein_{n}_shift_positiveM208 (a-2*m) (m-2) (H-3*a-m/2-4)
  (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
'''
text+='end\nend MathGKM.Markov\n'
(R/'research/MarkovTopSteinAlgebraM208.lean').write_text(text)
(O/'stein-certificate-generation.json').write_text(json.dumps(stats,indent=2))
print(stats)
