"""Machine-authored degree bounds for inherited polynomials; no inherited writes."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm');mods=[]
for i,b in enumerate([12,12,13,14]):
 mod=f'MarkovFullDegree{i}M06';mods.append(mod)
 imp=f'MarkovFullCoeff{i}'+('FinalFA' if i<2 else 'FA')
 ds=[f'fullH{i}FA']
 if i<2:ds += [f'runH{i}n{j}FA' for j in range(5-i)]
 s=f'''import {imp}
/-! Machine-authored 06b5b1f9. Uniform degree bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem fullH{i}_degreeM06 (n c r q t u : ℕ) :
 (fullH{i}FA (n:ℤ[X]) c r q t u X).natDegree≤{b} := by
 unfold {' '.join(ds)}
 compute_degree!
end
end MathGKM.Markov
'''
 (R/f'research/{mod}.lean').write_text(s)
(R/'evidence/markov-06b5b1f9/degree-modules.json').write_text(json.dumps(mods))
