import MarkovSecondKernelE273
/-! Machine-authored e27336bc. Cubic polynomial identity for shifted
binomial coefficients, including the first three zero positions. -/
namespace MathGKM.Markov
noncomputable section

theorem choose_three_productE273 (d : ℕ) :
 6*(Nat.choose (d+3) 3:ℤ)=((d:ℤ)+1)*(d+2)*(d+3) := by
 have h := Nat.descFactorial_eq_factorial_mul_choose (d+3) 3
 norm_num [Nat.descFactorial_succ] at h
 rw [show d+3-2=d+1 by omega,← mul_assoc] at h
 have hz : ((d:ℤ)+1)*((d:ℤ)+2)*((d:ℤ)+3)=6*(Nat.choose (d+3) 3:ℤ) := by
   exact_mod_cast h
 omega

#print axioms choose_three_productE273
end
end MathGKM.Markov
