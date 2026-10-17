"""Machine-authored shifted correction comparison candidates."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovCorrectionDominationM41B.lean').read_text()
s=s[s.index('def templateTermM41B'):s.index('theorem correction_exponential_boundM41B')]
for n in ['templateTerm','templateMass','template_term_nonneg','template_mass_nonneg','template_mass_le','kernel_same_bound','kernel_shift_bound']:
 s=s.replace(n+'M41B',n+'ME10')
# Keep the already checked dilation lemma instead of redeclaring it.
a=s.index('theorem diluted_chooseM41B');b=s.index('theorem kernel_same_boundME10')
s=s[:a]+s[b:]
s=s.replace('topShortSumMEB6','topShortME10').replace('+8','+4').replace('+9','+5')
# Only same-column kernels need the extra factor two.
a=s.index('theorem kernel_same_boundME10');b=s.index('theorem kernel_shift_boundME10')
t=s[a:b]
t=t.replace('≤ templateMassME10 x T c := by','≤ 2*templateMassME10 x T c := by')
t=t.replace('≤ ∑ l ∈ range (b+1), templateTermME10 x T c l := by','≤ ∑ l ∈ range (b+1), 2*templateTermME10 x T c l := by')
t=t.replace('≤ (x+2*c+4).choose (c+3-l) :=','≤ 2*(x+2*c+4).choose (c+3-l) :=')
t=t.replace('(choose_lower_stepM41B _ _ _ (by omega) (by omega))','(by\n       by_cases hl0 : l=0\n       · subst l\n         exact choose_near_stepME10 _ _ _ (by omega) (by omega) (by omega)\n       · have hh := choose_lower_stepM41B (x+2*c+4) (b-l) (c+3-l) (by omega) (by omega)\n         omega)')
t=t.replace('≤ ((x+2*c+4).choose (c+3-l):ℤ) :=','≤ 2*((x+2*c+4).choose (c+3-l):ℤ) :=')
t=t.replace('_ ≤ _ := mul_le_mul (mul_le_mul_of_nonneg_left hNz (by positivity)) hd (by positivity) (by positivity)',
'''_ ≤ (((c+l).choose c:ℤ)*(2*((x+2*c+4).choose (c+3-l):ℤ)))*
      ((T+1).choose (c+l+2):ℤ) :=
       mul_le_mul (mul_le_mul_of_nonneg_left hNz (by positivity)) hd (by positivity) (by positivity)
    _ = _ := by ring''')
t=t.replace('  _ ≤ _ := sum_le_sum_of_subset_of_nonneg (range_mono (by omega))\n    (fun l _ _ => template_term_nonnegME10 x T c l)',
'''  _ = 2*(∑ l ∈ range (b+1),templateTermME10 x T c l) := by rw [mul_sum]
  _ ≤ _ := mul_le_mul_of_nonneg_left
    (sum_le_sum_of_subset_of_nonneg (range_mono (by omega))
      (fun l _ _ => template_term_nonnegME10 x T c l)) (by norm_num)''')
s=s[:a]+t+s[b:]
(R/'MarkovShiftDominationME10.lean').write_text('import MarkovNearChooseME10\nimport MarkovCentralSourceME10\n/-! Machine-authored e108e0e2. Complete shifted correction domination. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Finset\nset_option maxHeartbeats 8000000\n'+s+'\nend\nend MathGKM.Markov\n')
