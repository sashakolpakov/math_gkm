import MarkovPellRatioMA24
/-! Machine-authored a24fe23d. Exact parameter recurrence, including the
vanishing upper boundary; every cancellation below uses a positive scalar. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem choose_up_twoMA24 (n k : ℕ) (hk : k ≤ n) :
 ((n:ℝ)+2-k)*(n+1-k)*((n+2).choose k:ℝ)=
 ((n:ℝ)+2)*(n+1)*(n.choose k:ℝ) := by
 have h0 := choose_down_topMA24 n k hk
 have h1 := choose_down_topMA24 (n+1) k (by omega)
 push_cast at h1
 linear_combination ((n:ℝ)+1-k)*h1+((n:ℝ)+2)*h0

theorem pell_parameter_stepMA24 (a j s q : ℕ)
 (ha : s+q+1 ≤ a) (hq : q ≤ j) (hj : j ≤ 2*s+2+q) :
 ((s:ℝ)+1)*(2*s+3-j+q)*(2*s+4-j+q)*pellTermMA24 a j (s+1) q=
 2*(2*(s:ℝ)+3)*(a-q-s-1)*(s+q+1)*pellTermMA24 a j s q := by
 have h0 := congrArg (fun n : ℕ => (n:ℝ)) (Nat.choose_succ_right_eq (a-q) (s+1))
 push_cast at h0
 rw [Nat.cast_sub (by omega : s+1 ≤ a-q)] at h0
 rw [Nat.cast_sub (by omega : q ≤ a)] at h0
 push_cast at h0
 have h1 := choose_down_topMA24 (s+q) q (by omega)
 have h2 := choose_up_twoMA24 (2*s+2) (j-q) (by omega)
 rw [Nat.cast_sub hq] at h2
 push_cast at h1 h2
 have hp := congrArg₂ (fun x y : ℝ => x*y) (congrArg₂ (fun x y : ℝ => x*y) h0 h1) h2
 have hmain : ((s:ℝ)+2)*(((s:ℝ)+1)*(2*s+3-j+q)*(2*s+4-j+q)*pellTermMA24 a j (s+1) q)=
   ((s:ℝ)+2)*(2*(2*(s:ℝ)+3)*(a-q-s-1)*(s+q+1)*pellTermMA24 a j s q) := by
   unfold pellTermMA24 horizontalTerm9a72
   rw [if_pos hq,if_pos hq]
   push_cast
   simp only [show 2*(s+1)+2=2*s+2+2 by omega,
     show s+1+q=s+q+1 by omega] at ⊢
   convert hp using 1 <;> ring
 exact mul_left_cancel₀ (by positivity : (s:ℝ)+2≠0) hmain

theorem pell_reverse_oneMA24 (a j s q : ℕ) :
 pellTermMA24 a j s (q+1)*pellTermMA24 a j (s+2) q ≤
 pellTermMA24 a j (s+1) q*pellTermMA24 a j (s+1) (q+1) := by
 by_cases h0 : pellTermMA24 a j s (q+1)=0
 · rw [h0,zero_mul]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
 by_cases h1 : pellTermMA24 a j (s+2) q=0
 · rw [h1,mul_zero]; exact mul_nonneg (pell_term_nonnegMA24 _ _ _ _) (pell_term_nonnegMA24 _ _ _ _)
 have hp0 := (pell_term_posMA24 a j s (q+1)).mp
   (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h0))
 have hp1 := (pell_term_posMA24 a j (s+2) q).mp
   (lt_of_le_of_ne (pell_term_nonnegMA24 _ _ _ _) (Ne.symm h1))
 have hlow := pell_parameter_stepMA24 a j s (q+1) (by omega) (by omega) (by omega)
 have hhigh := pell_parameter_stepMA24 a j (s+1) q (by omega) (by omega) (by omega)
 push_cast at hlow hhigh
 let E : ℝ := 2*s+3-j+q
 have hE : 0 ≤ E := by
   dsimp [E]
   have hh : (j:ℝ) ≤ 2*s+2+(q+1) := by exact_mod_cast hp0.2.2
   linarith
 have he : ((s:ℝ)+2)*(2*s+3)*(E+3)-((s:ℝ)+1)*(2*s+5)*(E+1)=
     E+4*(s:ℝ)^2+14*s+13 := by ring
 have hgap : 0 ≤ ((s:ℝ)+2)*(2*s+3)*(E+3)-((s:ℝ)+1)*(2*s+5)*(E+1) := by rw [he]; positivity
 have hA : 0 ≤ (a:ℝ)-q-s-2 := by
   have hh : (s:ℝ)+2+q+1 ≤ a := by exact_mod_cast hp1.1
   linarith
 have hn : 0 ≤ 2*((a:ℝ)-q-s-2)*(s+q+2)*pellTermMA24 a j s (q+1)*
     pellTermMA24 a j (s+1) q*
     (((s:ℝ)+2)*(2*s+3)*(E+3)-((s:ℝ)+1)*(2*s+5)*(E+1)) :=
   mul_nonneg (mul_nonneg (mul_nonneg (mul_nonneg (mul_nonneg (by norm_num) hA)
     (by positivity)) (pell_term_nonnegMA24 _ _ _ _)) (pell_term_nonnegMA24 _ _ _ _)) hgap
 have hid : ((s:ℝ)+1)*(s+2)*(E+1)*(E+2)*(E+3)*
     (pellTermMA24 a j (s+1) q*pellTermMA24 a j (s+1) (q+1)-
       pellTermMA24 a j s (q+1)*pellTermMA24 a j (s+2) q)=
     2*((a:ℝ)-q-s-2)*(s+q+2)*pellTermMA24 a j s (q+1)*pellTermMA24 a j (s+1) q*
     (((s:ℝ)+2)*(2*s+3)*(E+3)-((s:ℝ)+1)*(2*s+5)*(E+1)) := by
   dsimp [E]
   linear_combination ((s:ℝ)+2)*(2*s+6-j+q)*pellTermMA24 a j (s+1) q*hlow-
     ((s:ℝ)+1)*(2*s+4-j+q)*pellTermMA24 a j s (q+1)*hhigh
 have hp : 0 < ((s:ℝ)+1)*(s+2)*(E+1)*(E+2)*(E+3) := by positivity
 have hh := (mul_nonneg_iff_of_pos_left hp).mp (show 0 ≤ _ by rw [hid]; exact hn)
 linarith

end
end MathGKM.Markov
