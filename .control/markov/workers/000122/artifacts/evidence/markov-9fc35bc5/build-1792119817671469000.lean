import MarkovThirdAllBoundsDefM115
/-! Machine-authored 03d5764d; split from pending 1152282d candidate. Exact all-run gap/support certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_midhigh_2_1_cross2_5M9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (5+y+2*x) (2+x) (3+y+x) (0) (5+u) (15+2*u-1)*vEM115 (8+2*y+3*x) (5+y+2*x) (2+x) (3+y+x) (0) (5+u) (15+2*u+1) ≤ vEM115 (8+2*y+3*x) (5+y+2*x) (2+x) (3+y+x) (0) (5+u) (15+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (5+y+2*x) (2+x) (3+y+x) (0) (5+u) (15+2*u) := by
 rw [vE_bridge24M115 _ _ _ _ _ (5+u) ((15+2*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+u) ((15+2*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+u) (15+2*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3bridge24M115,v3mid2M115]
   ring_nf <;> positivity
 · simp only [v3bridge24M115,v3mid2M115]
   ring_nf <;> positivity

end
end MathGKM.Markov
