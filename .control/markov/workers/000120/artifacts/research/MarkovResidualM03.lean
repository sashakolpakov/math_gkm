import MarkovResidualMEA
import MarkovThirdAllLCM03
/-! Machine-authored 1152282d. Exact root residual; no root closure claimed. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

def InteriorCore63M03 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 3 ≤ i →
   (i=3 → m.a ≤ 6) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorM03 : Conjecture63 ↔ InteriorCore63M03 := by
 rw [root_iff_interiorMEA]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi _ => hv i j h0 h1 h2 ht hi,hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi
   by_cases hx : i=3 ∧ 7 ≤ (frame path).mid.a
   · obtain ⟨rfl,hx⟩ := hx
     exact vertical_third_largeM03 path hx j
   · exact hv i j h0 h1 h2 ht hi (by omega)
end
end MathGKM.Markov
