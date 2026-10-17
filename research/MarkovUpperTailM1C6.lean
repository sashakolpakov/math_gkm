import MarkovCertificate4M1C6
import MarkovCertificate5M1C6
import MarkovVarianceDriftM1C6
/-! Machine-authored 1c65a306. The exact still-open auxiliary residual starts
at deficiency six. This is not removal of a full-root residual clause. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

def ReverseTailM1C6 : Prop := ∀ j s h : ℕ, 6 ≤ h → h ≤ j →
 reverseConvMBEC j (s+1) (s+1) h*reverseConvMBEC j s (s+2) (h-1) ≤
 reverseConvMBEC j (s+1) (s+1) (h-1)*reverseConvMBEC j s (s+2) h

def VarianceTailM1C6 : Prop := ∀ j s h : ℕ, 6 ≤ h → h ≤ j → 0 ≤ varianceDriftM1C6 j s h

theorem reverse_tail_iffM1C6 : ReverseTailM1C6 ↔ UpperAdjacentMA45 := by
 rw [←reverse_core_iffMBEC]
 constructor
 · intro H j s h hh hj
   by_cases ht : 6 ≤ h
   · exact H j s h ht hj
   have he : h=4 ∨ h=5 := by omega
   rcases he with rfl|rfl
   · exact reverse_4M1C6 j s hj
   · exact reverse_5M1C6 j s hj
 · intro H j s h hh hj
   exact H j s h (by omega) hj

theorem variance_tail_iffM1C6 : VarianceTailM1C6 ↔ UpperAdjacentMA45 := by
 rw [←reverse_tail_iffM1C6]
 constructor
 · intro H j s h hh hj
   exact (reverse_adjacent_drift_iffM1C6 j s h (by omega) hj).mpr (H j s h hh hj)
 · intro H j s h hh hj
   exact (reverse_adjacent_drift_iffM1C6 j s h (by omega) hj).mp (H j s h hh hj)

theorem source_band_of_varianceM1C6 (H : VarianceTailM1C6)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_upperMA45 (variance_tail_iffM1C6.mp H) q k i r hq hn

theorem q_small_adjacentM1C6 (j s n : ℕ) (hj : j ≤ 5) (hn : n < 2*j) :
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
   · have he' : 2*j-n=2 ∨ 2*j-n=3 ∨ 2*j-n=4 ∨ 2*j-n=5 := by omega
     rcases he' with h2|h3|h4|h5
     · rw [h2]; exact reverse_twoMBEC j s (by omega)
     · rw [h3]; exact reverse_threeMBEC j s (by omega)
     · rw [h4]; exact reverse_4M1C6 j s (by omega)
     · rw [h5]; exact reverse_5M1C6 j s (by omega)
 have hout := (reverse_adjacent_iffMBEC j s (2*j-n) hh0 hh).mpr H
 simpa only [show 2*j-(2*j-n)=n by omega] using hout

end
end MathGKM.Markov
