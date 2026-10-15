import MarkovThirdLowSourceADB2
import MarkovInterior7d80
/-! Machine-authored request adb2c7b0. Exact residual of the pinned root.
The residual is not asserted. All directions, polygon guards, and endpoints
remain accounted for by an equivalence to Conjecture63. -/
namespace MathGKM.Markov
noncomputable section

def Interior63ADB2 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4≤m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j≤coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4≤m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2)≤coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+5≤m.a+m.b-1 → m.a+3≤i+j+2 →
   (m.a+4≤i+j+2 ∨ m.b<2*m.a) →
   coeff m.p i (j+2)*coeff m.p (i+2) j≤coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorADB2 : Conjecture63 ↔ Interior63ADB2 := by
 rw [root_iff_interior7d80]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs _ => hd i j h0 h1 h2 ht hs⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs
   by_cases hn : (frame path).mid.a+4≤i+j+2 ∨ (frame path).mid.b<2*(frame path).mid.a
   · exact hd i j h0 h1 h2 ht hs hn
   · exact source_third_lower_lowADB2 path i j (by omega) (by omega) h0 h1 h2

#print axioms root_iff_interiorADB2
end
end MathGKM.Markov
