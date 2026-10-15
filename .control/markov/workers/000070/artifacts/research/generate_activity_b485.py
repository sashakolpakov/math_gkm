"""Machine-authored exact identities; generated Lean proofs use ring."""
from itertools import product
from math import comb
from pathlib import Path
layers={}
for bits in product([0,1],repeat=7):
 s=sum(bits);h=sum(bits[k] for k in [1,2,4,5]);d=sum(bits[k]*bits[k+1] for k in range(6))+bits[0]+bits[-1]
 for j in range(d+1):layers[s,j,h]=layers.get((s,j,h),0)+comb(d,j)
def coeff(s,j):
 terms=[]
 for h in range(5):
  c=layers.get((s,j,h),0)
  if c:
   terms.append(str(c) if h==0 else (('' if c==1 else str(c)+'*')+('t' if h==1 else f't^{h}')))
 return '+'.join(terms) or '0'
def expression(s,poly=False):
 terms=[]
 for j in range(8):
  c=coeff(s,j)
  if c=='0':continue
  base=f'C ({c})' if poly else f'({c})'
  terms.append(base+('' if j==0 else '*'+('X' if poly else 'y')+(f'^{j}' if j>1 else '')))
 return '+\n   '.join(terms)
out='''import MarkovCutActivityB485
/-! Machine-authored b485717c. Exact seven-site formulas, no numerical oracle. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000
'''
for s in [2,3,4]:
 out+=f'''
theorem activity_slice{s}B485 {{R : Type*}} [CommRing R] (y t : R) :
 activityCoeffB485 y y 1 (activityWordB485 t) {s} =
   {expression(s)} := by
 simp only [activityWordB485,activityCoeffB485,cutChargeA27,cutFactorA27,
   Bool.false_eq_true,if_false,if_true]
 ring

theorem activity_coeff{s}B485 (t : ℤ) :
 (activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) {s}).coeff 2 =
 {coeff(s,2)} := by
 have he : activityCoeffB485 (X:ℤ[X]) X 1 (activityWordB485 (C t)) {s} =
   {expression(s,True)} := by
  simpa only [map_add,map_mul,map_pow,map_ofNat,map_one] using
    activity_slice{s}B485 (X:ℤ[X]) (C t)
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,
   Polynomial.coeff_C_mul_X,Polynomial.coeff_C]
 norm_num

#print axioms activity_slice{s}B485
#print axioms activity_coeff{s}B485
'''
out+='end\nend MathGKM.Markov\n'
Path('research/MarkovActivityFormulaB485.lean').write_text(out)
