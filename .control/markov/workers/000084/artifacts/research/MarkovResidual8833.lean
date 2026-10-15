import MarkovThirdGlobal8833
import MarkovResidualFD
/-! Machine-authored 8833a0fb. Exact residual equivalence; residual unproved. -/
namespace MathGKM.Markov
noncomputable section

def Interior638833 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+5 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interior8833 : Conjecture63 ↔ Interior638833 := by
 rw [root_iff_interiorFD]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs =>
     hd i j h0 h1 h2 ht (by omega) (Or.inl hs) (Or.inl hs) (Or.inl hs)⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs _ _ _
   by_cases he : i+j+2=(frame path).mid.a+3
   · exact source_third_lower8833 path i j he h0 h1 h2
   · exact hd i j h0 h1 h2 ht (by omega)

end
end MathGKM.Markov
