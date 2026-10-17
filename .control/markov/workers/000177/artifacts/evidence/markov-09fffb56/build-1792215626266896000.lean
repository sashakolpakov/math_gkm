import MarkovOrderedConvolutionM09F
/-! Machine-authored 09fffb56. Exact adjacent formulation of the unproved
ordered-ratio candidate, with interval positivity and zero tails established. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

theorem ordered_of_adjacentM09F (a b : ℕ → ℝ) (N : ℕ)
 (hb : ∀ i, i ≤ N → 0 < b i)
 (ha0 : ∀ i, N < i → a i=0) (hb0 : ∀ i, N < i → b i=0)
 (H : ∀ i, i < N → a i*b (i+1) ≤ a (i+1)*b i) :
 ∀ i j, i ≤ j → a i*b j ≤ a j*b i := by
 intro i j hij
 by_cases hj : j ≤ N
 · induction j, hij using Nat.le_induction with
   | base => exact le_rfl
   | succ j hij ih =>
     have ih' := ih (by omega)
     have hh := H j (by omega)
     have h0 := mul_le_mul_of_nonneg_right ih' (hb (j+1) hj).le
     have h1 := mul_le_mul_of_nonneg_right hh (hb i (by omega)).le
     apply (mul_le_mul_iff_of_pos_right (hb j (by omega))).mp
     nlinarith only [h0,h1]
 · rw [ha0 j (by omega),hb0 j (by omega),mul_zero,zero_mul]

theorem q_coeff_positiveM09F (j t i : ℕ) (hi : i ≤ j) : 0 < (qPolyM7E2 j t).coeff i := by
 rw [q_poly_coeffM7E2,qCoeffM7E2]
 have hb : 0 < qBinM7E2 t i := by
   unfold qBinM7E2
   exact_mod_cast Nat.choose_pos (by omega : i ≤ t+i+3)
 have hw : 0 < qWeightM7E2 ((j:ℤ)-i) := by
   unfold qWeightM7E2
   rw [if_neg (by omega : ¬(j:ℤ)-i < 0)]
   split_ifs with he
   · norm_num
   · have hp : (0:ℝ)<((j:ℤ)-i:ℤ) := by exact_mod_cast (show 0 < (j:ℤ)-i by omega)
     positivity
 exact mul_pos hw hb

theorem q_product_positiveM09F (j t u n : ℕ) (hn : n ≤ 2*j) :
 0 < (qPolyM7E2 j t*qPolyM7E2 j u).coeff n := by
 rw [Polynomial.coeff_mul,Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 let i := min n j
 have hi : i < n+1 := by dsimp [i]; omega
 have h0 : i ≤ j := by dsimp [i]; omega
 have h1 : n-i ≤ j := by dsimp [i]; omega
 have hterm := mul_pos (q_coeff_positiveM09F j t i h0) (q_coeff_positiveM09F j u (n-i) h1)
 exact hterm.trans_le (single_le_sum
   (fun k _ => mul_nonneg (q_coeff_nonnegMA64 j t k) (q_coeff_nonnegMA64 j u (n-k))) (mem_range.mpr hi))

theorem q_product_tailM09F (j t u n : ℕ) (hn : 2*j < n) :
 (qPolyM7E2 j t*qPolyM7E2 j u).coeff n=0 := by
 apply Polynomial.coeff_eq_zero_of_natDegree_lt
 exact (Polynomial.natDegree_mul_le.trans
   (add_le_add (q_poly_degreeM7E2 j t) (q_poly_degreeM7E2 j u))).trans_lt (by omega)

def UnshiftedAdjacentM09F : Prop := ∀ j s n : ℕ, n < 2*j →
 (qPolyM7E2 j (s+1)^2).coeff n*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff (n+1) ≤
 (qPolyM7E2 j (s+1)^2).coeff (n+1)*(qPolyM7E2 j s*qPolyM7E2 j (s+2)).coeff n

theorem unshifted_adjacent_iffM09F : UnshiftedAdjacentM09F ↔ UnshiftedRatioM09F := by
 constructor
 · intro H j s
   apply ordered_of_adjacentM09F _ _ (2*j)
   · exact fun i hi => q_product_positiveM09F j s (s+2) i hi
   · intro i hi
     rw [pow_two]
     exact q_product_tailM09F j (s+1) (s+1) i hi
   · exact fun i hi => q_product_tailM09F j s (s+2) i hi
   · exact H j s
 · intro H j s n hn
   exact H j s n (n+1) (by omega)

theorem source_band_of_adjacentM09F (H : UnshiftedAdjacentM09F)
 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q) (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 threeRawM9E2 q r i (q+k+1)*threeRawM9E2 q r (i+2) (q+k+1) ≤
 threeRawM9E2 q r (i+1) (q+k+1)^2 :=
 source_band_of_unshiftedM09F (unshifted_adjacent_iffM09F.mp H) q k i r hq hn

end
end MathGKM.Markov
