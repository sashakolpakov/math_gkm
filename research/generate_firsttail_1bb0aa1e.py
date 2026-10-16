"""Machine-authored source generation; generated Lean must compile and replay."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovLowForceME9C.lean').read_text()
s=s[s.index('theorem low_force_threeME9C'):s.index('\nend\nend MathGKM.Markov')]
s=s.replace('low_force_threeME9C','lower_force_threeM1BB').replace('low_force_fourME9C','lower_force_fourM1BB')
s=s.replace('(q j : ℕ) (r : Bool) (hj : j ≤ q)', '(n j : ℕ) (hj : j < n)')
s=s.replace('threeForceM96A q r','lowerForceME9C n').replace('sourceNME9C q r','n')
s=s.replace(' rw [low_force_baseME9C q 3 j r hj]\n have hn := source_n_gtME9C q j r hj',' unfold lowerForceME9C\n have hn := hj')
s=s.replace(' rw [low_force_baseME9C q 4 j r hj]\n have hn := source_n_gtME9C q j r hj',' unfold lowerForceME9C\n have hn := hj')
header='''import MarkovLowerUniformME9C
/-! Machine-authored request 1bb0aa1e. Exact first-tail forcing, with guards. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem lower_force_twoM1BB (n j : ℕ) (hj : j < n) : lowerForceME9C n 2 j=0 := by
 unfold lowerForceME9C addSRawM9E2 shiftRawM9E2
 split_ifs <;> try simp_all only [Nat.sub_zero, Nat.reduceSub]
 all_goals
   simp_all [fib_delta_axisME9C, fib_delta_oneME9C, fib_delta_twoME9C,
     show j-1<n by omega, show j-1-1<n by omega]

'''
(R/'MarkovFirstForceM1BB.lean').write_text(header+s+'\nend\nend MathGKM.Markov\n')
