import MarkovThirdAllBoundsDefM115
/-! Machine-authored 03d5764d; split from pending 1152282d candidate. Exact all-run gap/support certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_high_3_0_tail6M03 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (9+y+3*x) (6+y+2*x) (3+y+x) (3+x) (y) (5+u) (21+3*u-1)*vEM115 (9+y+3*x) (6+y+2*x) (3+y+x) (3+x) (y) (5+u) (21+3*u+1) ≤ vEM115 (9+y+3*x) (6+y+2*x) (3+y+x) (3+x) (y) (5+u) (21+3*u)^2 ∧
 0 < vEM115 (9+y+3*x) (6+y+2*x) (3+y+x) (3+x) (y) (5+u) (21+3*u) := by
 rw [vE_tail5M115 _ _ _ _ _ (5+u) ((21+3*u)-1) (by omega) (by omega)]
 rw [vE_pastM115 _ _ _ _ _ (5+u) ((21+3*u)+1) (by omega) (by omega)]
 rw [vE_tail6M115 _ _ _ _ _ (5+u) (21+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3tail5M115,v3pastM115,v3tail6M115]
   ring_nf <;> positivity
 · simp only [v3tail5M115,v3pastM115,v3tail6M115]
   ring_nf <;> positivity

end
end MathGKM.Markov
