import MarkovInteriorSourceFDDA
import MarkovExtractAllFDDA
/-! Machine-authored fddabb33. Exact coefficient extraction on the entire
third lower slice, including both exceptional cycle corrections. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 16384

def thirdNumeratorFDDA (n c r : ℕ) : ℤ[X] :=
 lowNumeratorPolyFDDA n c r+X^(n+2)*delayedRFDDA n c r

def correctedNumeratorFDDA (n c r : ℕ) : ℤ[X] :=
 thirdNumeratorFDDA n c r+(1-X)^6*
 (if c=2 then -12*X^(c*(n+1)+r)*(firstRunPolyADB2 n c r+1+X)
 else if c=3 then 6*X^(c*(n+1)+r) else 0)

theorem corrected_denominatorFDDA (n c r : ℕ) :
 (1-X)^6*correctedThirdRun8BBB n c r=correctedNumeratorFDDA n c r := by
 unfold correctedThirdRun8BBB correctedNumeratorFDDA thirdNumeratorFDDA
 rw [mul_add,source_denominatorFDDA]

theorem source_third_all_coeffFDDA (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+3) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ p ∈ Finset.HasAntidiagonal.antidiagonal j,
 (correctedNumeratorFDDA n (frame rest).mid.b (frame rest).mid.a).coeff p.1*
 ((p.2+5).choose 5 : ℤ) := by
 rw [←source_third_all_cycles_raw8BBB n rest i j hij]
 exact extract_allFDDA _ _ (corrected_denominatorFDDA n _ _) j

#print axioms corrected_denominatorFDDA
#print axioms source_third_all_coeffFDDA
end
end MathGKM.Markov
