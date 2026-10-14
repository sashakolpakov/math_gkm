import MarkovColumnSeries3af

/-! Machine-authored request 3af43e69. Unbounded denominator monotonicity
of every raw column i>=2. This compares different source polynomials and
does not substitute for any of the three within-polygon LC directions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem fib_nonneg3af (n : ℕ) : PolyNonneg16 (fib6 n) := by
  rcases n with _ | (_ | n)
  · rw [fib_zero6]; exact poly_one_nonneg16
  · rw [fib_one6]; exact poly_add_nonneg16 poly_U_nonneg16 poly_V_nonneg16
  · rw [← source_fib6]; exact raw_coeff_nonneg18 _

theorem two_nonneg3af (q : ℕ) : PolyNonneg16 (twoFamily3af q) := by
  unfold twoFamily3af
  simp only [pow_two]
  exact poly_add_nonneg16 (poly_mul_nonneg16 (fib_nonneg3af _) (fib_nonneg3af _))
    (poly_mul_nonneg16 poly_V_nonneg16
      (poly_mul_nonneg16 (fib_nonneg3af _) (fib_nonneg3af _)))

def NonnegColumn3af (p : Polynomial ℤ) : Prop := ∀ j, 0≤p.coeff j

theorem column_nonneg_mul3af {p q : Polynomial ℤ}
    (hp : NonnegColumn3af p) (hq : NonnegColumn3af q) : NonnegColumn3af (p*q) := by
  intro j
  rw [Polynomial.coeff_mul]
  exact Finset.sum_nonneg fun x hx => mul_nonneg (hp x.1) (hq x.2)

theorem column_nonneg_add3af {p q : Polynomial ℤ}
    (hp : NonnegColumn3af p) (hq : NonnegColumn3af q) : NonnegColumn3af (p+q) := by
  intro j; rw [Polynomial.coeff_add]; exact add_nonneg (hp j) (hq j)

theorem column_X2_nonneg3af : NonnegColumn3af (X^2) := by
  intro j; simp only [Polynomial.coeff_X_pow]; split_ifs <;> norm_num

theorem column_twolinear_nonneg3af : NonnegColumn3af (2*(X+1)) := by
  intro j
  rw [show (2*(X+1) : Polynomial ℤ)=C 2*X+C 2 by simp; ring]
  simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X,
    Polynomial.coeff_C]
  split_ifs <;> norm_num

theorem two_column_monotone3af (q i j : ℕ) :
    coeff (twoFamily3af q) (i+2) j ≤ coeff (twoFamily3af (q+1)) (i+2) j := by
  suffices h : ∀ q, NonnegColumn3af
      ((twoFamily3af (q+1)).coeff (i+2)-(twoFamily3af q).coeff (i+2)) by
    have hh := h q j
    simpa only [Polynomial.coeff_sub,sub_nonneg,coeff] using hh
  intro q
  induction q with
  | zero =>
    rw [two_initial_column3af]
    have he : (1+X^2)*(twoFamily3af 0).coeff (i+2)+
        2*(X+1)*(twoFamily3af 0).coeff (i+1)+(twoFamily3af 0).coeff i-
        (twoFamily3af 0).coeff (i+2)=
        X^2*(twoFamily3af 0).coeff (i+2)+
        2*(X+1)*(twoFamily3af 0).coeff (i+1)+(twoFamily3af 0).coeff i := by ring
    rw [he]
    exact column_nonneg_add3af
      (column_nonneg_add3af (column_nonneg_mul3af column_X2_nonneg3af (two_nonneg3af 0 _))
        (column_nonneg_mul3af column_twolinear_nonneg3af (two_nonneg3af 0 _)))
      (two_nonneg3af 0 _)
  | succ q ih =>
    rw [show q+1+1=q+2 by omega,two_polynomial_coefficient3af]
    have he : (1+X^2)*(twoFamily3af (q+1)).coeff (i+2)-
        X^2*(twoFamily3af q).coeff (i+2)+
        2*(X+1)*(twoFamily3af (q+1)).coeff (i+1)+
        (twoFamily3af (q+1)).coeff i-(twoFamily3af (q+1)).coeff (i+2)=
        X^2*((twoFamily3af (q+1)).coeff (i+2)-(twoFamily3af q).coeff (i+2))+
        2*(X+1)*(twoFamily3af (q+1)).coeff (i+1)+(twoFamily3af (q+1)).coeff i := by ring
    rw [he]
    exact column_nonneg_add3af
      (column_nonneg_add3af (column_nonneg_mul3af column_X2_nonneg3af ih)
        (column_nonneg_mul3af column_twolinear_nonneg3af (two_nonneg3af (q+1) _)))
      (two_nonneg3af (q+1) _)

#print axioms two_column_monotone3af
end
end MathGKM.Markov
