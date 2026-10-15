import MarkovCycleShort41N0MCFC
import MarkovCycleShort41N1MCFC
import MarkovCycleShort41N2MCFC
import MarkovCycleShort41N3MCFC
import MarkovCycleShort41N4MCFC
import MarkovCycleShort41N5MCFC
import MarkovCycleShort41N6MCFC
namespace MathGKM.Markov
noncomputable section
theorem cycle_short_value_lc41MCFC (n j : ℕ) (hn : n<7) (hj : j≤4*n+3) :
 smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
 interval_cases n
 · exact cycle_short_41_0MCFC j (by omega)
 · exact cycle_short_41_1MCFC j (by omega)
 · exact cycle_short_41_2MCFC j (by omega)
 · exact cycle_short_41_3MCFC j (by omega)
 · exact cycle_short_41_4MCFC j (by omega)
 · exact cycle_short_41_5MCFC j (by omega)
 · exact cycle_short_41_6MCFC j (by omega)
end
end MathGKM.Markov
