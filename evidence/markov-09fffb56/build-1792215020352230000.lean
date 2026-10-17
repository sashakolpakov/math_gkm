import MarkovNormalizedCoefficientsM09F
/-! Machine-authored 09fffb56. Quantitative curvature of the complete base. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem base_weight_gapM09F (j s : ℚ) (hj : 0 ≤ j) (hs : 0 ≤ s) :
 0 ≤ liftWeightMAE9 j (s+1) 0^2-liftWeightMAE9 j s 0*liftWeightMAE9 j (s+2) 0 := by
 have he : liftWeightMAE9 j (s+1) 0^2-liftWeightMAE9 j s 0*liftWeightMAE9 j (s+2) 0=
   60+48*j+8*j^2+s*(22+8*j)+2*s^2 := by unfold liftWeightMAE9 liftDenMAE9; ring
 rw [he]
 positivity

theorem base_curvature_ratM09F (j s : ℕ) :
 (liftTermMAE9 j s 0:ℚ)*(liftTermMAE9 j (s+2) 0:ℚ)*(s+7)*(s+j+4) ≤
 (liftTermMAE9 j (s+1) 0:ℚ)^2*(s+6)*(s+j+5) := by
 have h0 := lift_normalizedMFEE j s 0 (by omega)
 have h1 := lift_normalizedMFEE j (s+1) 0 (by omega)
 have h2 := lift_normalizedMFEE j (s+2) 0 (by omega)
 rw [base_choose_stepMFEE] at h1
 rw [base_choose_twoMFEE] at h2
 simp only [Nat.choose_zero_right,Nat.cast_one,Nat.cast_zero,mul_one] at h0 h1 h2
 push_cast at h1 h2
 let F : ℚ := ((s+j+3).choose j:ℚ)^2*(s+j+4)^2*(s+j+5)/((s+4)^2*(s+5)^2*(s+6))
 have hF : 0 ≤ F := by dsimp [F]; positivity
 have hg := base_weight_gapM09F j s (by positivity) (by positivity)
 have he : (liftTermMAE9 j (s+1) 0:ℚ)^2*(s+6)*(s+j+5)-
     (liftTermMAE9 j s 0:ℚ)*(liftTermMAE9 j (s+2) 0:ℚ)*(s+7)*(s+j+4)=
     F*(liftWeightMAE9 j (s+1) 0^2-liftWeightMAE9 j s 0*liftWeightMAE9 j (s+2) 0) := by
   rw [h0,h1,h2]
   dsimp [F,liftDenMAE9]
   field_simp
   <;> ring
 have hp := mul_nonneg hF hg
 linarith

theorem base_curvatureM09F (j s : ℕ) :
 (liftTermMAE9 j s 0:ℝ)*(liftTermMAE9 j (s+2) 0:ℝ)*(s+7)*(s+j+4) ≤
 (liftTermMAE9 j (s+1) 0:ℝ)^2*(s+6)*(s+j+5) := by
 have h := (Rat.cast_le (K:=ℝ)).mpr (base_curvature_ratM09F j s)
 push_cast at h
 exact h

def budgetDenM09F (s : ℝ) : ℝ := (s+6)*(s+7)*(s+8)*(s+9)

theorem budget_den_chooseM09F (s : ℕ) : budgetDenM09F s=24*((s+9).choose 4:ℝ) := by
 have h := Nat.ascFactorial_eq_factorial_mul_choose (s+5) 4
 have hh : (s+6)*(s+7)*(s+8)*(s+9)=24*(s+9).choose 4 := by
   simpa [Nat.ascFactorial_succ,Nat.factorial,Nat.mul_assoc,Nat.mul_comm,Nat.mul_left_comm] using h
 unfold budgetDenM09F
 exact_mod_cast hh

theorem budget_scalar_largeM09F (x u : ℝ) (hx : 0 ≤ x) (hu : 0 ≤ u) :
 (budgetDenM09F (x+5)+24*(x+8))*(budgetDenM09F (x+7)+24*(x+10))*(x+11)*(2*x+u+15) ≤
 budgetDenM09F (x+5)*budgetDenM09F (x+7)*(x+12)*(2*x+u+14) := by
 have he : budgetDenM09F (x+5)*budgetDenM09F (x+7)*(x+12)*(2*x+u+14)-
   (budgetDenM09F (x+5)+24*(x+8))*(budgetDenM09F (x+7)+24*(x+10))*(x+11)*(2*x+u+15)=
   (805368960+u*893185920)+x*((1452500784+u*551490960)+x*((725300940+u*148829876)+
   x*((179973212+u*22891368)+x*((26379591+u*2191413)+x*((2440233+u*133500)+
   x*((144510+u*5046)+x*((5322+u*108)+x*((111+u)+x)))))))) := by
   unfold budgetDenM09F
   ring
 have hp : 0 ≤ (805368960+u*893185920)+x*((1452500784+u*551490960)+x*((725300940+u*148829876)+
   x*((179973212+u*22891368)+x*((26379591+u*2191413)+x*((2440233+u*133500)+
   x*((144510+u*5046)+x*((5322+u*108)+x*((111+u)+x)))))))) := by positivity
 linarith

theorem budget_scalarM09F (j s : ℕ) (hs : 3 ≤ s) (hj : 5 ≤ j) (hsj : s ≤ j) :
 (((s+9).choose 4:ℝ)+(s+3))*(((s+11).choose 4:ℝ)+(s+5))*(s+6)*(s+j+5) ≤
 ((s+9).choose 4:ℝ)*((s+11).choose 4:ℝ)*(s+7)*(s+j+4) := by
 have he0 := budget_den_chooseM09F s
 have he2 := budget_den_chooseM09F (s+2)
 rw [show s+2+9=s+11 by omega] at he2
 push_cast at he2
 have H : (budgetDenM09F s+24*(s+3))*(budgetDenM09F (s+2)+24*(s+5))*(s+6)*(s+j+5) ≤
     budgetDenM09F s*budgetDenM09F (s+2)*(s+7)*(s+j+4) := by
   have hjR : (5:ℝ) ≤ j := by exact_mod_cast hj
   by_cases hs5 : 5 ≤ s
   · have hsR : (5:ℝ) ≤ s := by exact_mod_cast hs5
     have hsjR : (s:ℝ) ≤ j := by exact_mod_cast hsj
     have h := budget_scalar_largeM09F (s-5) (j-s) (by linarith) (by linarith)
     convert h using 1 <;> congr 1 <;> ring
   · interval_cases s <;> norm_num [budgetDenM09F] <;> nlinarith
 rw [he0,he2] at H
 nlinarith only [H]

end
end MathGKM.Markov
