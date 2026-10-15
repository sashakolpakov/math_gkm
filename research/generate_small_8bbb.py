"""Machine-authored finite polynomial identities and all-index zero-tail proofs."""
from pathlib import Path
data={(2,1):[24,132,300,360,240,84,12],(3,1):[120,636,1392,1614,1056,384,72,6],
 (3,2):[210,1200,2904,3864,3072,1488,432,72,6]}
s='''import MarkovThirdOneBridge8BBB
import MarkovThirdAllCycles8BBB
/-! Machine-authored request 8bbb934e. All coefficient positions for the
three exceptional run-one predecessor labels; zeros are not filtered. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
'''
for (c,r),a in data.items():
 name=f'{c}{r}';pol=' + '.join(str(z)+('' if j==0 else f'*X^{j}') for j,z in enumerate(a));N=len(a)
 s+=f'''theorem corrected_one_{name}8BBB :
 correctedThirdRun8BBB 1 {c} {r}=({pol}:ℤ[X]) := by
 unfold correctedThirdRun8BBB
'''
 if c==2:s+=' rw [thirdRun_one_two8BBB]\n'
 else:s+=f' rw [thirdRun_one_expand8BBB {c} {r} (by decide)]\n'
 s+=''' norm_num [thirdOnePoly8BBB,thirdOneSeq8BBB,firstRunPolyADB2,lowerH487,
   runSumA27,Finset.sum_range_succ]
 <;> ring
'''
 s+=f'''theorem corrected_one_lc_{name}8BBB (j : ℕ) :
 (correctedThirdRun8BBB 1 {c} {r}).coeff j*(correctedThirdRun8BBB 1 {c} {r}).coeff (j+2)≤
   ((correctedThirdRun8BBB 1 {c} {r}).coeff (j+1))^2 := by
 rw [corrected_one_{name}8BBB]
 by_cases hj : j<{N-2}
 · interval_cases j <;> norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X,Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ]
 · have hz : ({pol}:ℤ[X]).coeff (j+2)=0 := by
'''
 for k in range(N):s+=f'     have h{k} : j+2≠{k} := by omega\n'
 s+=f'''     simp only [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
       Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ,{','.join('h'+str(k) for k in range(N))},if_false,mul_zero,add_zero]
   rw [hz,mul_zero]
   exact sq_nonneg _
'''
s+='''
theorem corrected_one_small_lc8BBB (c r : ℕ) (hc : c<4) (hr : 0<r) (hrc : r<c) (j : ℕ) :
 (correctedThirdRun8BBB 1 c r).coeff j*(correctedThirdRun8BBB 1 c r).coeff (j+2)≤
   ((correctedThirdRun8BBB 1 c r).coeff (j+1))^2 := by
 have h : c=2 ∧ r=1 ∨ c=3 ∧ r=1 ∨ c=3 ∧ r=2 := by omega
 rcases h with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
 · exact corrected_one_lc_218BBB j
 · exact corrected_one_lc_318BBB j
 · exact corrected_one_lc_328BBB j
#print axioms corrected_one_small_lc8BBB
end
end MathGKM.Markov
'''
Path('research/MarkovThirdOneSmall8BBB.lean').write_text(s)
