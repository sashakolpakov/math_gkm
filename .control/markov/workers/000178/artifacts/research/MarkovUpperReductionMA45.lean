import MarkovCutoffAdjacentMA45
import MarkovTopAdjacentMA45
/-! Machine-authored a45def12. The remaining upper convolution interval is explicit. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem q_one_firstMA45 (s : ℕ) :
 (qPolyM7E2 1 (s+1)^2).coeff 0*(qPolyM7E2 1 s*qPolyM7E2 1 (s+2)).coeff 1 ≤
 (qPolyM7E2 1 (s+1)^2).coeff 1*(qPolyM7E2 1 s*qPolyM7E2 1 (s+2)).coeff 0 := by
 simp only [pow_two,mul_coeff_zero,mul_coeff_one,q_zero_coeffMA45 1 _ (by omega),
   q_endpoint_coeffMA45,Nat.choose_one_right]
 push_cast
 nlinarith

theorem q_below_cutoffMA45 (j s n : ℕ) (hn : n < j) :
 (qPolyM7E2 j (s+1)^2).coeff n*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (n+1) ≤
 (qPolyM7E2 j (s+1)^2).coeff (n+1)*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff n := by
 by_cases hh : n+1<j
 · exact q_low_adjacentMA45 j s n hh
 have hj : j=n+1 := by omega
 subst j
 cases n with
 | zero => simpa using q_one_firstMA45 s
 | succ k => simpa [Nat.add_assoc] using q_cutoff_adjacent_succMA45 k s

def UpperAdjacentMA45 : Prop := ∀ j s n : ℕ, j ≤ n → n+1 < 2*j →
 (qPolyM7E2 j (s+1)^2).coeff n*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (n+1) ≤
 (qPolyM7E2 j (s+1)^2).coeff (n+1)*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff n

theorem upper_adjacent_iffMA45 : UpperAdjacentMA45 ↔ UnshiftedAdjacentM09F := by
 constructor
 · intro H j s n hn
   by_cases hj : n<j
   · exact q_below_cutoffMA45 j s n hj
   by_cases ht : n+1<2*j
   · exact H j s n (by omega) ht
   have hpos : 0<j := by omega
   obtain ⟨k,hk⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : j≠0)
   subst j
   have he : n=2*k+1 := by omega
   subst n
   simpa [Nat.add_assoc] using q_last_adjacentMA45 k s
 · intro H j s n hj hn
   exact H j s n (by omega)

theorem upper_ratio_iffMA45 : UpperAdjacentMA45 ↔ UnshiftedRatioM09F :=
 upper_adjacent_iffMA45.trans unshifted_adjacent_iffM09F

theorem sharp_margin_of_upperMA45 (H : UpperAdjacentMA45) : SharpCompleteMarginMBE3 :=
 sharp_margin_of_unshiftedM09F (upper_ratio_iffMA45.mp H)

theorem source_band_of_upperMA45 (H : UpperAdjacentMA45)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_adjacentM09F (upper_adjacent_iffMA45.mp H) q k i r hq hn

end
end MathGKM.Markov
