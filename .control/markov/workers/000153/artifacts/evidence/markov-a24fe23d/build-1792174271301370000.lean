import MarkovPellRatioMA24
/-! Machine-authored a24fe23d. Reverse total positivity of the exact Pell
summand array, with every support zero retained. Not LC of its sum. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem pell_rr2_interiorMA24 (a j s q : ℕ)
 (ha : s+q+3 ≤ a) (hq : q+1 ≤ j) (hj : j ≤ 2*s+2+q) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+1) (q+1) ≤
 pellTermMA24 a j s (q+1)*pellTermMA24 a j (s+1) q := by
 have h0 := pell_term_q_stepMA24 a j s q (by omega) hq hj
 have h1 := pell_term_q_stepMA24 a j (s+1) q (by omega) hq (by omega)
 push_cast at h1
 let A : ℝ := a-q-s-1
 let B : ℝ := s+q+1
 let D : ℝ := j-q
 let E : ℝ := 2*s+2-j+q
 have hA : 0 ≤ A := by dsimp [A]; have : (s:ℝ)+q+3 ≤ a := by exact_mod_cast ha; linarith
 have hB : 0 ≤ B+1 := by dsimp [B]; positivity
 have hD : 0 ≤ D := by dsimp [D]; have : (q:ℝ)+1 ≤ j := by exact_mod_cast hq; linarith
 have hE : 0 < E+1 := by dsimp [E]; have : (j:ℝ) ≤ 2*s+2+q := by exact_mod_cast hj; linarith
 have hJ : 0 ≤ (j:ℝ)+q-1 := by have : (q:ℝ)+1 ≤ j := by exact_mod_cast hq; nlinarith
 have hgap : 0 ≤ A*B*(E+3)-(A-1)*(B+1)*(E+1) := by
   have he : A*B*(E+3)-(A-1)*(B+1)*(E+1)=A*((j:ℝ)+q-1)+(B+1)*(E+1) := by dsimp [A,B,E]; ring
   rw [he]
   exact add_nonneg (mul_nonneg hA hJ) (mul_nonneg hB hE.le)
 have hid : ((a:ℝ)-q)*(q+1)*(E+1)*(E+3)*
     (pellTermMA24 a j s (q+1)*pellTermMA24 a j (s+1) q-
       pellTermMA24 a j s q*pellTermMA24 a j (s+1) (q+1))=
     D*pellTermMA24 a j s q*pellTermMA24 a j (s+1) q*
       (A*B*(E+3)-(A-1)*(B+1)*(E+1)) := by
   dsimp [A,B,D,E]
   linear_combination (2*(s:ℝ)+5-j+q)*pellTermMA24 a j (s+1) q*h0-
     (2*(s:ℝ)+3-j+q)*pellTermMA24 a j s q*h1
 have hp : 0 < ((a:ℝ)-q)*(q+1)*(E+1)*(E+3) := by
   have haq : (q:ℝ)<a := by exact_mod_cast (show q<a by omega)
   exact mul_pos (mul_pos (mul_pos (sub_pos.mpr haq) (by positivity)) hE) (by linarith)
 have hn : 0 ≤ D*pellTermMA24 a j s q*pellTermMA24 a j (s+1) q*
       (A*B*(E+3)-(A-1)*(B+1)*(E+1)) :=
   mul_nonneg (mul_nonneg (mul_nonneg hD (pell_term_nonnegMA24 _ _ _ _))
     (pell_term_nonnegMA24 _ _ _ _)) hgap
 have hh := (mul_nonneg_iff_of_pos_left hp).mp (show 0 ≤ _ by rw [hid]; exact hn)
 linarith

theorem pell_rr2MA24 (a j s q : ℕ) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+1) (q+1) ≤
 pellTermMA24 a j s (q+1)*pellTermMA24 a j (s+1) q := by
 by_cases h0 : pellTermMA24 a j s q=0
 · rw [h0,zero_mul]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
 by_cases h1 : pellTermMA24 a j (s+1) (q+1)=0
 · rw [h1,mul_zero]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
 have hp0 := (pell_term_posMA24 a j s q).mp (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h0))
 have hp1 := (pell_term_posMA24 a j (s+1) (q+1)).mp (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h1))
 exact pell_rr2_interiorMA24 a j s q (by omega) (by omega) (by omega)

end
end MathGKM.Markov
