"""Machine-authored exact certificate adapters. Ordinary Lean checks the results."""
from pathlib import Path
out='''import MarkovFirstDiagonalCertificateM2C6
/-! Machine-authored 2c6e5ef0. Exact template/certificate adapters. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
'''
for z in (0,1):
 for d in (1,2):
  s='true' if z else 'false';r='true' if d==1 else 'false'
  N=f'(3*(n+7)+{d})';T=f'(n+{8+z})'
  out+=f'''
theorem first_template_{z}_{d}M2C6 (n : ℕ) :
 (topTemplateMB3E {N} {T}).coeff 1*
 (topTemplateMB3E {N} (n+{10+z})).coeff 3 ≤
 (topTemplateMB3E {N} (n+{9+z})).coeff 2^2 := by
 have h0 := (top_edge_coeffsMB3E {N} {T} (by omega) (by omega)).2.1
 have h1 := (top_edge_coeffsMB3E {N} (n+{9+z}) (by omega) (by omega)).2.2
 have h2 := top_third_coeffMB3E {N} (n+{10+z}) (by omega) (by omega)
 rw [show {N}-2*(n+{9+z})+6=n+{9+d-2*z} by omega] at h1
 rw [show {N}+5-(n+{10+z})=2*n+{16+d-z} by omega,
   show {N}-(n+{10+z})+6=2*n+{17+d-z} by omega,
   show {N}-2*(n+{10+z})+9=n+{10+d-2*z} by omega,
   show {N}-2*(n+{10+z})+8=n+{9+d-2*z} by omega] at h2
 rw [h0,h1,h2]
 have he := expr_nonneg_certificateM6C0 _ (first_gap_signsM2C6 {s} {r}) (n:ℚ) 0
   (by positivity) (by norm_num)
 norm_num only [firstGapExprM2C6,exprEvalM6C0,choose_expr_evalM6C0,
   Bool.false_eq_true,if_false,if_true,Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul,Nat.cast_ofNat] at he
 have hh : ((4*((3*(n+7)+{d}:ℕ):ℤ)+24-12*(n+{8+z})) : ℤ)*
   (((2*n+{16+d-z}).choose 3:ℤ)+4*(
    ((2*n+{17+d-z}).choose 5:ℤ)-((n+{10+d-2*z}).choose 5:ℤ)-
    ((n:ℤ)+{7+z})*((n+{9+d-2*z}).choose 4:ℤ))) ≤
   (4*((n:ℤ)+{7+z})*((n+{9+d-2*z}).choose 2:ℤ))^2 := by
  have hQ : ((4*((3*(n+7)+{d}:ℕ):ℚ)+24-12*(n+{8+z})) : ℚ)*
   (((2*n+{16+d-z}).choose 3:ℚ)+4*(
    ((2*n+{17+d-z}).choose 5:ℚ)-((n+{10+d-2*z}).choose 5:ℚ)-
    ((n:ℚ)+{7+z})*((n+{9+d-2*z}).choose 4:ℚ))) ≤
   (4*((n:ℚ)+{7+z})*((n+{9+d-2*z}).choose 2:ℚ))^2 := by
   simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one]
   nlinarith only [he]
  exact_mod_cast hQ
 push_cast
 push_cast at hh
 convert hh using 1 <;> ring
'''
out+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovFirstDiagonalTemplateM2C6.lean').write_text(out)
