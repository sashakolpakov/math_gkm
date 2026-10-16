import MarkovStripAllMCE8
import MarkovResidualMAA6
/-! Machine-authored ce882be3. Exact root reduction; the residual is unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

def InteriorCore63MCE8 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 1 ≤ j → (2 ≤ j ∨ m.b < 2*m.a) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorMCE8 : Conjecture63 ↔ InteriorCore63MCE8 := by
 rw [root_iff_interiorMAA6]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi hj _ => hv i j h0 h1 h2 ht hi hj,hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi hj
   by_cases hc : 2 ≤ j ∨ (frame path).mid.b < 2*(frame path).mid.a
   · exact hv i j h0 h1 h2 ht hi hj hc
   have hj1 : j=1 := by omega
   subst j
   have hs : 2*(frame path).mid.a ≤ (frame path).mid.b := by omega
   simpa using source_strip_all_lowMCE8 path hs i
end
end MathGKM.Markov
