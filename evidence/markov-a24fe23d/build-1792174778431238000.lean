import MarkovPellDiagonalStepMA24
/-! Machine-authored a24fe23d. Two-step reverse midpoint inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem pell_reverse_twoMA24 (a j s q : ℕ) :
 pellTermMA24 a j s (q+2)*pellTermMA24 a j (s+2) q ≤
 pellTermMA24 a j (s+1) (q+1)^2 := by
 by_cases hz0 : pellTermMA24 a j s (q+2)=0
 · rw [hz0,zero_mul]; exact sq_nonneg _
 by_cases hz1 : pellTermMA24 a j (s+2) q=0
 · rw [hz1,mul_zero]; exact sq_nonneg _
 have hp0 := (pell_term_posMA24 a j s (q+2)).mp
   (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm hz0))
 have hp1 := (pell_term_posMA24 a j (s+2) q).mp
   (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm hz1))
 have h0 := pell_diagonal_stepMA24 a j s (q+1) (by omega) (by omega) (by omega)
 have h1 := pell_diagonal_stepMA24 a j (s+1) q (by omega) (by omega) (by omega)
 simp only [Nat.add_assoc] at h0
 push_cast at h0 h1
 let A : ℝ := a-q
 let D : ℝ := j-q
 let E : ℝ := 2*s+2-D
 let X : ℝ := (E+4)*D*(A-1)
 let Y : ℝ := (E+3)*(D-1)*A
 have hA : (s:ℝ)+3 ≤ A := by
   dsimp [A]
   have hh : (s:ℝ)+q+3 ≤ a := by exact_mod_cast (show s+q+3 ≤ a by omega)
   linarith
 have hD : 2 ≤ D := by dsimp [D]; exact_mod_cast (show (2:ℤ) ≤ (j:ℤ)-q by omega)
 have hE : -2 ≤ E := by
   dsimp [E,D]
   have hh : (j:ℝ) ≤ 2*s+4+q := by exact_mod_cast (show j ≤ 2*s+4+q by omega)
   linarith
 have hA0 : 0 < A := by have : (0:ℝ) ≤ s := by positivity; linarith
 have hA1 : 0 < A-1 := by have : (0:ℝ) ≤ s := by positivity; linarith
 have hD0 : 0 < D := by linarith
 have hD1 : 0 < D-1 := by linarith
 have hE3 : 0 < E+3 := by linarith
 have hE4 : 0 < E+4 := by linarith
 have hY : 0 ≤ Y := by dsimp [Y]; positivity
 have hXY : Y ≤ X := by
   have hh := mul_nonneg (show 0 ≤ A-s-3 by linarith) (show 0 ≤ 2*(s:ℝ)+5 by positivity)
   have hs := sq_nonneg (D-((s:ℝ)+3))
   dsimp [X,Y,E] at ⊢
   nlinarith
 have hf : ((s:ℝ)+1)*(2*s+5) ≤ ((s:ℝ)+2)*(2*s+3) := by nlinarith
 have hm := mul_le_mul (mul_le_mul hf (show (q:ℝ)+1 ≤ q+2 by linarith)
     (by positivity) (by positivity)) hXY hY (by positivity : 0 ≤ ((s:ℝ)+2)*(2*s+3)*(q+2))
 let n0 : ℝ := 2*(2*s+3)*(A-1)*(q+2)
 let n1 : ℝ := 2*(2*s+5)*A*(q+1)
 let d0 : ℝ := (s+1)*(E+3)*(D-1)
 let d1 : ℝ := (s+2)*(E+4)*D
 have hgap : 0 ≤ d1*n0-d0*n1 := by
   dsimp [n0,n1,d0,d1,X,Y] at hm ⊢
   nlinarith only [hm]
 have hid : d1*n0*(pellTermMA24 a j (s+1) (q+1)^2-
     pellTermMA24 a j s (q+2)*pellTermMA24 a j (s+2) q)=
     pellTermMA24 a j (s+1) (q+1)^2*(d1*n0-d0*n1) := by
   dsimp [n0,n1,d0,d1,A,D,E]
   linear_combination
     (2*(2*(s:ℝ)+5)*(a-q)*(q+1))*pellTermMA24 a j (s+1) (q+1)*h0-
     (2*(2*(s:ℝ)+3)*(a-q-1)*(q+2))*pellTermMA24 a j s (q+2)*h1
 have hp : 0 < d1*n0 := by dsimp [d1,n0]; positivity
 have hn : 0 ≤ pellTermMA24 a j (s+1) (q+1)^2*(d1*n0-d0*n1) := mul_nonneg (sq_nonneg _) hgap
 have hh := (mul_nonneg_iff_of_pos_left hp).mp (show 0 ≤ _ by rw [hid]; exact hn)
 linarith

end
end MathGKM.Markov
