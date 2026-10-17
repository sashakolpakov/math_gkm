"""Machine-authored shifted final-triple certificates; ordinary Lean checks every identity."""
from pathlib import Path
import re
from weak_margin_probe_6738b4ea import C,X,add,scale,mul,expr
R=Path('/Users/sasha/math_gkm/research')
def rename(s):
 s=s.replace('MEB6','ME10').replace('topMassM55C','topMassME10').replace('topKernelM55C','topKernelME10').replace('topEigenM55C','topEigenME10').replace('top_kernel_stepM55C','top_kernel_stepME10')
 return re.sub(r'\+(6|7|8|9|10|11|12)\b',lambda m:'+'+str(int(m[1])-4),s)
s=(R/'MarkovTopTailKernelMEB6.lean').read_text();s=s[s.index('namespace MathGKM.Markov'):]
(R/'MarkovShiftTailKernelME10.lean').write_text('import MarkovShiftMomentsME10\n/-! Machine-authored e108e0e2. Shifted tail identities. -/\n'+rename(s))
i=X(0);d=X(1)
Den=scale(mul(add(d,i,C(2)),add(d,i,C(3))),2)
One=scale(mul(add(i,C(1)),add(d,scale(i,2),C(5)),add(d,i,C(3))),2)
Two=mul(add(i,C(1)),add(i,C(2)),add(d,scale(i,2),C(5)),add(d,scale(i,2),C(6)))
A=add(scale(Den,8),scale(One,4),Two)
E=add(scale(mul(add(d,scale(i,2),C(6)),One),4),scale(mul(add(d,scale(i,2),C(7)),Two),2))
F=scale(mul(add(d,scale(i,2),C(7)),add(d,scale(i,2),C(8)),Two),2)
P=add(mul(add(i,C(2)),add(i,C(5)),E,E),scale(mul(add(i,C(1)),add(i,C(4)),A,F),-1))
assert all(v>0 for v in P.values())
defs=(R/'MarkovTopTailScalarMEB6.lean').read_text();defs=defs[defs.index('def tailDen'):defs.index('theorem top_tail_scalar')]
ex=expr(P).replace('x','i').replace('y','d')
out='import MarkovShiftTailKernelME10\n/-! Machine-authored e108e0e2. Shifted positive final-triple scalar. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 15000000\n'+rename(defs)
out+='''theorem top_tail_scalar_positiveME10 (i d : ℤ) (hi : 0 ≤ i) (hd : 0 ≤ d) :
 (i+1)*(i+4)*tailAMME10 i d*tailCMME10 i d < (i+2)*(i+5)*tailEMME10 i d^2 := by
 have he : (i+2)*(i+5)*tailEMME10 i d^2-(i+1)*(i+4)*tailAMME10 i d*tailCMME10 i d=EXPR := by
   unfold tailAMME10 tailCMME10 tailEMME10 tailDenME10 tailOneME10 tailTwoME10
   ring
 have hp : (0:ℤ) < EXPR := by positivity
 linarith
end
end MathGKM.Markov
'''.replace('EXPR',ex)
(R/'MarkovShiftTailScalarME10.lean').write_text(out)
s=(R/'MarkovTopTailClosedMEB6.lean').read_text();s=s[s.index('namespace MathGKM.Markov'):]
(R/'MarkovShiftTailClosedME10.lean').write_text('import MarkovShiftTailScalarME10\n/-! Machine-authored e108e0e2. Shifted final-triple inequality. -/\n'+rename(s))
print({'positive_scalar_terms':len(P),'minimum':min(P.values())})
