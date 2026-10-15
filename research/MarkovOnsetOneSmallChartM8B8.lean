import MarkovOnsetOneAssemblyM253
import MarkovOnsetOneSmall1M8B8
import MarkovOnsetOneSmall2M8B8
import MarkovOnsetOneSmall3M8B8
import MarkovOnsetOneSmall4M8B8
import MarkovOnsetOneSmall5M8B8
/-! Machine-authored request 8b851864. Raw onset inequality, reduced run bound. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem onsetOne_lcM8B8 (N C : ℤ) (hN : -4≤N) (hC : 0≤C)
 (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetOneValueM253 N C k*onsetOneValueM253 N C (k+2) ≤
 onsetOneValueM253 N C (k+1)^2 := by
 interval_cases k
 · exact onsetOne_lc1M8B8 N C hN hC
 · exact onsetOne_lc2M8B8 N C hN hC
 · exact onsetOne_lc3M8B8 N C hN hC
 · exact onsetOne_lc4M8B8 N C hN hC
 · exact onsetOne_lc5M8B8 N C hN hC

theorem secondOnset_one_lcM8B8 (n c k : ℕ) (hn : 3≤n) (hc : 5≤c)
 (hk : 1≤k) (hku : k≤5) :
 secondOnsetValueM5DC n c 1 k*secondOnsetValueM5DC n c 1 (k+2) ≤
 secondOnsetValueM5DC n c 1 (k+1)^2 := by
 rw [onsetOne_valueM253 n c k hc hk (by omega),
   onsetOne_valueM253 n c (k+2) hc (by omega) (by omega),
   onsetOne_valueM253 n c (k+1) hc (by omega) (by omega)]
 exact onsetOne_lcM8B8 _ _ (by omega) (by omega) k hk hku

end
end MathGKM.Markov
