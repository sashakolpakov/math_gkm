import MarkovBinomialLiftMAE9
/-! Machine-authored ae9e841e. Exact reversed transform and interval support.
No adjacent-only test or transform-preservation premise is silently assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

def liftOutputMAE9 (d j t : ℕ) : ℤ :=
 ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*liftTermMAE9 j t m
def reverseLiftMAE9 (j t r : ℕ) : ℤ :=
 if r ≤ t then liftTermMAE9 j t (t-r) else 0

theorem lift_output_reverseMAE9 (d j t : ℕ) :
 liftOutputMAE9 d j t=
 ∑ r ∈ range (t+1), (d.choose r:ℤ)*reverseLiftMAE9 j t r := by
 unfold liftOutputMAE9
 rw [←sum_range_reflect (fun m => (d.choose (t-m):ℤ)*liftTermMAE9 j t m) (t+1)]
 apply sum_congr rfl
 intro r hr
 have hrt : r ≤ t := by have := mem_range.mp hr; omega
 simp only [show t+1-1=t by omega,show t-(t-r)=r by omega,reverseLiftMAE9,if_pos hrt]

theorem lift_output_nonnegMAE9 (d j t : ℕ) : 0 ≤ liftOutputMAE9 d j t := by
 unfold liftOutputMAE9 liftTermMAE9
 apply sum_nonneg
 intro m hm
 positivity

theorem lift_output_positiveMAE9 (d j t : ℕ) (ht : t ≤ d+j) :
 0 < liftOutputMAE9 d j t := by
 rw [liftOutputMAE9,←lower_row_liftMAE9,lower_row_positive_coeffMDAB _ j t (by omega)]
 rw [show 2*j+1+d-j-1=d+j by omega]
 have hp : 0 < ((d+j).choose t:ℤ) := by exact_mod_cast Nat.choose_pos ht
 have hq : 0 < ((t+j+3).choose j:ℤ) := by exact_mod_cast Nat.choose_pos (by omega : j ≤ t+j+3)
 apply add_pos_of_pos_of_nonneg (mul_pos hp hq)
 apply mul_nonneg (by norm_num)
 apply sum_nonneg
 intro s hs
 have hsj : (s:ℤ) ≤ j := by have := mem_range.mp hs; omega
 exact mul_nonneg (mul_nonneg (sub_nonneg.mpr hsj) (by positivity)) (by positivity)

theorem lift_output_tailMAE9 (d j t : ℕ) (ht : d+j < t) :
 liftOutputMAE9 d j t=0 := by
 rw [liftOutputMAE9,←lower_row_liftMAE9,lower_row_positive_coeffMDAB _ j t (by omega)]
 rw [Nat.choose_eq_zero_of_lt (by omega : 2*j+1+d-j-1<t)]
 simp only [Nat.cast_zero,zero_mul,zero_add]
 have hs : (∑ s ∈ range j, ((j:ℤ)-s)*
   ((2*j+1+d-2*j+s-1).choose t:ℤ)*((t+s+3).choose s:ℤ))=0 := by
   apply sum_eq_zero
   intro s hs
   have hsj := mem_range.mp hs
   rw [Nat.choose_eq_zero_of_lt (by omega : 2*j+1+d-2*j+s-1<t)]
   simp
 rw [hs,mul_zero]

theorem lift_output_pos_iffMAE9 (d j t : ℕ) :
 0 < liftOutputMAE9 d j t ↔ t ≤ d+j := by
 constructor
 · intro h
   by_contra ht
   rw [lift_output_tailMAE9 d j t (by omega)] at h
   omega
 · exact lift_output_positiveMAE9 d j t

theorem source_lower_reverse_liftMAE9 (q j t : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r (t+3) j=
 ∑ k ∈ range (t+1), ((sourceNME9C q r-2*j-1).choose k:ℤ)*reverseLiftMAE9 j t k := by
 rw [source_lower_liftMAE9 q j t r hj]
 exact lift_output_reverseMAE9 _ j t

end
end MathGKM.Markov
