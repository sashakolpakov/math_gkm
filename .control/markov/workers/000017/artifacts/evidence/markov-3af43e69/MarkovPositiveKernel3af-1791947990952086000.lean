import MarkovColumnSeries3af

/-! Machine-authored request 3af43e69. Exact positive Green-kernel column
recursion. The kernel has gaps and is not an LC-preserving smoothing kernel. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries

def geometric3af (r : Polynomial ℤ) : PowerSeries (Polynomial ℤ) := mk (r^·)
def columnKernel3af : PowerSeries (Polynomial ℤ) :=
  geometric3af 1*geometric3af (Polynomial.X^2)

theorem geometric_inverse3af (r : Polynomial ℤ) :
    geometric3af r*(1-C r*X)=1 := by
  apply PowerSeries.ext
  intro n
  rw [mul_sub,mul_one,← mul_assoc]
  cases n with
  | zero => simp [geometric3af]
  | succ n =>
    simp only [coeff_succ_mul_X,coeff_mul_C,geometric3af,coeff_mk,
      map_sub,coeff_one,Nat.succ_ne_zero,if_false,pow_succ]
    ring

theorem column_kernel_inverse3af :
    columnKernel3af*((1-X)*(1-C (Polynomial.X^2)*X))=1 := by
  have h0 := geometric_inverse3af 1
  have h1 := geometric_inverse3af (Polynomial.X^2)
  simp only [map_one,one_mul] at h0
  unfold columnKernel3af
  calc
    _ = (geometric3af 1*(1-X))*(geometric3af (Polynomial.X^2)*
        (1-C (Polynomial.X^2)*X)) := by ring
    _ = 1 := by rw [h0,h1,mul_one]

theorem column_positive_recursion3af (i : ℕ) :
    columnSeries3af (i+2)=columnKernel3af*
      (C ((twoFamily3af 0).coeff (i+2))+
        X*(C (2*(Polynomial.X+1))*columnSeries3af (i+1)+columnSeries3af i)) := by
  rw [← column_series_recurrence3af,← mul_assoc,column_kernel_inverse3af,one_mul]

theorem column_kernel_coeff3af (q : ℕ) :
    PowerSeries.coeff q columnKernel3af =
      ∑ a ∈ Finset.Nat.antidiagonal q, (Polynomial.X : Polynomial ℤ)^(2*a.2) := by
  simp [columnKernel3af,geometric3af,coeff_mul,coeff_mk,pow_mul]

theorem column_kernel_gap3af :
    ((PowerSeries.coeff 1 columnKernel3af).coeff 1)^2 <
      (PowerSeries.coeff 1 columnKernel3af).coeff 0*(PowerSeries.coeff 1 columnKernel3af).coeff 2 := by
  norm_num [column_kernel_coeff3af,Finset.Nat.antidiagonal_succ,
    Finset.Nat.antidiagonal_zero,Polynomial.coeff_add,Polynomial.coeff_X_pow,
    Polynomial.coeff_one]

#print axioms column_positive_recursion3af
#print axioms column_kernel_coeff3af
#print axioms column_kernel_gap3af
end
end MathGKM.Markov
