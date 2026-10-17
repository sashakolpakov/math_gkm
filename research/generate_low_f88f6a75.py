"""Machine-authored exact certificate generation. Kernel checks remain required."""
from pathlib import Path
import json
rows=json.loads(Path('evidence/markov-e108e0e2/central-low-probe.json').read_text())['cases']
for c in range(1,10):
 s='''import MarkovCentralExprMF88
/-! Machine-authored f88f6a75. Unbounded central-depth inequality.
The computational signs are checked by ordinary kernel reduction. -/
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000
set_option compiler.extract_closed false
'''
 for row in [v for v in rows if v['c']==c]:
  h=row['h'];K=row['k0'];r=str(row['r']).lower()
  s+=f'\ntheorem central_cert_{c}_{h}_{r}MF88 : oneNonnegM9DB (centralGapExprMF88 {h} {K} {c} {r}) := by decide +kernel\n'
 s+=f'''
theorem central_low_{c}MF88 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralRawME10 h k {c} r*centralRawME10 h k {c+2} r ≤ centralRawME10 h k {c+1} r^2 := by
 by_cases ht : centralTME10 h k r < {c+2}
 · rw [central_raw_zeroME10 h k {c+2} r ht,mul_zero]
   exact sq_nonneg _
 have ht' : {c+2} ≤ 3*k+h+(if r then 1 else 0) := by simpa [centralTME10] using (Nat.le_of_not_gt ht)
 interval_cases h <;> cases r
'''
 for h in range(4):
  for r in ['false','true']:
   row=next(v for v in rows if v['c']==c and v['h']==h and str(v['r']).lower()==r);K=row['k0']
   s+=f''' · apply central_certificate_transferMF88 {h} {K} {c} k {r} central_cert_{c}_{h}_{r}MF88
   simp only [Bool.false_eq_true,if_false,if_true] at ht'
   omega
'''
 s+='\nend MathGKM.Markov\n'
 Path(f'research/MarkovCentralLow{c}MF88.lean').write_text(s)
Path('research/MarkovCentralProbeMF88.lean').write_text('''import MarkovCentralExprMF88
namespace MathGKM.Markov
set_option maxHeartbeats 400000000
set_option maxRecDepth 1000000
set_option compiler.extract_closed false
theorem central_probeMF88 : oneNonnegM9DB (centralGapExprMF88 0 4 9 false) := by decide +kernel
end MathGKM.Markov
''')
print('Generated nine certificate modules and one largest-column test; unaccepted until checked.')
