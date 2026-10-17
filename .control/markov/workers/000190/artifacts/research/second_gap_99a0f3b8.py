"""Machine-authored unrestricted second-template-column certificate probe."""
from weighted_beta_symbolic_ca9709f2 import P,var,expr
from fractions import Fraction as F
from math import factorial,lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-99a0f3b8'
def choose(p,n):
 out=P(1)
 for k in range(n):out=out*(p-k)*F(1,k+1)
 return out
def weighted(a,m,k):return choose(a+m+1,k+2)-choose(a+1,k+2)-m*choose(a,k+1)
s,d=var(0),var(1)
A=4*(s+3)*choose(s+d+6,2)
B=choose(2*s+d+10,3)+4*weighted(s+d+8,s+2,3)
C=(s+2)*choose(2*s+d+11,4)+4*(5*weighted(s+d+9,s+2,5)+(-s-d-5)*weighted(s+d+9,s+2,4))
gap=(B*B-A*C).ev([s,d-s,P(),P()]);bad=[(k,str(v)) for k,v in gap.d.items() if v<0]
(O/'second-gap-probe.json').write_text(json.dumps(dict(negative=bad,terms=len(gap.d)),indent=2))
print('negative',bad,'terms',len(gap.d))
if not bad:
 den=lcm(*(v.denominator for v in gap.d.values()));e=expr(gap*den,['x','y','z','w'])
 src=f'''import MarkovTopSecondSourceM55C
/-! Machine-authored 99a0f3b8. Exact second-column certificate for all nonnegative n-2t. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
set_option maxRecDepth 30000
theorem middle_second_gapM99A (x y : ℚ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 topSecondQM55C x (y-x)*topFourthQM55C x (y-x)<topThirdQM55C x (y-x)^2 := by
 have he : {den}*(topThirdQM55C x (y-x)^2-topSecondQM55C x (y-x)*topFourthQM55C x (y-x))={e} := by
   unfold topThirdQM55C topSecondQM55C topFourthQM55C weightedChooseQM55C
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<{e} := by positivity
 linarith only [he,hp]
'''
 old=(R/'research/MarkovTopSecondSourceM55C.lean').read_text()
 p=old[old.index('theorem top_template_second_strictM55C'):old.index('theorem source_top_second_strictM55C')]
 p=p.replace('top_template_second_strictM55C','middle_template_second_strictM99A').replace(' (hnt : 3*t ≤ n+5)','')
 start=p.index(' have hd : 0 ≤ d := by');end=p.index(' have h2 :=',start)
 p=p[:start]+p[end:]
 p=p.replace(' have hg := top_second_gap_positiveM55C s d hs hd',' have hy : 0 ≤ d+s := by\n   have h : (2:ℚ)*t ≤ n := by exact_mod_cast hn\n   dsimp [s,d]; linarith\n have hg := middle_second_gapM99A s (d+s) hs hy\n rw [add_sub_cancel_right] at hg')
 (R/'research/MarkovMiddleSecondM99A.lean').write_text(src+'\nattribute [local irreducible] topTemplateMB3E\n'+p+'\nend\nend MathGKM.Markov\n')
