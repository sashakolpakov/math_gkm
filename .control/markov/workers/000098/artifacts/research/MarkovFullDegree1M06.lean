import MarkovFullCoeff1FinalFA
/-! Machine-authored 06b5b1f9. Uniform degree bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem fullH1_degreeM06 (n c r q t u : ℕ) :
 (fullH1FA (n:ℤ[X]) c r q t u X).natDegree≤12 := by
 unfold fullH1FA runH1n0FA runH1n1FA runH1n2FA runH1n3FA
 compute_degree!
end
end MathGKM.Markov
