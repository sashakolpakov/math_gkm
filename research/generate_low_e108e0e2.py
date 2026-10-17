"""Machine-authored exact univariate certificate candidates for central low columns."""
from pathlib import Path
from fractions import Fraction as F
from math import lcm
import json
R=Path('research'); rows=json.loads(Path('evidence/markov-e108e0e2/central-low-probe.json').read_text())['cases']
for c in range(10):
 src='import MarkovCentralRationalME10\n/-! Machine-authored e108e0e2. Total raw gap certificate; all correction terms retained. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Finset\nset_option maxHeartbeats 50000000\nset_option maxRecDepth 100000\nset_option linter.unusedSimpArgs false\n'
 for row in [z for z in rows if z['c']==c]:
  h=row['h'];r=str(row['r']).lower();k0=row['k0'];poly=list(map(F,row['coefficients']));den=lcm(*(v.denominator for v in poly));nums=[int(v*den) for v in poly]
  horner=str(nums[-1])
  for n in nums[-2::-1]:horner=f'(({horner})*z+{n})'
  name=f'central_cert_{c}_{h}_{r}ME10'
  src+=f'''\ntheorem {name} (z : ℚ) (hz : 0 ≤ z) :
 centralQValueME10 {h} (z+{k0}) {c} {r}*centralQValueME10 {h} (z+{k0}) {c+2} {r} ≤
 centralQValueME10 {h} (z+{k0}) {c+1} {r}^2 := by
 have he : {den}*(centralQValueME10 {h} (z+{k0}) {c+1} {r}^2-
   centralQValueME10 {h} (z+{k0}) {c} {r}*centralQValueME10 {h} (z+{k0}) {c+2} {r})={horner} := by
   unfold centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ {horner} := by positivity
 linarith only [he,hp]
'''
 src+=f'''\ntheorem central_low_{c}ME10 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralRawME10 h k {c} r*centralRawME10 h k {c+2} r ≤ centralRawME10 h k {c+1} r^2 := by
 by_cases ht : centralTME10 h k r < {c+2}
 · rw [central_raw_zeroME10 h k {c+2} r ht,mul_zero]
   exact sq_nonneg _
 have ht' : {c+2} ≤ 3*k+h+(if r then 1 else 0) := by simpa [centralTME10] using (Nat.le_of_not_gt ht)
 interval_cases h <;> cases r
'''
 for h in range(4):
  for r in ['false','true']:
   row=next(z for z in rows if z['c']==c and z['h']==h and str(z['r']).lower()==r);k0=row['k0']
   src+=f''' · have hk0 : {k0} ≤ k := by simp only [Bool.false_eq_true,if_false,if_true] at ht'; omega
   have he := central_cert_{c}_{h}_{r}ME10 ((k:ℚ)-{k0}) (by
     have hkQ : ({k0}:ℚ) ≤ (k:ℚ) := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   have hval : (k:ℚ)-{k0}+{k0}=k := by ring
   rw [hval,←central_raw_castME10 {h} k {c} {r},←central_raw_castME10 {h} k {c+2} {r},←central_raw_castME10 {h} k {c+1} {r}] at he
   exact_mod_cast he
'''
 src+='\nend\nend MathGKM.Markov\n'
 (R/f'MarkovCentralLow{c}ME10.lean').write_text(src)
print({'generated':10,'status':'Unaccepted certificate drafts until matching builds and validation.'})
