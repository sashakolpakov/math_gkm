"""Machine-authored cyclic linear-shift simplification candidates."""
from pathlib import Path
import json,ast
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,moment,serialize
from probe_shift_f2da221d import load
from generate_linear_cc599cf1 import expr
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
d=json.loads((O/'linear-local-candidates.json').read_text())
head='''import MarkovThirdLinearCC
import MarkovFourLinearCC
/-! Machine-authored cc599cf1. Shift-linear moment identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
'''
s=head+'''
theorem fourMoment_threeCC {A : Type*} [CommRing A]
 (f : Bool → Bool → Bool → A) (c r : ℕ) :
 fourMomentBE (fun p q r _ => f p q r) c r=
 boolMomentADB2 f c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;> unfold boolMomentADB2 boolJetADB2 fourTripleBE fourQuadBE
   fourCanonicalBE fourPotentialBE <;> ring
'''
for title,arity in [('Third',3),('Four',4)]:
 vals={ast.literal_eval(k)[:3]:load(v) for k,v in d[title]['values'].items()}
 m=moment(vals);print(title,'moment',len(m),'stat_dep',any(any(k[i] for i in [4,5,6]) for k in m),flush=True)
 assert not any(any(k[i] for i in [4,5,6]) for k in m)
 s+=f'\ndef linear{title}MomentCC {{A : Type*}} [CommRing A] (N Z C R x : A) : A :=\n '+expr(m)+'\n'
 s+=f'''
theorem linear{title}_momentCC {{A : Type*}} [CommRing A] (N Z x c r q t u : A) :
 boolMomentADB2 (linear{title}CC N Z x) c r q t u=linear{title}MomentCC N Z c r x := by
 unfold boolMomentADB2 boolJetADB2 linear{title}CC linear{title}MomentCC
 ring
'''
 if title=='Third':
  s+='''
theorem thirdMoment_linearCC {A : Type*} [CommRing A] (N Z x c r q t u : A) (hz : Z^2=0) :
 boolMomentADB2 (localThirdNumBC N Z x) c r q t u=linearThirdMomentCC N Z c r x := by
 have he : localThirdNumBC N Z x=linearThirdCC N Z x := by
   funext p q r; exact localThird_linearCC N Z x p q r hz
 rw [he,linearThird_momentCC]
'''
 else:
  s+='''
theorem fourthMoment_linearCC {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) (hz : Z^2=0) :
 fourMomentBE (localFourNumBC N Z x) c r=linearFourMomentCC N Z c r x := by
 have he : localFourNumBC N Z x=(fun p q r _ => linearFourCC N Z x p q r) := by
   funext p q r s; exact localFour_linearCC N Z x p q r s hz
 rw [he,fourMoment_threeCC,linearFour_momentCC]
'''
s+='end\nend MathGKM.Markov\n'
(R/'research/MarkovLinearMomentsCC.lean').write_text(s)
