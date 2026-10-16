import MarkovResidualMF1E
import MarkovSourceVarianceMAC3
/-! Machine-authored ac3d4ab9. Exact residual, with every unproved clause kept.
The residual itself is not asserted. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def InteriorCore63MAC3 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   ¬HorizontalMiddleMF1E m.a m.b i j →
   ¬(HorizontalRegionMAC3 m.a m.b i j ∨ HorizontalVarianceMAC3 m.a m.b i j) →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 3 ≤ j →
   ¬VerticalMiddleMF1E m.a m.b i j →
   ¬(VerticalRegionMAC3 m.a m.b i j ∨ VerticalVarianceMAC3 m.a m.b i j) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b → ¬DiagonalMiddleMF1E m.a m.b i j →
   ¬(DiagonalRegionMAC3 m.a m.b i j ∨ DiagonalVarianceMAC3 m.a m.b i j) →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorMAC3 : Conjecture63 ↔ InteriorCore63MAC3 := by
 rw [root_iff_interiorMF1E]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨fun i j h0 h1 h2 ht hj hm _ => hh i j h0 h1 h2 ht hj hm,
     fun i j h0 h1 h2 ht hi hj hm _ => hv i j h0 h1 h2 ht hi hj hm,
     fun i j h0 h1 h2 ht hs hb hm _ => hd i j h0 h1 h2 ht hs hb hm⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,?_,?_⟩
   · intro i j h0 h1 h2 ht hj hm
     by_cases hn : HorizontalRegionMAC3 (frame path).mid.a (frame path).mid.b i j ∨
       HorizontalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j
     · rcases hn with hn | hn
       · exact source_horizontal_regionMAC3 path i j hn
       · exact source_horizontal_varianceMAC3 path i j hn
     · exact hh i j h0 h1 h2 ht hj hm hn
   · intro i j h0 h1 h2 ht hi hj hm
     by_cases hn : VerticalRegionMAC3 (frame path).mid.a (frame path).mid.b i j ∨
       VerticalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j
     · rcases hn with hn | hn
       · exact source_vertical_regionMAC3 path i j hn
       · exact source_vertical_varianceMAC3 path i j hn
     · exact hv i j h0 h1 h2 ht hi hj hm hn
   · intro i j h0 h1 h2 ht hs hb hm
     by_cases hn : DiagonalRegionMAC3 (frame path).mid.a (frame path).mid.b i j ∨
       DiagonalVarianceMAC3 (frame path).mid.a (frame path).mid.b i j
     · rcases hn with hn | hn
       · exact source_diagonal_regionMAC3 path i j hn
       · exact source_diagonal_varianceMAC3 path i j hn
     · exact hd i j h0 h1 h2 ht hs hb hm hn
end
end MathGKM.Markov
