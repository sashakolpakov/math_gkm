import MarkovFixedZeroPositiveM1C6
/-! Machine-authored 1c65a306. Every auxiliary adjacent ratio at parameter s=0.
Both deficiency and polynomial degree are unbounded. Full source scope remains open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem fixed_zero_closed_gapM1C6 (j h : ℕ) (h0 : 2 ≤ h) (hh : h ≤ j) :
 0 ≤ closedBM1C6 j (h-1)*closedAM1C6 j h-closedBM1C6 j h*closedAM1C6 j (h-1) := by
 obtain ⟨u,hu⟩ := Nat.exists_eq_add_of_le h0
 obtain ⟨k,hk⟩ := Nat.exists_eq_add_of_le hh
 have Hp := (zero_gap_positiveM1C6 (u:ℝ) (k:ℝ) (by positivity) (by positivity)).le
 rw [←zero_gap_factorM1C6] at Hp
 have hj : (j:ℝ)=(u:ℝ)+2+k := by rw [hk,hu]; push_cast; ring
 have hh' : (h:ℝ)=(u:ℝ)+2 := by rw [hu]; push_cast; ring
 have hm : ((h-1:ℕ):ℝ)=(u:ℝ)+1 := by rw [hu]; norm_num; ring
 simpa only [hj,hh',hm] using Hp

theorem fixed_zero_reverseM1C6 (j h : ℕ) (h0 : 2 ≤ h) (hh : h ≤ j) :
 reverseConvMBEC j 1 1 h*reverseConvMBEC j 0 2 (h-1) ≤
 reverseConvMBEC j 1 1 (h-1)*reverseConvMBEC j 0 2 h := by
 have H := fixed_zero_closed_gapM1C6 j h h0 hh
 rw [←closed_A_coeffM1C6 j h (by omega) hh,
   ←closed_B_coeffM1C6 j h (by omega) hh,
   ←closed_A_coeffM1C6 j (h-1) (by omega) (by omega),
   ←closed_B_coeffM1C6 j (h-1) (by omega) (by omega)] at H
 apply (reverse_adjacent_iffMBEC j 0 h (by omega) hh).mp
 rw [show 2*j-h+1=2*j-(h-1) by omega,pow_two]
 norm_num only [Nat.zero_add,Nat.reduceAdd]
 nlinarith only [H]

theorem q_zero_adjacentM1C6 (j n : ℕ) (hn : n < 2*j) :
 (qPolyM7E2 j 1^2).coeff n*(qPolyM7E2 j 0*qPolyM7E2 j 2).coeff (n+1) ≤
 (qPolyM7E2 j 1^2).coeff (n+1)*(qPolyM7E2 j 0*qPolyM7E2 j 2).coeff n := by
 by_cases hl : n < j
 · exact q_below_cutoffMA45 j 0 n hl
 by_cases ht : n+1 < 2*j
 · have H := (reverse_adjacent_iffMBEC j 0 (2*j-n) (by omega) (by omega)).mpr
     (fixed_zero_reverseM1C6 j (2*j-n) (by omega) (by omega))
   simpa only [show 2*j-(2*j-n)=n by omega,Nat.zero_add,Nat.reduceAdd] using H
 · obtain ⟨k,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : j≠0)
   have he : n=2*k+1 := by omega
   subst n
   exact q_last_adjacentMA45 k 0

def PositiveParameterTailM1C6 : Prop := ∀ j s h : ℕ, 1 ≤ s → 6 ≤ h → h ≤ j →
 0 ≤ varianceDriftM1C6 j s h

theorem positive_parameter_tail_iffM1C6 : PositiveParameterTailM1C6 ↔ UpperAdjacentMA45 := by
 rw [←variance_tail_iffM1C6]
 constructor
 · intro H j s h h0 hh
   by_cases hs : s=0
   · subst s
     exact (reverse_adjacent_drift_iffM1C6 j 0 h (by omega) hh).mp
       (fixed_zero_reverseM1C6 j h (by omega) hh)
   · exact H j s h (by omega) h0 hh
 · intro H j s h hs h0 hh
   exact H j s h h0 hh

theorem source_band_of_positive_parameter_tailM1C6 (H : PositiveParameterTailM1C6)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_upperMA45 (positive_parameter_tail_iffM1C6.mp H) q k i r hq hn

end
end MathGKM.Markov
