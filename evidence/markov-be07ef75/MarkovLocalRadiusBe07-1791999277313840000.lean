import Mathlib
/-! Machine-authored be07ef75. No fixed charge radius suffices for abstract
aggregation. These arrays are NOT asserted to be source Markov coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def radiusLowBe07 (h t q : ℕ) : ℕ := t^(2*(h+1-q))
def radiusMidBe07 (h t : ℕ) : ℕ := t^(2*h+1)
def radiusHighBe07 (t q : ℕ) : ℕ := t^(2*q)

theorem radius_local_pairBe07 (h t q r : ℕ) (ht : 1 ≤ t)
 (hq : q ≤ h+1) (hrq : r ≤ q+h) :
 radiusLowBe07 h t q * radiusHighBe07 t r ≤ radiusMidBe07 h t ^ 2 := by
 unfold radiusLowBe07 radiusHighBe07 radiusMidBe07
 rw [← pow_add,← pow_mul]
 apply Nat.pow_le_pow_right ht
 omega

theorem radius_windowBe07 (h t : ℕ) (ht : 1 ≤ t) (I : Finset ℕ)
 (hi : ∀ q ∈ I, q ≤ h+1) (hd : ∀ q ∈ I, ∀ r ∈ I, r ≤ q+h) :
 (∑ q ∈ I, radiusLowBe07 h t q) * (∑ r ∈ I, radiusHighBe07 t r) ≤
 (∑ _q ∈ I, radiusMidBe07 h t)^2 := by
 rw [pow_two,Finset.sum_mul,Finset.sum_mul]
 apply Finset.sum_le_sum
 intro q hq
 rw [Finset.mul_sum,Finset.mul_sum]
 apply Finset.sum_le_sum
 intro r hr
 exact radius_local_pairBe07 h t q r ht (hi q hq) (hd q hq r hr)

theorem radius_low_geometricBe07 (h t q : ℕ) (hq : q+2 ≤ h+1) :
 radiusLowBe07 h t q * radiusLowBe07 h t (q+2) =
 radiusLowBe07 h t (q+1)^2 := by
 unfold radiusLowBe07
 rw [← pow_add,← pow_mul]
 congr 1
 omega

theorem radius_high_geometricBe07 (t q : ℕ) :
 radiusHighBe07 t q * radiusHighBe07 t (q+2) = radiusHighBe07 t (q+1)^2 := by
 unfold radiusHighBe07
 rw [← pow_add,← pow_mul]
 congr 1
 omega

theorem radius_sum_midBe07 (h : ℕ) :
 (∑ _q ∈ range (h+2), radiusMidBe07 h (h+2)) = (h+2)^(2*h+2) := by
 simp only [radiusMidBe07,sum_const,card_range,nsmul_eq_mul]
 rw [show 2*h+2=2*h+1+1 by omega,pow_succ]
 exact Nat.mul_comm _ _

theorem radius_sum_high_gtBe07 (h : ℕ) :
 (h+2)^(2*h+2) < ∑ q ∈ range (h+2), radiusHighBe07 (h+2) q := by
 rw [show h+2=(h+1)+1 by omega,Finset.sum_range_succ]
 have hp : 0 < ∑ q ∈ range (h+1), radiusHighBe07 (h+2) q := by
   apply Finset.sum_pos'
   · intro q hq; exact Nat.zero_le _
   · exact ⟨0,by simp,by simp [radiusHighBe07]⟩
 simp only [radiusHighBe07] at *
 have he : 2*(h+1)=2*h+2 := by omega
 rw [he]
 omega

theorem radius_sum_reverseBe07 (h t : ℕ) :
 (∑ q ∈ range (h+2), radiusLowBe07 h t q) =
 ∑ q ∈ range (h+2), radiusHighBe07 t q := by
 unfold radiusLowBe07 radiusHighBe07
 have he := Finset.sum_range_reflect (fun q => t^(2*q)) (h+2)
 simpa only [show h+2-1=h+1 by omega] using he

/-- For EVERY finite radius h, all local-window comparisons above hold, but
the full sums strictly reverse LC. This is an obstruction to a proof principle,
not to Conjecture63 and not to the exact Pell binomial array. -/
theorem no_fixed_local_radiusBe07 (h : ℕ) :
 (∑ _q ∈ range (h+2), radiusMidBe07 h (h+2))^2 <
 (∑ q ∈ range (h+2), radiusLowBe07 h (h+2) q) *
 (∑ q ∈ range (h+2), radiusHighBe07 (h+2) q) := by
 rw [radius_sum_reverseBe07,radius_sum_midBe07]
 have hlt := radius_sum_high_gtBe07 h
 have hp : 0 < (h+2)^(2*h+2) := by positivity
 nlinarith

#print axioms radius_local_pairBe07
#print axioms radius_windowBe07
#print axioms radius_low_geometricBe07
#print axioms radius_high_geometricBe07
#print axioms no_fixed_local_radiusBe07
end
end MathGKM.Markov
