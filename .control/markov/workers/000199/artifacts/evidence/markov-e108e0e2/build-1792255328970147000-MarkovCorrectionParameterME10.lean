import MarkovCorrectionPositiveSumM80F
/-! Machine-authored e108e0e2. Weaker exact parameter hypotheses. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
theorem middle_gain_parameterME10 (q k : ℕ) (r : Bool) (hq : k ≤ q) :
 middleGainM99A (q+2) (k+1) r+middleGainM99A q k r=
 middleGainM99A (q+1) (k+1) r+(X+1)*middleGainM99A (q+1) k r := by
 cases k with
 | zero =>
   have h0 := middle_fib_parameterM99A q 0 (by omega)
   have h1 := middle_fib_parameterM99A (q+1) 0 (by omega)
   simp only [middle_fib_zeroM99A] at h0 h1
   rw [middle_gain_succM99A (q+2) 0 r (by omega),middle_gain_succM99A (q+1) 0 r (by omega)]
   simp only [middle_gain_topM99A,middle_fib_zeroM99A]
   simp only [Nat.add_assoc,Nat.reduceAdd] at h0 h1 ⊢
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true]
   · linear_combination h1
   · linear_combination h0+h1
 | succ k =>
   have h0 := middle_fib_parameterM99A q k (by omega)
   have h1 := middle_fib_parameterM99A (q+1) k (by omega)
   have h2 := middle_fib_parameterM99A q (k+1) (by omega)
   have h3 := middle_fib_parameterM99A (q+1) (k+1) (by omega)
   rw [middle_gain_succM99A (q+2) (k+1) r (by omega),middle_gain_succM99A q k r (by omega),
     middle_gain_succM99A (q+1) (k+1) r (by omega),middle_gain_succM99A (q+1) k r (by omega)]
   simp only [Nat.add_assoc,Nat.reduceAdd] at h0 h1 h2 h3 ⊢
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true]
   · linear_combination h0+(X+1)*h1+h3
   · linear_combination (X+1)*h0+h2+h3

theorem middle_correction_parameterME10 (q k : ℕ) (r : Bool) (hq : k ≤ q) :
 middleCorrectionM99A (q+2) r (k+1)+middleCorrectionM99A q r k=
 middleCorrectionM99A (q+1) r (k+1)+(X+1)*middleCorrectionM99A (q+1) r k := by
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · have hg := middle_gain_parameterME10 q 0 r hq
     simp only [middleCorrectionM99A,middle_gain_topM99A] at hg ⊢
     linear_combination 4*X*hg
   · have hg0 := middle_gain_parameterME10 q 0 r (by omega)
     have hg1 := middle_gain_parameterME10 q 1 r hq
     simp only [middleCorrectionM99A,middle_gain_topM99A] at hg0 hg1 ⊢
     linear_combination 4*X*hg1+8*X*(1-X)*hg0
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     have hg := middle_gain_parameterME10 q (k+2) r hq
     simp only [middleCorrectionM99A] at h0 h1 ⊢
     linear_combination 4*X*hg+2*(1-X)*h1-(X+1)^2*h0

theorem middle_correction_diagonalME10 (q k : ℕ) (r : Bool) (hq : k ≤ q) :
 middleCorrectionM99A (q+4) r (k+2)-2*middleCorrectionM99A (q+2) r (k+1)+
 middleCorrectionM99A q r k=4*X*middleGainM99A (q+2) (k+2) r := by
 have h := row_diagonal_operatorMDAB (fun n t => middleCorrectionM99A n r t) q k
   (middle_correction_parameterME10 q k r hq)
   (middle_correction_parameterME10 (q+1) k r (by omega))
   (middle_correction_parameterME10 (q+1) (k+1) r (by omega))
   (middle_correction_parameterME10 (q+2) (k+1) r (by omega))
 have he : middleCorrectionM99A (q+2) r (k+2)=
   4*X*middleGainM99A (q+2) (k+2) r+2*(1-X)*middleCorrectionM99A (q+2) r (k+1)-
   (X+1)^2*middleCorrectionM99A (q+2) r k := rfl
 linear_combination h+he

end
end MathGKM.Markov
