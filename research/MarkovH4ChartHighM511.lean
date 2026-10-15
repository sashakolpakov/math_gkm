import MarkovHorizontalFourthGoodM511
/-! Machine-authored request 5110b3fa. Exact fourth horizontal seed certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

theorem h4chart_high_1_5M511 (x y : ℝ) (hx : 0≤x) (hy : 0≤y) :
 H4GoodM511 (8+3*x+y) (9+4*x+y) (7+2*x+y) (1+x) (6+x+y) (0) (1+x) (5+y) := by
 unfold H4GoodM511 H4BoundsM511
 refine ⟨⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩,?_,?_⟩
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity

theorem h4chart_high_2_1M511 (x y : ℝ) (hx : 0≤x) (hy : 0≤y) :
 H4GoodM511 (7+3*x+y) (9+4*x+y) (5+2*x+y) (2+x) (3+x+y) (0) (2+x) (1+y) := by
 unfold H4GoodM511 H4BoundsM511
 refine ⟨⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩,?_,?_⟩
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity

theorem h4chart_high_3_0M511 (x y : ℝ) (hx : 0≤x) (hy : 0≤y) :
 H4GoodM511 (9+3*x+y) (12+4*x+y) (6+2*x+y) (3+x) (3+x+y) (0) (3+x) (y) := by
 unfold H4GoodM511 H4BoundsM511
 refine ⟨⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩,?_,?_⟩
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
 · apply sub_nonneg.mp
   simp only [h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511]
   ring_nf <;> positivity
end
end MathGKM.Markov
