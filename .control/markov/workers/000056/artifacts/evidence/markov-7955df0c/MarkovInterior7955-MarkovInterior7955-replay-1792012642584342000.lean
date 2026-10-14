import MarkovNextHorizontal7955
import MarkovInteriorD052
/-! Machine-authored 7955df0c. Exact residual; all other directions retained. -/
namespace MathGKM.Markov
noncomputable section
def Interior637955 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i + 1) j →
   InPolygon m.a m.b (i + 2) j → i + j + 4  ≤  m.a + m.b - 1 →
   coeff m.p i j * coeff m.p (i + 2) j  ≤  coeff m.p (i + 1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j + 1) →
   InPolygon m.a m.b i (j + 2) → i + j + 3  ≤  m.a + m.b - 1 →
   coeff m.p i j * coeff m.p i (j + 2)  ≤  coeff m.p i (j + 1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j + 2) → InPolygon m.a m.b (i + 1) (j + 1) →
   InPolygon m.a m.b (i + 2) j → i + j + 5  ≤  m.a + m.b - 1 → m.a + 3  ≤  i + j + 2 →
   coeff m.p i (j + 2) * coeff m.p (i + 2) j  ≤  coeff m.p (i + 1) (j + 1)^2)


theorem root_iff_interior7955 : Conjecture63 ↔ Interior637955 := by
 rw [root_iff_interiorD052]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨fun i j h0 h1 h2 ht => hh i j h0 h1 h2 (by omega),hv,hd⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨?_,hv,hd⟩
   intro i j h0 h1 h2 ht
   by_cases he : i+j+4 ≤ (frame path).mid.a+(frame path).mid.b-1
   · exact hh i j h0 h1 h2 he
   · exact source_next_horizontal7955 path i j h0 (by omega)
#print axioms root_iff_interior7955
end
end MathGKM.Markov
