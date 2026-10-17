"""Machine-authored generation of ordinary Lean symbolic identities, fixed s=0.
Every generated equation must be independently elaborated and kernel checked.
"""
from fixed_parameter_1c65a306 import *
RDIR=Path('/Users/sasha/math_gkm/research')
def expr(p,vs=('h','j','r')):
 ts=[]
 for e,v in sorted(p.items()):
  c=str(v.numerator) if v.denominator==1 else f'({v.numerator}/{v.denominator})'
  t=c
  for n,x in zip(e,vs):
   if n:t+='*'+x+('^'+str(n) if n>1 else '')
  ts.append(t)
 return ' +\n   '.join(ts) or '0'
header='''import MarkovRisingConvolutionM1C6
/-! Machine-authored 1c65a306. Symbolic summation identities, no finite scan. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 12000
'''
src=header
for m in range(11):
 src+=f'''
theorem power_sum_{m}M1C6 (h : ℕ) :
 (∑ r ∈ range (h+1), (r:ℝ)^{m})={expr(S[m],('(h:ℝ)','j','r'))} := by
 induction h with
 | zero => norm_num
 | succ h ih =>
   rw [show h+1+1=(h+1)+1 by omega,sum_range_succ,ih]
   push_cast
   ring
'''
src+='\nend\nend MathGKM.Markov\n'
(RDIR/'MarkovPowerSumsM1C6.lean').write_text(src)
src=header.replace('import MarkovRisingConvolutionM1C6','import MarkovPowerSumsM1C6')
for label,a,b in [('A',3,5),('B',4,4)]:
 interior=scale(mul(mul(R,add(H,R,-1)),mul(rising(add(K,R,-1),a),rising(add(add(K,H,-1),R),b))),16)
 summed=sumr(interior)
 closed=sub(raw(a-3,b-3),[H,add(K,H,-1),R])
 src+=f'\ndef closed{label}M1C6 (j h : ℝ) : ℝ :=\n {expr(closed)}\n'
 coeffs=[]
 for m in range(11):
  c={(h,j,0):v for (h,j,r),v in interior.items() if r==m}
  if c:coeffs.append(f'({expr(c,vs=("(h:ℝ)","j","r"))})*(r:ℝ)^{m}')
 expand=' +\n    '.join(coeffs)
 src+=f'''
theorem interior_{label}_sumM1C6 (j : ℝ) (h : ℕ) :
 (∑ r ∈ range (h+1),16*(r:ℝ)*((h:ℝ)-r)*riseM1C6 {a} (j-r)*riseM1C6 {b} (j-h+r))=
 {expr(summed,vs=('(h:ℝ)','j','r'))} := by
 have ht (r : ℕ) : 16*(r:ℝ)*((h:ℝ)-r)*riseM1C6 {a} (j-r)*riseM1C6 {b} (j-h+r)=
    {expand} := by
   unfold riseM1C6
   norm_num only [prod_range_succ,prod_range_zero,Nat.reduceAdd,Nat.cast_zero,Nat.cast_one,
     Nat.cast_ofNat,mul_one,add_zero]
   ring
 simp_rw [ht]
 simp only [sum_add_distrib,←mul_sum,{','.join('power_sum_'+str(m)+'M1C6' for m in range(11))}]
 ring

theorem closed_{label}_coeffM1C6 (j h : ℕ) (h0 : 1 ≤ h) (hh : h ≤ j) :
 ({factorial(a)*factorial(b)}:ℝ)*(qPolyM7E2 j {a-3}*qPolyM7E2 j {b-3}).coeff (2*j-h)=closed{label}M1C6 j h := by
 have he := scaled_reverse_productM1C6 j {a-3} {b-3} h hh
 norm_num only [Nat.reduceAdd,Nat.factorial,Nat.cast_ofNat] at he
 rw [rising_weighted_sumM1C6 {a} {b} j h h0,interior_{label}_sumM1C6] at he
 convert he using 1
 unfold closed{label}M1C6 riseM1C6
 norm_num only [prod_range_succ,prod_range_zero,Nat.reduceAdd,Nat.cast_zero,Nat.cast_one,
   Nat.cast_ofNat,mul_one,add_zero]
 ring
'''
src+='\nend\nend MathGKM.Markov\n'
(RDIR/'MarkovFixedZeroFormulaM1C6.lean').write_text(src)
# Factor the shifted exact gap by positive linear polynomials over Q.
A=raw(0,2);B=raw(1,1)
prev=lambda p:sub(p,[add(H,C(-1)),add(K,C(1)),R])
gap=sub(add(mul(prev(B),A),mul(B,prev(A)),-1),[add(H,C(2)),K,R])
def divide(p,line):
 p=dict(p);q={};lead=max(line);lv=line[lead]
 while p:
  e=max(p)
  if any(x<y for x,y in zip(e,lead)):return None
  d=tuple(x-y for x,y in zip(e,lead));v=p[e]/lv
  q[d]=q.get(d,F(0))+v;p=add(p,mul({d:v},line),-1)
 return q
factors=[]
for a,b in [(0,1),(1,0),(1,1),(1,2),(2,1),(2,2)]:
 for c in range(0,16):
  line=add(add(scale(H,a),scale(K,b)),C(c))
  while True:
   q=divide(gap,line)
   if q is None:break
   factors.append((a,b,c));gap=q
print('fixed-s=0 factors',factors,'remaining terms',len(gap),'negative',sum(v<0 for v in gap.values()))
(O/'fixed-zero-factorization.json').write_text(json.dumps(dict(factors=factors,core=serial(gap)),indent=2)+'\n')
src=header.replace('import MarkovRisingConvolutionM1C6','import MarkovFixedZeroFormulaM1C6')
src+=f'\ndef zeroGapCoreM1C6 (h k : ℝ) : ℝ :=\n {expr(gap,vs=("h","k","r"))}\n'
fact='*'.join(f'({a}*h+{b}*k+{c})' for a,b,c in factors)
src+=f'\ndef zeroGapFactorM1C6 (h k : ℝ) : ℝ := {fact}*zeroGapCoreM1C6 h k\n'
src+='''
theorem zero_gap_factorM1C6 (h k : ℝ) :
 closedBM1C6 (h+2+k) (h+1)*closedAM1C6 (h+2+k) (h+2)-
 closedBM1C6 (h+2+k) (h+2)*closedAM1C6 (h+2+k) (h+1)=zeroGapFactorM1C6 h k := by
 unfold closedAM1C6 closedBM1C6 zeroGapFactorM1C6 zeroGapCoreM1C6
 ring

theorem zero_gap_positiveM1C6 (h k : ℝ) (hh : 0 ≤ h) (hk : 0 ≤ k) :
 0 < zeroGapFactorM1C6 h k := by
 unfold zeroGapFactorM1C6 zeroGapCoreM1C6
 positivity

end
end MathGKM.Markov
'''
(RDIR/'MarkovFixedZeroPositiveM1C6.lean').write_text(src)
