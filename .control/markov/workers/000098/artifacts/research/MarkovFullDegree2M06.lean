import MarkovFullCoeff2FA
/-! Machine-authored 06b5b1f9. Uniform degree bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem fullH2_degreeM06 (n c r q t u : ℕ) :
 (fullH2FA (n:ℤ[X]) c r q t u X).natDegree≤13 := by
 unfold fullH2FA
 compute_degree!
end
end MathGKM.Markov
