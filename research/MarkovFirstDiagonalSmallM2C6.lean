import MarkovUpperCompleteM9F23
/-! Machine-authored 2c6e5ef0. Exact finitely many upper-entry exceptions.
These finite computations are only a component of an unbounded theorem. -/
namespace MathGKM.Markov
set_option maxHeartbeats 600000000
set_option maxRecDepth 1000000
set_option compiler.extract_closed false

theorem first_boundary_smallM2C6 (q : ℕ) (r : Bool) (s : ℕ)
 (hq : 1 ≤ q) (hq7 : q < 7) (hs : s ≤ 1) :
 let j := sourceNME9C q r-q-1-s
 threeRawM9E2 q r 1 (j+2)*threeRawM9E2 q r 3 j ≤ threeRawM9E2 q r 2 (j+1)^2 := by
 interval_cases q <;> cases r <;> interval_cases s <;> decide +kernel

end MathGKM.Markov
