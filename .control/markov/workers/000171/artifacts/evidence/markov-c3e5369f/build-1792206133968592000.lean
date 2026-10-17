import MarkovSecondRowFormulaMC3E
import MarkovFibSecondRowMC3E
/-! Machine-authored c3e5369f. Exact third correction row; its log-concavity
is not asserted. Exponent restrictions are explicit, with no truncation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def thirdExponentMC3E (q : ℕ) (r : Bool) : ℕ := if r then q-6 else q-5
def thirdConstantMC3E (r : Bool) : ℤ := if r then 96 else 72
def thirdLinearMC3E (q : ℕ) (r : Bool) : ℤ := if r then 44*q-108 else 28*q-44
def thirdQuadraticMC3E (q : ℕ) (r : Bool) : ℤ :=
 if r then 4*(q.choose 2:ℤ)+4*((q+1).choose 2:ℤ)-12*q+8
 else 4*((q+1).choose 2:ℤ)-4*q
def thirdCorrectionMC3E (q : ℕ) (r : Bool) : Polynomial ℤ :=
 X^2*(X+1)^thirdExponentMC3E q r*
 (C (thirdConstantMC3E r)+C (thirdLinearMC3E q r)*X+C (thirdQuadraticMC3E q r)*X^2)

theorem third_quadratic_valueMC3E (q : ℕ) (r : Bool) :
 thirdQuadraticMC3E q r=if r then 4*((q:ℤ)-1)*((q:ℤ)-2) else 2*q*((q:ℤ)-1) := by
 have he : (thirdQuadraticMC3E q r:ℚ)=
     if r then 4*((q:ℚ)-1)*((q:ℚ)-2) else 2*q*((q:ℚ)-1) := by
   cases r <;> simp only [thirdQuadraticMC3E,Bool.false_eq_true,if_false,if_true]
     <;> push_cast
     <;> rw [choose_poly_natM0D3,binomial_poly_2M295]
   · push_cast; ring
   · rw [choose_poly_natM0D3,binomial_poly_2M295]; push_cast; ring
 exact_mod_cast he

theorem third_forcing_identityMC3E (q : ℕ) (r : Bool)
 (hq : (if r then 6 else 5) ≤ q) :
 (X+1)^2*thirdCorrectionMC3E q r+2*(X-1)*secondCorrectionMC3E q r+
 C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r)=
 4*X*gainRowsMC3E q r 2 := by
 have hq5 : 5 ≤ q := by cases r <;> simp_all <;> omega
 simp only [gainRowsMC3E,rowSMFFD,rowShiftMFFD,Nat.zero_le,
   show 1 ≤ (2:ℕ) by omega,if_true,Nat.sub_zero,Nat.reduceSub,pow_zero,pow_one,one_mul]
 rw [fib_rows_oneMC3E q (by omega),fib_rows_oneMC3E (q+1) (by omega),
   fib_rows_two_generalMC3E q hq5,fib_rows_two_generalMC3E (q+1) (by omega)]
 cases r
 · simp only [Bool.false_eq_true,if_false] at hq ⊢
   unfold thirdCorrectionMC3E thirdExponentMC3E thirdConstantMC3E thirdLinearMC3E thirdQuadraticMC3E
     secondCorrectionMC3E secondExponentMC3E secondConstantMC3E secondSlopeMC3E
     correctionConstantMDB2 correctionExponentMDB2
   simp only [Bool.false_eq_true,if_false,map_add,map_sub,map_mul,map_natCast,map_ofNat]
   rw [show q-3=(q-5)+2 by omega,show q-1=(q-5)+4 by omega,
     show q+1-5=(q-5)+1 by omega,show q+1-3=(q-5)+3 by omega,
     show q+1-1=q by omega]
   simp only [pow_add,Nat.cast_add,Nat.cast_one]
   ring
 · simp only [if_true] at hq ⊢
   unfold thirdCorrectionMC3E thirdExponentMC3E thirdConstantMC3E thirdLinearMC3E thirdQuadraticMC3E
     secondCorrectionMC3E secondExponentMC3E secondConstantMC3E secondSlopeMC3E
     correctionConstantMDB2 correctionExponentMDB2
   simp only [if_true,map_add,map_sub,map_mul,map_natCast,map_ofNat]
   rw [show q-4=(q-6)+2 by omega,show q-2=(q-6)+4 by omega,
     show q-3=(q-6)+3 by omega,show q-5=(q-6)+1 by omega,
     show q+1-5=(q-6)+2 by omega]
   simp only [pow_add,Nat.cast_add,Nat.cast_one,Nat.cast_sub (by omega : 1 ≤ q),Nat.cast_one]
   ring

theorem third_row_formulaMC3E (q : ℕ) (r : Bool)
 (hq : (if r then 6 else 5) ≤ q) :
 rawRowMC3E (threePolyM9E2 q r) (q+3)=
 lowerRowMFFD (sourceNME9C q r) (q+3)+thirdCorrectionMC3E q r := by
 have hq2 : 2 ≤ q := by cases r <;> simp_all <;> omega
 have hq' : (if r then 4 else 3) ≤ q := by cases r <;> simp_all <;> omega
 have hn : 2*(q+3)+1 ≤ sourceNME9C q r := by cases r <;> simp_all [sourceNME9C] <;> omega
 have he := source_row_equationMC3E q (q+3) r hn
 rw [show q+3=(q+1)+2 by omega,row_disc_succMFFD,row_disc_succMFFD,
   show q+1+1=q+2 by omega,show q+1+2=q+3 by omega] at he
 have h1 := source_row_firstMC3E q r hq2
 have h2 := second_row_formulaMC3E q r hq'
 have h3 := third_forcing_identityMC3E q r hq
 simp only [rowShiftMFFD,show q+1 ≤ q+3 by omega,if_true,
   show q+3-(q+1)=2 by omega,pow_one] at he
 have hz : (X+1:Polynomial ℤ)^2≠0 := by
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
   norm_num at hh
 apply mul_left_cancel₀ hz
 linear_combination he-2*(X-1)*h2-h1-h3

theorem third_row_sourceMC3E (q i : ℕ) (r : Bool)
 (hq : (if r then 6 else 5) ≤ q) :
 threeRawM9E2 q r i (q+3)=lowerRawME9C (sourceNME9C q r) i (q+3)+
 (thirdCorrectionMC3E q r).coeff i := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,third_row_formulaMC3E q r hq,coeff_add,
   lower_row_formulaMFFD _ (q+3) ?_ i (q+3) le_rfl]
 cases r <;> simp_all [sourceNME9C] <;> omega

end
end MathGKM.Markov
