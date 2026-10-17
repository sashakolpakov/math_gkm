"""Machine-authored c3e5369f. Proposed exact low-column gap certificates."""
from correction_polynomials_418bcc64 import F,add,scale,low,choose,mul,neg,horner
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c3e5369f'
x=[F(0),F(1)];polys={}
for i in range(2,9):
 for r in [False,True]:
  c0=36 if r else 24;c1=add(scale(x,8 if r else 4),[24 if r else 12])
  q=add(x,[4 if r else 3]);j=add(q,[2]);n=add(scale(q,3),[1 if r else 2])
  polys[i,r]=[F(c0)] if i==2 else add(add(low(n,j,i-3),scale(choose(x,i-2),c0)),mul(c1,choose(x,i-3)))
head='''/-! Machine-authored c3e5369f. Exact second-correction column certificates.
Python proposes coefficients; ordinary Lean ring checks every identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2
'''
s='import MarkovSecondColumnsBaseMC3E\n'+head
for i in range(2,9):
 s+=f'\ndef secondColumn{i}MC3E (x : ℚ) (r : Bool) : ℚ :=\n if r then {horner(polys[i,True])} else {horner(polys[i,False])}\n'
 s+=f'''theorem source_second_column{i}MC3E (d : ℕ) (r : Bool) :
 (threeRawM9E2 (secondQMC3E d r) r {i} (secondJMC3E d r):ℚ)=secondColumn{i}MC3E d r := by
'''
 if i==2:s+=''' rw [source_second_lowMC3E d 2 r (by omega)]
 cases r <;> norm_num [secondColumn2MC3E,secondConstantMC3E]
'''
 else:
  name='column_zero_explicitM418' if i==3 else f'column_explicit{i-3}MAE9'
  col='columnZeroM418' if i==3 else f'column{i-3}MAE9'
  s+=f''' have h := source_second_polynomialMC3E d {i-3} r
 norm_num only [Nat.reduceAdd] at h
 rw [h,{name}]
 cases r <;> simp only [sourceNME9C,secondQMC3E,secondJMC3E,Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   {col},secondColumn{i}MC3E,{','.join(f'binomial_poly_{k}M295' for k in range(i-1))}] <;> ring
'''
s+='\nend\nend MathGKM.Markov\n';(R/'research/MarkovSecondColumnsMC3E.lean').write_text(s)
s='import MarkovSecondColumnsMC3E\n'+head;out=[]
for i in range(2,7):
 gaps={r:add(mul(polys[i+1,r],polys[i+1,r]),neg(mul(polys[i,r],polys[i+2,r]))) for r in [False,True]}
 out.append({'i':i,'negative_coefficients':[sum(c<0 for c in gaps[r]) for r in [False,True]],'degrees':[len(gaps[r])-1 for r in [False,True]]})
 assert all(c>=0 for a in gaps.values() for c in a)
 s+=f'\ndef secondGap{i}MC3E (x : ℚ) (r : Bool) : ℚ :=\n if r then {horner(gaps[True])} else {horner(gaps[False])}\n'
 s+=f'''theorem second_gap_identity{i}MC3E (x : ℚ) (r : Bool) :
 secondColumn{i+1}MC3E x r^2-secondColumn{i}MC3E x r*secondColumn{i+2}MC3E x r=secondGap{i}MC3E x r := by
 cases r <;> simp only [secondColumn{i}MC3E,secondColumn{i+1}MC3E,secondColumn{i+2}MC3E,
   secondGap{i}MC3E,Bool.false_eq_true,if_false,if_true] <;> ring
theorem second_gap_nonneg{i}MC3E (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ secondGap{i}MC3E x r := by
 cases r <;> simp only [secondGap{i}MC3E,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_second_horizontal{i}MC3E (d : ℕ) (r : Bool) :
 threeRawM9E2 (secondQMC3E d r) r {i} (secondJMC3E d r)*
 threeRawM9E2 (secondQMC3E d r) r {i+2} (secondJMC3E d r) ≤
 threeRawM9E2 (secondQMC3E d r) r {i+1} (secondJMC3E d r)^2 := by
 have h : (threeRawM9E2 (secondQMC3E d r) r {i} (secondJMC3E d r):ℚ)*
     (threeRawM9E2 (secondQMC3E d r) r {i+2} (secondJMC3E d r):ℚ) ≤
     (threeRawM9E2 (secondQMC3E d r) r {i+1} (secondJMC3E d r):ℚ)^2 := by
   rw [source_second_column{i}MC3E,source_second_column{i+1}MC3E,source_second_column{i+2}MC3E]
   have he := second_gap_identity{i}MC3E (d:ℚ) r
   have hp := second_gap_nonneg{i}MC3E (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h
'''
s+='\nend\nend MathGKM.Markov\n';(R/'research/MarkovSecondGapsMC3E.lean').write_text(s)
(O/'column-generation.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
