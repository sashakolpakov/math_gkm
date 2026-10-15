"""Machine-authored exact correction bridge extending all six source chambers."""
from pathlib import Path
import re
R=Path('/Users/sasha/math_gkm/research')
head='/-! Machine-authored request 5dc9c88d. Exact source identity with the third reflected block. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 4000000\nset_option maxRecDepth 32768\nattribute [local irreducible] frame coeff penFallingM00\n'
imports=['MarkovBackwardThreeSourceM5DC','MarkovMiddleCanonicalM722']+[f'MarkovMiddleValue{ch}M00' for ch in range(6)]
s=''.join(f'import {m}\n' for m in imports)+head
s+='''
def middleCorrectionM5DC (n c r j : ℕ) : ℤ :=
 5040*(if j≤2*n+5 then convSevenK0B
  (reflect 13 (fullH2FA (n:ℤ[X]) c r (2*r-c:ℕ)
    (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) X)) (2*n+5-j) else 0)

theorem middleCorrection_zeroM5DC (n c r j : ℕ) (hj : 2*n+6≤j) :
 middleCorrectionM5DC n c r j=0 := by
 simp only [middleCorrectionM5DC,if_neg (by omega : ¬j≤2*n+5),mul_zero]

'''
for ch in range(6):
 t=(R/f'MarkovMiddleValue{ch}M00.lean').read_text()
 t=t[t.index('theorem source_fourth_middle_value'):t.rindex('\nend\n')]
 t=t.replace(f'source_fourth_middle_value{ch}M00',f'source_fourth_middle_corrected_value{ch}M5DC').replace('(hj : 2*n+6≤j)','(hj : n+5≤j)').replace('source_fourth_backward_twoM1B','source_fourth_backward_threeM5DC')
 t=t.replace(f'middleValue{ch}M00 n (frame rest).mid.b (frame rest).mid.a j := by',f'middleValue{ch}M00 n (frame rest).mid.b (frame rest).mid.a j+\n middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by')
 t=t.replace(f'unfold middleValue{ch}M00',f'unfold middleValue{ch}M00 middleCorrectionM5DC')
 s+=t+'\n'
t=(R/'MarkovMiddleCanonicalM722.lean').read_text();t=t[t.index('theorem source_fourth_middle_canonical'):t.rindex('\nend\n')]
t=t.replace('source_fourth_middle_canonicalM722','source_fourth_middle_correctedM5DC').replace('(hj : 2*n+6≤j)','(hj : n+5≤j)')
for ch in range(6):t=t.replace(f'source_fourth_middle_value{ch}M00',f'source_fourth_middle_corrected_value{ch}M5DC')
t=t.replace('middleRawValueM722 n (frame rest).mid.b (frame rest).mid.a j := by','middleRawValueM722 n (frame rest).mid.b (frame rest).mid.a j+\n middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by')
s+=t+'\nend\nend MathGKM.Markov\n'
p=R/'MarkovMiddleCorrectedM5DC.lean';assert not p.exists();p.write_text(s)
s=(R/'MarkovMiddleOneM722.lean').read_text().replace('middleRawValue_one_lcM722','middleRawValue_one_lcM5DC').replace('source_fourth_middle_oneM722','source_fourth_middle_oneM5DC')
p=R/'MarkovMiddleOneM5DC.lean';assert not p.exists();p.write_text(s)
