"""Machine-authored exact certificate generator. Generated identities require Lean checking."""
from pathlib import Path
import json
from itertools import product
from probe_adb2 import candidate,jets
from third_cert_75ad import P,expr
R=Path('research');O=Path('evidence/markov-8bbb934e')
class M(dict):
 def __add__(a,b):
  if not isinstance(b,M):b=M({(0,)*5:b})
  d=M(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return M({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return M({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  if not isinstance(b,M):b=M({(0,)*5:b})
  d=M()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return M({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  z=M({(0,)*5:1})
  for _ in range(n):z=z*a
  return z
def mexpr(p):
 if not isinstance(p,M):return str(p)
 if not p:return '0'
 return ' + '.join(str(v)+''.join('*'+s+('^'+str(e) if e>1 else '') for s,e in zip(['c','r','q','t','u'],k) if e) for k,v in sorted(p.items()))
def poly(a):
 return ' + '.join(str(v)+('' if j==0 else '*X'+('^'+str(j) if j>1 else '')) for j,v in enumerate(a) if v) or '0'
vars=[M({tuple(int(j==i) for j in range(5)):1}) for i in range(5)]
C=candidate(1,*vars);N=len(C)
s='''import MarkovThirdRunPolynomialADB2
/-! Machine-authored request 8bbb934e. Exact run-one sequence and polynomial.
The source adapter is proved separately; all zero tails are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def thirdOneSeq8BBB (c r q t u : ℤ) : ℕ → ℤ
'''
for j,z in enumerate(C):s+=f' | {j} => {mexpr(z)}\n'
s+=' | _ => 0\n\ndef thirdOnePoly8BBB (c r q t u : ℤ) : ℤ[X] :=\n '+ '+\n '.join(f'C (thirdOneSeq8BBB c r q t u {j})'+('' if j==0 else f'*X^{j}') for j in range(N))+'\n'
s+='''
theorem thirdOnePoly_coeff8BBB (c r q t u : ℤ) (j : ℕ) :
 (thirdOnePoly8BBB c r q t u).coeff j=thirdOneSeq8BBB c r q t u j := by
 unfold thirdOnePoly8BBB
'''+f' by_cases hj : j<{N}\n · interval_cases j <;> simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,\n     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_C] <;> norm_num\n'
for j in range(N):s+=f' · have h{j} : j≠{j} := by omega\n' if j==0 else f'   have h{j} : j≠{j} := by omega\n'
s+=f'''   have hz : thirdOneSeq8BBB c r q t u j=0 := by
     obtain ⟨k,rfl⟩ : ∃ k,j=k+{N} := ⟨j-{N},by omega⟩
     rfl
   simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_C,{','.join('h'+str(j) for j in range(N))},hz,if_false,
     mul_zero,add_zero,eq_comm]
end
end MathGKM.Markov
'''
(R/'MarkovThirdOneSeq8BBB.lean').write_text(s)
# Four exact coefficient jets for each Boolean gauge.
s='''import MarkovThirdOneSeq8BBB
/-! Machine-authored exact jets for the two run lengths 1 and 2. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
'''
fields=[('a',1,'a'),('b',1,'b'),('c',1,'c'),('d',1,'d'),('b',2,'b2'),('c',2,'c2'),('d',2,'d2'),('d',3,'d3')]
for p,q in product((0,1),repeat=2):
 J=jets(1,p,q);ps=['false','true'][p];qs=['false','true'][q]
 s+=f'theorem oneGauge_{p}{q}8BBB :\n '+ ' ∧\n '.join(f'(runBooleanGaugeADB2 1 {ps} {qs}).{a}.coeff {i}=({poly(J[key])})' for a,i,key in fields)+' := by\n'
 s+=''' norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
   ambientWord5c,ambientT5c,mm16,U,V,runSumA27,Finset.sum_range_succ,
   Polynomial.coeff_add,Polynomial.coeff_sub,Polynomial.coeff_neg,Polynomial.coeff_mul_C,
   Polynomial.coeff_C_mul,Polynomial.coeff_mul_X,Polynomial.coeff_X_mul,
   Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_C]
 <;> ring
'''
s+='end\nend MathGKM.Markov\n'
(R/'MarkovThirdOneJets8BBB.lean').write_text(s)
cases={'Low':('3*(x+1)+y','x+1','0','0','0'),
 'MidLow':('2*(x+1)+3*(y+1)','(x+1)+(y+1)','0','x+1','0'),
 'MidHigh':('3*(x+1)+2*(y+1)','2*(x+1)+(y+1)','x+1','x+y+2','0'),
 'High':('(x+1)+3*(y+1)','(x+1)+2*(y+1)','x+y+2','y+1','x+1')}
x=P({(1,0):1});y=P({(0,1):1});records=[]
for name,args in cases.items():
 coeffs=candidate(1,*(eval(a) for a in args));coeffs += [P()]*(N-len(coeffs))
 s='''import MarkovThirdOneSeq8BBB
/-! Machine-authored universal nonnegative polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
'''
 seq='thirdOneSeq8BBB '+' '.join('('+a+')' for a in args)
 for j in range(N-2):
  g=coeffs[j+1]**2-coeffs[j]*coeffs[j+2];g=g if isinstance(g,P) else P({(0,0):g})
  assert all(v>=0 for v in g.values())
  ex=expr(g);records.append(dict(chamber=name,j=j,expression=ex))
  s+=f'''theorem thirdOne_{name.lower()}_{j}8BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) :
 {seq} {j}*{seq} {j+2}≤({seq} {j+1})^2 := by
 have he : ({seq} {j+1})^2-({seq} {j})*({seq} {j+2}) =
   {ex} := by simp only [thirdOneSeq8BBB]; ring
 have hp : 0≤{ex} := by positivity
 omega
'''
 s+=f'''theorem thirdOne_{name.lower()}_lc8BBB (x y : ℤ) (hx : 0≤x) (hy : 0≤y) (j : ℕ) :
 {seq} j*{seq} (j+2)≤({seq} (j+1))^2 := by
 by_cases hj : j<{N-2}
 · interval_cases j
'''
 for j in range(N-2):s+=f'   · exact thirdOne_{name.lower()}_{j}8BBB x y hx hy\n'
 s+=f''' · have hz : {seq} (j+2)=0 := by
     match j with
     | {' | '.join(str(j) for j in range(N-2))} => omega
     | n+{N-2} => rfl
   rw [hz,mul_zero]
   exact sq_nonneg _
#print axioms thirdOne_{name.lower()}_lc8BBB
end
end MathGKM.Markov
'''
 (R/f'MarkovThirdOne{name}8BBB.lean').write_text(s)
(O/'run-one-certificates.json').write_text(json.dumps(records,indent=2)+'\n')
print(json.dumps(dict(sequence_length=N,certificates=len(records))))
