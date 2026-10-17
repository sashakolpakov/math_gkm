import MarkovFirstDiagonalCertificateM2C6
/-! Machine-authored 2c6e5ef0. Exact template/certificate adapters. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000

theorem first_template_0_1M2C6 (n : ℕ) :
 (topTemplateMB3E (3*(n+7)+1) (n+8)).coeff 1*
 (topTemplateMB3E (3*(n+7)+1) (n+10)).coeff 3 ≤
 (topTemplateMB3E (3*(n+7)+1) (n+9)).coeff 2^2 := by
 have h0 := (top_edge_coeffsMB3E (3*(n+7)+1) (n+8) (by omega) (by omega)).2.1
 have h1 := (top_edge_coeffsMB3E (3*(n+7)+1) (n+9) (by omega) (by omega)).2.2
 have h2 := top_third_coeffMB3E (3*(n+7)+1) (n+10) (by omega) (by omega)
 rw [show (3*(n+7)+1)-2*(n+9)+6=n+10 by omega] at h1
 rw [show (3*(n+7)+1)+5-(n+10)=2*n+17 by omega,
   show (3*(n+7)+1)-(n+10)+6=2*n+18 by omega,
   show (3*(n+7)+1)-2*(n+10)+9=n+11 by omega,
   show (3*(n+7)+1)-2*(n+10)+8=n+10 by omega] at h2
 rw [h0,h1,h2]
 have he := expr_nonneg_certificateM6C0 _ (first_gap_signsM2C6 false true) (n:ℚ) 0
   (by positivity) (by norm_num)
 norm_num only [firstGapExprM2C6,exprEvalM6C0,choose_expr_evalM6C0,
   Bool.false_eq_true,if_false,if_true,Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul,Nat.cast_ofNat] at he
 have hh : ((4*((3*(n+7)+1:ℕ):ℤ)+24-12*(n+8)) : ℤ)*
   (((2*n+17).choose 3:ℤ)+4*(
    ((2*n+18).choose 5:ℤ)-((n+11).choose 5:ℤ)-
    ((n:ℤ)+7)*((n+10).choose 4:ℤ))) ≤
   (4*((n:ℤ)+7)*((n+10).choose 2:ℤ))^2 := by
  have hQ : ((4*((3*(n+7)+1:ℕ):ℚ)+24-12*(n+8)) : ℚ)*
   (((2*n+17).choose 3:ℚ)+4*(
    ((2*n+18).choose 5:ℚ)-((n+11).choose 5:ℚ)-
    ((n:ℚ)+7)*((n+10).choose 4:ℚ))) ≤
   (4*((n:ℚ)+7)*((n+10).choose 2:ℚ))^2 := by
   simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat]
   nlinarith only [he]
  exact_mod_cast hQ
 push_cast
 push_cast at hh
 convert hh using 1 <;> ring

theorem first_template_0_2M2C6 (n : ℕ) :
 (topTemplateMB3E (3*(n+7)+2) (n+8)).coeff 1*
 (topTemplateMB3E (3*(n+7)+2) (n+10)).coeff 3 ≤
 (topTemplateMB3E (3*(n+7)+2) (n+9)).coeff 2^2 := by
 have h0 := (top_edge_coeffsMB3E (3*(n+7)+2) (n+8) (by omega) (by omega)).2.1
 have h1 := (top_edge_coeffsMB3E (3*(n+7)+2) (n+9) (by omega) (by omega)).2.2
 have h2 := top_third_coeffMB3E (3*(n+7)+2) (n+10) (by omega) (by omega)
 rw [show (3*(n+7)+2)-2*(n+9)+6=n+11 by omega] at h1
 rw [show (3*(n+7)+2)+5-(n+10)=2*n+18 by omega,
   show (3*(n+7)+2)-(n+10)+6=2*n+19 by omega,
   show (3*(n+7)+2)-2*(n+10)+9=n+12 by omega,
   show (3*(n+7)+2)-2*(n+10)+8=n+11 by omega] at h2
 rw [h0,h1,h2]
 have he := expr_nonneg_certificateM6C0 _ (first_gap_signsM2C6 false false) (n:ℚ) 0
   (by positivity) (by norm_num)
 norm_num only [firstGapExprM2C6,exprEvalM6C0,choose_expr_evalM6C0,
   Bool.false_eq_true,if_false,if_true,Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul,Nat.cast_ofNat] at he
 have hh : ((4*((3*(n+7)+2:ℕ):ℤ)+24-12*(n+8)) : ℤ)*
   (((2*n+18).choose 3:ℤ)+4*(
    ((2*n+19).choose 5:ℤ)-((n+12).choose 5:ℤ)-
    ((n:ℤ)+7)*((n+11).choose 4:ℤ))) ≤
   (4*((n:ℤ)+7)*((n+11).choose 2:ℤ))^2 := by
  have hQ : ((4*((3*(n+7)+2:ℕ):ℚ)+24-12*(n+8)) : ℚ)*
   (((2*n+18).choose 3:ℚ)+4*(
    ((2*n+19).choose 5:ℚ)-((n+12).choose 5:ℚ)-
    ((n:ℚ)+7)*((n+11).choose 4:ℚ))) ≤
   (4*((n:ℚ)+7)*((n+11).choose 2:ℚ))^2 := by
   simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat]
   nlinarith only [he]
  exact_mod_cast hQ
 push_cast
 push_cast at hh
 convert hh using 1 <;> ring

