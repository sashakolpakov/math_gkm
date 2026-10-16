"""Machine-authored generation of a bounded Lean positivity attempt.
GAP supplies only candidate factors; Lean ring arithmetic checks the theorem.
"""
from pathlib import Path
import ast,json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fee405c8'
fs=ast.literal_eval((O/'pair-factors-extrep.txt').read_text().replace('\\\n',''))
names={1:'x',2:'g',3:'z',4:'T'}
def render(e):
 terms=[]
 for idx in range(0,len(e),2):
  mon,c=e[idx:idx+2];f=[str(c)]
  for a in range(0,len(mon),2):
   n,p=mon[a:a+2];f.append(names[n] if p==1 else names[n]+'^'+str(p))
  terms.append('*'.join(f))
 return '('+'+'.join(terms)+')'
terms=['*'.join(render(p) for p in a) for a in fs]
src='import MathGKM.Markov\n/-! Machine-authored fee405c8. Cleared normalized-pair algebra only.\nThe kernel ratio and centered-tail bridges remain separate obligations. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 24000000\nset_option maxRecDepth 65536\nset_option linter.unusedVariables false\n'
src+='def pairClearedMFEE (T x g z : ℚ) : ℚ :=\n ('+terms[0]+')+\n ('+terms[1]+')-\n ('+terms[2]+')-\n ('+terms[3]+')\n'
src+='theorem pair_cleared_nonnegMFEE (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :\n 0 ≤ pairClearedMFEE T x g z := by\n unfold pairClearedMFEE\n ring_nf\n positivity\nend\nend MathGKM.Markov\n'
(R/'research/MarkovPairClearedMFEE.lean').write_text(src)
print(json.dumps({'source_bytes':len(src),'factor_counts':[len(a) for a in fs]}))
