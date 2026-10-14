import MarkovFamilyRecurrence3af

/-! Machine-authored request 3af43e69. Exact formal generating equation for
the entire numerator-two family. No analytic convergence or LC assumption. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries

def familySeries3af : PowerSeries BiPoly := mk twoFamily3af
def familyDenom3af : PowerSeries BiPoly :=
  1-C (S^2-V)*X+C (V*(S^2-V))*X^2-C (V^3)*X^3
def familyNumer3af : PowerSeries BiPoly :=
  C (twoFamily3af 0)+C (twoFamily3af 1-(S^2-V)*twoFamily3af 0)*X+
    C (twoFamily3af 2-(S^2-V)*twoFamily3af 1+V*(S^2-V)*twoFamily3af 0)*X^2

theorem family_generating3af : familyDenom3af*familySeries3af=familyNumer3af := by
  apply PowerSeries.ext
  intro n
  simp only [familyDenom3af,familyNumer3af,add_mul,sub_mul,one_mul,mul_assoc,
    map_add,map_sub,coeff_C_mul]
  rcases n with _ | (_ | (_ | n))
  · simp [familySeries3af,coeff_X_pow_mul',coeff_succ_X_mul,coeff_X]
  · simp [familySeries3af,coeff_X_pow_mul',coeff_succ_X_mul,coeff_X]
  · simp [familySeries3af,coeff_X_pow_mul',coeff_succ_X_mul,coeff_X]
  · have hn0 : n+1+1+1≠0 := by omega
    have hn1 : n+1+1+1≠1 := by omega
    have hn2 : n+1+1+1≠2 := by omega
    simp only [coeff_succ_X_mul,coeff_X,coeff_X_pow_mul',
      show 1≤n+1+1+1 by omega,show n+1+1+1-1=n+2 by omega,
      show 2≤n+1+1+1 by omega,
      show 3≤n+1+1+1 by omega,if_true,
      show n+1+1+1-2=n+1 by omega,show n+1+1+1-3=n by omega,
      familySeries3af,coeff_mk,coeff_C,hn0,if_false,coeff_X,hn1,
      coeff_X_pow,hn2,mul_zero,add_zero,zero_add]
    have h := two_recurrence3af n
    convert (show twoFamily3af (n+3)-(S^2-V)*twoFamily3af (n+2)+
        V*(S^2-V)*twoFamily3af (n+1)-V^3*twoFamily3af n=0 by
          linear_combination h) using 1 <;> ring

theorem family_denom_factor3af : familyDenom3af=
    (1-C V*X)*((1-X)*(1-C (V^2)*X)-C (U*(U+2*V+2))*X) := by
  unfold familyDenom3af S
  simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
  ring

#print axioms family_generating3af
#print axioms family_denom_factor3af
end
end MathGKM.Markov
