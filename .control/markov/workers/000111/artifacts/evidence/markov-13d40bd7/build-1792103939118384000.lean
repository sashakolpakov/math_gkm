import MarkovHorizontalSeedM13D
/-! Machine-authored request 13d40bd7. Exact nonnegative polynomial certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem h3chart_low_0_1M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2+(x+0)) (3*(2+(x+0))+(y+1)) 0 0 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_low_1_0M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2+(x+1)) (3*(2+(x+1))+(y+0)) 0 0 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midlow_0_4M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D ((x+0)+(y+4)) (3*(x+0)+2*(y+4)) 0 (y+4) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midhigh_0_4M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+0)+(y+4)) (3*(x+0)+2*(y+4)) (x+0) ((x+0)+(y+4)) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midlow_1_2M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D ((x+1)+(y+2)) (3*(x+1)+2*(y+2)) 0 (y+2) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midhigh_1_2M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+1)+(y+2)) (3*(x+1)+2*(y+2)) (x+1) ((x+1)+(y+2)) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midlow_2_1M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D ((x+2)+(y+1)) (3*(x+2)+2*(y+1)) 0 (y+1) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midhigh_2_1M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+2)+(y+1)) (3*(x+2)+2*(y+1)) (x+2) ((x+2)+(y+1)) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midlow_3_0M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D ((x+3)+(y+0)) (3*(x+3)+2*(y+0)) 0 (y+0) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_midhigh_3_0M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+3)+(y+0)) (3*(x+3)+2*(y+0)) (x+3) ((x+3)+(y+0)) 0 := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_high_1_4M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+1)+(y+4)) (3*(x+1)+(y+4)) ((x+1)+(y+4)) (x+1) (y+4) := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_high_2_1M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+2)+(y+1)) (3*(x+2)+(y+1)) ((x+2)+(y+1)) (x+2) (y+1) := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity

theorem h3chart_high_3_0M13D (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 H3BoundsM13D (2*(x+3)+(y+0)) (3*(x+3)+(y+0)) ((x+3)+(y+0)) (x+3) (y+0) := by
 unfold H3BoundsM13D
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
 · apply sub_nonneg.mp
   unfold h3c0M13D h3c1M13D h3c2M13D h3c3M13D h3c4M13D h3c5M13D
   ring_nf
   positivity
end
end MathGKM.Markov
