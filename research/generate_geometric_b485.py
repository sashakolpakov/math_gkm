"""Generate exact ring proofs from enumerated masks; Lean checks identities."""
from itertools import product
from pathlib import Path
from math import comb
import json
def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a):c[i]+=v
 for i,v in enumerate(b):c[i]+=v
 return c
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
w=(1,1,0,1,1,0,1,1,1);F={}
for bits in product([0,1],repeat=9):
 p=[0,1];out=[1]
 for r,b in zip(w,bits):
  if b:out=mul(out,mul([1,1] if r else [1],add(p,[1])));p=[0,1]
  else:p=[0]+add(p,[2]) if r else [0]
 s=sum(bits);e=sum((8-k)*b for k,b in enumerate(bits))
 for j,c in enumerate(out):F[s,j,e]=F.get((s,j,e),0)+c
def poly(terms,var='t'):
 return '+'.join(str(c) if k==0 else (('' if c==1 else str(c)+'*')+(var if k==1 else f'{var}^{k}')) for k,c in terms if c) or '0'
def coef(s,j):return poly([(e,F.get((s,j,e),0)) for e in range(37)])
def expr(s,pp=False):
 ans=[]
 for j in range(20):
  c=coef(s,j)
  if c=='0':continue
  ans.append((f'C ({c})' if pp else f'({c})')+('' if j==0 else '*'+('X' if pp else 'y')+(f'^{j}' if j>1 else '')))
 return '+\n   '.join(ans)
word='['+','.join(f'({str(bool(r)).lower()},'+('1' if 8-k==0 else 't' if 8-k==1 else f't^{8-k}')+')' for k,r in enumerate(w))+']'
base='''import MarkovCutActivityB485
/-! Machine-authored b485717c. Geometric cut activities on actual source 7/10. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
def geometricWordB485 {R : Type*} [Monoid R] (t : R) : List (Bool × R) :=
 '''+word+'''
theorem geometric_source_wordB485 :
 central28 [true,true,false,false]++[true]=[true,true,false,true,true,false,true,true,true] := by decide
theorem geometric_uniformB485 {R : Type*} [Monoid R] :
 geometricWordB485 (1:R)=
 ([true,true,false,true,true,false,true,true,true].map (fun r => (r,(1:R)))) := by
 simp [geometricWordB485]
end
end MathGKM.Markov
'''
Path('research/MarkovGeometricWordB485.lean').write_text(base)
for s in [3,4,5]:
 text=f'''import MarkovGeometricWordB485
/-! Machine-authored exact identity, independently elaborated and kernel checked. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
theorem geometric_slice{s}B485 {{R : Type*}} [CommRing R] (y t : R) :
 activityCoeffB485 y y 1 (geometricWordB485 t) {s} =
   {expr(s)} := by
 simp only [geometricWordB485,activityCoeffB485,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true]
 ring
theorem geometric_coeff{s}B485 (t : ℤ) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) {s}).coeff 9 =
   {coef(s,9)} := by
 have he : activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) {s} =
   {expr(s,True)} := by
  simpa only [map_add,map_mul,map_pow,map_ofNat,map_one] using
    geometric_slice{s}B485 (X:ℤ[X]) (C t)
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 norm_num
#print axioms geometric_slice{s}B485
#print axioms geometric_coeff{s}B485
end
end MathGKM.Markov
'''
 Path(f'research/MarkovGeometricSlice{s}B485.lean').write_text(text)
data=json.loads(Path('evidence/markov-b485717c/geometric-symbolic.json').read_text())
gap=poly(list(enumerate(data['residual_gap'])));neg=poly([(k,-c) for k,c in enumerate(data['residual_gap_shift8'])],var='n')
text=f'''import MarkovGeometricSlice3B485
import MarkovGeometricSlice4B485
import MarkovGeometricSlice5B485
/-! Machine-authored b485717c. Entire geometric family t>=8 fails an auxiliary
horizontal inequality. Uniform t=1 remains the unchanged source polynomial. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
def geometricResidualB485 (t : ℤ) : ℤ := {gap}
theorem geometric_gap_identityB485 (t : ℤ) :
 ({coef(4,9)})^2-({coef(3,9)})*({coef(5,9)}) =
 t^19*geometricResidualB485 t := by unfold geometricResidualB485; ring
theorem geometric_gap_shiftB485 (n : ℤ) :
 geometricResidualB485 (n+8) = -({neg}) := by
 unfold geometricResidualB485
 ring
theorem geometric_residual_negativeB485 (t : ℤ) (ht : 8≤t) :
 geometricResidualB485 t<0 := by
 let n := t-8
 have hn : 0≤n := by dsimp [n]; omega
 have h := geometric_gap_shiftB485 n
 have he : n+8=t := by dsimp [n]; ring
 rw [he] at h
 have hp : 0 < {neg} := by positivity
 omega
theorem geometric_horizontal_failureB485 (t : ℤ) (ht : 8≤t) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 4).coeff 9^2 <
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 3).coeff 9*
 (activityCoeffB485 (X:ℤ[X]) X 1 (geometricWordB485 (C t)) 5).coeff 9 := by
 rw [geometric_coeff3B485,geometric_coeff4B485,geometric_coeff5B485]
 have hp : 0<t^19 := pow_pos (by omega) _
 have hn := mul_neg_of_pos_of_neg hp (geometric_residual_negativeB485 t ht)
 rw [←geometric_gap_identityB485] at hn
 omega
#print axioms geometric_gap_identityB485
#print axioms geometric_gap_shiftB485
#print axioms geometric_residual_negativeB485
#print axioms geometric_horizontal_failureB485
end
end MathGKM.Markov
'''
Path('research/MarkovGeometricFailureB485.lean').write_text(text)
