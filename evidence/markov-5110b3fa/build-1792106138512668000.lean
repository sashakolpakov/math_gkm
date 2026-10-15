import MarkovResidualFifthMCFC
import MarkovHorizontalFourthLCM511
import MarkovHorizontalThirdSourceM13D
import MarkovHorizontalTwo05ef
/-! Machine-authored request 5110b3fa. Exact root reduction retaining every
unresolved horizontal case, both other directions, and the inherited endpoints. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 5000000

def HorizontalUnresolvedM511 (a b j : ℕ) : Prop :=
 2 ≤ j ∧ (j=2 → b<5) ∧ (j=3 → a<2 ∨ b<7) ∧ (j=4 → a<3 ∨ b<9)

def InteriorCore63HorizontalM511 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   HorizontalUnresolvedM511 m.a m.b j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_horizontalM511 : Conjecture63 ↔ InteriorCore63HorizontalM511 := by
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h.2.2 path
   exact ⟨fun i j h0 h1 h2 _ _ => hh i j h0 h1 h2,
     fun i j h0 h1 h2 _ => hv i j h0 h1 h2,
     fun i j h0 h1 h2 _ _ _ => hd i j h0 h1 h2⟩
 · intro h
   apply root_iff_coreFifthMCFC.mpr
   intro path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨?_,hv,hd⟩
   intro i j h0 h1 h2 ht
   by_cases hj0 : j=0
   · subst j; exact boundary_raw_logConcave path i
   by_cases hj1 : j=1
   · subst j; exact horizontal_one_raw46 path i
   by_cases hj2 : j=2
   · by_cases hb : 5 ≤ (frame path).mid.b
     · subst j; exact horizontal_two_raw05ef path hb i
     · exact hh i j h0 h1 h2 ht (by simp [HorizontalUnresolvedM511,hj2]; omega)
   by_cases hj3 : j=3
   · by_cases ha : 2 ≤ (frame path).mid.a ∧ 7 ≤ (frame path).mid.b
     · subst j; exact horizontal_third_rawM13D path ha.1 ha.2 i
     · exact hh i j h0 h1 h2 ht (by simp [HorizontalUnresolvedM511,hj3]; omega)
   by_cases hj4 : j=4
   · by_cases ha : 3 ≤ (frame path).mid.a ∧ 9 ≤ (frame path).mid.b
     · subst j; exact horizontal_fourth_rawM511 path ha.1 ha.2 i
     · exact hh i j h0 h1 h2 ht (by simp [HorizontalUnresolvedM511,hj4]; omega)
   exact hh i j h0 h1 h2 ht (by simp [HorizontalUnresolvedM511,hj2,hj3,hj4]; omega)

end
end MathGKM.Markov
