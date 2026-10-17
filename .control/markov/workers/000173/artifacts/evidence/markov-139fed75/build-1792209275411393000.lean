import MarkovBandBudgetObstructionM139
/-! Machine-authored 139fed75. The budget obstruction is attached to an
actual 3/221 source. Its raw valid triple satisfies strict log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem budget_witness_lower3M139 : (lowerRowMFFD 221 110).coeff 3=587447224 := by
 have h := lower_row_liftMAE9 0 110 0
 norm_num only [Nat.reduceMul,Nat.reduceAdd] at h
 have hc : (liftOutputMAE9 0 110 0:ℚ)=587447224 := by
   norm_num [liftOutputMAE9,liftTermMAE9,Finset.sum_range_succ,
     choose_poly_natM0D3,binomial_poly_0M295,binomial_poly_1M295,
     binomial_poly_3M295,binomial_poly_5M295]
 change (lowerRowMFFD 221 110).coeff 3=liftOutputMAE9 0 110 0 at h
 rw [h]
 exact_mod_cast hc

theorem budget_witness_lower4M139 : (lowerRowMFFD 221 110).coeff 4=877009737560 := by
 have h := lower_row_liftMAE9 0 110 1
 norm_num only [Nat.reduceMul,Nat.reduceAdd] at h
 have hc : (liftOutputMAE9 0 110 1:ℚ)=877009737560 := by
   norm_num [liftOutputMAE9,liftTermMAE9,Finset.sum_range_succ,
     choose_poly_natM0D3,binomial_poly_0M295,binomial_poly_1M295,
     binomial_poly_4M295,binomial_poly_6M295]
 change (lowerRowMFFD 221 110).coeff 4=liftOutputMAE9 0 110 1 at h
 rw [h]
 exact_mod_cast hc

theorem budget_witness_rawM139 :
 threeRawM9E2 73 false 2 110=104044 ∧
 threeRawM9E2 73 false 3 110=609161488 ∧
 threeRawM9E2 73 false 4 110=879400499960 := by
 have he (i : ℕ) := congrArg (fun p : Polynomial ℤ => p.coeff i) budget_witness_source_factorM139
 have hc := band_Q_constantM139 73 36 false
 norm_num at hc
 have h0 := he 2
 have h1 := he 3
 have h2 := he 4
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,coeff_X_pow_mul',
   show 2 ≤ (2:ℕ) by omega,show 2 ≤ (3:ℕ) by omega,show 2 ≤ (4:ℕ) by omega,
   if_true,Nat.reduceSub,hc,budget_witness_linearM139,budget_witness_quadraticM139,
   budget_witness_lower3M139,budget_witness_lower4M139] at h0 h1 h2
 have hz : (lowerRowMFFD 221 110).coeff 2=0 := by
   simp [lowerRowMFFD,coeff_X_pow_mul']
 rw [hz] at h0
 exact ⟨by omega,by omega,by omega⟩

theorem budget_witness_actual_pathM139 :
 (frame (threePathM9E2 72 false)).mid.a=3 ∧
 (frame (threePathM9E2 72 false)).mid.b=221 ∧
 coeff (frame (threePathM9E2 72 false)).mid.p 2 110=104044 ∧
 coeff (frame (threePathM9E2 72 false)).mid.p 3 110=609161488 ∧
 coeff (frame (threePathM9E2 72 false)).mid.p 4 110=879400499960 := by
 have hl := three_path_labelsM9E2 72 false
 have hp := three_path_polynomialM9E2 72 false
 norm_num only [Nat.reduceAdd,Nat.reduceMul,Bool.false_eq_true,if_false] at hl hp
 refine ⟨hl.1,hl.2,?_⟩
 rw [hp]
 simpa only [three_raw_formulaM9E2] using budget_witness_rawM139

theorem budget_witness_valid_tripleM139 :
 InPolygon 3 221 2 110 ∧ InPolygon 3 221 3 110 ∧ InPolygon 3 221 4 110 ∧
 threeRawM9E2 73 false 3 110^2-
   threeRawM9E2 73 false 2 110*threeRawM9E2 73 false 4 110=279581372844535904 := by
 obtain ⟨h0,h1,h2⟩ := budget_witness_rawM139
 rw [h0,h1,h2]
 norm_num [InPolygon]

end
end MathGKM.Markov
