import MarkovLowerClosedM7A3
import MarkovCorrectionFactorMDB2
/-! Machine-authored 7a344181. Exact weighted-output representation of the
first correction row. Its log-concavity remains an explicit premise, and q=1
is excluded rather than assigned a truncated negative exponent. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def augmentedOutputM7A3 (d j : ℕ) (c : ℤ) : ℕ → ℤ
 | 0 => c
 | t+1 => liftOutputMAE9 d j t + c*(d.choose (t+1):ℤ)

theorem source_correction_outputM7A3 (q t : ℕ) (r : Bool) (hq : 2 ≤ q) :
 threeRawM9E2 q r (t+2) (q+1) =
 augmentedOutputM7A3 (correctionExponentMDB2 q r) (q+1) (correctionConstantMDB2 r) t := by
 have hn : 2*(q+1)+1 ≤ sourceNME9C q r := by
   cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_true,if_false] <;> omega
 rw [first_row_sourceM1BB q (t+2) r (by omega),
   ←lower_row_formulaMFFD (sourceNME9C q r) (q+1) hn (t+2) (q+1) (le_refl _)]
 cases t with
 | zero =>
   simp only [Nat.zero_add,lowerRowMFFD,coeff_X_pow_mul',show ¬3 ≤ 2 by omega,
     if_false,zero_add,augmentedOutputM7A3]
   cases r <;> simp [firstCorrectionM1BB,correctionConstantMDB2,show q≠1 by omega]
 | succ t =>
   have he : 2*(q+1)+1+correctionExponentMDB2 q r=sourceNME9C q r := by
     cases r <;> simp only [sourceNME9C,correctionExponentMDB2,
       Bool.false_eq_true,if_true,if_false] <;> omega
   have hl := lower_row_liftMAE9 (correctionExponentMDB2 q r) (q+1) t
   rw [he] at hl
   rw [show t+1+2=t+3 by omega,hl]
   change liftOutputMAE9 _ _ t + firstCorrectionM1BB q r (t+3) =
     liftOutputMAE9 _ _ t + correctionConstantMDB2 r *
       ((correctionExponentMDB2 q r).choose (t+1):ℤ)
   congr 1
   cases r <;> simp [firstCorrectionM1BB,correctionConstantMDB2,
     correctionExponentMDB2,show q≠1 by omega,show 2 ≤ t+3 by omega,
     show t+3-2=t+1 by omega]

theorem source_correction_output_lc_iffM7A3 (q : ℕ) (r : Bool) (hq : 2 ≤ q) :
 (∀ t : ℕ, threeRawM9E2 q r (t+2) (q+1)*threeRawM9E2 q r (t+4) (q+1) ≤
     threeRawM9E2 q r (t+3) (q+1)^2) ↔
 (∀ t : ℕ,
   augmentedOutputM7A3 (correctionExponentMDB2 q r) (q+1) (correctionConstantMDB2 r) t *
   augmentedOutputM7A3 (correctionExponentMDB2 q r) (q+1) (correctionConstantMDB2 r) (t+2) ≤
   augmentedOutputM7A3 (correctionExponentMDB2 q r) (q+1) (correctionConstantMDB2 r) (t+1)^2) := by
 have h1 (t : ℕ) := source_correction_outputM7A3 q (t+1) r hq
 have h2 (t : ℕ) := source_correction_outputM7A3 q (t+2) r hq
 simp only [show ∀ t : ℕ, t+1+2=t+3 by omega] at h1
 simp only [show ∀ t : ℕ, t+2+2=t+4 by omega] at h2
 simp only [source_correction_outputM7A3 q _ r hq,h1,h2]

theorem correction_output_witnessM7A3 :
 augmentedOutputM7A3 1 3 4 1=108 ∧ augmentedOutputM7A3 1 3 4 2=412 ∧
 augmentedOutputM7A3 1 3 4 3=636 := by
 unfold augmentedOutputM7A3 liftOutputMAE9 liftTermMAE9
 decide +kernel

end
end MathGKM.Markov
