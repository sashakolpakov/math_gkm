import MarkovStripAllMD11
import MarkovResidualFullMCE8
/-! Machine-authored d11e335e. Exact residual; all other directions retained. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff

def InteriorCore63LowMD11 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 2 ≤ m.a →
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 → 5 ≤ j →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 → 4 ≤ i → 2 ≤ j →
   (j=2 → m.b<4*m.a) →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+5 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interior_lowMD11 : Conjecture63 ↔ InteriorCore63LowMD11 := by
 rw [root_iff_interior_fullMCE8]
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
   by_cases hc : j=2 → (frame path).mid.b<4*(frame path).mid.a
   · exact hv i j h0 h1 h2 ht hi hj hc
   have hj2 : j=2 := by tauto
   have hs : 4*(frame path).mid.a ≤ (frame path).mid.b := by omega
   subst j
   simpa using source_strip_allMD11 path hs i
end
end MathGKM.Markov
