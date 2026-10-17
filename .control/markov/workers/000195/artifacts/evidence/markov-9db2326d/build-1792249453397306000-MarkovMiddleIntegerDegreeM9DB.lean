import MarkovMiddleIntegerSignsM9DB
/-! Machine-authored 9db2326d. Uniform degree bounds for the exact integer
gap polynomials. Each fixed-depth sign test is finite; all depths remain open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 8000000

theorem falling_poly_degreeM9DB (A n : ℕ) : (fallingPolyM9DB A n).natDegree ≤ n := by
 simpa only [fallingPolyM9DB,descPochhammer_natDegree,natDegree_X_add_C,mul_one]
   using (natDegree_comp_le (p:=descPochhammer ℤ n) (q:=X+C (A:ℤ)))

theorem const_mul_degreeM9DB (a : ℤ) (P : Polynomial ℤ) : (C a*P).natDegree ≤ P.natDegree := by
 simpa only [natDegree_C,zero_add] using (natDegree_mul_le (p:=C a) (q:=P))

theorem binomial_poly_degreeM9DB (N A n : ℕ) : (binomialPolyM9DB N A n).natDegree ≤ n := by
 exact (const_mul_degreeM9DB _ _).trans (falling_poly_degreeM9DB A n)

theorem binomial_product_poly_degreeM9DB (N A a B b : ℕ) :
 (binomialProductPolyM9DB N A a B b).natDegree ≤ a+b := by
 unfold binomialProductPolyM9DB
 have hA := (const_mul_degreeM9DB _ (fallingPolyM9DB A a)).trans (falling_poly_degreeM9DB A a)
 have hB := falling_poly_degreeM9DB B b
 exact natDegree_mul_le.trans (Nat.add_le_add hA hB)

theorem top_poly_degreeM9DB (d T c : ℕ) : (topPolyM9DB d T c).natDegree ≤ 2*c+5 := by
 unfold topPolyM9DB
 apply natDegree_sum_le_of_forall_le
 intro l hl
 have hl' : l ≤ c+3 := by have := mem_range.mp hl; omega
 apply (const_mul_degreeM9DB _ _).trans
 apply natDegree_add_le_of_degree_le
 · exact (binomial_product_poly_degreeM9DB _ _ _ _ _).trans (by omega)
 · exact (const_mul_degreeM9DB _ _).trans
     ((binomial_product_poly_degreeM9DB _ _ _ _ _).trans (by omega))

theorem kernel_poly_degreeM9DB (N D k a b : ℕ) :
 (kernelPolyM9DB N D k a b).natDegree ≤ b := by
 unfold kernelPolyM9DB
 apply natDegree_sum_le_of_forall_le
 intro l hl
 exact (const_mul_degreeM9DB _ _).trans ((binomial_poly_degreeM9DB _ _ _).trans (by omega))

theorem correction_poly_degreeM9DB (N d k c : ℕ) (r : Bool) :
 (correctionPolyM9DB N d k c r).natDegree ≤ c+2 := by
 unfold correctionPolyM9DB
 apply (const_mul_degreeM9DB _ _).trans
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true]
 all_goals repeat' apply natDegree_add_le_of_degree_le
 all_goals first
 | exact (kernel_poly_degreeM9DB _ _ _ _ _).trans (by omega)
 | exact (const_mul_degreeM9DB _ _).trans ((kernel_poly_degreeM9DB _ _ _ _ _).trans (by omega))

theorem middle_poly_degreeM9DB (k c : ℕ) (r : Bool) (off : ℕ) :
 (middlePolyM9DB k c r off).natDegree ≤ 2*c+5 := by
 unfold middlePolyM9DB
 exact natDegree_add_le_of_degree_le (top_poly_degreeM9DB _ _ _)
   ((correction_poly_degreeM9DB _ _ _ _ _).trans (by omega))

theorem integer_gap_poly_degreeM9DB (k c : ℕ) (r : Bool) :
 (integerGapPolyM9DB k c r).natDegree ≤ 4*c+14 := by
 unfold integerGapPolyM9DB
 dsimp only
 apply (natDegree_sub_le _ _).trans
 apply max_le
 · apply (const_mul_degreeM9DB _ _).trans
   rw [pow_two]
   have h := middle_poly_degreeM9DB k (c+1) r (fixedShiftM9DB k c r)
   exact natDegree_mul_le.trans (by omega)
 · have h0 := middle_poly_degreeM9DB k c r (fixedShiftM9DB k c r)
   have h1 := middle_poly_degreeM9DB k (c+2) r (fixedShiftM9DB k c r)
   have h2 := const_mul_degreeM9DB (((2*(c+1)+5).factorial:ℤ)^2)
     (middlePolyM9DB k c r (fixedShiftM9DB k c r))
   exact natDegree_mul_le.trans (by omega)

theorem integer_gap_coeff_sign_iffM9DB (k c : ℕ) (r : Bool) :
 (∀ i, 0 ≤ (integerGapPolyM9DB k c r).coeff i) ↔
 (∀ i, i ≤ 4*c+14 → 0 ≤ (integerGapPolyM9DB k c r).coeff i) := by
 constructor
 · intro h i _; exact h i
 · intro h i
   by_cases hi : i ≤ 4*c+14
   · exact h i hi
   · rw [coeff_eq_zero_of_natDegree_lt ((integer_gap_poly_degreeM9DB k c r).trans_lt (by omega))]

end
end MathGKM.Markov
