import MarkovSecondSourceD052
import MarkovInterior487
/-! Machine-authored 0d052acb. Exact residual; full root is still unresolved. -/
namespace MathGKM.Markov
noncomputable section

def Interior63D052 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i + 1) j →
   InPolygon m.a m.b (i + 2) j → i + j + 3 ≤ m.a + m.b - 1 →
   coeff m.p i j * coeff m.p (i + 2) j ≤ coeff m.p (i + 1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j + 1) →
   InPolygon m.a m.b i (j + 2) → i + j + 3 ≤ m.a + m.b - 1 →
   coeff m.p i j * coeff m.p i (j + 2) ≤ coeff m.p i (j + 1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j + 2) → InPolygon m.a m.b (i + 1) (j + 1) →
   InPolygon m.a m.b (i + 2) j → i + j + 5 ≤ m.a + m.b - 1 → m.a + 3 ≤ i + j + 2 →
   coeff m.p i (j + 2) * coeff m.p (i + 2) j ≤ coeff m.p (i + 1) (j + 1)^2)

theorem root_iff_interiorD052 : Conjecture63 ↔ Interior63D052 := by
 rw [root_iff_interior487]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs => hd i j h0 h1 h2 ht (by omega)⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs
   by_cases he : (frame path).mid.a+3≤i+j+2
   · exact hd i j h0 h1 h2 ht he
   · exact source_second_lower_diagonalD052 path i j (by omega) h0 h1 h2

#print axioms root_iff_interiorD052
end
end MathGKM.Markov
