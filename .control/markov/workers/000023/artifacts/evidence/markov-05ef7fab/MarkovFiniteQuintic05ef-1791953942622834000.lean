import MarkovSixthLongE582
import MarkovFiniteQuartic26dd
/-! Machine-authored 05ef7fab. Exact finite quintic word base. -/
namespace MathGKM.Markov
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
def qa05ef (m : ℤ) := m*(m-1)*(m-2)*(m-3)*(m-4)
def qb05ef (n m s t h e : ℤ) :=
 -360+750*m-605*m^2+270*m^3-55*m^4+120*n-170*n*m+55*n*m^2-10*n*m^3+5*n*m^4-
 120*(m^2-3*m+3)*s+240*(m-1)*t+240*h+120*e
def qc05ef (n m s t k e f : ℤ) :=
 -1440+2040*m-1140*m^2+660*m^3+720*n-940*n*m-30*n*m^2-170*n*m^3+
 140*n^2*m+30*n^2*m^2+10*n^2*m^3-120*(2*m*(n-6)+9)*s+
 240*(n-5)*t-240*k-120*e+240*f
def qd05ef (n m s : ℤ) :=
 -720+420*m-1500*m^2+1320*n+670*n*m+950*n*m^2-720*n^2-420*n^2*m-
 180*n^2*m^2+120*n^3+50*n^3*m+10*n^3*m^2-120*(n-3)*(n-4)*s
def qe05ef (n m : ℤ) :=
 240*m-120*n-470*n*m+220*n^2+295*n^2*m-120*n^3-70*n^3*m+20*n^4+5*n^4*m
def qf05ef (n : ℤ) := (n+1)*n*(n-1)*(n-2)*(n-3)


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
