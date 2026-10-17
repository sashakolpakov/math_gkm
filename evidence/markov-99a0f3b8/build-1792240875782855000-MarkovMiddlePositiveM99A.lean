import MarkovMiddleParameterM99A
/-! Machine-authored 99a0f3b8. Coefficient positivity of the actual middle
correction via a parameter-diagonal recurrence. No LC closure is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem middle_fib_oneM99A (n : ℕ) (hn : 1 ≤ n) :
 middleFibM99A n 1=C (n:ℤ)*X := by
 ext i
 rw [middleFibM99A,fib_rows_coeffMC3E]
 rcases i with _|_|i
 · simp [fibRawM9E2,show n-1≠n by omega,coeff_C_mul]
 · simp [fibRawM9E2,show 1+(n-1)=n by omega,show n-(n-1)-1=0 by omega,
     coeff_C_mul,Nat.choose_symm (show n-1 ≤ n by omega)]
   congr 1
   rw [show n-(n-1)=1 by omega,Nat.choose_one_right]
 · simp [fibRawM9E2,show ¬i+2+(n-1) ≤ n by omega,coeff_C_mul,show i+2≠1 by omega]

theorem middle_correction_oneM99A (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 middleCorrectionM99A q r 1=
 if r then 20*X+C (8*(q:ℤ)-8)*X^2 else 16*X+C (4*(q:ℤ))*X^2 := by
 rw [middleCorrectionM99A,middle_gain_succM99A q 0 r (by omega),middle_fib_zeroM99A,
   middle_fib_zeroM99A,middle_fib_oneM99A q hq,middle_fib_oneM99A (q+1) (by omega),
   middleCorrectionM99A,middle_gain_topM99A]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_one,map_add,map_sub,map_mul,map_ofNat,map_one]
   <;> ring

theorem gain_coeff_nonnegM99A (q i j : ℕ) (r : Bool) :
 0 ≤ (gainRowsMC3E q r j).coeff i := by
 have hf (n i j : ℕ) : 0 ≤ (fibRowsMC3E n j).coeff i := by
   rw [fib_rows_coeffMC3E]
   unfold fibRawM9E2
   split_ifs <;> positivity
 have hx (n j : ℕ) : 0 ≤ (X*fibRowsMC3E n j).coeff i := by
   cases i with
   | zero => simp
   | succ i => rw [coeff_X_mul]; exact hf _ _ _
 cases r <;> simp only [gainRowsMC3E,Bool.false_eq_true,if_false,if_true,rowSMFFD,rowShiftMFFD,
   Nat.zero_le,if_true,Nat.sub_zero,pow_zero,pow_one,one_mul,coeff_add]
   <;> split_ifs <;> simp only [coeff_add,coeff_zero]
   <;> positivity

def middleAtM99A (d k : ℕ) (r : Bool) : Polynomial ℤ :=
 middleCorrectionM99A (d+2*k+2) r k

theorem middle_at_diagonalM99A (d k : ℕ) (r : Bool) :
 middleAtM99A d (k+2) r-2*middleAtM99A d (k+1) r+middleAtM99A d k r=
 4*X*middleGainM99A (d+2*k+4) (k+2) r := by
 have h := middle_correction_diagonalM99A (d+2*k+2) k r (by omega)
 simpa only [middleAtM99A,show d+2*(k+2)+2=d+2*k+2+4 by omega,
   show d+2*(k+1)+2=d+2*k+2+2 by omega,show d+2*k+2+2=d+2*k+4 by omega] using h

theorem middle_at_initialM99A (d i : ℕ) (r : Bool) :
 0 ≤ (middleAtM99A d 0 r).coeff i ∧
 (middleAtM99A d 0 r).coeff i ≤ (middleAtM99A d 1 r).coeff i := by
 simp only [middleAtM99A,Nat.mul_zero,Nat.add_zero,Nat.mul_one,
   middle_correction_oneM99A (d+2+2) r (by omega),middleCorrectionM99A,middle_gain_topM99A]
 cases r <;> rcases i with _|_|_|i <;>
   norm_num [coeff_C_mul,coeff_X_pow,coeff_X,coeff_one,show i+3≠1 by omega,show i+3≠2 by omega] <;> omega

theorem middle_at_nonneg_monoM99A (d k i : ℕ) (r : Bool) :
 0 ≤ (middleAtM99A d k r).coeff i ∧
 (middleAtM99A d k r).coeff i ≤ (middleAtM99A d (k+1) r).coeff i := by
 induction k with
 | zero => exact middle_at_initialM99A d i r
 | succ k ih =>
   have h := congrArg (fun p : Polynomial ℤ => p.coeff i) (middle_at_diagonalM99A d k r)
   simp only [coeff_sub,coeff_add,coeff_ofNat_mul] at h
   have hg : 0 ≤ (X*middleGainM99A (d+2*k+4) (k+2) r).coeff i := by
     cases i with
     | zero => simp
     | succ i => rw [coeff_X_mul]; exact gain_coeff_nonnegM99A _ _ _ r
   have he : (4*X*middleGainM99A (d+2*k+4) (k+2) r).coeff i=
     4*(X*middleGainM99A (d+2*k+4) (k+2) r).coeff i := by rw [mul_assoc,coeff_ofNat_mul]
   rw [he] at h
   constructor <;> omega

theorem middle_correction_nonnegM99A (q k i : ℕ) (r : Bool) (hq : 2*k+2 ≤ q) :
 0 ≤ (middleCorrectionM99A q r k).coeff i := by
 have h := (middle_at_nonneg_monoM99A (q-(2*k+2)) k i r).1
 simpa only [middleAtM99A,show q-(2*k+2)+2*k+2=q by omega] using h

end
end MathGKM.Markov
