import MarkovCorrectionFactorMDB2
/-! Machine-authored c3e5369f. Exact source-row discriminant equation.
No log-concavity or positivity is inferred from its signed recurrence. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def rawRowMC3E (P : BiPoly) (j : ℕ) : Polynomial ℤ := (Bivariate.swap P).coeff j

theorem raw_row_coeffMC3E (P : BiPoly) (i j : ℕ) :
 (rawRowMC3E P j).coeff i=coeff P i j := swap_coeff46 P i j

def fibRowsMC3E (n j : ℕ) : Polynomial ℤ := rawRowMC3E (fib6 n) j

theorem fib_rows_coeffMC3E (n i j : ℕ) :
 (fibRowsMC3E n j).coeff i=fibRawM9E2 n i j := by
 rw [fibRowsMC3E,raw_row_coeffMC3E,fib_raw_formulaM9E2]

theorem fib_rows_zeroMC3E (n : ℕ) (hn : 1 ≤ n) :
 fibRowsMC3E n 0=X*(X+1)^(n-1) := by
 ext i
 rw [fib_rows_coeffMC3E]
 cases i with
 | zero => simp [fibRawM9E2,show 0≠n by omega,coeff_X_mul]
 | succ i =>
   rw [fib_raw_extendedME9C n i 0 (by omega)]
   simp [coeff_X_mul,coeff_X_add_one_pow]

theorem fib_rows_oneMC3E (n : ℕ) (hn : 3 ≤ n) :
 fibRowsMC3E n 1=X*(X+1)^(n-3)*(2+(n:Polynomial ℤ)*X) := by
 have h := horizontal_one_formula46 (List.replicate (n-2) false) (by
   rw [spine_b6]; omega)
 rw [left_spine_a274,spine_b6,source_fib6] at h
 simpa only [fibRowsMC3E,rawRowMC3E,Nat.cast_ofNat,show n-2+2=n by omega,Nat.reduceMul,Nat.reduceSub,
   show 1+n-1=n by omega,pow_one] using h

def gainRowsMC3E (q : ℕ) (r : Bool) (j : ℕ) : Polynomial ℤ :=
 if r then rowSMFFD (fibRowsMC3E q) j+fibRowsMC3E (q+1) j
 else rowShiftMFFD 0 1 (fibRowsMC3E q) j+rowSMFFD (fibRowsMC3E (q+1)) j

theorem gain_rows_coeffMC3E (q i j : ℕ) (r : Bool) :
 (gainRowsMC3E q r j).coeff i=
 (if r then (fun a b => addSRawM9E2 (fibRawM9E2 q) a b+fibRawM9E2 (q+1) a b)
 else (fun a b => shiftRawM9E2 0 1 (fibRawM9E2 q) a b+
   addSRawM9E2 (fibRawM9E2 (q+1)) a b)) i j := by
 have hf (n : ℕ) : rowCoeffsMFFD (fibRowsMC3E n)=fibRawM9E2 n :=
   funext fun a => funext fun b => fib_rows_coeffMC3E n a b
 cases r <;> simp only [gainRowsMC3E,Bool.false_eq_true,if_false,if_true,
   coeff_add,row_shift_coeffMFFD,row_S_coeffMFFD,hf,fib_rows_coeffMC3E]

theorem source_row_equationMC3E (q j : ℕ) (r : Bool) (hj : 2*j+1 ≤ sourceNME9C q r) :
 rowDiscMFFD (rawRowMC3E (threePolyM9E2 q r)) j-
 rowDiscMFFD (lowerRowMFFD (sourceNME9C q r)) j=
 4*rowShiftMFFD 1 (q+1) (gainRowsMC3E q r) j := by
 ext i
 simp only [coeff_sub,coeff_ofNat_mul,row_shift_coeffMFFD,row_disc_coeffMFFD]
 have hs : rowCoeffsMFFD (rawRowMC3E (threePolyM9E2 q r))=threeRawM9E2 q r :=
   funext fun a => funext fun b => (raw_row_coeffMC3E _ a b).trans (three_raw_formulaM9E2 q r a b)
 rw [hs,three_raw_equationM96A,lower_row_raw_equationMFFD _ j hj i j le_rfl]
 unfold threeForceM96A lowerForceME9C sourceNME9C fibDeltaME9C
 rw [add_sub_cancel_left]
 have hg := funext (fun a => funext (fun b => gain_rows_coeffMC3E q a b r))
 change rowCoeffsMFFD (gainRowsMC3E q r)=_ at hg
 rw [hg]

theorem source_row_lowerMC3E (q j : ℕ) (r : Bool) (hj : j ≤ q) :
 rawRowMC3E (threePolyM9E2 q r) j=lowerRowMFFD (sourceNME9C q r) j := by
 ext i
 rw [raw_row_coeffMC3E,three_raw_formulaM9E2,source_lower_rowMFFD q i j r hj]

theorem source_row_firstMC3E (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 rawRowMC3E (threePolyM9E2 q r) (q+1)-lowerRowMFFD (sourceNME9C q r) (q+1)=
 C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r) := by
 ext i
 rw [coeff_sub,raw_row_coeffMC3E,three_raw_formulaM9E2,
   source_correction_factorMDB2 q i r hq,correction_row_splitMDB2 q r hq,coeff_add]
 ring

theorem second_row_equationMC3E (q : ℕ) (r : Bool)
 (hq : 2 ≤ q) (hn : 2*(q+2)+1 ≤ sourceNME9C q r) :
 (X+1)^2*(rawRowMC3E (threePolyM9E2 q r) (q+2)-lowerRowMFFD (sourceNME9C q r) (q+2))+
 2*(X-1)*(C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r))=
 4*X*gainRowsMC3E q r 1 := by
 have he := source_row_equationMC3E q (q+2) r hn
 rw [row_disc_succMFFD,row_disc_succMFFD,source_row_lowerMC3E q q r le_rfl] at he
 have hf := source_row_firstMC3E q r hq
 simp only [rowShiftMFFD,show q+1 ≤ q+2 by omega,if_true,
   show q+2-(q+1)=1 by omega,pow_one] at he
 linear_combination he-2*(X-1)*hf

end
end MathGKM.Markov
