import MarkovCycleShort43N0MCFC
import MarkovCycleShort43N1MCFC
import MarkovCycleShort43N2MCFC
import MarkovCycleShort43N3MCFC
import MarkovCycleShort43N4MCFC
import MarkovCycleShort43N5MCFC
import MarkovCycleShort43N6MCFC
namespace MathGKM.Markov
noncomputable section
theorem cycle_short_value_lc43MCFC (n j : ℕ) (hn : n<7) (hj : j≤4*n+5) :
 smallValue43MCFC n j*smallValue43MCFC n (j+2) ≤ smallValue43MCFC n (j+1)^2 := by
 interval_cases n
 · exact cycle_short_43_0MCFC j (by omega)
 · exact cycle_short_43_1MCFC j (by omega)
 · exact cycle_short_43_2MCFC j (by omega)
 · exact cycle_short_43_3MCFC j (by omega)
 · exact cycle_short_43_4MCFC j (by omega)
 · exact cycle_short_43_5MCFC j (by omega)
 · exact cycle_short_43_6MCFC j (by omega)
end
end MathGKM.Markov
