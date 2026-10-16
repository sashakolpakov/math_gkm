import MarkovTerminalGapDefsM263
/-! Machine-authored 263d8c71. Terminal-A raw compensation certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768

theorem terminal_1_two_large_zeroM263 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ terminalGapM263 2 (y+3) (z+1) 0 1 := by
 simp only [terminalGapM263,terminalMixedM263,terminalHM263]
 ring_nf
 positivity

theorem terminal_1_two_large_endM263 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ terminalGapM263 2 (y+3) (z+1) (2*(z+1)-1) 1 := by
 simp only [terminalGapM263,terminalMixedM263,terminalHM263]
 ring_nf
 positivity

theorem terminal_1_two_large_mixedM263 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ terminalMixedM263 2 (y+3) (z+1) 1 := by
 simp only [terminalGapM263,terminalMixedM263,terminalHM263]
 ring_nf
 positivity

end
end MathGKM.Markov
