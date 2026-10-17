"""Machine-authored c3e5369f. Exact sparse arithmetic proposes two-residue certificates."""
from pathlib import Path
from fractions import Fraction as F
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c3e5369f'
src=(R/'research/generate_boundary_f8f306c0.py').read_text();ns={'F':F}
exec(src[src.index('class P(dict):'):src.index('class Rat:')],ns)
x,g,z=ns['x'],ns['g'],ns['z'];horner=ns['horner']
out=[]; polys={}
for r in [False,True]:
 t=x+4;d=t+g;j=d+(6 if r else 5)
 V=(36 if r else 24)*(d-t)+(8*d+24 if r else 4*d+12)*(t+1)
 B=F(1,5040)*(j+1)*(j+2)*(j+3)*(j+4)*(j+5)*(j+6)*(j+7)+z
 W=(t+6)*(t+7)+4*j*(t+j+6)
 num=B**2*j*(t+j+4)*(t+1)**2*(t+6)*(t+7)-2*V*B*(t+j+4)*(t+j+5)*W*(t+1)*(t+4)-V**2*(t+4)**2*(t+5)*(t+6)*(t+7)
 W0=(t+5)*(t+6)+4*j*(t+j+5);W1=(t+6)*(t+7)+4*(j-1)*(t+j+5)
 border=B*j*W1*(t+5)**2*(t+6)*(t+1)-V*(t+j+5)*W0**2*(t+4)*(t+7)
 for tag,p in [('complete',num),('border',border)]:
  out.append({'residue':r,'kind':tag,'terms':len(p),'negative':sum(v<0 for v in p.values()),'degrees':[max(k[i] for k in p) for i in range(3)]})
  polys[r,tag]=p
(O/'margin-generation.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if any(a['negative'] for a in out):raise SystemExit('negative terms; no certificates emitted')
s='''import MarkovMarginCertificateMA64
/-! Machine-authored c3e5369f. Exact second-row scalar certificates, checked by ring. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
set_option maxRecDepth 8192
def secondMarginBaseMC3E (j : ℚ) : ℚ := (j+1)*(j+2)*(j+3)*(j+4)*(j+5)*(j+6)*(j+7)/5040
def secondBoundNumeratorMC3E (t d : ℚ) (r : Bool) : ℚ :=
 if r then 36*(d-t)+(8*d+24)*(t+1) else 24*(d-t)+(4*d+12)*(t+1)
def secondMarginValueMC3E (t d B : ℚ) (r : Bool) : ℚ :=
 let j := d+(if r then 6 else 5)
 let V := secondBoundNumeratorMC3E t d r
 B^2*j*(t+j+4)/((t+4)^2*(t+5))-
 2*V/(t+1)*B*(t+j+4)*(t+j+5)*
 ((t+6)*(t+7)+4*j*(t+j+6))/((t+4)*(t+5)*(t+6)*(t+7))-(V/(t+1))^2
def secondBorderScalarMC3E (t d B : ℚ) (r : Bool) : ℚ :=
 let j := d+(if r then 6 else 5)
 B*j*((t+6)*(t+7)+4*(j-1)*(t+j+5))*(t+5)^2*(t+6)*(t+1)-
 secondBoundNumeratorMC3E t d r*(t+j+5)*((t+5)*(t+6)+4*j*(t+j+5))^2*(t+4)*(t+7)
'''
for r in [False,True]:
 b=str(r).lower();off=10 if r else 9
 s+=f'''\ntheorem second_complete_{b}MC3E (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ secondMarginValueMC3E (x+4) (x+4+g) (secondMarginBaseMC3E (x+{off}+g)+z) {b} := by
 let num : ℚ := {horner(polys[r,'complete'])}
 let den : ℚ := (x+5)^2*(x+8)^2*(x+9)*(x+10)*(x+11)
 have hn : 0 ≤ num := by dsimp [num]; positivity
 have hd : 0 < den := by dsimp [den]; positivity
 have h5 : x+5≠0 := by positivity
 have h8 : x+8≠0 := by positivity
 have h9 : x+9≠0 := by positivity
 have h10 : x+10≠0 := by positivity
 have h11 : x+11≠0 := by positivity
 have he : secondMarginValueMC3E (x+4) (x+4+g) (secondMarginBaseMC3E (x+{off}+g)+z) {b}=num/den := by
   dsimp [secondMarginValueMC3E,secondBoundNumeratorMC3E,secondMarginBaseMC3E,den]
   field_simp [h5,h8,h9,h10,h11]
   <;> dsimp [num] <;> ring
 rw [he]
 exact div_nonneg hn hd.le
theorem second_border_{b}MC3E (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ secondBorderScalarMC3E (x+4) (x+4+g) (secondMarginBaseMC3E (x+{off}+g)+z) {b} := by
 have he : secondBorderScalarMC3E (x+4) (x+4+g) (secondMarginBaseMC3E (x+{off}+g)+z) {b}={horner(polys[r,'border'])} := by
   unfold secondBorderScalarMC3E secondBoundNumeratorMC3E secondMarginBaseMC3E
   simp only [Bool.false_eq_true,if_false,if_true]
   ring
 rw [he]
 positivity
'''
s+='''
theorem second_margin_nonnegMC3E (t d B : ℚ) (r : Bool) (ht : 4 ≤ t) (hd : t ≤ d)
 (hB : secondMarginBaseMC3E (d+(if r then 6 else 5)) ≤ B) :
 0 ≤ secondMarginValueMC3E t d B r := by
 cases r
 · have h := second_complete_falseMC3E (t-4) (d-t) (B-secondMarginBaseMC3E (d+5))
     (by linarith) (by linarith) (by simpa using sub_nonneg.mpr hB)
   convert h using 1 <;> congr 1 <;> ring
 · have h := second_complete_trueMC3E (t-4) (d-t) (B-secondMarginBaseMC3E (d+6))
     (by linarith) (by linarith) (by simpa using sub_nonneg.mpr hB)
   convert h using 1 <;> congr 1 <;> ring
theorem second_border_nonnegMC3E (t d B : ℚ) (r : Bool) (ht : 4 ≤ t) (hd : t ≤ d)
 (hB : secondMarginBaseMC3E (d+(if r then 6 else 5)) ≤ B) :
 0 ≤ secondBorderScalarMC3E t d B r := by
 cases r
 · have h := second_border_falseMC3E (t-4) (d-t) (B-secondMarginBaseMC3E (d+5))
     (by linarith) (by linarith) (by simpa using sub_nonneg.mpr hB)
   convert h using 1 <;> congr 1 <;> ring
 · have h := second_border_trueMC3E (t-4) (d-t) (B-secondMarginBaseMC3E (d+6))
     (by linarith) (by linarith) (by simpa using sub_nonneg.mpr hB)
   convert h using 1 <;> congr 1 <;> ring
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondMarginCertificateMC3E.lean').write_text(s)
