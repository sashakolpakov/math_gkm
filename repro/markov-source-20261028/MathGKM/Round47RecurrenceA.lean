import MathGKM.Round47BoundaryA

/-! Machine-authored round47: division-free contiguous recurrence.
All support guards are explicit; no factor is cancelled. -/
namespace HorizontalR47
open MathGKM.Markov HorizontalR46
noncomputable section

theorem F_q_recurrence (n h j q : ℕ) (hh : 0<h)
    (hqn : q+1 ≤ n-h) (hqj : q+1 ≤ j) (hj : j ≤ q+2*h) :
    ((n-q : ℕ) : ℤ)*((q+1 : ℕ) : ℤ)*((2*h-(j-q)+1 : ℕ) : ℤ)*
      F n h j (q+1) =
    ((n-h-q : ℕ) : ℤ)*((h+q : ℕ) : ℤ)*((j-q : ℕ) : ℤ)*F n h j q := by
  have hnq : 0<n-q := by omega
  have hhp : 0<h+q := by omega
  have hnp : n-q-1+1=n-q := by omega
  have hqp : h+q-1+1=h+q := by omega
  have hjp : j-q-1+1=j-q := by omega
  have hA : (((n-(q+1)).choose h : ℕ) : ℤ)*((n-q : ℕ) : ℤ) =
      ((n-q).choose h : ℤ)*((n-h-q : ℕ) : ℤ) := by
    have H := Nat.choose_mul_succ_eq (n-q-1) h
    have e1 : n-q-1=n-(q+1) := by omega
    have e2 : n-q-h=n-h-q := by omega
    rw [hnp,e1,e2] at H
    exact_mod_cast H
  have hB : ((h+(q+1)-1).choose (q+1) : ℤ)*((q+1 : ℕ) : ℤ) =
      ((h+q-1).choose q : ℤ)*((h+q : ℕ) : ℤ) := by
    have H := Nat.succ_mul_choose_eq (h+q-1) q
    have e1 : h+(q+1)-1=h+q := by omega
    rw [show (h+q-1).succ=h+q by omega] at H
    rw [e1]
    exact_mod_cast (H.symm.trans (Nat.mul_comm _ _))
  have hD : ((2*h).choose (j-(q+1)) : ℤ)*((2*h-(j-q)+1 : ℕ) : ℤ) =
      ((2*h).choose (j-q) : ℤ)*((j-q : ℕ) : ℤ) := by
    have H := Nat.choose_succ_right_eq (2*h) (j-q-1)
    have e1 : j-q-1=j-(q+1) := by omega
    have e2 : 2*h-(j-q-1)=2*h-(j-q)+1 := by omega
    rw [hjp,e2,e1] at H
    exact_mod_cast H.symm
  have g0 : q ≤ n-h ∧ q ≤ j ∧ j ≤ q+2*h := by omega
  have g1 : q+1 ≤ n-h ∧ q+1 ≤ j ∧ j ≤ q+1+2*h := by omega
  simp only [F,if_pos g0,if_pos g1]
  calc
    _ = (((n-(q+1)).choose h : ℤ)*((n-q : ℕ) : ℤ))*
      (((h+(q+1)-1).choose (q+1) : ℤ)*((q+1 : ℕ) : ℤ))*
      (((2*h).choose (j-(q+1)) : ℤ)*((2*h-(j-q)+1 : ℕ) : ℤ)) := by ring
    _ = _ := by rw [hA,hB,hD]; ring

theorem q_factor_positive (n h j q : ℕ) (hqn : q+1 ≤ n-h)
    (hj : j ≤ q+2*h) :
    0 < ((n-q : ℕ) : ℤ)*((q+1 : ℕ) : ℤ)*((2*h-(j-q)+1 : ℕ) : ℤ) := by
  apply mul_pos
  · apply mul_pos <;> omega
  · omega

end
end HorizontalR47
#print axioms HorizontalR47.F_q_recurrence
