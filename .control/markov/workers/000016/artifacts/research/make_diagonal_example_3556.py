"""Machine-authored generator of an explicit Lean source example, no evaluator axioms."""
import sys,pathlib
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
u={(1,0):1};v={(0,1):1};s={(0,0):1,(1,0):1,(0,1):1}
f=[{(0,0):1},add(u,v)]
for n in range(2,5):f.append(add(mul(s,f[-1]),mul(v,f[-2]),-1))
p=add(mul(f[4],f[4]),mul(v,mul(f[3],f[3])))
terms=[]
for i in range(9):
 row='+'.join(f'{p[(i,j)]}*X^{j}' for j in range(9) if (i,j) in p)
 if row:terms.append(f'C ({row})*X^{i}')
poly=' +\n      '.join(terms)
text='''import MarkovVerticalTwo3556

/-! Machine-authored request 3556cd95. Actual numerator-two diagonal
with a nonreal zero; this is NOT a failure of raw log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def rawSlice3556 (P : BiPoly) (d : ℕ) : Polynomial ℤ :=
  ∑ i ∈ Finset.range (d+1), C (coeff P i (d-i))*X^i

theorem two_sevenths_slice3556 : rawSlice3556 (frame [false,false,true]).mid.p 4=
    X^2*(14+28*X+15*X^2) := by
  have hp : (frame [false,false,true]).mid.p =
      POLY := by
    simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
      Bool.false_eq_true,if_false,if_true,S,U,V]
    norm_num
    simp only [map_add,map_mul,map_pow,map_ofNat]
    ring
  rw [hp]
  simp only [rawSlice3556,Finset.sum_range_succ,Finset.sum_range_zero,coeff,
    Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
  norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_one]
  ring

theorem source_diagonal_nonreal3556 :
    ∃ z : ℂ, z.im≠0 ∧ Polynomial.eval₂ (Int.castRingHom ℂ) z
      (rawSlice3556 (frame [false,false,true]).mid.p 4)=0 := by
  let z : ℂ := (-14+(Real.sqrt 14 : ℂ)*Complex.I)/15
  have hs : (Real.sqrt 14)^2=(14:ℝ) := Real.sq_sqrt (by norm_num)
  have hc : (Real.sqrt 14 : ℂ)^2=14 := by exact_mod_cast hs
  have hz : z.im≠0 := by
    have hp : 0<Real.sqrt 14 := Real.sqrt_pos.2 (by norm_num)
    dsimp [z]; simp
  have he : 14+28*z+15*z^2=0 := by
    dsimp [z]; ring_nf; norm_num [Complex.I_sq,hc]
  refine ⟨z,hz,?_⟩
  rw [two_sevenths_slice3556]
  simp only [Polynomial.eval₂_mul,Polynomial.eval₂_pow,Polynomial.eval₂_X,
    Polynomial.eval₂_add,Polynomial.eval₂_ofNat]
  rw [he,mul_zero]

#print axioms two_sevenths_slice3556
#print axioms source_diagonal_nonreal3556
end
end MathGKM.Markov
'''.replace('POLY',poly)
pathlib.Path('research/MarkovDiagonalExample3556.lean').write_text(text)
