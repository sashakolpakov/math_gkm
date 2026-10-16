import MarkovInverseBoundaryM96A
/-! Machine-authored 96ada19b. Explicit two-sum binomial inverse for actual sources. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 4000000

def rectPolyM96A (f : ℕ → ℕ → ℤ) (N : ℕ) : BiPoly :=
 ∑ a ∈ range (N+1), monomial a (∑ b ∈ range (N+1), monomial b (f a b))

theorem rect_poly_coeffM96A (f : ℕ → ℕ → ℤ) (N i j : ℕ) :
 coeff (rectPolyM96A f N) i j=if i ≤ N ∧ j ≤ N then f i j else 0 := by
 classical
 simp [rectPolyM96A,coeff,Polynomial.coeff_monomial,Finset.sum_ite_eq',Nat.lt_succ_iff]
 split_ifs <;> simp_all [Polynomial.coeff_monomial,Finset.sum_ite_eq',Nat.lt_succ_iff]

theorem disc_action_congrM96A (f g : ℕ → ℕ → ℤ) (i j : ℕ)
 (h : ∀ a b, a ≤ i → b ≤ j → f a b=g a b) :
 discriminantActionM96A f i j=discriminantActionM96A g i j := by
 have hs (a b : ℕ) : shiftRawM9E2 a b f i j=shiftRawM9E2 a b g i j := by
   unfold shiftRawM9E2
   split_ifs
   · exact h _ _ (Nat.sub_le _ _) (Nat.sub_le _ _)
   · rfl
 simp only [discriminantActionM96A,hs,h i j le_rfl le_rfl]

theorem rect_kernel_actionM96A (N i j : ℕ) (hi : i ≤ N) (hj : j ≤ N) :
 coeff ((S^2-4*V)*rectPolyM96A inverseKernelM96A N) i j=
 if i=0 ∧ j=0 then 2 else 0 := by
 rw [discriminant_coeffM96A]
 have h := disc_action_congrM96A (coeff (rectPolyM96A inverseKernelM96A N))
   inverseKernelM96A i j (by
     intro a b ha hb
     rw [rect_poly_coeffM96A,if_pos ⟨by omega,by omega⟩])
 rw [h,inverse_kernel_equationM96A]

theorem coeff_mul_impulseM96A (P Q : BiPoly) (i j : ℕ)
 (h : ∀ a b, a ≤ i → b ≤ j → coeff Q a b=if a=0 ∧ b=0 then 2 else 0) :
 coeff (P*Q) i j=2*coeff P i j := by
 classical
 rw [coeff_productM9E2]
 unfold biConvM9E2
 rw [sum_eq_single i]
 · rw [sum_eq_single j]
   · rw [Nat.sub_self,Nat.sub_self,h 0 0 (by omega) (by omega)]
     simp
     ring
   · intro b hb hbj
     have hb' : b ≤ j := by simpa using hb
     rw [Nat.sub_self,h 0 (j-b) (by omega) (by omega),if_neg (by omega),mul_zero]
   · simp
 · intro a ha hai
   have ha' : a ≤ i := by simpa using ha
   apply sum_eq_zero
   intro b hb
   have hb' : b ≤ j := by simpa using hb
   rw [h (i-a) (j-b) (by omega) (by omega),if_neg (by omega),mul_zero]
 · simp

theorem discriminant_inverse_coeffM96A (P : BiPoly) (i j : ℕ) :
 2*coeff P i j=biConvM9E2 (coeff ((S^2-4*V)*P)) inverseKernelM96A i j := by
 let N := i+j
 let K := rectPolyM96A inverseKernelM96A N
 have h := coeff_mul_impulseM96A P ((S^2-4*V)*K) i j (by
   intro a b ha hb
   exact rect_kernel_actionM96A N a b (by dsimp [N]; omega) (by dsimp [N]; omega))
 rw [show P*((S^2-4*V)*K)=((S^2-4*V)*P)*K by ring,coeff_productM9E2] at h
 rw [←h]
 unfold biConvM9E2
 apply sum_congr rfl
 intro a ha
 apply sum_congr rfl
 intro b hb
 congr 1
 exact (rect_poly_coeffM96A inverseKernelM96A N (i-a) (j-b)).trans
   (if_pos ⟨by dsimp [N]; omega,by dsimp [N]; omega⟩)

theorem three_double_sumM96A (q : ℕ) (r : Bool) (i j : ℕ) :
 2*threeRawM9E2 q r i j=biConvM9E2 (threeForceM96A q r) inverseKernelM96A i j := by
 have h := discriminant_inverse_coeffM96A (threePolyM9E2 q r) i j
 rw [three_raw_formulaM9E2,three_sparse_identityM96A] at h
 have hf : coeff (threeSparseM96A q r)=threeForceM96A q r :=
   funext fun a => funext fun b => three_force_coeffM96A q r a b
 simpa only [hf] using h

def DoubleSumThreeLCM96A : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 let z := biConvM9E2 (threeForceM96A q r) inverseKernelM96A
 (∀ i j, z i j*z (i+2) j ≤ z (i+1) j^2) ∧
 (∀ i j, z i j*z i (j+2) ≤ z i (j+1)^2) ∧
 (∀ i j, z i (j+2)*z (i+2) j ≤ z (i+1) (j+1)^2)

theorem root_iff_double_sumM96A : Conjecture63 ↔ DoubleSumThreeLCM96A ∧ OtherFourM9E2 := by
 rw [root_iff_three_arithmeticM9E2]
 have h (a b c : ℤ) : (2*a)*(2*c) ≤ (2*b)^2 ↔ a*c ≤ b^2 := by
   constructor <;> intro h <;> nlinarith
 unfold DoubleSumThreeLCM96A ThreeRawLCM9E2
 simp only [←three_double_sumM96A,h]

end
end MathGKM.Markov
