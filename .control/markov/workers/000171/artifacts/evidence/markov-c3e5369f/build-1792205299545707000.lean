import MarkovSecondRowEquationMC3E
/-! Machine-authored c3e5369f. Complete second correction row identity in
the honest polynomial-exponent ranges. No shape claim and no omitted zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def secondExponentMC3E (q : ℕ) (r : Bool) : ℕ := if r then q-4 else q-3
def secondConstantMC3E (r : Bool) : ℤ := if r then 36 else 24
def secondSlopeMC3E (q : ℕ) (r : Bool) : ℤ := if r then 8*q-8 else 4*q
def secondCorrectionMC3E (q : ℕ) (r : Bool) : Polynomial ℤ :=
 X^2*(X+1)^secondExponentMC3E q r*
   (C (secondConstantMC3E r)+C (secondSlopeMC3E q r)*X)

theorem second_forcing_identityMC3E (q : ℕ) (r : Bool)
 (hq : (if r then 4 else 3) ≤ q) :
 (X+1)^2*secondCorrectionMC3E q r+
 2*(X-1)*(C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r))=
 4*X*gainRowsMC3E q r 1 := by
 have hq3 : 3 ≤ q := by cases r <;> simpa using hq <;> omega
 simp only [gainRowsMC3E,rowSMFFD,rowShiftMFFD,Nat.zero_le,Nat.le_refl,
   if_true,Nat.sub_zero,Nat.sub_self,pow_zero,pow_one,one_mul]
 rw [fib_rows_oneMC3E q hq3,fib_rows_oneMC3E (q+1) (by omega),
   fib_rows_zeroMC3E q (by omega),fib_rows_zeroMC3E (q+1) (by omega)]
 cases r
 · simp only [Bool.false_eq_true,if_false] at hq ⊢
   unfold secondCorrectionMC3E secondExponentMC3E secondConstantMC3E secondSlopeMC3E
     correctionConstantMDB2 correctionExponentMDB2
   simp only [Bool.false_eq_true,if_false,map_mul,map_natCast,map_ofNat]
   rw [show q-1=(q-3)+2 by omega,show q+1-3=(q-3)+1 by omega,
     show q+1-1=(q-3)+3 by omega]
   simp only [pow_add,Nat.cast_add,Nat.cast_one]
   ring
 · simp only [if_true] at hq ⊢
   unfold secondCorrectionMC3E secondExponentMC3E secondConstantMC3E secondSlopeMC3E
     correctionConstantMDB2 correctionExponentMDB2
   simp only [if_true,map_sub,map_mul,map_natCast,map_ofNat]
   rw [show q-2=(q-4)+2 by omega,show q-1=(q-4)+3 by omega,
     show q-3=(q-4)+1 by omega,show q+1-3=(q-4)+2 by omega]
   simp only [pow_add,Nat.cast_add,Nat.cast_one]
   ring

theorem second_row_formulaMC3E (q : ℕ) (r : Bool)
 (hq : (if r then 4 else 3) ≤ q) :
 rawRowMC3E (threePolyM9E2 q r) (q+2)=
 lowerRowMFFD (sourceNME9C q r) (q+2)+secondCorrectionMC3E q r := by
 have hq2 : 2 ≤ q := by cases r <;> simp_all <;> omega
 have hn : 2*(q+2)+1 ≤ sourceNME9C q r := by
   cases r <;> simp_all [sourceNME9C] <;> omega
 have he := second_row_equationMC3E q r hq2 hn
 have hf := second_forcing_identityMC3E q r hq
 have hz : (X+1:Polynomial ℤ)^2≠0 := by
   apply pow_ne_zero
   intro h
   have hh := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
   norm_num at hh
 have hh : (X+1)^2*(rawRowMC3E (threePolyM9E2 q r) (q+2)-
     lowerRowMFFD (sourceNME9C q r) (q+2))=(X+1)^2*secondCorrectionMC3E q r := by
   linear_combination he-hf
 have hc := mul_left_cancel₀ hz hh
 exact sub_eq_iff_eq_add.mp hc |>.trans (add_comm _ _)

theorem second_row_sourceMC3E (q i : ℕ) (r : Bool)
 (hq : (if r then 4 else 3) ≤ q) :
 threeRawM9E2 q r i (q+2)=lowerRawME9C (sourceNME9C q r) i (q+2)+
   (secondCorrectionMC3E q r).coeff i := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,second_row_formulaMC3E q r hq,coeff_add,
   lower_row_formulaMFFD _ (q+2) ?_ i (q+2) le_rfl]
 cases r <;> simp_all [sourceNME9C] <;> omega

theorem second_correction_coeffMC3E (q i : ℕ) (r : Bool) :
 (secondCorrectionMC3E q r).coeff i=
 (if 2 ≤ i then secondConstantMC3E r*((secondExponentMC3E q r).choose (i-2):ℤ) else 0)+
 (if 3 ≤ i then secondSlopeMC3E q r*((secondExponentMC3E q r).choose (i-3):ℤ) else 0) := by
 have he : secondCorrectionMC3E q r=
 C (secondConstantMC3E r)*(X^2*(X+1)^secondExponentMC3E q r)+
 C (secondSlopeMC3E q r)*(X^3*(X+1)^secondExponentMC3E q r) := by
   unfold secondCorrectionMC3E
   ring
 rw [he]
 simp only [coeff_add,coeff_C_mul,coeff_X_pow_mul',coeff_X_add_one_pow]
 split_ifs <;> ring

theorem source_second_pathMC3E (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ((if r then 4 else 3) ≤ q → ∀ i, coeff (frame path).mid.p i (q+2)=
   lowerRawME9C (sourceNME9C q r) i (q+2)+(secondCorrectionMC3E q r).coeff i) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 exact ⟨q,r,hq,hb,fun h i => (hp i (q+2)).trans (second_row_sourceMC3E q i r h)⟩

end
end MathGKM.Markov
