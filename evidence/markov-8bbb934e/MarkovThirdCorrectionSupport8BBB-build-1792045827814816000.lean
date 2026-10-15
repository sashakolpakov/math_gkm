import MarkovThirdAllCycles8BBB
/-! Machine-authored request 8bbb934e. Small-cycle corrections are confined
to indices at or above the actual denominator. No inequality premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
theorem correctedThird_coeff_below8BBB (n c r j : ℕ) (hj : j<c*(n+1)+r) :
 (correctedThirdRun8BBB n c r).coeff j=(thirdRunPolyADB2 n c r).coeff j := by
 have he : -12*X^(c*(n+1)+r)*(firstRunPolyADB2 n c r+1+X)=
     X^(c*(n+1)+r)*(-12*(firstRunPolyADB2 n c r+1+X)) := by ring
 unfold correctedThirdRun8BBB
 split_ifs <;> simp only [Polynomial.coeff_add,he,Polynomial.coeff_X_pow_mul',
   show ¬c*(n+1)+r ≤ j by omega,if_false,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,show j≠c*(n+1)+r by omega,mul_zero,add_zero,
   Polynomial.coeff_zero]

#print axioms correctedThird_coeff_below8BBB
end
end MathGKM.Markov
