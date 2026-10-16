import MarkovThirdAllBoundsDefM115
/-! Machine-authored 03d5764d; split from pending 1152282d candidate. Exact all-run gap/support certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_midlow_2_1_lowM03 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (5+v+u) (5+u-1)*vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (5+v+u) (5+u+1) ≤ vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (5+v+u) (5+u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (3+y+x) (0) (1+y) (0) (5+v+u) (5+u) := by
 rw [vE_lowM115 _ _ _ _ _ (5+v+u) ((5+u)-1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+v+u) ((5+u)+1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+v+u) (5+u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3lowM115]
   ring_nf <;> positivity
 · simp only [v3lowM115]
   ring_nf <;> positivity

end
end MathGKM.Markov
