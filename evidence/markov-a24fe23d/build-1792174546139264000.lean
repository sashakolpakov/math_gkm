import MarkovPellParameterMA24
/-! Machine-authored a24fe23d. A diagonal ratio for the actual Pell summands. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem choose_up_diagMA24 (n k : ℕ) (hk : k ≤ n) :
 ((k:ℝ)+1)*(n+1-k)*((n+2).choose (k+1):ℝ)=
 ((n:ℝ)+2)*(n+1)*(n.choose k:ℝ) := by
 have h0 := choose_down_topMA24 n k hk
 have h1 := congrArg (fun t : ℕ => (t:ℝ)) (Nat.add_one_mul_choose_eq (n+1) k)
 push_cast at h1
 linear_combination ((n:ℝ)+1-k)*h1.symm+((n:ℝ)+2)*h0

theorem pell_diagonal_stepMA24 (a j s q : ℕ)
 (ha : s+q+2 ≤ a) (hq : q+1 ≤ j) (hj : j ≤ 2*s+3+q) :
 ((s:ℝ)+1)*(2*s+4-j+q)*(j-q)*pellTermMA24 a j (s+1) q=
 2*(2*(s:ℝ)+3)*(a-q)*(q+1)*pellTermMA24 a j s (q+1) := by
 have ea : a-(q+1)+1=a-q := by omega
 have ej : j-(q+1)+1=j-q := by omega
 have h0 := congrArg (fun t : ℕ => (t:ℝ)) (Nat.add_one_mul_choose_eq (a-(q+1)) (s+1))
 rw [ea] at h0
 push_cast at h0
 rw [Nat.cast_sub (by omega : q+1 ≤ a)] at h0
 push_cast at h0
 have h1 := congrArg (fun t : ℕ => (t:ℝ)) (Nat.choose_succ_right_eq (s+q+1) q)
 rw [show s+q+1-q=s+1 by omega] at h1
 push_cast at h1
 have h2 := choose_up_diagMA24 (2*s+2) (j-(q+1)) (by omega)
 rw [ej,Nat.cast_sub hq] at h2
 push_cast at h2
 have hp := congrArg₂ (fun x y : ℝ => x*y) (congrArg₂ (fun x y : ℝ => x*y) h0.symm h1.symm) h2
 have hh : ((s:ℝ)+2)*(((s:ℝ)+1)*(2*s+4-j+q)*(j-q)*pellTermMA24 a j (s+1) q)=
     ((s:ℝ)+2)*(2*(2*(s:ℝ)+3)*(a-q)*(q+1)*pellTermMA24 a j s (q+1)) := by
   unfold pellTermMA24 horizontalTerm9a72
   rw [if_pos (by omega : q ≤ j),if_pos hq]
   push_cast
   simp only [show 2*(s+1)+2=2*s+2+2 by omega,
     show s+1+q=s+q+1 by omega,Nat.add_assoc] at ⊢ hp
   convert hp using 1 <;> ring
 exact mul_left_cancel₀ (by positivity : (s:ℝ)+2≠0) hh

end
end MathGKM.Markov
