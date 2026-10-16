import MarkovResidualMDE6
import MarkovVerticalSeedLCM758
/-! Machine-authored request 7584c5d0. Exact root residual after the new
second-column family. The residual is unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

def InteriorCore63M758 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 2 ≤ i →
   (i=2 → 2*m.a ≤ m.b ∧ m.a ≤ 4) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorM758 : Conjecture63 ↔ InteriorCore63M758 := by
 rw [root_iff_interiorMDE6]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi he => hv i j h0 h1 h2 ht hi (fun h => (he h).1),hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi he
   by_cases hx : i=2
   · subst i
     by_cases ha5 : 5 ≤ (frame path).mid.a
     · exact vertical_second_largeM758 path ha5 j
     · exact hv 2 j h0 h1 h2 ht hi (by intro _; exact ⟨he rfl,by omega⟩)
   · exact hv i j h0 h1 h2 ht hi (by intro h; exact (hx h).elim)

end
end MathGKM.Markov
