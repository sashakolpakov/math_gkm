import MarkovResidualM9E1
import MarkovVerticalSecondRightMDE6
/-! Machine-authored request de6168c6. Exact root residual after the new
second-column family. The residual is unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

def InteriorCore63MDE6 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 2 ≤ i →
   (i=2 → 2*m.a ≤ m.b) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorMDE6 : Conjecture63 ↔ InteriorCore63MDE6 := by
 rw [root_iff_interiorM9E1]
 constructor
 · intro h path ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi _ => hv i j h0 h1 h2 ht hi,hd⟩
 · intro h path ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi
   by_cases he : i=2
   · subst i
     by_cases hb : (frame path).mid.b < 2*(frame path).mid.a
     · exact vertical_second_near_oneMDE6 path hb j
     · exact hv 2 j h0 h1 h2 ht hi (by omega)
   · exact hv i j h0 h1 h2 ht hi (by omega)

end
end MathGKM.Markov
