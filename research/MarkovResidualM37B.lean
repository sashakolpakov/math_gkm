import MarkovResidualMAC3
import MarkovSourceSharpM37B
/-! Machine-authored 37bf1d20. Exact residual, with every unproved clause kept.
The residual itself is not asserted. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def InteriorCore63M37B : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   ¬HorizontalMiddleMF1E m.a m.b i j →
   ¬(HorizontalRegionMAC3 m.a m.b i j ∨ HorizontalVarianceMAC3 m.a m.b i j) →
   ¬HorizontalSharpM37B m.a m.b i j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 3 ≤ j →
   ¬VerticalMiddleMF1E m.a m.b i j →
   ¬(VerticalRegionMAC3 m.a m.b i j ∨ VerticalVarianceMAC3 m.a m.b i j) →
   ¬VerticalSharpM37B m.a m.b i j →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b → ¬DiagonalMiddleMF1E m.a m.b i j →
   ¬(DiagonalRegionMAC3 m.a m.b i j ∨ DiagonalVarianceMAC3 m.a m.b i j) →
   ¬DiagonalSharpM37B m.a m.b i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorM37B : Conjecture63 ↔ InteriorCore63M37B := by
 rw [root_iff_interiorMAC3]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨fun i j h0 h1 h2 ht hj hm hn _ => hh i j h0 h1 h2 ht hj hm hn,
     fun i j h0 h1 h2 ht hi hj hm hn _ => hv i j h0 h1 h2 ht hi hj hm hn,
     fun i j h0 h1 h2 ht hs hb hm hn _ => hd i j h0 h1 h2 ht hs hb hm hn⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,?_,?_⟩
   · intro i j h0 h1 h2 ht hj hm hn
     by_cases hs : HorizontalSharpM37B (frame path).mid.a (frame path).mid.b i j
     · exact source_horizontal_sharpM37B path i j hs
     · exact hh i j h0 h1 h2 ht hj hm hn hs
   · intro i j h0 h1 h2 ht hi hj hm hn
     by_cases hs : VerticalSharpM37B (frame path).mid.a (frame path).mid.b i j
     · exact source_vertical_sharpM37B path i j hs
     · exact hv i j h0 h1 h2 ht hi hj hm hn hs
   · intro i j h0 h1 h2 ht hs hb hm hn
     by_cases hd' : DiagonalSharpM37B (frame path).mid.a (frame path).mid.b i j
     · exact source_diagonal_sharpM37B path i j hd'
     · exact hd i j h0 h1 h2 ht hs hb hm hn hd'
end
end MathGKM.Markov
