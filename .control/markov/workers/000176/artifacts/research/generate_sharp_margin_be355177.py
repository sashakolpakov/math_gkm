"""Machine-authored be355177. Reuse audited transport with an explicit new premise."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
prefix='''import MarkovTransposedSharpMBE3
/-! Machine-authored be355177. The exact coefficient-zero relative margin is
an explicit unproved candidate. Its transport to every lower tail cut is proved. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def SharpCompleteMarginMBE3 : Prop := ∀ j s n : ℕ,
 (liftTermMAE9 j (s+1) 0:ℝ)^2*
   (completeLiftMA64 j s*completeLiftMA64 j (s+2)).coeff n ≤
 (liftTermMAE9 j s 0:ℝ)*(liftTermMAE9 j (s+2) 0:ℝ)*
   (completeLiftMA64 j (s+1)^2).coeff n

def sharpGapMBE3 (j s : ℕ) : ℝ := (liftTermMAE9 j (s+1) 0:ℝ)^2-
 (liftTermMAE9 j s 0:ℝ)*(liftTermMAE9 j (s+2) 0:ℝ)

theorem sharp_complete_marginMBE3 (H : SharpCompleteMarginMBE3) (j s n : ℕ) :
 sharpGapMBE3 j s*(completeLiftMA64 j (s+1)^2).coeff n ≤
 kernelScaleMA64 j s*(completeLiftMA64 j (s+1)^2-
   completeLiftMA64 j s*completeLiftMA64 j (s+2)).coeff n := by
 have h := H j s n
 rw [kernelScaleMA64,complete_coeffMA64,sharpGapMBE3,coeff_sub]
 nlinarith only [h]

'''
s=(R/'MarkovLiftMarginMA64.lean').read_text()
s=s[s.index('theorem reversed_relative_marginMA64'):s.index('theorem lift_border_lowerMA64')]
s=s.replace('topGapMA64','sharpGapMBE3')
for old,new in [('reversed_relative_marginMA64','sharp_reversed_marginMBE3'),('shifted_relative_marginMA64','sharp_shifted_marginMBE3'),('lift_cut_marginMA64','sharp_cut_marginMBE3')]:
 s=s.replace(old,new)
 s=s.replace('theorem '+new+' (j','theorem '+new+' (H : SharpCompleteMarginMBE3) (j')
s=s.replace('complete_relative_marginMA64 j t _','sharp_complete_marginMBE3 H j t _')
s=s.replace('exact sharp_reversed_marginMBE3 j','exact sharp_reversed_marginMBE3 H j')
s=s.replace('exact sharp_shifted_marginMBE3 j','exact sharp_shifted_marginMBE3 H j')
s=s.replace('theorem sharp_cut_marginMBE3 (H :','theorem sharp_cut_marginMBE3 (HM :')
s=s.replace('exact sharp_shifted_marginMBE3 H j t','exact sharp_shifted_marginMBE3 HM j t')
(R/'MarkovSharpMarginMBE3.lean').write_text(prefix+s+'\nend\nend MathGKM.Markov\n')
