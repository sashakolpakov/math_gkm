"""Machine-authored candidates. Lean checking, not Python, establishes identities."""
from pathlib import Path
from fractions import Fraction as F
from itertools import product
import json
from rational_third_bdee import P, X, local, serialize
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-0b212317'
def low(p):return P({k:v for k,v in p.items() if not k[1]})
def expr(p):
 names=['N','Z','C','R','Q','T','U','x']; out=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  fs += [name if k==1 else name+'^'+str(k) for name,k in zip(names,ks) if k]
  out.append('*'.join(fs))
 return ' + '.join(out) if out else '0'
header='''import MarkovFourthTruncateK0B
/-! Machine-authored request 0b212317. Zero-Z local moments. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
gauges=json.loads((R/'evidence/markov-bc8d3b6f/gauge-normalization-candidates.json').read_text())
defs=[f'gauge{r["e"]}{r["k"]}BC' for r in gauges[:11]]+[r['name'] for r in gauges]
four=json.loads((R/'evidence/markov-bc8d3b6f/normalization-candidates.json').read_text())
values={}
for arity,title in [(3,'Third'),(4,'Four')]:
 vals={}
 for bs in product((0,1),repeat=arity):
  if arity==3:
   z=local(*bs); p=z.p*(1-X)**(6-z.d)
  else:
   row=next(row for row in four if tuple(row['bits'])==bs)
   p=P({tuple(k):F(v) for k,v in row['numerator']})*(1-X)**(8-row['denominator'])
  vals[bs]=low(p)
 assert all(p==vals[(0,bits[1])+((0,)*(arity-2))] for bits,p in vals.items())
 text=header
 for q in (0,1):
  p=vals[(0,q)+((0,)*(arity-2))]
  text+=f'\ndef zero{title}{q}K0B {{A : Type*}} [CommRing A] (N x : A) : A :=\n {expr(p)}\n'
 args='p q r' if arity==3 else 'p q r s'
 text+=f'''\ntheorem local{title}_zeroK0B {{A : Type*}} [CommRing A] (N x : A) ({args} : Bool) :
 local{title}NumBC N 0 x {args} =
 (if q then zero{title}1K0B N x else zero{title}0K0B N x) := by
 {' <;> '.join('cases '+b for b in args.split())}
 all_goals
  simp only [local{title}NumBC,{','.join(defs)},zero{title}0K0B,zero{title}1K0B,
    Bool.false_eq_true,if_false,if_true,zero_pow,mul_zero,zero_mul,add_zero,zero_add,sub_zero]
  ring
end
end MathGKM.Markov
'''
 (R/f'research/Markov{title}ZeroK0B.lean').write_text(text)
 values[title]={str(bs):serialize(p) for bs,p in vals.items()}
 print(title, len(vals), [len(vals[(0,q)+((0,)*(arity-2))]) for q in (0,1)],flush=True)
(O/'zero-local-candidates.json').write_text(json.dumps(values,indent=2)+'\n')
