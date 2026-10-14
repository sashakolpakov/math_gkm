import MarkovFamilyEquation3af

/-! Machine-authored request 3af43e69. A positive recurrence in the column
index for exact source-family generating series. It does not assert LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def columnSeries3af (i : ℕ) : PowerSeries (Polynomial ℤ) :=
  PowerSeries.mk (fun q => (twoFamily3af q).coeff i)

theorem two_initial3af : twoFamily3af 1=
    (S^2-2*V)*twoFamily3af 0-V*(V+1)-4*U*V := by
  norm_num [twoFamily3af,fib_zero6,fib_one6,fib_two6,S]
  ring

theorem two_initial_column3af (i : ℕ) :
    (twoFamily3af 1).coeff (i+2)=
      (1+X^2)*(twoFamily3af 0).coeff (i+2)+
      2*(X+1)*(twoFamily3af 0).coeff (i+1)+
      (twoFamily3af 0).coeff i := by
  rw [two_initial3af]
  have hs : S^2-2*V=U^2+C (2*(X+1))*U+C (1+X^2) := by
    simp only [S,U,V,map_mul,map_add,map_ofNat,map_one,map_pow]; ring
  have he : 4*U*V=C (4*X)*U := by
    simp only [U,V,map_mul,map_ofNat]; ring
  rw [hs,he]
  simp only [add_mul,mul_assoc,Polynomial.coeff_add,Polynomial.coeff_sub,
    U,V,← map_mul,← map_add,map_one,Polynomial.coeff_C_mul,
    Polynomial.coeff_X_pow_mul,show i+2=i+1+1 by omega,
    Polynomial.coeff_X_mul,Polynomial.coeff_X,Polynomial.coeff_C,Polynomial.coeff_one,
    show ¬1=i+1+1 by omega,show i+1+1≠0 by omega,if_false,mul_zero,sub_zero]
  ring

theorem column_series_recurrence3af (i : ℕ) :
    ((1-PowerSeries.X)*(1-PowerSeries.C (X^2)*PowerSeries.X))*columnSeries3af (i+2)=
      PowerSeries.C ((twoFamily3af 0).coeff (i+2))+
      PowerSeries.X*(PowerSeries.C (2*(X+1))*columnSeries3af (i+1)+columnSeries3af i) := by
  have he : ((1-PowerSeries.X)*(1-PowerSeries.C (X^2)*PowerSeries.X) :
      PowerSeries (Polynomial ℤ))=1-PowerSeries.C (1+X^2)*PowerSeries.X+
      PowerSeries.C (X^2)*PowerSeries.X^2 := by
    simp only [map_add,map_one]; ring
  rw [he]
  apply PowerSeries.ext
  intro q
  simp only [add_mul,sub_mul,one_mul,mul_assoc,map_add,map_sub,
    PowerSeries.coeff_C_mul]
  rcases q with _ | (_ | q)
  · simp [columnSeries3af,PowerSeries.coeff_X_pow_mul']
  · simp only [PowerSeries.coeff_succ_X_mul,PowerSeries.coeff_X_pow_mul',
      show ¬2≤1 by omega,if_false,PowerSeries.coeff_C,show 1≠0 by omega,
      mul_zero,add_zero,zero_add,map_add,PowerSeries.coeff_C_mul,columnSeries3af,
      PowerSeries.coeff_mk]
    linear_combination two_initial_column3af i
  · simp only [PowerSeries.coeff_succ_X_mul,PowerSeries.coeff_X_pow_mul',
      show 2≤q+1+1 by omega,if_true,show q+1+1-2=q by omega,
      PowerSeries.coeff_C,show q+1+1≠0 by omega,if_false,zero_add,
      map_add,PowerSeries.coeff_C_mul,columnSeries3af,PowerSeries.coeff_mk]
    linear_combination two_polynomial_coefficient3af q i

#print axioms column_series_recurrence3af
end
end MathGKM.Markov
