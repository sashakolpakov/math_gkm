import MarkovAugmentedSourceM7A3
/-! Machine-authored 418bcc64. The exact first-correction tail, without
discarding its initial coefficients or the exceptional q=1 case. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem augmented_tail_valueM418 (d j t : ℕ) (c : ℤ) (ht : d < t+1) :
 augmentedOutputM7A3 d j c (t+1)=liftOutputMAE9 d j t := by
 simp [augmentedOutputM7A3,Nat.choose_eq_zero_of_lt ht]

theorem augmented_tail_lcM418 (d j t : ℕ) (c : ℤ) (ht : d < t+1) :
 augmentedOutputM7A3 d j c (t+1)*augmentedOutputM7A3 d j c (t+3) ≤
   augmentedOutputM7A3 d j c (t+2)^2 := by
 rw [augmented_tail_valueM418 d j t c ht,
   show t+3=(t+2)+1 by omega,augmented_tail_valueM418 d j (t+2) c (by omega),
   show t+2=(t+1)+1 by omega,augmented_tail_valueM418 d j (t+1) c (by omega)]
 exact lift_output_lcM7A3 d j t

theorem source_correction_tailM418 (q t : ℕ) (r : Bool) (hq : 2 ≤ q)
 (ht : correctionExponentMDB2 q r < t+1) :
 threeRawM9E2 q r (t+3) (q+1)*threeRawM9E2 q r (t+5) (q+1) ≤
   threeRawM9E2 q r (t+4) (q+1)^2 := by
 have h := augmented_tail_lcM418 (correctionExponentMDB2 q r) (q+1) t
   (correctionConstantMDB2 r) ht
 rw [←source_correction_outputM7A3 q (t+1) r hq,
   ←source_correction_outputM7A3 q (t+3) r hq,
   ←source_correction_outputM7A3 q (t+2) r hq] at h
 convert h using 1 <;> congr 2 <;> omega

end
end MathGKM.Markov
