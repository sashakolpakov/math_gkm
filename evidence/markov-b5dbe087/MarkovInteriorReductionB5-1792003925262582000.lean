import MarkovTopVerticalB5
import MarkovTopHorizontal58d2
/-! Machine-authored b5dbe087. Exact residual equivalence, not a proof of
either side. The top three homogeneous layers are discharged in all directions. -/
namespace MathGKM.Markov
noncomputable section

def Interior63B5 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+3 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+3 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+5 ≤ m.a+m.b-1 →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_interiorB5 : Conjecture63 ↔ Interior63B5 := by
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h.2.2 path
   exact ⟨fun i j h0 h1 h2 _ => hh i j h0 h1 h2,
     fun i j h0 h1 h2 _ => hv i j h0 h1 h2,
     fun i j h0 h1 h2 _ => hd i j h0 h1 h2⟩
 · intro h
   refine ⟨?_,?_,?_⟩
   · constructor
     · intro i j h0 h1 h2; unfold InPolygon at *; omega
     constructor
     · intro i j h0 h1 h2; unfold InPolygon at *; omega
     · intro i j h0 h1 h2; unfold InPolygon at *; omega
   · constructor
     · intro i j h0 h1 h2; unfold InPolygon at *; omega
     constructor
     · intro i j h0 h1 h2; unfold InPolygon at *; omega
     · intro i j h0 h1 h2; unfold InPolygon at *; omega
   · intro path
     obtain ⟨hh,hv,hd⟩ := h path
     constructor
     · intro i j h0 h1 h2
       by_cases ht : i+j+3 ≤ (frame path).mid.a+(frame path).mid.b-1
       · exact hh i j h0 h1 h2 ht
       · exact source_top_horizontal_raw58 path i j h0 (by have := h2.2; omega)
     constructor
     · intro i j h0 h1 h2
       by_cases ht : i+j+3 ≤ (frame path).mid.a+(frame path).mid.b-1
       · exact hv i j h0 h1 h2 ht
       · exact source_top_vertical_rawB5 path i j h0 (by have := h2.2; omega)
     · intro i j h0 h1 h2
       by_cases ht : i+j+5 ≤ (frame path).mid.a+(frame path).mid.b-1
       · exact hd i j h0 h1 h2 ht
       · let r := (frame path).mid.a+(frame path).mid.b-1-(i+j+2)
         have hr : r ≤ 2 := by dsimp [r]; omega
         exact first_three_raw_logConcave5a7 path r i j hr (by
           dsimp [r]; have := h0.2; omega)

#print axioms root_iff_interiorB5
end
end MathGKM.Markov
