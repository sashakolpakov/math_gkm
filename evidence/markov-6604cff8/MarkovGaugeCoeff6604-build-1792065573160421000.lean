import MarkovFourthLowerK062
/-! Machine-authored 6604cff8. Coefficientwise scalar gauge formulas. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
theorem gauge_coeff_a6604 (a b : ℤ[X]) (m : Mat16 BiPoly) (k : ℕ) :
 (gauge75 (C a) (C b) m).a.coeff k=m.a.coeff k-m.b.coeff k*b := by
 simp only [gauge75,unshear75,shear75,mm16,one_mul,mul_one,zero_mul,add_zero,zero_add,
   _root_.mul_neg,Polynomial.coeff_add,Polynomial.coeff_neg,Polynomial.coeff_mul_C,sub_eq_add_neg]
theorem gauge_coeff_b6604 (a b : ℤ[X]) (m : Mat16 BiPoly) (k : ℕ) :
 (gauge75 (C a) (C b) m).b.coeff k=m.b.coeff k := by
 simp [gauge75,unshear75,shear75,mm16]
theorem gauge_coeff_c6604 (a b : ℤ[X]) (m : Mat16 BiPoly) (k : ℕ) :
 (gauge75 (C a) (C b) m).c.coeff k=
 a*m.a.coeff k+m.c.coeff k-(a*m.b.coeff k+m.d.coeff k)*b := by
 simp only [gauge75,unshear75,shear75,mm16,one_mul,mul_one,zero_mul,add_zero,zero_add,
   _root_.mul_neg,Polynomial.coeff_add,Polynomial.coeff_neg,Polynomial.coeff_mul_C,Polynomial.coeff_C_mul,sub_eq_add_neg]
theorem gauge_coeff_d6604 (a b : ℤ[X]) (m : Mat16 BiPoly) (k : ℕ) :
 (gauge75 (C a) (C b) m).d.coeff k=a*m.b.coeff k+m.d.coeff k := by
 simp [gauge75,unshear75,shear75,mm16,coeff_add,coeff_C_mul]
end
end MathGKM.Markov
