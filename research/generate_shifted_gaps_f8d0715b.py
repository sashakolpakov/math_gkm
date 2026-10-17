"""Machine-authored shifted positive total-gap certificates, columns 8 and 9."""
from pathlib import Path
from math import lcm
import json
import sys
from middle_polynomial_probe_f8d0715b import raw,add,mul,scale,serial
from generate_middle_gaps_f8d0715b import horner
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8d0715b'
def run():
 for i in (list(map(int,sys.argv[1:])) or [5,6]):
  src='''import MarkovMiddleRationalMF8D
/-! Machine-authored f8d0715b. Positive TOTAL middle gap after the exact
integer depth shift k -> k+1. The k=0 row is handled separately. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 100000000
set_option maxRecDepth 200000
attribute [local irreducible] middleQMF8D
'''
  for r in [False,True]:
   a,b,c=[raw(j,r,1) for j in range(i,i+3)];g=add(mul(b,b),scale(mul(a,c),-1))
   assert all(v>0 for v in g.values()) and g[(0,0)]>0
   den=lcm(*(v.denominator for v in g.values()));g=scale(g,den)
   (O/f'shifted-polynomial-{i}-{int(r)}.json').write_text(json.dumps(dict(i=i,r=r,K=1,scale=den,coefficients=serial(g)),indent=2))
   rhs=horner({z:int(v) for z,v in g.items()},['x','k']);s='true' if r else 'false'
   expand='choosePolyM0D3,descPochhammer_succ_right,Polynomial.eval_mul,Polynomial.eval_sub,Polynomial.eval_X,Polynomial.eval_natCast,Nat.factorial' if i>=6 else 'choose_poly_succM0D3,choose_poly_zeroM0D3'
   src+=f'''
theorem middle_shift_{i}_{s}_certificateMF8D (x k : ℚ) (hx : 0 ≤ x) (hk : 0 ≤ k) :
 middleQMF8D x (k+1) {s} {i}*middleQMF8D x (k+1) {s} {i+2} <
 middleQMF8D x (k+1) {s} {i+1}^2 := by
 have he : {den}*(middleQMF8D x (k+1) {s} {i+1}^2-
   middleQMF8D x (k+1) {s} {i}*middleQMF8D x (k+1) {s} {i+2})=
   {rhs} := by
   unfold middleQMF8D correctionQMF8D middleKernelQMF8D topShortQMEB6
   norm_num [sum_range_succ,Nat.choose,{expand}]
   ring
 have hp : (0:ℚ) < {rhs} := by positivity
 linarith only [he,hp]
'''
  src+=f'''
theorem middle_gap_shift_{i}_positiveMF8D (x k : ℕ) (r : Bool) :
 0 < middleGapMD02 r {i} x (k+1) := by
 have hc : (k:ℚ)+1=((k+1:ℕ):ℚ) := by norm_cast
 cases r
 · have h := middle_shift_{i}_false_certificateMF8D x k (by positivity) (by positivity)
   rw [hc,←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at h
   have hh : middleRawMD02 x (k+1) false {i}*middleRawMD02 x (k+1) false {i+2} <
     middleRawMD02 x (k+1) false {i+1}^2 := by exact_mod_cast h
   exact sub_pos.mpr hh
 · have h := middle_shift_{i}_true_certificateMF8D x k (by positivity) (by positivity)
   rw [hc,←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at h
   have hh : middleRawMD02 x (k+1) true {i}*middleRawMD02 x (k+1) true {i+2} <
     middleRawMD02 x (k+1) true {i+1}^2 := by exact_mod_cast h
   exact sub_pos.mpr hh
end
end MathGKM.Markov
'''
  p=R/f'research/MarkovMiddleTotalC{i+3}MF8D.lean';p.write_text(src);print(p.name,len(src))
if __name__=='__main__':run()