theorem first_template_1_1M2C6 (n : ℕ) :
 (topTemplateMB3E (3*(n+7)+1) (n+9)).coeff 1*
 (topTemplateMB3E (3*(n+7)+1) (n+11)).coeff 3 ≤
 (topTemplateMB3E (3*(n+7)+1) (n+10)).coeff 2^2 := by
 have h0 := (top_edge_coeffsMB3E (3*(n+7)+1) (n+9) (by omega) (by omega)).2.1
 have h1 := (top_edge_coeffsMB3E (3*(n+7)+1) (n+10) (by omega) (by omega)).2.2
 have h2 := top_third_coeffMB3E (3*(n+7)+1) (n+11) (by omega) (by omega)
 rw [show (3*(n+7)+1)-2*(n+10)+6=n+8 by omega] at h1
 rw [show (3*(n+7)+1)+5-(n+11)=2*n+16 by omega,
   show (3*(n+7)+1)-(n+11)+6=2*n+17 by omega,
   show (3*(n+7)+1)-2*(n+11)+9=n+9 by omega,
   show (3*(n+7)+1)-2*(n+11)+8=n+8 by omega] at h2
 rw [h0,h1,h2]
 have he := expr_nonneg_certificateM6C0 _ (first_gap_signsM2C6 true true) (n:ℚ) 0
   (by positivity) (by norm_num)
 norm_num only [firstGapExprM2C6,exprEvalM6C0,choose_expr_evalM6C0,
   Bool.false_eq_true,if_false,if_true,Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul,Nat.cast_ofNat] at he
 have hh : ((4*((3*(n+7)+1:ℕ):ℤ)+24-12*(n+9)) : ℤ)*
   (((2*n+16).choose 3:ℤ)+4*(
    ((2*n+17).choose 5:ℤ)-((n+9).choose 5:ℤ)-
    ((n:ℤ)+8)*((n+8).choose 4:ℤ))) ≤
   (4*((n:ℤ)+8)*((n+8).choose 2:ℤ))^2 := by
  have hQ : ((4*((3*(n+7)+1:ℕ):ℚ)+24-12*(n+9)) : ℚ)*
   (((2*n+16).choose 3:ℚ)+4*(
    ((2*n+17).choose 5:ℚ)-((n+9).choose 5:ℚ)-
    ((n:ℚ)+8)*((n+8).choose 4:ℚ))) ≤
   (4*((n:ℚ)+8)*((n+8).choose 2:ℚ))^2 := by
   simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat]
   nlinarith only [he]
  exact_mod_cast hQ
 push_cast
 push_cast at hh
 convert hh using 1 <;> ring

theorem first_template_1_2M2C6 (n : ℕ) :
 (topTemplateMB3E (3*(n+7)+2) (n+9)).coeff 1*
 (topTemplateMB3E (3*(n+7)+2) (n+11)).coeff 3 ≤
 (topTemplateMB3E (3*(n+7)+2) (n+10)).coeff 2^2 := by
 have h0 := (top_edge_coeffsMB3E (3*(n+7)+2) (n+9) (by omega) (by omega)).2.1
 have h1 := (top_edge_coeffsMB3E (3*(n+7)+2) (n+10) (by omega) (by omega)).2.2
 have h2 := top_third_coeffMB3E (3*(n+7)+2) (n+11) (by omega) (by omega)
 rw [show (3*(n+7)+2)-2*(n+10)+6=n+9 by omega] at h1
 rw [show (3*(n+7)+2)+5-(n+11)=2*n+17 by omega,
   show (3*(n+7)+2)-(n+11)+6=2*n+18 by omega,
   show (3*(n+7)+2)-2*(n+11)+9=n+10 by omega,
   show (3*(n+7)+2)-2*(n+11)+8=n+9 by omega] at h2
 rw [h0,h1,h2]
 have he := expr_nonneg_certificateM6C0 _ (first_gap_signsM2C6 true false) (n:ℚ) 0
   (by positivity) (by norm_num)
 norm_num only [firstGapExprM2C6,exprEvalM6C0,choose_expr_evalM6C0,
   Bool.false_eq_true,if_false,if_true,Nat.reduceAdd,Nat.reduceSub,Nat.reduceMul,Nat.cast_ofNat] at he
 have hh : ((4*((3*(n+7)+2:ℕ):ℤ)+24-12*(n+9)) : ℤ)*
   (((2*n+17).choose 3:ℤ)+4*(
    ((2*n+18).choose 5:ℤ)-((n+10).choose 5:ℤ)-
    ((n:ℤ)+8)*((n+9).choose 4:ℤ))) ≤
   (4*((n:ℤ)+8)*((n+9).choose 2:ℤ))^2 := by
  have hQ : ((4*((3*(n+7)+2:ℕ):ℚ)+24-12*(n+9)) : ℚ)*
   (((2*n+17).choose 3:ℚ)+4*(
    ((2*n+18).choose 5:ℚ)-((n+10).choose 5:ℚ)-
    ((n:ℚ)+8)*((n+9).choose 4:ℚ))) ≤
   (4*((n:ℚ)+8)*((n+9).choose 2:ℚ))^2 := by
   simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat]
   nlinarith only [he]
  exact_mod_cast hQ
 push_cast
 push_cast at hh
 convert hh using 1 <;> ring

end MathGKM.Markov
