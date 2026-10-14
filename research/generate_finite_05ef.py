"""Machine-authored finite quintic certificate generator."""
from pathlib import Path
s=Path('research/MarkovQuinticBoundsE582.lean').read_text()
a=s[s.index('def qaE582'):s.index('theorem quintic_certificateE582')].replace('E582','05ef').replace('ℝ','ℤ')
p='''import MarkovSixthLongE582
import MarkovFiniteQuartic26dd
/-! Machine-authored 05ef7fab. Exact finite quintic word base. -/
namespace MathGKM.Markov
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
'''+a+'''
def quinticGood05ef (n m s t h k e f : ℤ) : Prop :=
 qa05ef m*qc05ef n m s t k e f ≤ qb05ef n m s t h e^2 ∧
 qb05ef n m s t h e*qd05ef n m s ≤ qc05ef n m s t k e f^2 ∧
 qc05ef n m s t k e f*qe05ef n m ≤ qd05ef n m s^2 ∧
 qd05ef n m s*qf05ef n ≤ qe05ef n m^2
instance (n m s t h k e f : ℤ) : Decidable (quinticGood05ef n m s t h k e f) := by
 unfold quinticGood05ef; infer_instance

def quinticWordGood05ef : List Bool → Prop
 | d::e::r::w =>
   let z := endTripleE582 d e r w
   quinticGood05ef (d::e::r::w).length ((d::e::r::w).count true)
    (switchesFrom5a7 d (e::r::w)) (triples4f8 d e (r::w))
    (quadsHE582 d e r w) (quadsKE582 d e r w)
    ((if d then 0 else 1)+(if z.2.2 then 0 else 1))
    ((if hitFE582 d e r then 1 else 0)+(if hitFE582 z.1 z.2.1 z.2.2 then 1 else 0))
 | _ => True
instance (w : List Bool) : Decidable (quinticWordGood05ef w) := by
 cases w with
 | nil => unfold quinticWordGood05ef; infer_instance
 | cons d w => cases w with
   | nil => unfold quinticWordGood05ef; infer_instance
   | cons e w => cases w <;> unfold quinticWordGood05ef <;> infer_instance

theorem finite_quintic05ef : ∀ w ∈ shortWords26dd 17, quinticWordGood05ef w := by
 decide

#print axioms finite_quintic05ef
end MathGKM.Markov
'''
Path('research/MarkovFiniteQuintic05ef.lean').write_text(p)
