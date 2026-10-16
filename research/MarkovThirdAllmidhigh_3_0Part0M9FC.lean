import MarkovThirdAllBoundsDefM115
/-! Machine-authored 03d5764d; split from pending 1152282d candidate. Exact all-run gap/support certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_midhigh_3_0_first1M9FC (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (9+2*y+3*x) (6+y+2*x) (3+x) (3+y+x) (0) (5+u) (1-1)*vEM115 (9+2*y+3*x) (6+y+2*x) (3+x) (3+y+x) (0) (5+u) (1+1) ≤ vEM115 (9+2*y+3*x) (6+y+2*x) (3+x) (3+y+x) (0) (5+u) (1)^2 ∧
 0 ≤ vEM115 (9+2*y+3*x) (6+y+2*x) (3+x) (3+y+x) (0) (5+u) (1) := by
 rw [vE_zeroM115 _ _ _ _ _ (5+u) ((1)-1) (by omega) (by omega)]
 rw [vE_first2M115 _ _ _ _ _ (5+u) ((1)+1) (by omega) (by omega)]
 rw [vE_first1M115 _ _ _ _ _ (5+u) (1) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3first2M115,v3first1M115]
   ring_nf <;> positivity
 · simp only [v3first2M115,v3first1M115]
   ring_nf <;> positivity

end
end MathGKM.Markov
