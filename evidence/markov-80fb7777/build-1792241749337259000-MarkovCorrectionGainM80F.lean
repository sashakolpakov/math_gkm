import MarkovCorrectionJetDefsM80F
/-! Machine-authored 80fb7777. Exact gain coefficients with guarded indices. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

def fibJetM80F (n t : ℚ) (c : ℕ) : ℚ :=
 if c=0 then 0 else choosePolyM0D3 t (c-1)*choosePolyM0D3 (n-t-1+c) c

theorem middle_fib_coeffM80F (n t c : ℕ) (ht : t+1 ≤ n) :
 ((middleFibM99A n (t+1)).coeff c:ℚ)=fibJetM80F n t c := by
 rw [middleFibM99A,fib_rows_coeffMC3E]
 cases c with
 | zero => simp [fibRawM9E2,fibJetM80F,show n-(t+1)≠n by omega]
 | succ c =>
   simp only [fibRawM9E2,Nat.succ_ne_zero,if_false,fibJetM80F,Nat.add_sub_cancel]
   by_cases hc : c ≤ t
   · rw [if_pos (by omega : c+1+(n-(t+1)) ≤ n),
       show n-(n-(t+1))-1=t by omega]
     rw [Nat.choose_symm (show n-(t+1) ≤ c+1+(n-(t+1)) by omega)]
     simp only [show c+1+(n-(t+1))-(n-(t+1))=c+1 by omega,Int.cast_mul,
       Int.cast_natCast,choose_poly_natM0D3]
     congr 2
     push_cast [Nat.cast_sub ht]
     ring
   · rw [if_neg (by omega : ¬c+1+(n-(t+1)) ≤ n)]
     have hz : choosePolyM0D3 (t:ℚ) c=0 := by
       rw [←choose_poly_natM0D3,Nat.choose_eq_zero_of_lt (by omega)]; norm_num
     simp [hz]

def gainJetM80F (q k : ℚ) (r : Bool) (c : ℕ) : ℚ :=
 if r then
 (if c=0 then 0 else fibJetM80F q k (c-1))+fibJetM80F q k c+
 fibJetM80F q (k+1) c+fibJetM80F (q+1) (k+1) c
 else fibJetM80F q k c+(if c=0 then 0 else fibJetM80F (q+1) k (c-1))+
 fibJetM80F (q+1) k c+fibJetM80F (q+1) (k+1) c

theorem middle_gain_coeffM80F (q k c : ℕ) (r : Bool) (hq : k+2 ≤ q) :
 ((middleGainM99A q (k+2) r).coeff c:ℚ)=gainJetM80F q k r c := by
 rw [middle_gain_succM99A q (k+1) r hq]
 have h0 := middle_fib_coeffM80F q k c (by omega)
 have h1 := middle_fib_coeffM80F q (k+1) c (by omega)
 have h2 := middle_fib_coeffM80F (q+1) k c (by omega)
 have h3 := middle_fib_coeffM80F (q+1) (k+1) c (by omega)
 cases c with
 | zero =>
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,add_mul,one_mul,
     coeff_add,coeff_X_mul_zero,Int.cast_add,Int.cast_zero] at h0 h1 h2 h3 ⊢
     <;> simp [gainJetM80F,fibJetM80F] at h0 h1 h2 h3 ⊢ <;> linarith
 | succ c =>
   have h4 := middle_fib_coeffM80F q k c (by omega)
   have h5 := middle_fib_coeffM80F (q+1) k c (by omega)
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,add_mul,one_mul,
     coeff_add,coeff_X_mul,Int.cast_add] at h0 h1 h2 h3 ⊢
     <;> simp only [gainJetM80F,Bool.false_eq_true,if_false,if_true,Nat.succ_ne_zero,
       Nat.add_sub_cancel,Nat.cast_add,Nat.cast_one]
     <;> push_cast at h0 h1 h2 h3 h4 h5
     <;> linarith

end
end MathGKM.Markov
