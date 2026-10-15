"""Machine-authored exact onset certificates; generation is not proof."""
from pathlib import Path
from math import comb
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96dea62b'
head='''/-! Machine-authored live request 96dea62b. Exact onset coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
end='end\nend MathGKM.Markov\n'
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def expr(p):
 return bal(['*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','J','E','U','x'],ks) if k]) for ks,v in sorted(p.items())])
def save(m,s):
 p=R/'research'/f'{m}.lean';assert not p.exists();p.write_text(s)
s=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
lin=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['linear'])
vals={};defs='import Mathlib.Tactic.Ring\nimport Mathlib.Tactic.Positivity\n'+head
for k in range(1,7):
 corr=P({})
 for ks,v in lin.items():
  if ks[-1]<=k:
   key=ks[:-1]+(0,);corr[key]=corr.get(key,0)+315*v*comb(k-ks[-1]+7,7)
 vals[k]=subst(s,[N,Z,C,N*C+Rr,N+k,T,U,X])+corr
 defs+=f'\ndef onsetValue{k}M96 (N C R : ℤ) : ℤ :=\n {expr(vals[k])}\n'
save('MarkovOnsetDefsM96',defs+end)
bridges=[]
for k in range(1,7):
 m=f'MarkovOnsetValue{k}M96';bridges.append(m)
 st='import MarkovOnsetDefsM96\nimport MarkovEarlyBlockM042\n'+head
 st+=f'\ntheorem onset_value{k}M96 (N c r : ℤ) :\n earlyBlockValueM042 N c r {k}=onsetValue{k}M96 N c r := by\n unfold earlyBlockValueM042\n rw [shiftPoly_convolutionCC]\n norm_num [chooseShiftSevenK0B, Nat.choose]\n unfold fourthShapeK0B onsetValue{k}M96 '+' '.join(f'shiftPart{i}CC' for i in range(k+1))+'\n ring\n'
 save(m,st+end)
charts=[];data=[]
for k in range(1,5):
 gap=vals[k+1]**2-vals[k]*vals[k+2]
 for tag,rv,cv,rlean,clean in [('L',Rr+4,Rr+C+5,'(R+4)','(R+C+5)'),('A',coerce(3),C+5,'3','(C+5)'),('B',coerce(2),C+5,'2','(C+5)'),('D',coerce(1),C+5,'1','(C+5)')]:
  p=subst(gap,[N+4,Z,cv,rv,Q,T,U,X]);assert all(v>=0 for v in p.values())
  m=f'MarkovOnset{tag}{k}M96';charts.append(m)
  lhs=f'onsetValue{k+1}M96 (N+4) {clean} {rlean}^2-onsetValue{k}M96 (N+4) {clean} {rlean}*onsetValue{k+2}M96 (N+4) {clean} {rlean}'
  st='import MarkovOnsetDefsM96\n'+head
  st+=f'\ntheorem onset{tag}{k}M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :\n 0≤{lhs} := by\n have he : {lhs}=\n {expr(p)} := by\n  unfold onsetValue{k}M96 onsetValue{k+1}M96 onsetValue{k+2}M96\n  ring\n rw [he]\n positivity\n'
  save(m,st+end);data.append(dict(k=k,chart=tag,terms=len(p),gap=serialize(p)))
(O/'onset-certificates.json').write_text(json.dumps(dict(bridges=bridges,charts=charts,values={k:serialize(v) for k,v in vals.items()},certificates=data),indent=2)+'\n')
print([(x['k'],x['chart'],x['terms']) for x in data])
