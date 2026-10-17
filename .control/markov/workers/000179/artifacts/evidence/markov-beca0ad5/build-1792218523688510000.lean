import MarkovUpperResidualMBEC
import MarkovReverseThreeMBEC
/-! Machine-authored beca0ad5. Exact still-open residual, deficiency at least four. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

def ReverseCoreMBEC : Prop := ∀ j s h : ℕ, 4 ≤ h → h ≤ j →
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h

theorem reverse_core_iffMBEC : ReverseCoreMBEC ↔ UpperAdjacentMA45 := by
 rw [←reverse_interior_iffMBEC]
 constructor
 · intro H j s h hh hj
   by_cases ht : 4 ≤ h
   · exact H j s h ht hj
   · have he : h=3 := by omega
     subst h
     exact reverse_threeMBEC j s hj
 · intro H j s h hh hj
   exact H j s h (by omega) hj

theorem sharp_margin_of_coreMBEC (H : ReverseCoreMBEC) : SharpCompleteMarginMBE3 :=
 sharp_margin_of_upperMA45 (reverse_core_iffMBEC.mp H)

theorem source_band_of_coreMBEC (H : ReverseCoreMBEC)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_upperMA45 (reverse_core_iffMBEC.mp H) q k i r hq hn

theorem q_small_adjacentMBEC (j s n : ℕ) (hj : j ≤ 3) (hn : n < 2*j) :
 (qPolyM7E2 j (s+1)^2).coeff n*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (n+1) ≤
 (qPolyM7E2 j (s+1)^2).coeff (n+1)*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff n := by
 by_cases hl : n < j
 · exact q_below_cutoffMA45 j s n hl
 have hh0 : 1 ≤ 2*j-n := by omega
 have hh : 2*j-n ≤ j := by omega
 have H :
   reverseConvMBEC j (s+1) (s+1) (2*j-n)*reverseConvMBEC j s (s+2) (2*j-n-1) ≤
   reverseConvMBEC j (s+1) (s+1) (2*j-n-1)*reverseConvMBEC j s (s+2) (2*j-n) := by
   by_cases he : 2*j-n=1
   · obtain ⟨k,hk⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : j≠0)
     subst j
     have hn' : n=2*k+1 := by omega
     subst n
     apply (reverse_adjacent_iffMBEC (k+1) s (2*(k+1)-(2*k+1)) hh0 hh).mp
     simpa only [show 2*(k+1)-(2*(k+1)-(2*k+1))=2*k+1 by omega,
       show 2*k+1+1=2*k+2 by omega] using q_last_adjacentMA45 k s
   · have he' : 2*j-n=2 ∨ 2*j-n=3 := by omega
     rcases he' with h2|h3
     · rw [h2]
       exact reverse_twoMBEC j s (by omega)
     · rw [h3]
       exact reverse_threeMBEC j s (by omega)
 have hout := (reverse_adjacent_iffMBEC j s (2*j-n) hh0 hh).mpr H
 simpa only [show 2*j-(2*j-n)=n by omega] using hout

end
end MathGKM.Markov
