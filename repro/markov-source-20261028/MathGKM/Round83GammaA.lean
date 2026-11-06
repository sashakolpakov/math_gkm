import MathGKM.Accepted0389682fd849add0e3926978
import MathGKM.Accepted9b000c6f345ccf55f4a0320b
/- Machine-authored round83: fresh composition of accepted exports only. -/
namespace StoppedFiberR83
open Polynomial
theorem gamma_obstruction :
    (∀ gamma : ℕ → ℤ,
      FullFiberRankR80.rankPoly 8 1 4 2 0 6 = SymmetricBinomialR80.expansion 2 gamma →
      gamma 0=36 ∧ gamma 1= -8) ∧
    ¬∃ gamma : ℕ → ℤ,
      FullFiberRankR80.rankPoly 8 1 4 2 0 6 = SymmetricBinomialR80.expansion 2 gamma ∧
      (∀ k, k≤1 → 0≤gamma k) := by
  have hc : (FullFiberRankR80.rankPoly 8 1 4 2 0 6).coeff 0=36 ∧
      (FullFiberRankR80.rankPoly 8 1 4 2 0 6).coeff 1=64 := by
    rw [Accepted0389682fd849add0e3926978.obligation]
    norm_num
  exact Accepted9b000c6f345ccf55f4a0320b.obligation hc
end StoppedFiberR83
#print axioms StoppedFiberR83.gamma_obstruction
