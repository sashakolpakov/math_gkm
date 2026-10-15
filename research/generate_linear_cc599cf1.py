"""Machine-authored square-zero shift-variable identities, ordinary Lean checks required."""
from pathlib import Path
from fractions import Fraction as F
from itertools import product
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,local,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def expr(p):
 return ' + '.join('*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','Q','T','U','x'],ks) if k]) for ks,v in sorted(p.items())) or '0'
header='''import MarkovShiftProductF2
/-! Machine-authored cc599cf1. Exact square-zero shift-variable calculation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
hp=''.join(f' have hz{i} : Z^{i}=0 := by rw [show {i}=2+{i-2} by omega,pow_add,hz,zero_mul]\n' for i in range(3,9))
zeros=['hz']+[f'hz{i}' for i in range(3,9)]+['mul_zero','zero_mul','add_zero','zero_add','sub_zero']
gauges=json.loads((R/'evidence/markov-bc8d3b6f/gauge-normalization-candidates.json').read_text())
defs=[f'gauge{r["e"]}{r["k"]}BC' for r in gauges[:11]]+[r['name'] for r in gauges]
four=json.loads((R/'evidence/markov-bc8d3b6f/normalization-candidates.json').read_text())
saved={}
for title,arity in [('Third',3),('Four',4)]:
 vals={}
 for bs in product((0,1),repeat=arity):
  if arity==3:
   z=local(*bs);p=z.p*(1-X)**(6-z.d)
  else:
   row=next(row for row in four if tuple(row['bits'])==bs)
   p=P({tuple(k):F(v) for k,v in row['numerator']})*(1-X)**(8-row['denominator'])
  vals[bs]=P({k:v for k,v in p.items() if k[1]<2})
 used=next(k for k in range(1,arity+1) if all(p==vals[bs[:k]+(0,)*(arity-k)] for bs,p in vals.items()))
 args=' '.join('pqrs'[:used]); allargs=' '.join('pqrs'[:arity])
 text=header+f'\ndef linear{title}CC {{A : Type*}} [CommRing A] (N Z x : A) ({args} : Bool) : A :=\n match '+','.join('pqrs'[:used])+' with\n'
 for bs in product((0,1),repeat=used):text+=' | '+','.join(str(bool(b)).lower() for b in bs)+' => '+expr(vals[bs+(0,)*(arity-used)])+'\n'
 text+=f'\ntheorem local{title}_linearCC {{A : Type*}} [CommRing A] (N Z x : A) ({allargs} : Bool) (hz : Z^2=0) :\n local{title}NumBC N Z x {allargs}=linear{title}CC N Z x {args} := by\n'+hp
 text+=' '+' <;> '.join('cases '+b for b in allargs.split())+'\n all_goals\n  simp only ['+','.join([f'local{title}NumBC',f'linear{title}CC']+defs+zeros)+']\n  ring_nf\n  simp only ['+','.join(zeros)+']\nend\nend MathGKM.Markov\n'
 (R/f'research/Markov{title}LinearCC.lean').write_text(text)
 saved[title]=dict(used=used,values={str(bs):serialize(p) for bs,p in vals.items()})
 print(title,used,max(map(len,vals.values())),flush=True)
(O/'linear-local-candidates.json').write_text(json.dumps(saved,indent=2)+'\n')
