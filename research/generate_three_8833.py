"""Machine-authored exact polynomial certificates; no inherited file writes."""
from pathlib import Path
import json
from rational_third_bdee import N,P,coerce
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-8833a0fb'
def body(file,name):
 s=(R/'research'/file).read_text();return s.split('def '+name+' ',1)[1].split(':=\n',1)[1].split('\n',1)[0].strip().replace('^','**')
sec=body('MarkovSecondShape07F1.lean','secondShape07F1')
ts=[body('MarkovTailShape53D.lean',f'thirdTailCoeff{k}53D') for k in range(4)]
low=body('MarkovTailShape53D.lean','tailLow53D');high=body('MarkovTailShape53D.lean','tailHigh53D')
def ev(s,**kw):return coerce(eval(s,{'__builtins__':{}},kw))
def fmt(p,var='x'):
 return ' + '.join(str(int(v))+('' if k[0]==0 else '*'+var if k[0]==1 else '*'+var+'^'+str(k[0])) for k,v in sorted(p.items())) or '0'
head='''import MarkovCrossTail53D
/-! Machine-authored 8833a0fb. Exact unbounded three-cycle gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
'''
s=head;checks=[]
for r in [1,2]:
 q=max(2*r-3,0);vals=[ev(sec,n=N+4,c=3,r=r,j=2*(N+4)+k) for k in range(1,7)]
 a=[ev(t,n=N+4,c=3,r=r,q=q) for t in ts]
 vals[2]+=15*a[0];vals[3]+=90*a[0]+15*a[1]
 vals[4]+=315*a[0]+90*a[1]+15*a[2]
 vals[5]+=840*a[0]+315*a[1]+90*a[2]+15*a[3]
 for k in range(4):
  gap=vals[k+1]**2-vals[k]*vals[k+2]
  assert all(v>=0 for v in gap.values()),(r,k,fmt(gap))
  checks.append(dict(r=r,start=k+1,gap_shift4=fmt(gap)))
  lhs=f'crossTail{k+1}53D (x+4) 3 {r} {q}*crossTail{k+3}53D (x+4) 3 {r} {q}'
  rhs=f'(crossTail{k+2}53D (x+4) 3 {r} {q})^2'
  defs=' '.join(f'crossTail{z}53D' for z in range(k+1,k+4))+' secondShape07F1 '+' '.join(f'thirdTailCoeff{z}53D' for z in range(4))
  s+=f'''theorem three_cross_{r}_{k+1}8833 (x : ℤ) (hx : 0 ≤ x) :
 {lhs} ≤ {rhs} := by
 have he : {rhs}-({lhs})={fmt(gap)} := by
  simp only [{defs.replace(' ', ',')}]
  ring
 have hp : 0 ≤ {fmt(gap)} := by positivity
 linarith only [he,hp]
'''
 for shift in [1]:
  sh=low if r==1 else high;nm='tailLow53D' if r==1 else 'tailHigh53D'
  arr=[ev(sh,c=3,r=r,k=N+shift+z) for z in [-1,0,1]]
  gap=arr[1]**2-arr[0]*arr[2]
  assert all(v>=0 for v in gap.values()),(r,fmt(gap))
  checks.append(dict(r=r,tail_gap_shift1=fmt(gap)))
  s+=f'''theorem three_tail_{r}8833 (x : ℤ) (hx : 0 ≤ x) :
 {nm} 3 {r} x*{nm} 3 {r} (x+2) ≤ ({nm} 3 {r} (x+1))^2 := by
 have he : ({nm} 3 {r} (x+1))^2-{nm} 3 {r} x*{nm} 3 {r} (x+2)={fmt(gap)} := by
  unfold {nm}; ring
 have hp : 0 ≤ {fmt(gap)} := by positivity
 linarith only [he,hp]
'''
s+='end\nend MathGKM.Markov\n'
(R/'research/MarkovThreeGaps8833.lean').write_text(s)
src=(R/'research/MarkovCrossTail53D.lean').read_text();src=src[src.index('theorem cross_tail_coeff153D'):src.rindex('\nend\nend')]
src=src.replace('(hn : 5 ≤ n)','(hn : 4 ≤ n)')
for k in range(1,7):src=src.replace(f'cross_tail_coeff{k}53D',f'cross_tail_coeff{k}8833')
(R/'research/MarkovThreeExtract8833.lean').write_text(head+src+'\nend\nend MathGKM.Markov\n')
(O/'three-symbolic.json').write_text(json.dumps(dict(status='Exact symbolic experiment; certificates require Lean checks',checks=checks),indent=2)+'\n')
print(json.dumps(checks))
