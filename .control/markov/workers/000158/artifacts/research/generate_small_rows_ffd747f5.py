"""Machine-authored exact source polynomial candidates; Lean checks every equality."""
from pathlib import Path
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm')
lines=['import MarkovLowerShapeME9C','import MarkovHorizontalB46',
 '/-! Machine-authored ffd747f5. Exact small source rows, checked by ring algebra. -/',
 'namespace MathGKM.Markov','noncomputable section','open Polynomial',
 'set_option maxHeartbeats 8000000','set_option maxRecDepth 10000']
for q in range(1,5):
 for r in [False,True]:
  path=[False]*(q-1)+[True,r];a,n,p=frame(path)
  ps='['+','.join(str(x).lower() for x in path)+']';b=str(r).lower();tag=f'{q}{"T" if r else "F"}'
  def row(j):return '+'.join(f'{c}*X^{i}' for (i,k),c in sorted(p.items()) if k==j) or '0'
  poly=' +\n '.join(f'C ({row(j)})*X^{j}' for j in range(n+3))
  lines += [f'theorem fifth_small_poly{tag}MFFD : Bivariate.swap (frame {ps}).mid.p=\n {poly} := by',
   ' simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,',
   '   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,',
   '   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]', ' norm_num',' ring',
   f'theorem fifth_small_row{tag}MFFD (i : ℕ) : threeRawM9E2 {q} {b} i 5=({row(5)}:Polynomial ℤ).coeff i := by',
   f' rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 {q-1} {b}]',
   f' change coeff (frame {ps}).mid.p i 5=_',
   f' rw [←swap_coeff46,fifth_small_poly{tag}MFFD]',
   ' simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]', ' norm_num']
lines += ['end','end MathGKM.Markov']
(R/'research/MarkovFifthSmallRowsMFFD.lean').write_text('\n'.join(lines)+'\n')
print({'candidate':'research/MarkovFifthSmallRowsMFFD.lean','source_polynomials':8,'lines':len(lines)})
