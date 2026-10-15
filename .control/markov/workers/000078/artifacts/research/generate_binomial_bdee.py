"""Machine-authored auxiliary coefficient extraction algebra."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-bdee9a64'
data=json.loads((O/'rational-normalization.json').read_text())['low_numerator']
groups=[[] for _ in range(10)]
for ks,val in data:
 n,z,c,r,q,t,u,x=ks
 assert z==q==t==u==0 and '/' not in val
 term=val
 for name,pow in [('n',n),('c',c),('r',r)]:
  if pow:term+='*'+name+(f'^{pow}' if pow>1 else '')
 groups[x].append(term)
s='''import MarkovShapePartsBDEE
/-! Machine-authored bdee9a64. Exact binomial expression for the auxiliary
interior candidate. The source-to-numerator normalization remains separate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
set_option maxRecDepth 8192
def fallingFiveBDEE (x : ℤ) : ℤ := x*(x-1)*(x-2)*(x-3)*(x-4)
theorem fallingFive_natBDEE (z : ℕ) :
 fallingFiveBDEE z=120*(z.choose 5:ℤ) := by
 by_cases hz : 4≤z
 · have h := congrArg (fun n : ℕ => (n:ℤ)) (Nat.descFactorial_eq_factorial_mul_choose z 5)
   norm_num [Nat.descFactorial_succ,Nat.descFactorial_zero,Nat.cast_sub (by omega : 4≤z),
     Nat.cast_sub (by omega : 3≤z),Nat.cast_sub (by omega : 2≤z),
     Nat.cast_sub (by omega : 1≤z)] at h
   unfold fallingFiveBDEE
   linear_combination h
 · interval_cases z <;> norm_num [fallingFiveBDEE]
theorem fallingFive_shiftBDEE (j l : ℕ) (h : l≤j+5) :
 fallingFiveBDEE ((j:ℤ)+5-l)=120*((j+5-l).choose 5:ℤ) := by
 have hh := fallingFive_natBDEE (j+5-l)
 simpa only [Nat.cast_sub h,Nat.cast_add,Nat.cast_ofNat] using hh
'''
for i,g in enumerate(groups):s+=f'def lowNumerator{i}BDEE (n c r : ℤ) : ℤ :=\n '+' + '.join(g)+'\n'
def a(i):return f'lowNumerator{i}BDEE n c r'
fall='+'.join(f'({a(i)})*fallingFiveBDEE (j+5-{i})' for i in range(10))
s+=f'''theorem thirdShape_fallingBDEE (n c r j : ℤ) :
 8*thirdShapeBDEE n c r j={fall} := by
 unfold thirdShapeBDEE fallingFiveBDEE {' '.join(f'lowNumerator{i}BDEE' for i in range(10))}
 ring
'''
choose='+'.join(f'({a(i)})*((j+5-{i}).choose 5:ℤ)' for i in range(10))
s+=f'''theorem thirdShape_chooseBDEE (n c r : ℤ) (j : ℕ) (hj : 4≤j) :
 thirdShapeBDEE n c r j=15*({choose}) := by
 have h := thirdShape_fallingBDEE n c r j
 norm_num at h
'''
for i in range(10):s+=f' have h{i} := fallingFive_shiftBDEE j {i} (by omega)\n norm_num at h{i}\n rw [h{i}] at h\n'
s+=''' norm_num
 nlinarith only [h]
#print axioms thirdShape_chooseBDEE
end
end MathGKM.Markov
'''
(R/'research/MarkovShapeBinomialBDEE.lean').write_text(s.replace('≤',' ≤ '))
