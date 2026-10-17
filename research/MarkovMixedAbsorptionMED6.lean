import MarkovCorrectionDiagonalMED6
/-! Machine-authored ed6bdbeb. Sufficient signed-gap conditions.
The absorption hypotheses below are explicit unproved inputs, not axioms. -/
namespace MathGKM.Markov
noncomputable section

def signedAbsorptionMED6 (d0 d1 d2 e0 e1 e2 : ℝ) : Prop :=
 d0*d2+d0*e2+d2*e0 ≤ d1^2+2*d1*e1

theorem sum_lc_of_absorptionMED6 (d0 d1 d2 e0 e1 e2 : ℝ)
 (h : signedAbsorptionMED6 d0 d1 d2 e0 e1 e2) (he : e0*e2 ≤ e1^2) :
 (d0+e0)*(d2+e2) ≤ (d1+e1)^2 := by
 unfold signedAbsorptionMED6 at h
 nlinarith only [h,he]

theorem source_vertical_of_absorptionMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i)
 (h : signedAbsorptionMED6
   (baseValueM13E q r i j) (baseValueM13E q r i (j+1)) (baseValueM13E q r i (j+2))
   (correctionValueM13E q r i j) (correctionValueM13E q r i (j+1)) (correctionValueM13E q r i (j+2))) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 have hh := sum_lc_of_absorptionMED6 _ _ _ _ _ _ h (correction_verticalM13E q i j r)
 rw [←source_two_kernelMED6 q i j r hq hi,←source_two_kernelMED6 q i (j+1) r hq hi,
   ←source_two_kernelMED6 q i (j+2) r hq hi] at hh
 exact_mod_cast hh

theorem source_diagonal_of_absorptionMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i)
 (h : signedAbsorptionMED6
   (baseValueM13E q r i (j+2)) (baseValueM13E q r (i+1) (j+1)) (baseValueM13E q r (i+2) j)
   (correctionValueM13E q r i (j+2)) (correctionValueM13E q r (i+1) (j+1)) (correctionValueM13E q r (i+2) j)) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) (j+1)^2 := by
 have hh := sum_lc_of_absorptionMED6 _ _ _ _ _ _ h (correction_diagonalMED6 q i j r hi)
 rw [←source_two_kernelMED6 q i (j+2) r hq hi,
   ←source_two_kernelMED6 q (i+1) (j+1) r hq (by omega),
   ←source_two_kernelMED6 q (i+2) j r hq (by omega)] at hh
 exact_mod_cast hh

end
end MathGKM.Markov
