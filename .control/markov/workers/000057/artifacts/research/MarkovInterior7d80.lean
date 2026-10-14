import MarkovNextVertical7d80
import MarkovInterior7955
/-! Machine-authored 7d80a785. Exact residual, retaining every direction and endpoint. -/
namespace MathGKM.Markov
noncomputable section
def Interior637d80 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i + 1) j →
   InPolygon m.a m.b (i + 2) j → i + j + 4 ≤ m.a + m.b - 1 →
   coeff m.p i j * coeff m.p (i + 2) j ≤ coeff m.p (i + 1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j + 1) →
   InPolygon m.a m.b i (j + 2) → i + j + 4 ≤ m.a + m.b - 1 →
   coeff m.p i j * coeff m.p i (j + 2) ≤ coeff m.p i (j + 1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j + 2) → InPolygon m.a m.b (i + 1) (j + 1) →
   InPolygon m.a m.b (i + 2) j → i + j + 5 ≤ m.a + m.b - 1 → m.a + 3 ≤ i + j + 2 →
   coeff m.p i (j + 2) * coeff m.p (i + 2) j ≤ coeff m.p (i + 1) (j + 1)^2)

theorem root_iff_interior7d80 : Conjecture63 ↔ Interior637d80 := by
 rw [root_iff_interior7955]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,fun i j h0 h1 h2 ht => hv i j h0 h1 h2 (by omega),hd⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht
   by_cases he : i+j+4 ≤ (frame path).mid.a+(frame path).mid.b-1
   · exact hv i j h0 h1 h2 he
   · exact source_next_vertical7d80 path i j h0 (by omega)
#print axioms root_iff_interior7d80
end
end MathGKM.Markov
