import MarkovSecondGapDefsMF52
/-! Machine-authored f52ba141. Raw smoothed-cubic gap; no source assumption. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768

theorem second_one_two_zeroMF52 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ secondGapMF52 1 2 (z+1) 0 := by
 simp only [secondGapMF52,secondMixedMF52,secondHMF52]
 ring_nf
 positivity

theorem second_one_two_endMF52 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ secondGapMF52 1 2 (z+1) (2*(z+1)) := by
 simp only [secondGapMF52,secondMixedMF52,secondHMF52]
 ring_nf
 positivity

theorem second_one_two_mixedMF52 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) : 0 ≤ secondMixedMF52 1 2 (z+1) := by
 simp only [secondGapMF52,secondMixedMF52,secondHMF52]
 ring_nf
 positivity

end
end MathGKM.Markov
