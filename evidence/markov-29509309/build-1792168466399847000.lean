import MarkovResidualM0D3
import MarkovEightVerticalM295
/-! Machine-authored 29509309. All previous residual clauses are preserved;
only the newly proved eighth vertical column of numerator-two sources is removed. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def InteriorCore63M295 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   ¬HorizontalMiddleMF1E m.a m.b i j →
   ¬(HorizontalRegionMAC3 m.a m.b i j ∨ HorizontalVarianceMAC3 m.a m.b i j) →
   ¬HorizontalSharpM37B m.a m.b i j → m.a≠2 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 3 ≤ j →
   ¬VerticalMiddleMF1E m.a m.b i j →
   ¬(VerticalRegionMAC3 m.a m.b i j ∨ VerticalVarianceMAC3 m.a m.b i j) →
   ¬VerticalSharpM37B m.a m.b i j → ¬(m.a=2 ∧ i=4) → ¬(m.a=2 ∧ i=8) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b → ¬DiagonalMiddleMF1E m.a m.b i j →
   ¬(DiagonalRegionMAC3 m.a m.b i j ∨ DiagonalVarianceMAC3 m.a m.b i j) →
   ¬DiagonalSharpM37B m.a m.b i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorM295 : Conjecture63 ↔ InteriorCore63M295 := by
 rw [root_iff_interiorM0D3]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi hj hm hn hs hc _ =>
     hv i j h0 h1 h2 ht hi hj hm hn hs hc,hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi hj hm hn hs hc
   by_cases he : (frame path).mid.a=2 ∧ i=8
   · rcases he with ⟨he,rfl⟩
     exact source_two_vertical_eightM295 path he j
   · exact hv i j h0 h1 h2 ht hi hj hm hn hs hc he
end
end MathGKM.Markov
