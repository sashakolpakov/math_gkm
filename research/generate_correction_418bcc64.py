"""Machine-authored 418bcc64. Generate exact identities; Lean verifies all algebra."""
from correction_polynomials_418bcc64 import *
head='''/-! Machine-authored request 418bcc64. Exact raw first-correction columns.
Python supplies proposed rational coefficients; every identity is checked by ring. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2
'''
src='import MarkovAugmentedSourceM7A3\n'+''.join(f'import MarkovColumn{i}MAE9\n' for i in range(1,6))+head
src+=(R/'research/MarkovColumn0MAE9.lean').read_text().split('def column0MAE9')[1].split('theorem source_column0MAE9')[0].join(['def column0MAE9','']).replace('column0MAE9','columnZeroM418').replace('column_explicit0MAE9','column_zero_explicitM418')
polys={}
for i in range(2,9):
 polys[i]={r:correction([F(2),F(1)],r,i) for r in [False,True]}
 src+=f'\ndef correctionColumn{i}M418 (x : ℚ) (r : Bool) : ℚ :=\n if r then {horner(polys[i][True])} else {horner(polys[i][False])}\n'
 src+=f'''theorem source_correction_column{i}M418 (q : ℕ) (r : Bool) :
 (threeRawM9E2 (q+2) r {i} (q+3):ℚ)=correctionColumn{i}M418 q r := by
'''
 if i==2:
  src+=''' have h := source_correction_outputM7A3 (q+2) 0 r (by omega)
 norm_num only [Nat.zero_add,augmentedOutputM7A3,show q+2+1=q+3 by omega] at h
 rw [h]
 cases r <;> norm_num [correctionColumn2M418,correctionConstantMDB2]
'''
 else:
  src+=f''' have h := source_first_correction_polynomialMAE9 (q+2) {i-3} r (by omega)
 norm_num only [Nat.reduceAdd,show q+2+1=q+3 by omega] at h
 rw [h,column_explicit{i-3}MAE9]
 cases r <;> simp only [sourceNME9C, Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   column{i-3}MAE9,correctionColumn{i}M418,
   {','.join(f'binomial_poly_{k}M295' for k in range(i-1))}] <;> ring
'''
src=src.replace('column_explicit0MAE9','column_zero_explicitM418').replace('column0MAE9','columnZeroM418')
src+='\nend\nend MathGKM.Markov\n'
(R/'research/MarkovCorrectionColumnsM418.lean').write_text(src)
src='import MarkovCorrectionColumnsM418\n'+head
for i in range(2,7):
 gaps={r:add(mul(polys[i+1][r],polys[i+1][r]),neg(mul(polys[i][r],polys[i+2][r]))) for r in [False,True]}
 assert all(c>=0 for a in gaps.values() for c in a)
 src+=f'\ndef correctionGap{i}M418 (x : ℚ) (r : Bool) : ℚ :=\n if r then {horner(gaps[True])} else {horner(gaps[False])}\n'
 src+=f'''theorem correction_gap_identity{i}M418 (x : ℚ) (r : Bool) :
 correctionColumn{i+1}M418 x r^2-correctionColumn{i}M418 x r*correctionColumn{i+2}M418 x r=
 correctionGap{i}M418 x r := by
 cases r <;> simp only [correctionColumn{i}M418,correctionColumn{i+1}M418,
   correctionColumn{i+2}M418,correctionGap{i}M418,Bool.false_eq_true,if_false,if_true] <;> ring

theorem correction_gap_nonneg{i}M418 (x : ℚ) (r : Bool) (hx : 0 ≤ x) :
 0 ≤ correctionGap{i}M418 x r := by
 cases r <;> simp only [correctionGap{i}M418,Bool.false_eq_true,if_false,if_true] <;> positivity

theorem source_correction_horizontal{i}M418 (q : ℕ) (r : Bool) :
 threeRawM9E2 (q+2) r {i} (q+3)*threeRawM9E2 (q+2) r {i+2} (q+3) ≤
   threeRawM9E2 (q+2) r {i+1} (q+3)^2 := by
 have h : (threeRawM9E2 (q+2) r {i} (q+3):ℚ)*(threeRawM9E2 (q+2) r {i+2} (q+3):ℚ) ≤
   (threeRawM9E2 (q+2) r {i+1} (q+3):ℚ)^2 := by
   rw [source_correction_column{i}M418,source_correction_column{i+1}M418,
     source_correction_column{i+2}M418]
   have he := correction_gap_identity{i}M418 (q:ℚ) r
   have hp := correction_gap_nonneg{i}M418 (q:ℚ) r (by positivity)
   linarith only [he,hp]
 exact_mod_cast h
'''
src+='\nend\nend MathGKM.Markov\n'
(R/'research/MarkovCorrectionGapsM418.lean').write_text(src)
print('Generated source column identities 2..8 and horizontal gaps 2..6.')
