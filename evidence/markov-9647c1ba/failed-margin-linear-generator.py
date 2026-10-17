"""Machine-authored 9647c1ba: exact rational scalar certificate proposal."""
from pathlib import Path
from fractions import Fraction as F
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9647c1ba'
src=(R/'research/generate_boundary_f8f306c0.py').read_text();ns={'F':F}
exec(src[src.index('class P(dict):'):src.index('class Rat:')],ns)
x,g,z=ns['x'],ns['g'],ns['z'];horner=ns['horner']
out=[];polys={}
for r in [False,True]:
 s=x+4;d=s-1+g;j=d+(9 if r else 8)
 V=(96 if r else 72)*d+(44*d+156 if r else 28*d+96)*(s+1)
 B=F(1,5040)*(j+1)*(j+2)*(j+3)*(j+4)*(j+5)*(j+6)*(j+7)+z
 W=(s+5)*(s+6)+4*j*(s+j+5)
 p=B**2*j*(s+5)*(s+6)**2*(s+1)**2-(2*B*V*(s+1)+V**2)*(s+j+4)*W**2
 out.append({'residue':r,'terms':len(p),'negative':sum(v<0 for v in p.values()),'degrees':[max(k[i] for k in p) for i in range(3)]});polys[r]=p
(O/'margin-generation.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if any(a['negative'] for a in out):raise SystemExit('negative coefficients; no certificate emitted')
s='''import MarkovSecondMarginsMC3E
/-! Machine-authored 9647c1ba. Multiplicative robustness margin; exact
polynomial identity and nonnegativity checked with ordinary Lean tactics. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
def thirdBoundNumeratorM964 (s d : ℚ) (r : Bool) : ℚ :=
 (if r then 96 else 72)*d+
 (if r then 44*d+156 else 28*d+96)*(s+1)
def thirdMarginScalarM964 (s d B : ℚ) (r : Bool) : ℚ :=
 let j := d+(if r then 9 else 8)
 let V := thirdBoundNumeratorM964 s d r
 B^2*j*(s+5)*(s+6)^2*(s+1)^2-
 (2*B*V*(s+1)+V^2)*(s+j+4)*((s+5)*(s+6)+4*j*(s+j+5))^2
'''
for r in [False,True]:
 b=str(r).lower();off=12 if r else 11
 s+=f'''\ntheorem third_margin_{b}M964 (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ thirdMarginScalarM964 (x+4) (x+3+g) (secondMarginBaseMC3E (x+{off}+g)+z) {b} := by
 have he : thirdMarginScalarM964 (x+4) (x+3+g) (secondMarginBaseMC3E (x+{off}+g)+z) {b}=
   {horner(polys[r])} := by
   unfold thirdMarginScalarM964 thirdBoundNumeratorM964 secondMarginBaseMC3E
   simp only [Bool.false_eq_true,if_false,if_true]
   ring
 rw [he]
 positivity
'''
s+='''
theorem third_margin_nonnegM964 (s d B : ℚ) (r : Bool) (hs : 4 ≤ s) (hd : s-1 ≤ d)
 (hB : secondMarginBaseMC3E (d+(if r then 9 else 8)) ≤ B) :
 0 ≤ thirdMarginScalarM964 s d B r := by
 cases r
 · have h := third_margin_falseM964 (s-4) (d-s+1) (B-secondMarginBaseMC3E (d+8))
     (by linarith) (by linarith) (by simpa using sub_nonneg.mpr hB)
   convert h using 1 <;> congr 1 <;> ring
 · have h := third_margin_trueM964 (s-4) (d-s+1) (B-secondMarginBaseMC3E (d+9))
     (by linarith) (by linarith) (by simpa using sub_nonneg.mpr hB)
   convert h using 1 <;> congr 1 <;> ring
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdMarginCertificateM964.lean').write_text(s)
