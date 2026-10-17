"""Machine-authored a646848d. Scalar border-margin candidate generation."""
from pathlib import Path
from fractions import Fraction as F
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-a646848d'
src=(R/'research/generate_boundary_f8f306c0.py').read_text();ns={'F':F}
exec(src[src.index('class P(dict):'):src.index('class Rat:')],ns)
x,g,z=ns['x'],ns['g'],ns['z'];horner=ns['horner']
t=x+4;j=t+3+g;B=F(1,120)*(j+1)*(j+2)*(j+3)*(j+4)*(j+5)+z
W0=(t+5)*(t+6)+4*j*(t+j+5);W1=(t+6)*(t+7)+4*(j-1)*(t+j+5)
num=B*j*W1*(t+5)**2*(t+6)*(t+1)-8*(j-t-2)*(t+j+5)*W0**2*(t+4)*(t+7)
out={'status':'candidate requires Lean','terms':len(num),'negative':sum(v<0 for v in num.values()),'degrees':[max(k[i] for k in num) for i in range(3)]}
(O/'border-margin-generation.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
assert not out['negative']
s='''import MarkovMarginCertificateMA64
/-! Machine-authored a646848d. Scalar lower bound needed at every border. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192
def borderScalarMA64 (t j B : ℚ) : ℚ :=
 B*j*((t+6)*(t+7)+4*(j-1)*(t+j+5))*(t+5)^2*(t+6)*(t+1)-
 8*(j-t-2)*(t+j+5)*((t+5)*(t+6)+4*j*(t+j+5))^2*(t+4)*(t+7)
theorem border_scalar_certificateMA64 (x g z : ℚ)
 (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ borderScalarMA64 (x+4) (x+7+g) (marginBaseMA64 (x+7+g)+z) := by
'''
s+=' have he : borderScalarMA64 (x+4) (x+7+g) (marginBaseMA64 (x+7+g)+z)='+horner(num)+' := by\n'
s+='''   unfold borderScalarMA64 marginBaseMA64
   ring
 rw [he]
 positivity
theorem border_scalar_nonnegMA64 (t j B : ℚ) (ht : 4 ≤ t) (hj : t+3 ≤ j)
 (hB : marginBaseMA64 j ≤ B) : 0 ≤ borderScalarMA64 t j B := by
 have h := border_scalar_certificateMA64 (t-4) (j-t-3) (B-marginBaseMA64 j)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> congr 1 <;> ring
end
end MathGKM.Markov
'''
(R/'research/MarkovBorderScalarMA64.lean').write_text(s)
