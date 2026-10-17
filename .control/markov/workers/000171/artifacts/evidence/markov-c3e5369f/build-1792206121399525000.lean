import MarkovSecondRowEquationMC3E
/-! Machine-authored c3e5369f. Exact Fibonacci row needed for the next
correction band; ordinary integer coefficients throughout. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem fib_rows_recMC3E (n j : ℕ) :
 fibRowsMC3E (n+2) j=rowSMFFD (fibRowsMC3E (n+1)) j-rowShiftMFFD 0 1 (fibRowsMC3E n) j := by
 ext i
 rw [coeff_sub,row_S_coeffMFFD,row_shift_coeffMFFD]
 have hf (n : ℕ) : rowCoeffsMFFD (fibRowsMC3E n)=coeff (fib6 n) :=
   funext fun a => funext fun b => raw_row_coeffMC3E _ a b
 rw [hf,hf,←coeff_S_productM9E2,←coeff_monomial_productM9E2]
 rw [fibRowsMC3E,raw_row_coeffMC3E,fib_rec6]
 simp [coeff]

theorem fib_rows_two_stepMC3E (n : ℕ) :
 fibRowsMC3E (n+2) 2=(X+1)*fibRowsMC3E (n+1) 2+
 fibRowsMC3E (n+1) 1-fibRowsMC3E n 1 := by
 rw [fib_rows_recMC3E]
 simp [rowSMFFD,rowShiftMFFD]
 ring

theorem fib_rows_two_baseMC3E :
 fibRowsMC3E 5 2=3*X+12*X^2+10*X^3 := by
 ext i
 rw [fib_rows_coeffMC3E]
 by_cases hi : i ≤ 3
 · interval_cases i <;> norm_num [fibRawM9E2,coeff_add,coeff_ofNat_mul,coeff_X_pow,coeff_X,Nat.choose]
 · simp [fibRawM9E2,show i≠0 by omega,show ¬i+2 ≤ 5 by omega,
     coeff_add,coeff_ofNat_mul,coeff_X_pow,coeff_X,show i≠1 by omega,show i≠2 by omega,show i≠3 by omega]

theorem fib_rows_twoMC3E (n : ℕ) :
 fibRowsMC3E (n+5) 2=X*(X+1)^n*
   (3+3*((n+4:ℕ):Polynomial ℤ)*X+((n+5).choose 2:Polynomial ℤ)*X^2) := by
 induction n with
 | zero => rw [fib_rows_two_baseMC3E]; norm_num [Nat.choose]; ring
 | succ n ih =>
   rw [show n+1+5=(n+4)+2 by omega,fib_rows_two_stepMC3E,
     show n+4+1=n+5 by omega,ih,fib_rows_oneMC3E (n+5) (by omega),
     fib_rows_oneMC3E (n+4) (by omega)]
   have hc : ((n+1+5).choose 2:Polynomial ℤ)=((n+5).choose 2:Polynomial ℤ)+(n+5) := by
     rw [show n+1+5=(n+5)+1 by omega,Nat.choose_succ_succ,Nat.choose_one_right]
     push_cast
     ring
   rw [hc]
   simp only [show n+5-3=n+2 by omega,show n+4-3=n+1 by omega,
     pow_add,pow_one,Nat.cast_add,Nat.cast_ofNat,Nat.cast_one]
   ring

theorem fib_rows_two_generalMC3E (n : ℕ) (hn : 5 ≤ n) :
 fibRowsMC3E n 2=X*(X+1)^(n-5)*
   (3+3*((n-1:ℕ):Polynomial ℤ)*X+(n.choose 2:Polynomial ℤ)*X^2) := by
 have h := fib_rows_twoMC3E (n-5)
 simpa only [show n-5+5=n by omega,show n-5+4=n-1 by omega] using h

end
end MathGKM.Markov
