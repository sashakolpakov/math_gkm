import MarkovFirstCorrectionPolynomialMAE9
import MarkovRowTransferMFFD
/-! Machine-authored db238071. First correction row as one binomial factor
times one augmented residual. This is an identity, not a shape assertion.
The q=1 exception is retained by the explicit q>=2 hypothesis. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def correctionExponentMDB2 (q : ℕ) (r : Bool) : ℕ := if r then q-2 else q-1
def correctionConstantMDB2 (r : Bool) : ℤ := if r then 8 else 4
def correctionResidualMDB2 (q : ℕ) (r : Bool) : Polynomial ℤ :=
 C (correctionConstantMDB2 r) + X*rowHMFFD (sourceNME9C q r) (q+1)
def correctionRowMDB2 (q : ℕ) (r : Bool) : Polynomial ℤ :=
 X^2*((X+1)^correctionExponentMDB2 q r*correctionResidualMDB2 q r)

theorem correction_exponentMDB2 (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 sourceNME9C q r - 2*(q+1)-1=correctionExponentMDB2 q r := by
 cases r <;> simp only [sourceNME9C,correctionExponentMDB2,Bool.false_eq_true,if_true,if_false] <;> omega

theorem correction_binomial_coeffMDB2 (q i : ℕ) (r : Bool) (hq : 2 ≤ q) :
 (C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r)).coeff i =
 firstCorrectionM1BB q r i := by
 rw [coeff_C_mul,coeff_X_pow_mul']
 by_cases hi : 2 ≤ i
 · rw [if_pos hi,coeff_X_add_one_pow]
   cases r <;> simp [firstCorrectionM1BB,hi,correctionConstantMDB2,
     correctionExponentMDB2,show q≠1 by omega]
 · simp [hi,firstCorrectionM1BB]

theorem correction_row_splitMDB2 (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 correctionRowMDB2 q r=lowerRowMFFD (sourceNME9C q r) (q+1)+
 C (correctionConstantMDB2 r)*(X^2*(X+1)^correctionExponentMDB2 q r) := by
 unfold correctionRowMDB2 correctionResidualMDB2 lowerRowMFFD
 rw [correction_exponentMDB2 q r hq]
 ring

theorem source_correction_factorMDB2 (q i : ℕ) (r : Bool) (hq : 2 ≤ q) :
 threeRawM9E2 q r i (q+1)=(correctionRowMDB2 q r).coeff i := by
 rw [correction_row_splitMDB2 q r hq,coeff_add,
   correction_binomial_coeffMDB2 q i r hq,
   lower_row_formulaMFFD (sourceNME9C q r) (q+1) ?_ i (q+1) (le_refl _)]
 · exact first_row_sourceM1BB q i r (by omega)
 · cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_true,if_false] <;> omega

theorem correction_row_crossMDB2 (q : ℕ) (r : Bool)
 (h : CrossLC (CoeffSeq ((correctionResidualMDB2 q r).map (Int.castRingHom ℝ)))) :
 CrossLC (CoeffSeq ((correctionRowMDB2 q r).map (Int.castRingHom ℝ))) := by
 have hp := crossLC_pascal h (correctionExponentMDB2 q r)
 rw [← coeffSeq_binomial_mul] at hp
 have hh := crossLC_X_pow_mul46 _ hp 2
 simpa only [correctionRowMDB2,Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,add_comm (1:ℝ[X]) X] using hh

theorem source_correction_lc_of_residualMDB2 (q i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (h : CrossLC (CoeffSeq ((correctionResidualMDB2 q r).map (Int.castRingHom ℝ)))) :
 threeRawM9E2 q r i (q+1)*threeRawM9E2 q r (i+2) (q+1) ≤
   threeRawM9E2 q r (i+1) (q+1)^2 := by
 have hh := crossLC_adjacent (correction_row_crossMDB2 q r h) (i+1)
 simp only [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
   show ¬(i:ℤ)+1+1<0 by omega,add_sub_cancel_right,if_false,
   Int.toNat_natCast,Polynomial.coeff_map] at hh
 have h1 : ((i:ℤ)+1).toNat=i+1 := by omega
 have h2 : ((i:ℤ)+1+1).toNat=i+2 := by omega
 rw [h1,h2] at hh
 simp only [←source_correction_factorMDB2 q _ r hq,Int.coe_castRingHom] at hh
 exact_mod_cast hh

end
end MathGKM.Markov
