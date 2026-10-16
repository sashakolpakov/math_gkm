import MarkovResidualM37B
import MarkovSourceCentralM3A1
/-! Machine-authored 3a11314d. Exact residual; all other clauses are retained. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def InteriorCore63M3A1 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   ¬HorizontalMiddleMF1E m.a m.b i j →
   ¬(HorizontalRegionMAC3 m.a m.b i j ∨ HorizontalVarianceMAC3 m.a m.b i j) →
   ¬HorizontalSharpM37B m.a m.b i j →
   ¬(m.a=2 ∧ i=2 ∧ m.b=2*j+1) →
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

theorem root_iff_interiorM3A1 : Conjecture63 ↔ InteriorCore63M3A1 := by
 rw [root_iff_interiorM37B]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨fun i j h0 h1 h2 ht hj hm hn hs _ => hh i j h0 h1 h2 ht hj hm hn hs,hv,hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,hv,hd⟩
   intro i j h0 h1 h2 ht hj hm hn hs
   by_cases hc : (frame path).mid.a=2 ∧ i=2 ∧ (frame path).mid.b=2*j+1
   · obtain ⟨ha',rfl,hb⟩ := hc
     exact source_two_centralM3A1 path j ha' hb
   · exact hh i j h0 h1 h2 ht hj hm hn hs hc
end
end MathGKM.Markov
