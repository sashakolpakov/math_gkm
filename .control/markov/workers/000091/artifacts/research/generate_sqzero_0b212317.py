"""Machine-authored square-zero truncation candidate."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm')
gauges=json.loads((R/'evidence/markov-bc8d3b6f/gauge-normalization-candidates.json').read_text())
defs=[f'gauge{r["e"]}{r["k"]}BC' for r in gauges[:11]]+[r['name'] for r in gauges]
text='''import MarkovFourthTruncateK0B
/-! Machine-authored request 0b212317. Lowest x-terms are independent of Z. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

theorem fourthNumerator_sqzeroK0B {A : Type*} [CommRing A]
 (N Z x : A) (c r : ℕ) (hx : x^2=0) :
 fourthNumeratorBC N Z x c r=fourthNumeratorBC N 0 x c r := by
'''
for i in range(3,15):text+=f' have hx{i} : x^{i}=0 := by rw [show {i}=2+{i-2} by omega,pow_add,hx,zero_mul]\n'
text+=' unfold fourthNumeratorBC fourMomentBE fourSourceMoment897\n dsimp only\n split_ifs\n all_goals\n  simp only ['+','.join(['firstNumBC','secondNumBC','boolMomentADB2','boolJetADB2','fourTripleBE','fourQuadBE','fourCanonicalBE','fourPotentialBE','localThirdNumBC','localFourNumBC']+defs+['hx']+[f'hx{i}' for i in range(3,15)]+['zero_pow','mul_zero','zero_mul','add_zero','zero_add','sub_zero'])+']\n  ring_nf\n  simp only [hx,mul_zero,add_zero]\nend\nend MathGKM.Markov\n'
(R/'research/MarkovFourthSqZeroK0B.lean').write_text(text)
