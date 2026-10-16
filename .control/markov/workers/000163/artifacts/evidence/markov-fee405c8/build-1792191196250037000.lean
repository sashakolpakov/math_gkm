import MarkovRankWeightMFEE
/-! Machine-authored fee405c8. LC-positive polynomial triples retain their
coefficientwise gap under arbitrary nonnegative CrossLC coefficient weights. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def weightPolyMFEE (w : ℕ → ℝ) (P : ℝ[X]) : ℝ[X] :=
 ∑ k ∈ range (P.natDegree+1), monomial k (w k*P.coeff k)

theorem weight_poly_coeffMFEE (w : ℕ → ℝ) (P : ℝ[X]) (k : ℕ) :
 (weightPolyMFEE w P).coeff k=w k*P.coeff k := by
 classical
 simp only [weightPolyMFEE,finsetSum_coeff,coeff_monomial,sum_ite_eq']
 by_cases hk : k<P.natDegree+1
 · simp [hk]
 · simp [hk,coeff_eq_zero_of_natDegree_lt (by omega : P.natDegree<k)]

def cutPolyMFEE (h : ℕ) (P : ℝ[X]) : ℝ[X] :=
 weightPolyMFEE (fun k => if h ≤ k then 1 else 0) P

theorem cut_poly_coeffMFEE (h : ℕ) (P : ℝ[X]) (k : ℕ) :
 (cutPolyMFEE h P).coeff k=if h ≤ k then P.coeff k else 0 := by
 rw [cutPolyMFEE,weight_poly_coeffMFEE]
 split_ifs <;> simp

theorem cut_gap_coeffMFEE (A B C : ℝ[X]) (h n : ℕ) :
 ((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n=
 ∑ p ∈ antidiagonal n, if h ≤ min p.1 p.2 then
   B.coeff p.1*B.coeff p.2-A.coeff p.1*C.coeff p.2 else 0 := by
 rw [coeff_sub,pow_two,coeff_mul,coeff_mul,←sum_sub_distrib]
 apply sum_congr rfl
 intro p hp
 simp only [cut_poly_coeffMFEE,le_min_iff]
 split_ifs <;> simp_all

theorem cross_weight_minMFEE (f : ℤ → ℝ) (n i j : ℕ) (h : i+j=n) :
 f i*f j=f (min i j)*f (n-min i j) := by
 by_cases hij : i ≤ j
 · rw [min_eq_left hij,show n-i=j by omega]
 · rw [min_eq_right (by omega : j ≤ i),show n-j=i by omega,mul_comm]

theorem weighted_gap_nonnegMFEE (A B C : ℝ[X])
 (hcut : ∀ h n, 0 ≤ ((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n)
 (f : ℤ → ℝ) (hf : CrossLC f) (hpos : ∀ k, 0 ≤ f k) (n : ℕ) :
 0 ≤ ((weightPolyMFEE (fun k => f k) B)^2-
   weightPolyMFEE (fun k => f k) A*weightPolyMFEE (fun k => f k) C).coeff n := by
 rw [coeff_sub,pow_two,coeff_mul,coeff_mul,←sum_sub_distrib]
 simp only [weight_poly_coeffMFEE]
 have he : (∑ p ∈ antidiagonal n,
     f p.1*B.coeff p.1*(f p.2*B.coeff p.2)-
     f p.1*A.coeff p.1*(f p.2*C.coeff p.2))=
   ∑ p ∈ antidiagonal n, (B.coeff p.1*B.coeff p.2-A.coeff p.1*C.coeff p.2)*
     (f (min p.1 p.2)*f (n-min p.1 p.2)) := by
   apply sum_congr rfl
   intro p hp
   have hh := cross_weight_minMFEE f n p.1 p.2 (mem_antidiagonal.mp hp)
   calc
    _ = (B.coeff p.1*B.coeff p.2-A.coeff p.1*C.coeff p.2)*(f p.1*f p.2) := by ring
    _ = _ := by rw [hh]
 rw [he]
 apply rank_weight_nonnegMFEE (antidiagonal n) _ (fun p => min p.1 p.2) (n/2)
 · intro p hp
   have hh := mem_antidiagonal.mp hp
   have h1 := min_le_left p.1 p.2
   have h2 := min_le_right p.1 p.2
   omega
 · exact mul_nonneg (hpos _) (hpos _)
 · intro k hk
   exact crossLC_center_weights65c4 f hf n k (by omega)
 · intro h hh
   simpa only [cut_gap_coeffMFEE] using hcut h n

theorem weighted_value_lcMFEE (A B C : ℝ[X])
 (hcut : ∀ h n, 0 ≤ ((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff n)
 (f : ℤ → ℝ) (hf : CrossLC f) (hpos : ∀ k, 0 ≤ f k) :
 (weightPolyMFEE (fun k => f k) A).eval 1*(weightPolyMFEE (fun k => f k) C).eval 1 ≤
 (weightPolyMFEE (fun k => f k) B).eval 1^2 := by
 have h : 0 ≤ ((weightPolyMFEE (fun k => f k) B)^2-
   weightPolyMFEE (fun k => f k) A*weightPolyMFEE (fun k => f k) C).eval 1 := by
   rw [eval_eq_sum_range]
   apply sum_nonneg
   intro k hk
   simpa using weighted_gap_nonnegMFEE A B C hcut f hf hpos k
 simpa only [eval_sub,eval_pow,eval_mul,sub_nonneg] using h

end
end MathGKM.Markov
