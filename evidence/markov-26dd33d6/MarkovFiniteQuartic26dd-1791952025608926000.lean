import MarkovQuarticSource4f8

/-! Machine-authored request 26dd33d6. Kernel-checked finite word base cases;
these alone do not establish any universal source inequality. -/
namespace MathGKM.Markov
open Polynomial
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

def quarticGoodZ26dd (n m s t : ℤ) : Prop :=
 let a := m*(m-1)*(m-2)*(m-3)
 let b := 4*((n-8)*m^3+18*m^2+(5*n-22)*m-6*n+12)+48*(1-m)*s+48*t
 let c := 6*(n^2*(m^2+3*m+6)+n*(-11*m^2-9*m-18)+26*m^2-10*m+12)+(144-48*n)*s
 let d := 4*(n-1)*(n-2)*(3*n+m*(n-6))
 let e := (n+1)*n*(n-1)*(n-2)
 a*c ≤ b^2 ∧ b*d ≤ c^2 ∧ c*e ≤ d^2

instance (n m s t : ℤ) : Decidable (quarticGoodZ26dd n m s t) := by
 unfold quarticGoodZ26dd
 infer_instance

def quarticWordGood26dd : List Bool → Prop
 | e::r::w => quarticGoodZ26dd (e::r::w).length ((e::r::w).count true)
    (switchesFrom5a7 e (r::w)) (triples4f8 e r w)
 | _ => True

instance (w : List Bool) : Decidable (quarticWordGood26dd w) := by
 cases w with
 | nil => unfold quarticWordGood26dd; infer_instance
 | cons e w => cases w <;> unfold quarticWordGood26dd <;> infer_instance

def shortWords26dd : ℕ → List (List Bool)
 | 0 => [[]]
 | n+1 => [] :: (shortWords26dd n).flatMap (fun w => [false::w,true::w])

theorem mem_shortWords26dd (w : List Bool) (n : ℕ) (h : w.length ≤ n) :
 w ∈ shortWords26dd n := by
 induction n generalizing w with
 | zero => have hw : w=[] := List.length_eq_zero_iff.mp (by omega); subst w; simp [shortWords26dd]
 | succ n ih =>
   cases w with
   | nil => simp [shortWords26dd]
   | cons e w =>
     have hw := ih w (by simpa using h)
     simp only [shortWords26dd,List.mem_cons,List.mem_flatMap]
     right
     refine ⟨w,hw,?_⟩
     cases e <;> simp

theorem finite_quartic26dd : ∀ w ∈ shortWords26dd 9, quarticWordGood26dd w := by
 decide

theorem short_quartic26dd (e r : Bool) (w : List Bool)
 (h : (e::r::w).length ≤ 9) :
 quarticGoodZ26dd (e::r::w).length ((e::r::w).count true)
    (switchesFrom5a7 e (r::w)) (triples4f8 e r w) :=
 finite_quartic26dd _ (mem_shortWords26dd _ _ h)

theorem quarticGood_cast26dd (n m s t : ℕ) (h : quarticGoodZ26dd n m s t) :
 qa4f8 m*qc4f8 n m s ≤ qb4f8 n m s t^2 ∧
 qb4f8 n m s t*qd4f8 n m ≤ qc4f8 n m s^2 ∧
 qc4f8 n m s*qe4f8 n ≤ qd4f8 n m^2 := by
 unfold quarticGoodZ26dd at h
 unfold qa4f8 qb4f8 qc4f8 qd4f8 qe4f8
 exact_mod_cast h

#print axioms finite_quartic26dd
#print axioms short_quartic26dd
end MathGKM.Markov
