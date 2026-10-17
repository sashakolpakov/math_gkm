"""Machine-authored positive total-gap certificates; Lean checks all identities."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8d0715b'
def horner(p,vs):
 if not vs:return str(next(iter(p.values())))
 n=max(k[0] for k in p);parts={}
 for k,v in p.items():parts.setdefault(k[0],{})[k[1:]]=v
 s=horner(parts[n],vs[1:])
 for j in range(n-1,-1,-1):
  s=f'({s})*{vs[0]}'
  if j in parts:s+=f'+({horner(parts[j],vs[1:])})'
 return s
def run():
 for i in [2,3,4]:
  src='''import MarkovMiddleRationalMF8D
/-! Machine-authored f8d0715b. Positive polynomial certificate for the TOTAL
middle source gap; template, mixed, and correction terms all retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 60000000
set_option maxRecDepth 150000
attribute [local irreducible] middleQMF8D
'''
  for r in [False,True]:
   row=json.loads((O/f'middle-polynomial-{i}-{int(r)}-0.json').read_text())
   p={(a,b):int(v) for a,b,v in row['coefficients']};den=row['scale'];rhs=horner(p,['x','k']);s='true' if r else 'false'
   strict=(0,0) in p;rel='<' if strict else '≤'
   src+=f'''
theorem middle_total_{i}_{s}_certificateMF8D (x k : ℚ) (hx : 0 ≤ x) (hk : 0 ≤ k) :
 middleQMF8D x k {s} {i}*middleQMF8D x k {s} {i+2} {rel} middleQMF8D x k {s} {i+1}^2 := by
 have he : {den}*(middleQMF8D x k {s} {i+1}^2-
   middleQMF8D x k {s} {i}*middleQMF8D x k {s} {i+2})=
   {rhs} := by
   unfold middleQMF8D correctionQMF8D middleKernelQMF8D topShortQMEB6
   norm_num [sum_range_succ,Nat.choose,choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ) {rel} {rhs} := by positivity
 linarith only [he,hp]
'''
  src+=f'''
theorem middle_gap_{i}_nonnegMF8D (x k : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r {i} x k := by
 cases r
 · have h := middle_total_{i}_false_certificateMF8D x k (by positivity) (by positivity)
   rw [←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at h
   have hh : middleRawMD02 x k false {i}*middleRawMD02 x k false {i+2} ≤
     middleRawMD02 x k false {i+1}^2 := by exact_mod_cast {'h.le' if i<4 else 'h'}
   exact sub_nonneg.mpr hh
 · have h := middle_total_{i}_true_certificateMF8D x k (by positivity) (by positivity)
   rw [←middle_raw_castMF8D,←middle_raw_castMF8D,←middle_raw_castMF8D] at h
   have hh : middleRawMD02 x k true {i}*middleRawMD02 x k true {i+2} ≤
     middleRawMD02 x k true {i+1}^2 := by exact_mod_cast h.le
   exact sub_nonneg.mpr hh
end
end MathGKM.Markov
'''
  p=R/f'research/MarkovMiddleTotalC{i+3}MF8D.lean';p.write_text(src);print(p.name,len(src))
if __name__=='__main__':run()
