import MarkovThirdAllBoundsDefM115
/-! Machine-authored 1152282d. Exact all-run gap/support certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
set_option linter.unnecessarySeqFocus false

theorem vAll_midlow_0_4_first1M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (1-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (1+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (1)^2 ∧
 0 ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (1) := by
 rw [vE_zeroM115 _ _ _ _ _ (5+u) ((1)-1) (by omega) (by omega)]
 rw [vE_first2M115 _ _ _ _ _ (5+u) ((1)+1) (by omega) (by omega)]
 rw [vE_first1M115 _ _ _ _ _ (5+u) (1) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3first2M115,v3first1M115]
   ring_nf <;> positivity
 · simp only [v3first2M115,v3first1M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_first2M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (2-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (2+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (2)^2 ∧
 0 ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (2) := by
 rw [vE_first1M115 _ _ _ _ _ (5+u) ((2)-1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+u) ((2)+1) (by omega) (by omega)]
 rw [vE_first2M115 _ _ _ _ _ (5+u) (2) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3first1M115,v3lowM115,v3first2M115]
   ring_nf <;> positivity
 · simp only [v3first1M115,v3lowM115,v3first2M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_first3M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (3-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (3+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (3)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (3) := by
 rw [vE_first2M115 _ _ _ _ _ (5+u) ((3)-1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+u) ((3)+1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+u) (3) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3first2M115,v3lowM115]
   ring_nf <;> positivity
 · simp only [v3first2M115,v3lowM115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_first4M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (4-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (4+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (4)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (4) := by
 rw [vE_lowM115 _ _ _ _ _ (5+u) ((4)-1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+u) ((4)+1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+u) (4) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3lowM115]
   ring_nf <;> positivity
 · simp only [v3lowM115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_lowM115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (5+u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (5+u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (5+u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (5+u) := by
 rw [vE_lowM115 _ _ _ _ _ (5+v+u) ((5+u)-1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+v+u) ((5+u)+1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+v+u) (5+u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3lowM115]
   ring_nf <;> positivity
 · simp only [v3lowM115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross1_1M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (6+u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (6+u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (6+u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (6+u) := by
 rw [vE_lowM115 _ _ _ _ _ (5+u) ((6+u)-1) (by omega) (by omega)]
 rw [vE_bridge12M115 _ _ _ _ _ (5+u) ((6+u)+1) (by omega) (by omega)]
 rw [vE_lowM115 _ _ _ _ _ (5+u) (6+u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3lowM115,v3bridge12M115]
   ring_nf <;> positivity
 · simp only [v3lowM115,v3bridge12M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross1_2M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (7+u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (7+u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (7+u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (7+u) := by
 rw [vE_lowM115 _ _ _ _ _ (5+u) ((7+u)-1) (by omega) (by omega)]
 rw [vE_bridge13M115 _ _ _ _ _ (5+u) ((7+u)+1) (by omega) (by omega)]
 rw [vE_bridge12M115 _ _ _ _ _ (5+u) (7+u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3lowM115,v3bridge13M115,v3bridge12M115]
   ring_nf <;> positivity
 · simp only [v3lowM115,v3bridge13M115,v3bridge12M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross1_3M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (8+u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (8+u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (8+u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (8+u) := by
 rw [vE_bridge12M115 _ _ _ _ _ (5+u) ((8+u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (5+u) ((8+u)+1) (by omega) (by omega)]
 rw [vE_bridge13M115 _ _ _ _ _ (5+u) (8+u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3bridge12M115,v3mid1M115,v3bridge13M115]
   ring_nf <;> positivity
 · simp only [v3bridge12M115,v3mid1M115,v3bridge13M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross1_4M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (9+u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (9+u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (9+u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (9+u) := by
 rw [vE_bridge13M115 _ _ _ _ _ (5+u) ((9+u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (5+u) ((9+u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (5+u) (9+u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3bridge13M115,v3mid1M115]
   ring_nf <;> positivity
 · simp only [v3bridge13M115,v3mid1M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_mid1M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (4+v+u) (9+v+2*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (4+v+u) (9+v+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (4+v+u) (9+v+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (4+v+u) (9+v+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)-1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) ((9+v+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (4+v+u) (9+v+2*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3mid1M115]
   ring_nf <;> positivity
 · simp only [v3mid1M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross2_2M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (12+2*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (12+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (12+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (12+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (5+u) ((12+2*u)-1) (by omega) (by omega)]
 rw [vE_bridge23M115 _ _ _ _ _ (5+u) ((12+2*u)+1) (by omega) (by omega)]
 rw [vE_mid1M115 _ _ _ _ _ (5+u) (12+2*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3mid1M115,v3bridge23M115]
   ring_nf <;> positivity
 · simp only [v3mid1M115,v3bridge23M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross2_3M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (13+2*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (13+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (13+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (13+2*u) := by
 rw [vE_mid1M115 _ _ _ _ _ (5+u) ((13+2*u)-1) (by omega) (by omega)]
 rw [vE_bridge24M115 _ _ _ _ _ (5+u) ((13+2*u)+1) (by omega) (by omega)]
 rw [vE_bridge23M115 _ _ _ _ _ (5+u) (13+2*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3mid1M115,v3bridge24M115,v3bridge23M115]
   ring_nf <;> positivity
 · simp only [v3mid1M115,v3bridge24M115,v3bridge23M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross2_4M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (14+2*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (14+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (14+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (14+2*u) := by
 rw [vE_bridge23M115 _ _ _ _ _ (5+u) ((14+2*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+u) ((14+2*u)+1) (by omega) (by omega)]
 rw [vE_bridge24M115 _ _ _ _ _ (5+u) (14+2*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3bridge23M115,v3mid2M115,v3bridge24M115]
   ring_nf <;> positivity
 · simp only [v3bridge23M115,v3mid2M115,v3bridge24M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_cross2_5M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (15+2*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (15+2*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (15+2*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (15+2*u) := by
 rw [vE_bridge24M115 _ _ _ _ _ (5+u) ((15+2*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+u) ((15+2*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+u) (15+2*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3bridge24M115,v3mid2M115]
   ring_nf <;> positivity
 · simp only [v3bridge24M115,v3mid2M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_mid2M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (16+2*v+3*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (16+2*v+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (16+2*v+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+v+u) (16+2*v+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)-1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) ((16+2*v+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+v+u) (16+2*v+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3mid2M115]
   ring_nf <;> positivity
 · simp only [v3mid2M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_tail2M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (17+3*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (17+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (17+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (17+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+u) ((17+3*u)-1) (by omega) (by omega)]
 rw [vE_tail3M115 _ _ _ _ _ (5+u) ((17+3*u)+1) (by omega) (by omega)]
 rw [vE_mid2M115 _ _ _ _ _ (5+u) (17+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3mid2M115,v3tail3M115]
   ring_nf <;> positivity
 · simp only [v3mid2M115,v3tail3M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_tail3M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (18+3*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (18+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (18+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (18+3*u) := by
 rw [vE_mid2M115 _ _ _ _ _ (5+u) ((18+3*u)-1) (by omega) (by omega)]
 rw [vE_tail4M115 _ _ _ _ _ (5+u) ((18+3*u)+1) (by omega) (by omega)]
 rw [vE_tail3M115 _ _ _ _ _ (5+u) (18+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3mid2M115,v3tail4M115,v3tail3M115]
   ring_nf <;> positivity
 · simp only [v3mid2M115,v3tail4M115,v3tail3M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_tail4M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (19+3*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (19+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (19+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (19+3*u) := by
 rw [vE_tail3M115 _ _ _ _ _ (5+u) ((19+3*u)-1) (by omega) (by omega)]
 rw [vE_tail5M115 _ _ _ _ _ (5+u) ((19+3*u)+1) (by omega) (by omega)]
 rw [vE_tail4M115 _ _ _ _ _ (5+u) (19+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3tail3M115,v3tail5M115,v3tail4M115]
   ring_nf <;> positivity
 · simp only [v3tail3M115,v3tail5M115,v3tail4M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_tail5M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (20+3*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (20+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (20+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (20+3*u) := by
 rw [vE_tail4M115 _ _ _ _ _ (5+u) ((20+3*u)-1) (by omega) (by omega)]
 rw [vE_tail6M115 _ _ _ _ _ (5+u) ((20+3*u)+1) (by omega) (by omega)]
 rw [vE_tail5M115 _ _ _ _ _ (5+u) (20+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3tail4M115,v3tail6M115,v3tail5M115]
   ring_nf <;> positivity
 · simp only [v3tail4M115,v3tail6M115,v3tail5M115]
   ring_nf <;> positivity

theorem vAll_midlow_0_4_tail6M115 (x y u v : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (21+3*u-1)*vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (21+3*u+1) ≤ vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (21+3*u)^2 ∧
 0 < vEM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) (5+u) (21+3*u) := by
 rw [vE_tail5M115 _ _ _ _ _ (5+u) ((21+3*u)-1) (by omega) (by omega)]
 rw [vE_pastM115 _ _ _ _ _ (5+u) ((21+3*u)+1) (by omega) (by omega)]
 rw [vE_tail6M115 _ _ _ _ _ (5+u) (21+3*u) (by omega) (by omega)]
 constructor
 · apply sub_nonneg.mp
   simp only [v3tail5M115,v3pastM115,v3tail6M115]
   ring_nf <;> positivity
 · simp only [v3tail5M115,v3pastM115,v3tail6M115]
   ring_nf <;> positivity

theorem vAllchart_midlow_0_4M115 (x y : ℤ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 vAllBoundsM115 (8+2*y+3*x) (4+y+x) (0) (4+y) (0) := by
 intro q hq
 constructor
 · intro j
   by_cases h0 : j ≤ 1
   · rw [vE_zeroM115 _ _ _ _ _ q (j-1) (by omega) (by omega),zero_mul]; exact sq_nonneg _
   by_cases hN : 3*q+6 ≤ j
   · rw [vE_pastM115 _ _ _ _ _ q (j+1) (by omega) (by omega),v3pastM115,mul_zero]; exact sq_nonneg _
   by_cases h2 : j=2
   · convert (vAll_midlow_0_4_first2M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h3 : j=3
   · convert (vAll_midlow_0_4_first3M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_midlow_0_4_first4M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_midlow_0_4_lowM115 x y (j-5) (q-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_midlow_0_4_cross1_1M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_midlow_0_4_cross1_2M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_midlow_0_4_cross1_3M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_midlow_0_4_cross1_4M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_midlow_0_4_mid1M115 x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_midlow_0_4_cross2_2M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_midlow_0_4_cross2_3M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_midlow_0_4_cross2_4M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_midlow_0_4_cross2_5M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_midlow_0_4_mid2M115 x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 := by omega
   rcases ht with ht|ht|ht|ht
   · convert (vAll_midlow_0_4_tail2M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail3M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail4M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail5M115 x y (q-5) (0) hx hy (by omega) (by omega)).1 using 1 <;> congr 1 <;> congr 1 <;> omega
 · intro j hj3 hjN
   by_cases h3 : j=3
   · convert (vAll_midlow_0_4_first3M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases h4 : j=4
   · convert (vAll_midlow_0_4_first4M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hl : j ≤ q
   · convert (vAll_midlow_0_4_lowM115 x y (j-5) (q-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc1 : j=q+1
   · convert (vAll_midlow_0_4_cross1_1M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc2 : j=q+2
   · convert (vAll_midlow_0_4_cross1_2M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc3 : j=q+3
   · convert (vAll_midlow_0_4_cross1_3M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hc4 : j=q+4
   · convert (vAll_midlow_0_4_cross1_4M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm1 : j ≤ 2*q+1
   · convert (vAll_midlow_0_4_mid1M115 x y (j-q-5) (2*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd2 : j=2*q+2
   · convert (vAll_midlow_0_4_cross2_2M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd3 : j=2*q+3
   · convert (vAll_midlow_0_4_cross2_3M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd4 : j=2*q+4
   · convert (vAll_midlow_0_4_cross2_4M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hd5 : j=2*q+5
   · convert (vAll_midlow_0_4_cross2_5M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   by_cases hm2 : j ≤ 3*q+1
   · convert (vAll_midlow_0_4_mid2M115 x y (j-2*q-6) (3*q+1-j) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   have ht : j=3*q+2 ∨ j=3*q+3 ∨ j=3*q+4 ∨ j=3*q+5 ∨ j=3*q+6 := by omega
   rcases ht with ht|ht|ht|ht|ht
   · convert (vAll_midlow_0_4_tail2M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail3M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail4M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail5M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
   · convert (vAll_midlow_0_4_tail6M115 x y (q-5) (0) hx hy (by omega) (by omega)).2 using 1 <;> congr 1 <;> congr 1 <;> omega
end
end MathGKM.Markov
