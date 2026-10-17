"""Machine-authored 9647c1ba. Exact ordinary rational column certificates."""
from correction_polynomials_418bcc64 import F,add,scale,low,choose,mul,neg,horner
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-9647c1ba'
x=[F(0),F(1)];polys={}
for i in range(2,12):
 for r in [False,True]:
  c0=96 if r else 72;c1=add(scale(x,44 if r else 28),[156 if r else 96])
  c2=scale(mul(add(x,[5]),add(x,[4])),4 if r else 2)
  q=add(x,[6 if r else 5]);j=add(q,[3]);n=add(scale(q,3),[1 if r else 2])
  p=[F(c0)] if i==2 else add(add(low(n,j,i-3),scale(choose(x,i-2),c0)),mul(c1,choose(x,i-3)))
  if i>=4:p=add(p,mul(c2,choose(x,i-4)))
  polys[i,r]=p
head='''/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2
'''
for i in range(2,12):
 s='import MarkovThirdColumnsBaseM964\n'+head
 s+=f'\ndef thirdColumn{i}M964 (x : ℚ) (r : Bool) : ℚ :=\n if r then {horner(polys[i,True])} else {horner(polys[i,False])}\n'
 s+=f'''theorem source_third_column{i}M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r {i} (thirdJM964 d r):ℚ)=thirdColumn{i}M964 d r := by
'''
 if i==2:s+=''' rw [source_third_lowM964 d 2 r (by omega)]
 cases r <;> norm_num [thirdColumn2M964,thirdCM964]
'''
 else:
  s+=f''' have h := source_third_polynomialM964 d {i-3} r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ {i-3} by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn{i}M964,{','.join(f'binomial_poly_{k}M295' for k in range(2*(i-3)+6))}] <;> ring
'''
  if i==3:s=s.replace('show (1:ℕ) ≤ 0 by omega,if_true','show ¬(1:ℕ) ≤ 0 by omega,if_false')
 s+='\nend\nend MathGKM.Markov\n';(R/'research'/f'MarkovThirdColumn{i}M964.lean').write_text(s)
out=[]
for i in range(2,10):
 gaps={r:add(mul(polys[i+1,r],polys[i+1,r]),neg(mul(polys[i,r],polys[i+2,r]))) for r in [False,True]}
 out.append({'i':i,'negative_coefficients':[sum(c<0 for c in gaps[r]) for r in [False,True]],'degrees':[len(gaps[r])-1 for r in [False,True]]})
 if any(c<0 for a in gaps.values() for c in a):continue
 s='\n'.join(f'import MarkovThirdColumn{k}M964' for k in range(i,i+3))+'\n'+head
 s+=f'\ndef thirdGap{i}M964 (x : ℚ) (r : Bool) : ℚ :=\n if r then {horner(gaps[True])} else {horner(gaps[False])}\n'
 s+=f'''theorem third_gap_identity{i}M964 (x : ℚ) (r : Bool) :
 thirdColumn{i+1}M964 x r^2-thirdColumn{i}M964 x r*thirdColumn{i+2}M964 x r=thirdGap{i}M964 x r := by
 cases r <;> simp only [thirdColumn{i}M964,thirdColumn{i+1}M964,thirdColumn{i+2}M964,
   thirdGap{i}M964,Bool.false_eq_true,if_false,if_true] <;> ring
theorem third_gap_nonneg{i}M964 (x : ℚ) (r : Bool) (hx : 0 ≤ x) : 0 ≤ thirdGap{i}M964 x r := by
 cases r <;> simp only [thirdGap{i}M964,Bool.false_eq_true,if_false,if_true] <;> positivity
theorem source_third_horizontal{i}M964 (d : ℕ) (r : Bool) :
 threeRawM9E2 (thirdQM964 d r) r {i} (thirdJM964 d r)*
 threeRawM9E2 (thirdQM964 d r) r {i+2} (thirdJM964 d r) ≤
 threeRawM9E2 (thirdQM964 d r) r {i+1} (thirdJM964 d r)^2 := by
 have h : (threeRawM9E2 (thirdQM964 d r) r {i} (thirdJM964 d r):ℚ)*
     (threeRawM9E2 (thirdQM964 d r) r {i+2} (thirdJM964 d r):ℚ) ≤
     (threeRawM9E2 (thirdQM964 d r) r {i+1} (thirdJM964 d r):ℚ)^2 := by
   rw [source_third_column{i}M964,source_third_column{i+1}M964,source_third_column{i+2}M964]
   have he := third_gap_identity{i}M964 (d:ℚ) r
   have hp := third_gap_nonneg{i}M964 (d:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h
end
end MathGKM.Markov
'''
 (R/'research'/f'MarkovThirdGap{i}M964.lean').write_text(s)
(O/'column-generation.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
