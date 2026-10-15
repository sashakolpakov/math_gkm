"""Machine-authored small-cycle identities, checked by symbolic Lean algebra."""
from pathlib import Path
from verify_third_75ad import source,path_for
R=Path('/Users/sasha/math_gkm')
for n in [2,3]:
 text=f'''import MarkovSmallPoly{n}FD
import MarkovThirdAllCycles8BBB
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem small_poly_all{n}FD (c r : ℕ) :
 thirdRunPolyADB2 {n} c r=smallPoly{n}FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)+
 (if c=2 then 6*firstRunPolyADB2 {n} c r*X^{2*n+3} else 0) := by
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 rw [source_denominatorFDDA,mul_add,small_factor{n}FD]
 norm_num only [Nat.cast_ofNat]
 rw [←low_band_polyFDDA ({n}:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 unfold delayedRFDDA
 split_ifs <;> norm_num only [Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul,Int.cast_ofNat]
 <;> ring
'''
 for c,r in [(2,1),(3,1),(3,2)]:
  a=n*c+r;b=(n+1)*c+r
  aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
  arr=[6*p.get((a+3-j,j),0) for j in range(a+4)]
  while arr and arr[-1]==0:arr.pop()
  expr=' + '.join(f'{v}*X^{j}' for j,v in enumerate(arr) if v)
  name=f'small_cycle{n}_{c}{r}FD'
  text+=f'''theorem {name} :
 correctedThirdRun8BBB {n} {c} {r}=({expr}:ℤ[X]) := by
 unfold correctedThirdRun8BBB
 rw [small_poly_all{n}FD]
 norm_num [smallPoly{n}FD,'''+','.join(f'small{n}_{j}FD' for j in range(3*n+6))+f''',
   firstRunPolyADB2,lowerH487,runSumA27,Finset.sum_range_succ]
 <;> ring
theorem {name}_lc (j : ℕ) :
 (correctedThirdRun8BBB {n} {c} {r}).coeff j*(correctedThirdRun8BBB {n} {c} {r}).coeff (j+2) ≤
 ((correctedThirdRun8BBB {n} {c} {r}).coeff (j+1))^2 := by
 rw [{name}]
 by_cases hj : j ≤ {len(arr)-3}
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : ({expr}:ℤ[X]).coeff (j+2)=0 := by
'''
  for k in range(len(arr)):text+=f'    have h{k} : j+2≠{k} := by omega\n'
  text+='    simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,\n      '+','.join(f'h{k}' for k in range(len(arr)))+',if_false,mul_zero,add_zero]\n'
  text+='   rw [hz,mul_zero]\n   exact sq_nonneg _\n'
 text+=f'''theorem small_cycles_lc{n}FD (c r : ℕ) (hc : c<4) (hr : 0<r) (hrc : r<c) (j : ℕ) :
 (correctedThirdRun8BBB {n} c r).coeff j*(correctedThirdRun8BBB {n} c r).coeff (j+2) ≤
 ((correctedThirdRun8BBB {n} c r).coeff (j+1))^2 := by
 have hc' : 2 ≤ c := by omega
 interval_cases c <;> interval_cases r
 · exact small_cycle{n}_21FD_lc j
 · exact small_cycle{n}_31FD_lc j
 · exact small_cycle{n}_32FD_lc j
end
end MathGKM.Markov
'''
 (R/f'research/MarkovSmallCycles{n}FD.lean').write_text(text)
print('Generated six exact small-cycle polynomial identities and inequalities.')
