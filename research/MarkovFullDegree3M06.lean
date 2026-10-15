import MarkovFullCoeff3FA
/-! Machine-authored 06b5b1f9. Uniform degree bound. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem fullH3_degreeM06 (n c r q t u : ℕ) :
 (fullH3FA (n:ℤ[X]) c r q t u X).natDegree≤14 := by
 unfold fullH3FA
 compute_degree!
end
end MathGKM.Markov
