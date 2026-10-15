import MarkovFourthOneSourceBE
/-! Machine-authored be5676f9. Exact root equivalence after all fourth lower
diagonals through slope 2/3. The remaining infinite predicate is unproved. -/
namespace MathGKM.Markov
noncomputable section

def InteriorCore63BE : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b → (m.a+5 ≤ i+j+2 ∨ 2*m.b < 3*m.a) →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreBE : Conjecture63 ↔ InteriorCore63BE := by
 rw [root_iff_core897]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx
   apply hd i j h0 h1 h2 ht hs hb
   rcases hx with hx|hx
   · exact Or.inl hx
   · exact Or.inr (by omega)
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb _
   by_cases he : i+j+2=(frame path).mid.a+4
   · by_cases hr : 3*(frame path).mid.a≤2*(frame path).mid.b
     · exact source_fourth_lower_two_thirdsBE path i j hr he h0 h1 h2
     · exact hd i j h0 h1 h2 ht hs hb (Or.inr (by omega))
   · exact hd i j h0 h1 h2 ht hs hb (Or.inl (by omega))

end
end MathGKM.Markov
