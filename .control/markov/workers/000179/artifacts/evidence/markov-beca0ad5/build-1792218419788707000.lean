import MarkovReverseKernelMBEC
import MarkovSecondTopClosedMBEC
/-! Machine-authored beca0ad5. The final two adjacent steps are unconditional;
the remaining all-parameter condition is explicitly retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem reverse_twoMBEC (j s : ℕ) (hj : 2 ≤ j) :
 reverseConvMBEC j (s+1) (s+1) 2*reverseConvMBEC j s (s+2) 1  ≤ 
 reverseConvMBEC j (s+1) (s+1) 1*reverseConvMBEC j s (s+2) 2 := by
 obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
 rw [Nat.add_comm 2 k]
 apply (reverse_adjacent_iffMBEC (k+2) s 2 (by omega) (by omega)).mp
 simpa only [show 2*(k+2)-2=2*k+2 by omega,show 2*k+2+1=2*k+3 by omega] using q_second_last_adjacentMBEC k s

def ReverseInteriorMBEC : Prop := ∀ j s h : ℕ, 3 ≤ h → h ≤ j →
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1)  ≤ 
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h

theorem reverse_interior_iffMBEC : ReverseInteriorMBEC ↔ UpperAdjacentMA45 := by
 rw [←reverse_upper_iffMBEC]
 constructor
 · intro H j s h hh hj
   by_cases ht : 3 ≤ h
   · exact H j s h ht hj
   · have he : h=2 := by omega
     subst h
     exact reverse_twoMBEC j s hj
 · intro H j s h hh hj
   exact H j s h (by omega) hj

theorem sharp_margin_of_reverseMBEC (H : ReverseInteriorMBEC) : SharpCompleteMarginMBE3 :=
 sharp_margin_of_upperMA45 (reverse_interior_iffMBEC.mp H)

theorem source_band_of_reverseMBEC (H : ReverseInteriorMBEC)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1)  ≤ 
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_upperMA45 (reverse_interior_iffMBEC.mp H) q k i r hq hn

end
end MathGKM.Markov
