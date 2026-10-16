import MarkovPolynomialWeightMFEE
import MarkovLiftCutM7E2
import MarkovBinomialAllM37B
/-! Machine-authored fee405c8. Formal weighting bridge from the still-open
LiftBoundaryM7E2 to every numerator-three lower horizontal raw inequality. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem cut_lift_identityMFEE (j t h : ℕ) :
 cutPolyMFEE h (liftPolyM7E2 j t)=liftCutM7E2 j t h := by
 ext k
 rw [cut_poly_coeffMFEE,lift_cut_coeffM7E2]

theorem weight_lift_evalMFEE (w : ℕ → ℝ) (j t : ℕ) :
 (weightPolyMFEE w (liftPolyM7E2 j t)).eval 1=
 ∑ k ∈ range (t+1), w k*(reverseLiftMAE9 j t k:ℝ) := by
 have he : weightPolyMFEE w (liftPolyM7E2 j t)=
   ∑ k ∈ range (t+1), monomial k (w k*(reverseLiftMAE9 j t k:ℝ)) := by
   ext k
   rw [weight_poly_coeffMFEE,lift_poly_coeffM7E2]
   simp only [finsetSum_coeff,coeff_monomial,sum_ite_eq']
   by_cases hk : k<t+1
   · simp [hk]
   · simp [hk,reverseLiftMAE9,show ¬k ≤ t by omega]
 rw [he]
 simp only [eval_finset_sum,eval_monomial,one_pow,mul_one]

theorem weighted_lift_outputMFEE (d j t : ℕ) :
 (weightPolyMFEE (fun k => zchooseM37B d k) (liftPolyM7E2 j t)).eval 1=
 (liftOutputMAE9 d j t:ℝ) := by
 rw [weight_lift_evalMFEE,lift_output_reverseMAE9]
 simp only [zchoose_natM37B]
 push_cast
 rfl

theorem lift_output_lc_of_boundaryMFEE (H : LiftBoundaryM7E2) (d j t : ℕ) :
 liftOutputMAE9 d j t*liftOutputMAE9 d j (t+2) ≤ liftOutputMAE9 d j (t+1)^2 := by
 have hcut := lift_positive_iff_boundaryM7E2.mpr H
 have hf : CrossLC (zchooseM37B d) := by
   have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext k; exact zchoose_coeffM37B d k
   rw [he]
   exact crossLC_binomial d
 have hpos (k : ℤ) : 0 ≤ zchooseM37B d k := by
   unfold zchooseM37B
   split_ifs <;> positivity
 have hh := weighted_value_lcMFEE (liftPolyM7E2 j t) (liftPolyM7E2 j (t+1))
   (liftPolyM7E2 j (t+2)) (by
     intro h n
     simpa only [cut_lift_identityMFEE,liftCutGapM7E2] using hcut j t h n)
   (zchooseM37B d) hf hpos
 simp only [weighted_lift_outputMFEE] at hh
 exact_mod_cast hh

theorem source_lower_horizontal_of_boundaryMFEE (H : LiftBoundaryM7E2)
 (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 by_cases hi : i<3
 · rw [source_lower_rowMFFD q i j r hj,lowerRowMFFD,coeff_X_pow_mul',if_neg (by omega),zero_mul]
   exact sq_nonneg _
 obtain ⟨t,rfl⟩ := Nat.exists_eq_add_of_le (by omega : 3 ≤ i)
 have hh := lift_output_lc_of_boundaryMFEE H (sourceNME9C q r-2*j-1) j t
 simp only [liftOutputMAE9,←source_lower_liftMAE9 q j _ r hj] at hh
 convert hh using 1 <;> congr 2 <;> omega

end
end MathGKM.Markov
