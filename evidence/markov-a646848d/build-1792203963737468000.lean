import MarkovCompleteMarginMA64
/-! Machine-authored a646848d. Quantitative centered-cut preservation.
Zero denominator terms are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem cut_den_sumMA64 (B : ℝ[X]) (h n : ℕ) :
 (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then pairDenMAD5 B p else 0)=
 ((cutPolyMFEE h B)^2).coeff n := by
 rw [pow_two,coeff_mul]
 apply sum_congr rfl
 intro p hp
 simp only [cut_poly_coeffMFEE,pairDenMAD5]
 by_cases h1 : h ≤ p.1 <;> by_cases h2 : h ≤ p.2 <;> simp [h1,h2,le_min_iff]

theorem cut_margin_sumMA64 (A B C : ℝ[X]) (M N : ℝ) (h n : ℕ) :
 (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then
   M*pairGapMAD5 A B C p-2*N*pairDenMAD5 B p else 0)=
 2*(M*((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n-
   N*((cutPolyMFEE h B)^2).coeff n) := by
 have he : (∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then
   M*pairGapMAD5 A B C p-2*N*pairDenMAD5 B p else 0)=
 M*(∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then pairGapMAD5 A B C p else 0)-
 2*N*(∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then pairDenMAD5 B p else 0) := by
   rw [mul_sum,mul_sum,←sum_sub_distrib]
   apply sum_congr rfl
   intro p hp
   split_ifs <;> ring
 rw [he,symmetric_cut_sumMAD5,cut_den_sumMA64]
 ring

theorem quantitative_cutMA64 (A B C : ℝ[X]) (M N : ℝ) (hM : 0 ≤ M)
 (hA : ∀ k, 0 ≤ A.coeff k) (hB : ∀ k, 0 ≤ B.coeff k)
 (hC : ∀ k, 0 ≤ C.coeff k) (horder : PairOrderMAD5 A B C)
 (hfull : ∀ n, N*(B^2).coeff n ≤ M*(B^2-A*C).coeff n) (h n : ℕ) :
 N*((cutPolyMFEE h B)^2).coeff n ≤
 M*((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n := by
 have hb : ∀ p ∈ antidiagonal n, 0 ≤ pairDenMAD5 B p :=
   fun p _ => mul_nonneg (hB p.1) (hB p.2)
 have hz : ∀ p ∈ antidiagonal n, pairDenMAD5 B p=0 →
   M*pairGapMAD5 A B C p-2*N*pairDenMAD5 B p ≤ 0 := by
   intro p hp hd
   rw [hd,mul_zero,sub_zero]
   apply mul_nonpos_of_nonneg_of_nonpos hM
   unfold pairGapMAD5
   rw [hd]
   have h1 := mul_nonneg (hA p.1) (hC p.2)
   have h2 := mul_nonneg (hC p.1) (hA p.2)
   linarith
 have ht : 0 ≤ ∑ p ∈ antidiagonal n,
   (M*pairGapMAD5 A B C p-2*N*pairDenMAD5 B p) := by
   have hs := cut_margin_sumMA64 A B C M N 0 n
   simp only [Nat.zero_le,ite_true,cut_zeroMAD5] at hs
   rw [hs]
   linarith [hfull n]
 have hr : ∀ p ∈ antidiagonal n, ∀ q ∈ antidiagonal n,
   min p.1 p.2 ≤ min q.1 q.2 →
   (M*pairGapMAD5 A B C p-2*N*pairDenMAD5 B p)*pairDenMAD5 B q ≤
   (M*pairGapMAD5 A B C q-2*N*pairDenMAD5 B q)*pairDenMAD5 B p := by
   intro p hp q hq hpq
   have hh := mul_le_mul_of_nonneg_left (horder n p hp q hq hpq) hM
   nlinarith only [hh]
 have hh := normalized_rank_zeroMAD5 (antidiagonal n) (fun p => min p.1 p.2)
   (fun p => M*pairGapMAD5 A B C p-2*N*pairDenMAD5 B p)
   (pairDenMAD5 B) hb hz ht hr h
 rw [cut_margin_sumMA64] at hh
 linarith

def kernelScaleMA64 (j t : ℕ) : ℝ := (completeLiftMA64 j (t+1)).coeff 0^2

theorem complete_square_upperMA64 (j t m : ℕ) :
 (completeLiftMA64 j (t+1)^2).coeff m ≤ kernelScaleMA64 j t*((j+j).choose m:ℝ) := by
 have hn : ∀ k, 0 ≤ (qPolyM7E2 j (t+1)^2).coeff k := by
   intro k
   rw [pow_two,coeff_mul]
   exact sum_nonneg (fun p _ => mul_nonneg (q_coeff_nonnegMA64 j (t+1) _) (q_coeff_nonnegMA64 j (t+1) _))
 have hd : (qPolyM7E2 j (t+1)^2).natDegree ≤ j+j := by
   rw [pow_two]
   exact (natDegree_mul_le).trans (Nat.add_le_add (q_poly_degreeM7E2 j (t+1)) (q_poly_degreeM7E2 j (t+1)))
 have h := comp_binomial_upperMA64 (qPolyM7E2 j (t+1)^2) (j+j) m hn hd
 rw [Polynomial.pow_comp] at h
 simpa only [kernelScaleMA64,completeLiftMA64,pow_two,coeff_mul_zero] using h

theorem complete_relative_marginMA64 (j t m : ℕ) :
 topGapMA64 j t*(completeLiftMA64 j (t+1)^2).coeff m ≤
 kernelScaleMA64 j t*(completeLiftMA64 j (t+1)^2-
   completeLiftMA64 j t*completeLiftMA64 j (t+2)).coeff m := by
 have h1 := mul_le_mul_of_nonneg_left (complete_square_upperMA64 j t m) (top_gap_nonnegMA64 j t)
 have h2 := mul_le_mul_of_nonneg_left (complete_gap_lowerMA64 j t m)
   (show 0 ≤ kernelScaleMA64 j t by unfold kernelScaleMA64; positivity)
 nlinarith only [h1,h2]

end
end MathGKM.Markov
