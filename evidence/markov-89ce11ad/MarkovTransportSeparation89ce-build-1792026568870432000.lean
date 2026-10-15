import MarkovPairGap89ce
import MarkovTailSeparation89ce
/-! Machine-authored 89ce11ad. Pair transport implies scalar grade-tail
positivity, while scalar grade-tail positivity alone does not supply transport. -/
namespace MathGKM.Markov
noncomputable section
open Finset

theorem degree_transport_tail_nonneg89 (D : Finset (ℕ × ℕ))
 (G R : ℕ × ℕ → ℝ) (M : (ℕ × ℕ) → (ℕ × ℕ) → ℝ)
 (hnR : ∀ x∈D,0≤R x) (hnM : ∀ x∈D,∀ y∈D,0≤M x y)
 (ho : ∀ x∈D,∀ y∈D,M x y≠0 → DegreePairLE89 x y)
 (hid : ∀ x∈D,G x=R x+(∑ y∈D,M y x)-(∑ y∈D,M x y)) (r : ℕ) :
 0≤∑ x∈D,if r≤x.1+x.2 then G x else 0 := by
 have h := finite_transport_nonneg89 D G R
   (fun x => if r≤x.1+x.2 then 1 else 0) M
   (by intro x hx;split_ifs <;> norm_num) hnR hnM
   (by
    intro x hx y hy hM
    have hs := (ho x hx y hy hM).2
    split_ifs <;> norm_num <;> omega) hid
 simpa only [mul_ite,mul_one,mul_zero] using h

def tailA89 (d : ℕ) : ℝ := if d=2 then 1 else 0
def tailB89 (d : ℕ) : ℝ := if d=0 ∨ d=4 then 1 else 0
def tailC89 (d : ℕ) : ℝ := if d=2 then 3 else 0

theorem tail_arrays_no_transport89 :
 ¬HasDegreeTransport89 (range 5) tailA89 tailB89 tailC89 := by
 intro hT
 obtain ⟨R,M,hnR,hnM,ho,hid⟩ := hT
 have h := weighted_array_lc_of_transport89 (range 5) tailA89 tailB89 tailC89
   R M hnR hnM ho hid cappedWeight89 cappedWeight_nonneg89
   cappedWeight_monotone89 cappedWeight_lc89
 norm_num [Finset.sum_range_succ,tailA89,tailB89,tailC89,cappedWeight89] at h

theorem tail_arrays_grade_gap89 (z : ℝ) :
 (∑ d∈range 5,tailB89 d*z^d)^2-
   (∑ d∈range 5,tailA89 d*z^d)*(∑ d∈range 5,tailC89 d*z^d)=
   Polynomial.eval z tailExample89 := by
 norm_num [Finset.sum_range_succ,tailA89,tailB89,tailC89,tailExample89]
 ring

#print axioms degree_transport_tail_nonneg89
#print axioms tail_arrays_no_transport89
#print axioms tail_arrays_grade_gap89
end
end MathGKM.Markov
