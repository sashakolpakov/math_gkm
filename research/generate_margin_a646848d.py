"""Machine-authored a646848d. Propose a small exact polynomial certificate."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-a646848d'
# Reuse only the pure sparse-polynomial definitions; no predecessor actions run.
src=(R/'research/generate_boundary_f8f306c0.py').read_text()
ns={};exec(src[src.index('class P(dict):'):src.index('class Rat:')],dict(F=__import__('fractions').Fraction),ns)
# Functions need a shared globals dictionary.
ns={'F':__import__('fractions').Fraction}
exec(src[src.index('class P(dict):'):src.index('class Rat:')],ns)
x,g,z=ns['x'],ns['g'],ns['z'];F=ns['F'];horner=ns['horner']
t=x+4;j=t+3+g;u0=j-t-2
B=F(1,120)*(j+1)*(j+2)*(j+3)*(j+4)*(j+5)+z
W=(t+6)*(t+7)+4*j*(t+j+6)
num=B**2*j*(t+j+4)*(t+1)**2*(t+6)*(t+7)-16*u0*B*(t+j+4)*(t+j+5)*W*(t+1)*(t+4)-64*u0**2*(t+4)**2*(t+5)*(t+6)*(t+7)
out={'status':'generated candidate, requires Lean check','terms':len(num),'negative':sum(v<0 for v in num.values()),'degrees':[max(k[i] for k in num) for i in range(3)]}
(O/'margin-generation.json').write_text(json.dumps(out,indent=2)+'\n');print(out)
assert not out['negative']
s='''import MarkovBinomialMarginMA64
/-! Machine-authored a646848d. Rational robustness margin certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 8192

def marginBaseMA64 (j : ℚ) : ℚ := (j+1)*(j+2)*(j+3)*(j+4)*(j+5)/120
def marginValueMA64 (t j B : ℚ) : ℚ :=
 B^2*j*(t+j+4)/((t+4)^2*(t+5))-
 16*(j-t-2)/(t+1)*B*(t+j+4)*(t+j+5)*
 ((t+6)*(t+7)+4*j*(t+j+6))/((t+4)*(t+5)*(t+6)*(t+7))-
 (8*(j-t-2)/(t+1))^2

theorem margin_certificateMA64 (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ marginValueMA64 (x+4) (x+7+g) (marginBaseMA64 (x+7+g)+z) := by
'''
s+=' let num : ℚ := '+horner(num)+'\n'
s+=''' let den : ℚ := (x+5)^2*(x+8)^2*(x+9)*(x+10)*(x+11)
 have hn : 0 ≤ num := by dsimp [num]; positivity
 have hd : 0 < den := by dsimp [den]; positivity
 have h5 : x+5≠0 := by positivity
 have h8 : x+8≠0 := by positivity
 have h9 : x+9≠0 := by positivity
 have h10 : x+10≠0 := by positivity
 have h11 : x+11≠0 := by positivity
 have he : marginValueMA64 (x+4) (x+7+g) (marginBaseMA64 (x+7+g)+z)=num/den := by
   dsimp [marginValueMA64,marginBaseMA64,den]
   field_simp [h5,h8,h9,h10,h11]
   <;> dsimp [num] <;> ring
 rw [he]
 exact div_nonneg hn hd.le

theorem margin_nonnegMA64 (t j B : ℚ) (ht : 4 ≤ t) (hj : t+3 ≤ j)
 (hB : marginBaseMA64 j ≤ B) : 0 ≤ marginValueMA64 t j B := by
 have h := margin_certificateMA64 (t-4) (j-t-3) (B-marginBaseMA64 j)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> congr 1 <;> ring

end
end MathGKM.Markov
'''
(R/'research/MarkovMarginCertificateMA64.lean').write_text(s)
