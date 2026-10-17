import MarkovFirstDiagonalTemplateM2C6
import MarkovMiddleCrossingM50C
/-! Machine-authored 2c6e5ef0. Exact coefficient transport across the two
upper-entry rows. The low-degree correction vanishes at these positions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem first_diagonal_template_bridgeM2C6 (q j s : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hs : s ≤ 1) (hj : j+q+1+s=sourceNME9C q r) :
 threeRawM9E2 q r 1 (j+2)=(topTemplateMB3E (sourceNME9C q r) (q+1+s)).coeff 1 ∧
 threeRawM9E2 q r 2 (j+1)=(topTemplateMB3E (sourceNME9C q r) (q+2+s)).coeff 2 ∧
 threeRawM9E2 q r 3 j=(topTemplateMB3E (sourceNME9C q r) (q+3+s)).coeff 3 := by
 have h0 := source_top_coeffMB3E q (q+1+s) 1 r hq (by omega)
 rw [show sourceNME9C q r+2-(q+1+s)=j+2 by omega] at h0
 have h2 := source_middle_high_coeffM99A q s 3 r hq (by omega) (by omega)
 rw [show sourceNME9C q r+2-(q+3+s)=j by omega] at h2
 refine ⟨h0,?_,h2⟩
 by_cases hs0 : s=0
 · subst s
   have h1 := source_top_coeffMB3E q (q+2) 2 r hq le_rfl
   rw [show sourceNME9C q r+2-(q+2)=j+1 by omega] at h1
   simpa only [Nat.add_zero] using h1
 · have hs1 : s=1 := by omega
   subst s
   have h1 := source_middle_high_coeffM99A q 0 2 r hq (by omega) (by omega)
   rw [show sourceNME9C q r+2-(q+3+0)=j+1 by omega] at h1
   simpa only [Nat.add_zero,show q+2+1=q+3 by omega] using h1

theorem first_boundary_largeM2C6 (q j s : ℕ) (r : Bool)
 (hq : 7 ≤ q) (hs : s ≤ 1) (hj : j+q+1+s=sourceNME9C q r) :
 threeRawM9E2 q r 1 (j+2)*threeRawM9E2 q r 3 j ≤ threeRawM9E2 q r 2 (j+1)^2 := by
 obtain ⟨h0,h1,h2⟩ := first_diagonal_template_bridgeM2C6 q j s r (by omega) hs hj
 rw [h0,h1,h2]
 obtain ⟨n,hn⟩ := Nat.exists_eq_add_of_le hq
 have hq' : q=n+7 := by omega
 rw [hq']
 interval_cases s <;> cases r
 · simpa only [sourceNME9C,Bool.false_eq_true,if_false,Nat.add_zero,Nat.add_assoc] using first_template_0_2M2C6 n
 · simpa only [sourceNME9C,if_true,Nat.add_zero,Nat.add_assoc] using first_template_0_1M2C6 n
 · simpa only [sourceNME9C,Bool.false_eq_true,if_false,Nat.add_assoc] using first_template_1_2M2C6 n
 · simpa only [sourceNME9C,if_true,Nat.add_assoc] using first_template_1_1M2C6 n

end
end MathGKM.Markov
