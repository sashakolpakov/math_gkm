"""Machine-authored exact certificates; generated expressions require Lean proof."""
from pathlib import Path
from fractions import Fraction
from math import comb
import json
from uniform_shape_8bbb import Q,var,subst,horner
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-07f1d410'
# Adapt the inspected, side-effect-free generator text into a distinct generator.
old=(R/'research/generate_lc_bdee.py').read_text()
new=old.replace('markov-bdee9a64','markov-07f1d410').replace('BDEE','07F1')
new=new.replace('t+s+6','t+s+5').replace('n-j-1','n-j').replace('j+1≤n','j≤n')
# Reuse the established shape definition, avoid defining it again.
new=new.replace("src='import MathGKM.Markov\\n", "src='import MarkovShapePartsBDEE\\n")
start="src+='def thirdShape07F1 (n c r j : ℤ) : ℤ :=\\n '+horner(p,['n','c','r','j'])+'\\n'"
new=new.replace(start, "# Existing shape definition is imported.")
new=new.replace('thirdShape07F1','thirdShapeBDEE')
# Its source import and final theorem name intentionally refer to this run.
new=new.replace('theorem thirdShape_shift_lc07F1','theorem thirdShape_shift_lc07F1')
new=new.replace("have h0 : j-5+(n-j)+6=n", "have h0 : j-5+(n-j)+5=n")
(R/'research/generate_extended_07f1.py').write_text(new)
exec(compile(new,str(R/'research/generate_extended_07f1.py'),'exec'))
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
low=[(tuple(k),Fraction(v)) for k,v in data['low_numerator']]
cs=[]
for j in range(6):
 d=Q()
 for k,v in low:
  if k[7]<=j:
   key=(k[0],k[2],k[3],0);d=d+Q({key:v*comb(j-k[7]+5,5)})
 cs.append(d)
header='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
'''
src='import MarkovInteriorSourceFDDA\n/-! Machine-authored 07f1d410. Exact low coefficients, not interpolation. -/\n'+header
for j,p in enumerate(cs):
 src+=f'def firstCoeff{j}07F1 (n c r : ℤ) : ℤ :=\n '+horner(p,['n','c','r','unused'])+'\n'
src+='''theorem extract_monomial07F1 (a : ℤ) (l j : ℕ) :
 PowerSeries.coeff j (inverseSixFDDA*((C a*X^l:ℤ[X]):PowerSeries ℤ))=
 if l≤j then a*((j-l+5).choose 5 : ℤ) else 0 := by
 simp only [Polynomial.coe_mul,Polynomial.coe_C,Polynomial.coe_pow,Polynomial.coe_X]
 rw [show inverseSixFDDA*(PowerSeries.C a*PowerSeries.X^l)=
   PowerSeries.C a*(PowerSeries.X^l*inverseSixFDDA) by ring]
 rw [PowerSeries.coeff_C_mul,PowerSeries.coeff_X_pow_mul']
 split_ifs <;> simp [inverseSix_coeffFDDA]
'''
for j in range(6):
 src+=f'''theorem first_coeff_{j}07F1 (n c r : ℕ) (hn : {j}<n+2) :
 (thirdRunPolyADB2 n c r).coeff {j}=firstCoeff{j}07F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) {j} (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num
 unfold firstCoeff{j}07F1 {' '.join(f'lowNumerator{k}BDEE' for k in range(j+1))}
 ring
'''
src+='end\nend MathGKM.Markov\n'
(R/'research/MarkovFirstCoefficients07F1.lean').write_text(src)
s,u,v,_=map(var,range(4)); stats=[]
for j in range(4):
 vs=[s+j+1,u+v+2,u+1,Q()]
 vals=[subst(cs[k],vs) for k in range(j,j+3)]
 gap=vals[1]**2-vals[0]*vals[2]
 neg=[(k,x) for k,x in gap.items() if x<0]
 stats.append(dict(left_index=j,terms=len(gap),negative_terms=neg))
 if neg:continue
 expr=horner(gap,['s','u','v','unused'])
 src='import MarkovFirstCoefficients07F1\n'+header+f'''theorem first_gap_{j}07F1 (n c r : ℤ)
 (hn : {j+1}≤n) (hr : 1≤r) (hc : r+1≤c) :
 firstCoeff{j}07F1 n c r*firstCoeff{j+2}07F1 n c r≤(firstCoeff{j+1}07F1 n c r)^2 := by
 let s := n-{j+1}
 let u := r-1
 let v := c-r-1
 have hs : 0≤s := by dsimp [s]; omega
 have hu : 0≤u := by dsimp [u]; omega
 have hv : 0≤v := by dsimp [v]; omega
 have he : (firstCoeff{j+1}07F1 n c r)^2-firstCoeff{j}07F1 n c r*firstCoeff{j+2}07F1 n c r={expr} := by
  dsimp [firstCoeff{j}07F1,firstCoeff{j+1}07F1,firstCoeff{j+2}07F1,s,u,v]
  ring
 have hp : 0≤{expr} := by positivity
 omega
#print axioms first_gap_{j}07F1
end
end MathGKM.Markov
'''
 (R/f'research/MarkovFirstGap{j}07F1.lean').write_text(src)
(O/'first-band-generation.json').write_text(json.dumps(dict(status='Exact symbolic certificate generation; mathematical acceptance requires Lean.',gaps=stats),indent=2)+'\n')
print(json.dumps(stats))
