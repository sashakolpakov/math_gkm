import MarkovSourceInteriorMF1E
import MarkovResidualMF25
/-! Machine-authored f1e4fe3b. Exact residual retaining every unreached clause.
The residual is a proposition definition, not an asserted theorem. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

def DiagonalMiddleMF1E (a b i j : ℕ) : Prop :=
 ∃ r, i+j+2+r=a+b-1 ∧ r+r^2 ≤ i ∧ r+r^2 ≤ j

def InteriorCore63MF1E : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   ¬HorizontalMiddleMF1E m.a m.b i j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 3 ≤ j →
   ¬VerticalMiddleMF1E m.a m.b i j →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b → ¬DiagonalMiddleMF1E m.a m.b i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorMF1E : Conjecture63 ↔ InteriorCore63MF1E := by
 rw [root_iff_interiorMF25]
 constructor
 · intro h path ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨fun i j h0 h1 h2 ht hj _ => hh i j h0 h1 h2 ht hj,
     fun i j h0 h1 h2 ht hi hj _ => hv i j h0 h1 h2 ht hi hj,
     fun i j h0 h1 h2 ht hs hb _ => hd i j h0 h1 h2 ht hs hb⟩
 · intro h path ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,?_,?_⟩
   · intro i j h0 h1 h2 ht hj
     by_cases hm : HorizontalMiddleMF1E (frame path).mid.a (frame path).mid.b i j
     · exact source_horizontal_middleMF1E path i j hm
     · exact hh i j h0 h1 h2 ht hj hm
   · intro i j h0 h1 h2 ht hi hj
     by_cases hm : VerticalMiddleMF1E (frame path).mid.a (frame path).mid.b i j
     · exact source_vertical_middleMF1E path i j hm
     · exact hv i j h0 h1 h2 ht hi hj hm
   · intro i j h0 h1 h2 ht hs hb
     by_cases hm : DiagonalMiddleMF1E (frame path).mid.a (frame path).mid.b i j
     · obtain ⟨r,hr,hi,hj⟩ := hm
       exact source_diagonal_middleMF1E path r i j hr hi hj
     · exact hd i j h0 h1 h2 ht hs hb hm
end
end MathGKM.Markov
