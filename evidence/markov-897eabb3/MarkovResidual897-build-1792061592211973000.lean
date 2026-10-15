import MarkovFourthLowSource897
/-! Machine-authored 897eabb3. Exact root equivalence after the low-slope
fourth slice. The infinite residual is explicitly unproved. -/
namespace MathGKM.Markov
noncomputable section

def InteriorCore63897 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b → (m.a+5≤i+j+2 ∨ m.b<2*m.a) →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_core897 : Conjecture63 ↔ InteriorCore63897 := by
 rw [root_iff_core8833]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs hb _ => hd i j h0 h1 h2 ht hs hb⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb
   by_cases he : i+j+2=(frame path).mid.a+4
   · by_cases hr : 2*(frame path).mid.a≤(frame path).mid.b
     · exact source_fourth_lower_low897 path i j hr he h0 h1 h2
     · exact hd i j h0 h1 h2 ht hs hb (Or.inr (by omega))
   · exact hd i j h0 h1 h2 ht hs hb (Or.inl (by omega))

end
end MathGKM.Markov
