"""Machine-authored exact scalar certificate for a prospective fourth-moment bound.
No probabilistic or source bridge is generated or assumed.
"""
from pathlib import Path
from fractions import Fraction as F
from math import lcm
import json
from weighted_beta_symbolic_ca9709f2 import P,var,expr
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-73199834'
raw=json.loads((O/'fourth-moment-probe.json').read_text())
poly=lambda vs:P({tuple(k):F(v) for k,v in vs if F(v)})
red=poly(raw['reduced']);selected=next(q for q in raw['positive_certificates'] if q['offset']==3 and q['c']==4)
rem=poly(selected['remainder']);fac=P()
for key,v in selected['factors']:
 key[1]-=1;fac=fac+P({tuple(key):F(v)})
x,y,z,w=[var(j) for j in range(4)]
shift=red.ev([x+3,y+2,3*(x+3)+(y+2)*F(1,2)+4+z,w])
assert not (shift-rem-(x*x-4*y)*fac).d
assert all(v>0 for v in rem.d.values()) and all(v>0 for v in fac.d.values())
scale=lcm(*(v.denominator for p in [rem,fac] for v in p.d.values()))
ee=expr(rem*scale,['x','y','z','w']);ff=expr(fac*scale,['x','y','z','w'])
s='''import MarkovTopSteinCorrectionM208
/-! Machine-authored 73199834. Exact scalar fourth-moment certificate.
The required normalized fourth-moment bound is a separate unproved attachment;
this file makes no source positivity or asymptotic claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
def fourthMomentDenM731 (a : ℝ) : ℝ := 16*(2*a+1)*(2*a+3)
def fourthMomentNumM731 (a m : ℝ) : ℝ := m*(2*a+m)*(3*m*(2*a+m)-4*a)
def fourthDeltaM731 (a m H : ℝ) : ℝ := (8*a+14)*m^2/2-steinEM208 a m H
def fourthCenterM731 (a m H : ℝ) : ℝ :=
 (a+m/2)*(H+m/2)*m*(H-a-3+m/2)
def fourthCertificateM731 (a m H : ℝ) : ℝ :=
 (steinC0M208 a m H+steinCpM208 a m H*m^2/4)*fourthDeltaM731 a m H*fourthMomentDenM731 a-
 steinCpM208 a m H*(fourthCenterM731 a m H*fourthMomentDenM731 a+
   (8*a+14)*fourthMomentNumM731 a m)
def fourthReducedM731 (a m H : ℝ) : ℝ :=
'''+expr(red,['a','m','H','z'])+'''
theorem fourth_certificate_factorM731 (a m H : ℝ) :
 fourthCertificateM731 a m H=a*m*(m-1)*fourthReducedM731 a m H := by
 unfold fourthCertificateM731 fourthReducedM731 fourthDeltaM731 fourthCenterM731
   fourthMomentDenM731 fourthMomentNumM731 steinC0M208 steinCpM208 steinEM208
 ring

theorem fourth_reduced_shift_positiveM731 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) (hxy : 4*y ≤ x^2) :
 0 < fourthReducedM731 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : SCALE*fourthReducedM731 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 (REM)+(x^2-4*y)*(FAC) := by unfold fourthReducedM731; ring
 have hp : (0:ℝ)<REM := by positivity
 have hf : (0:ℝ)≤FAC := by positivity
 have hc : 0 ≤ (x^2-4*y)*(FAC) := mul_nonneg (sub_nonneg.mpr hxy) hf
 linarith only [he,hp,hc]

attribute [local irreducible] fourthReducedM731 fourthCertificateM731
theorem fourth_certificate_positiveM731 (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (ham : 4*(m-2) ≤ (a-3)^2)
 (hH : 6*a+m+8 ≤ 2*H) : 0 < fourthCertificateM731 a m H := by
 have h := fourth_reduced_shift_positiveM731 (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith) ham
 have hr : 0 < fourthReducedM731 a m H := by
   convert h using 1 <;> ring
 have hp : 0 < a*m*(m-1)*fourthReducedM731 a m H :=
   mul_pos (mul_pos (mul_pos (by linarith) (by linarith)) (by linarith)) hr
 exact hp.trans_eq (fourth_certificate_factorM731 a m H).symm
end
end MathGKM.Markov
'''
s=s.replace('SCALE',str(scale)).replace('REM',ee).replace('FAC',ff)
(R/'research/MarkovTopFourthMomentCertificateM731.lean').write_text(s)
(O/'fourth-moment-certificate.json').write_text(json.dumps(dict(scale=scale,remainder_terms=len(rem.d),factor_terms=len(fac.d),verified_symbolic_identity=True,status='Lean checking required; attachment remains unproved'),indent=2))
print(json.dumps(dict(scale=scale,remainder_terms=len(rem.d),factor_terms=len(fac.d))))
