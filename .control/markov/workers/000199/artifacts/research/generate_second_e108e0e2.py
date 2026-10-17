"""Machine-authored total physical-column-two gap certificates."""
from pathlib import Path
from math import comb,lcm
from fractions import Fraction as F
from central_low_probe_e108e0e2 import add,mul,scale,raw
src='import MarkovCentralSecondME10\n/-! Machine-authored e108e0e2. Total column-two raw gap. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Finset\nset_option maxHeartbeats 20000000\nset_option maxRecDepth 50000\nset_option linter.unusedSimpArgs false\n'
for h in range(4):
 for r in [False,True]:
  k0=max(0,3-h);k=[F(k0),F(1)];q=add(scale(k,2),[F(h+int(r))]);ksq=mul(k,k);kcu=mul(k,k,k)
  jet=add(scale(k,2),scale(kcu,-10),scale(mul(q,k),2),scale(mul(q,ksq),6)) if r else add(scale(k,-2),scale(ksq,12),scale(kcu,-10),scale(mul(q,k),-2),scale(mul(q,ksq),6))
  second=add(scale(add(scale(k,3),[F(h+int(r)+1)]),4*comb(h+2,2)),jet)
  a=raw(h,k0,0,r);b=raw(h,k0,1,r);p=add(mul(a,a),scale(mul(second,b),-1));assert all(v>=0 for v in p)
  den=lcm(*(v.denominator for v in p));ns=[int(v*den) for v in p];expr=str(ns[-1])
  for n in ns[-2::-1]:expr=f'(({expr})*z+{n})'
  rr=str(r).lower()
  src+=f'''\ntheorem central_second_cert_{h}_{rr}ME10 (z : ℚ) (hz : 0 ≤ z) :
 centralSecondME10 {h} (z+{k0}) {rr}*centralQValueME10 {h} (z+{k0}) 1 {rr} ≤
 centralQValueME10 {h} (z+{k0}) 0 {rr}^2 := by
 have he : {den}*(centralQValueME10 {h} (z+{k0}) 0 {rr}^2-
   centralSecondME10 {h} (z+{k0}) {rr}*centralQValueME10 {h} (z+{k0}) 1 {rr})={expr} := by
   unfold centralSecondME10 correctionJet2M80F centralQValueME10 topShortQME10 correctionShortQME10 middleKernelQMF8D
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) ≤ {expr} := by positivity
 linarith only [he,hp]
'''
src+='''\ntheorem central_second_gapME10 (h k : ℕ) (r : Bool) (hh : h ≤ 3) (hk : 3 ≤ k+h) :
 centralSecondME10 h k r*centralQValueME10 h k 1 r ≤ centralQValueME10 h k 0 r^2 := by
 interval_cases h <;> cases r
'''
for h in range(4):
 for r in ['false','true']:
  k0=max(0,3-h)
  src+=f''' · have hk0 : {k0} ≤ k := by omega
   have he := central_second_cert_{h}_{r}ME10 ((k:ℚ)-{k0}) (by
     have hkQ : ({k0}:ℚ) ≤ k := by exact_mod_cast hk0
     exact sub_nonneg.mpr hkQ)
   simpa only [sub_add_cancel,Nat.cast_ofNat,Nat.cast_zero,Nat.cast_one] using he
'''
src+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovCentralSecondGapME10.lean').write_text(src)
print({'certificates':8,'positive_coefficients':True,'status':'Unaccepted until Lean validation.'})
