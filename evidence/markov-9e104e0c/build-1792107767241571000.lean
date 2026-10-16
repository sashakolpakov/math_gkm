import MarkovResidualHorizontalM511
import MarkovHorizontalFourAllM9E1
import MarkovSmallVertical274
/-! Machine-authored request 9e104e0c. Exact root reduction. The interior
proposition remains unproved; every original direction and endpoint is retained. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000

def InteriorCore63M9E1 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 2 ≤ i →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorM9E1 : Conjecture63 ↔ InteriorCore63M9E1 := by
 constructor
 · intro h path _
   obtain ⟨hh,hv,hd⟩ := h.2.2 path
   exact ⟨fun i j h0 h1 h2 _ _ => hh i j h0 h1 h2,
     fun i j h0 h1 h2 _ _ => hv i j h0 h1 h2,
     fun i j h0 h1 h2 _ _ _ => hd i j h0 h1 h2⟩
 · intro h
   apply root_iff_horizontalM511.mpr
   intro path
   by_cases ha : (frame path).mid.a=1
   · obtain ⟨hh,hv,hd⟩ := source_one_global6 path ha
     exact ⟨fun i j _ _ _ _ _ => hh i j,
       fun i j _ _ _ _ => hv i j,
       fun i j _ _ _ _ _ _ => hd i j⟩
   have ha2 : 2 ≤ (frame path).mid.a := by have hp := (frame_reduced path).1; omega
   obtain ⟨hh,hv,hd⟩ := h path ha2
   refine ⟨?_,?_,hd⟩
   · intro i j h0 h1 h2 ht _
     by_cases hj : j ≤ 4
     · exact horizontal_first_fiveM9E1 path i j hj
     · exact hh i j h0 h1 h2 ht (by omega)
   · intro i j h0 h1 h2 ht
     by_cases hi0 : i=0
     · subst i; exact vertical_boundary_raw46 path j
     by_cases hi1 : i=1
     · subst i; exact vertical_one_all274 path j
     exact hv i j h0 h1 h2 ht (by omega)

end
end MathGKM.Markov
