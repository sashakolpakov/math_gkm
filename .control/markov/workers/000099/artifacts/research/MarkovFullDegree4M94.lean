import MarkovFullSourceFA
/-! Machine-authored 94b1de05. Highest corrected numerator block degree. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem fullH4_degreeM94 (n c r q t u : ℕ) :
 (fullH4FA (n:ℤ[X]) c r q t u X).natDegree≤15 := by
 unfold fullH4FA
 compute_degree!
theorem correctedH4_degreeM94 (n c r q t u : ℕ) :
 (fullH4FA (n:ℤ[X]) c r q t u X+
  96*(1-X)^8*fourthCountCorrectionFA X c r).natDegree≤15 := by
 have h := fullH4_degreeM94 n c r q t u
 unfold fourthCountCorrectionFA
 split_ifs <;> compute_degree <;> omega
end
end MathGKM.Markov
