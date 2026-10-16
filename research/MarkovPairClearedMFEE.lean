import MathGKM.Markov
/-! Machine-authored fee405c8. Cleared normalized-pair algebra only.
The kernel ratio and centered-tail bridges remain separate obligations. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 24000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false
def pairClearedMFEE (T x g z : ℚ) : ℚ :=
 ((2+1*g+1*x)*(8+1*T+1*g+1*x)*(54+15*T+28*z+15*g+15*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(2+1*z+1*g)*(5+1*T+1*x)*(88+19*T+36*z+36*g+19*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2)*(3+1*g+1*x)*(10+1*T+1*g+1*x)*(3+1*z+1*g)*(3+1*T+1*x)*(2+1*z)*(4+1*T+1*g+1*x)*(2+1*g+1*x)*(8+1*T+1*g+1*x)*(9+1*T+1*g+1*x)*(70+17*T+32*z+17*g+17*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(2+1*z+1*g)*(4+1*T+1*x)*(5+1*T+1*x)*(2+1*x)*(9+1*T+1*x)*(70+17*T+32*z+32*g+17*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2))+
 ((1*x)*(5+1*T+1*x)*(84+19*T+36*z+36*g+19*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2)*(1*z)*(8+1*T+1*g+1*x)*(58+15*T+28*z+15*g+15*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(1+1*z)*(6+1*T+1*g+1*x)*(1+1*x)*(7+1*T+1*x)*(2+1*z)*(4+1*T+1*g+1*x)*(5+1*T+1*g+1*x)*(2+1*g+1*x)*(8+1*T+1*g+1*x)*(70+17*T+32*z+17*g+17*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(2+1*z+1*g)*(5+1*T+1*x)*(2+1*x)*(8+1*T+1*x)*(9+1*T+1*x)*(70+17*T+32*z+32*g+17*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2))-
 ((1+1*g+1*x)*(6+1*T+1*g+1*x)*(68+17*T+32*z+17*g+17*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(1+1*z+1*g)*(7+1*T+1*x)*(72+17*T+32*z+32*g+17*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2)*(1+1*z)*(6+1*T+1*g+1*x)*(3+1*g+1*x)*(10+1*T+1*g+1*x)*(56+15*T+28*z+15*g+15*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(3+1*z+1*g)*(3+1*T+1*x)*(1+1*x)*(7+1*T+1*x)*(86+19*T+36*z+36*g+19*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2)*(2+1*g+1*x)*(8+1*T+1*g+1*x)*(9+1*T+1*g+1*x)*(2+1*z+1*g)*(4+1*T+1*x)*(5+1*T+1*x))-
 ((1+1*x)*(7+1*T+1*x)*(68+17*T+32*z+32*g+17*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2)*(1+1*z)*(6+1*T+1*g+1*x)*(72+17*T+32*z+17*g+17*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(1+1*z)*(6+1*T+1*g+1*x)*(3+1*g+1*x)*(10+1*T+1*g+1*x)*(56+15*T+28*z+15*g+15*x+1*T^2+4*z*T+4*z^2+2*g*T+4*g*z+1*g^2+2*x*T+4*x*z+2*x*g+1*x^2)*(3+1*z+1*g)*(3+1*T+1*x)*(1+1*x)*(7+1*T+1*x)*(86+19*T+36*z+36*g+19*x+1*T^2+4*z*T+4*z^2+4*g*T+8*g*z+4*g^2+2*x*T+4*x*z+4*x*g+1*x^2)*(2+1*z)*(4+1*T+1*g+1*x)*(5+1*T+1*g+1*x)*(2+1*x)*(8+1*T+1*x)*(9+1*T+1*x))
theorem pair_cleared_nonnegMFEE (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ pairClearedMFEE T x g z := by
 unfold pairClearedMFEE
 ring_nf
 positivity
end
end MathGKM.Markov
