"""Machine-authored split of the timed-out r=1 proof; old attempt retained in receipts."""
from pathlib import Path
import json
from uniform_shape_8bbb import Q,var,subst,horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-07f1d410'
p=Q({tuple(k):v for k,v in json.loads((O/'second-band-probe.json').read_text())['second_terms']})
t,s,u,v=map(var,range(4));parts={}
for w,d in [('L',8),('C',9),('R',10)]:
 a=subst(p,[t+s+4,v+3,Q({(0,0,0,0):1}),2*t+s+d])
 for k in range(4):parts[w,k]=Q({(aa,b,c,0):z for (aa,b,c,e),z in a.items() if e==k})
src='''import MarkovSecondShape07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
'''
for (w,k),a in parts.items():src+=f'def one{w}{k}07F1 (t s : ℤ) : ℤ := '+horner(a,['t','s','u','v'])+'\n'
def pp(w,k):return f'one{w}{k}07F1 t s'
def summ(w):return '+'.join(f'({pp(w,k)})*v^{k}' for k in range(4))
for w,d in [('L',8),('C',9),('R',10)]:
 src+=f'''theorem one_expand_{w}07F1 (t s v : ℤ) :
 secondShape07F1 (t+s+4) (v+3) 1 (2*t+s+{d})={summ(w)} := by
 unfold secondShape07F1 {' '.join(f'one{w}{k}07F1' for k in range(4))}
 ring
'''
for k in range(7):
 pairs=[(i,k-i) for i in range(4) if 0<=k-i<4];g=Q();expr=[]
 for i,j in pairs:
  g=g+parts['C',i]*parts['C',j]-parts['L',i]*parts['R',j]
  expr.append(f'(({pp("C",i)})*({pp("C",j)})-({pp("L",i)})*({pp("R",j)}))')
 assert all(z>=0 for z in g.values())
 src+=f'def oneGap{k}07F1 (t s : ℤ) : ℤ := '+ '+'.join(expr)+'\n'
 src+=f'''theorem one_gap_{k}07F1 (t s : ℤ) (ht : 0 ≤ t) (hs : 0 ≤ s) :
 0 ≤ oneGap{k}07F1 t s := by
 have he : oneGap{k}07F1 t s={horner(g,['t','s','u','v'])} := by
  unfold oneGap{k}07F1 {' '.join(f'one{w}{i}07F1' for w in 'LCR' for i in range(4) if 0<=k-i<4)}
  ring
 rw [he]
 positivity
'''
src+='''theorem second_One_shift07F1 (t s v : ℤ) (ht : 0 ≤ t) (hs : 0 ≤ s) (hv : 0 ≤ v) :
 secondShape07F1 (t+s+4) (v+3) 1 (2*t+s+8)*secondShape07F1 (t+s+4) (v+3) 1 (2*t+s+10) ≤
 (secondShape07F1 (t+s+4) (v+3) 1 (2*t+s+9))^2 := by
 rw [one_expand_L07F1,one_expand_C07F1,one_expand_R07F1]
'''
for k in range(7):src+=f' have h{k} := one_gap_{k}07F1 t s ht hs\n'
gexpr='+'.join(f'oneGap{k}07F1 t s*v^{k}' for k in range(7))
src+=f''' have he : ({summ('C')})^2-({summ('L')})*({summ('R')})={gexpr} := by
  unfold {' '.join(f'oneGap{k}07F1' for k in range(7))}
  ring
 have hp : 0 ≤ {gexpr} := by positivity
 omega
end
end MathGKM.Markov
'''
(R/'research/MarkovSecondOne07F1.lean').write_text(src)
