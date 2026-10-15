import MarkovResidual8833
import MarkovSixthAll05ef
/-! Machine-authored 8833a0fb. Reuse the established six upper slices;
isolate the genuine middle diagonals without dropping any directions. -/
namespace MathGKM.Markov
noncomputable section

theorem source_lower_three8833 (path : List Bool) (i j : ℕ)
 (hs : i+j+2 ≤ (frame path).mid.a+3)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have hl := polygon_diagonal_lower487 path i j h0
 have he : i+j+2=(frame path).mid.a+1 ∨ i+j+2=(frame path).mid.a+2 ∨
   i+j+2=(frame path).mid.a+3 := by omega
 rcases he with he | he | he
 · exact source_first_lower_diagonal487 path i j he h0 h1 h2
 · exact source_second_lower_diagonalD052 path i j he h0 h1 h2
 · exact source_third_lower8833 path i j he h0 h1 h2

theorem source_diagonal_ten8833 (path : List Bool) (hb : (frame path).mid.b ≤ 10)
 (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases hs : i+j+2 ≤ (frame path).mid.a+3
 · exact source_lower_three8833 path i j hs h0 h1 h2
 · have ht := h0.2
   exact first_six_raw05ef path ((frame path).mid.a+(frame path).mid.b-1-(i+j+2))
     i j (by omega) (by omega)

def InteriorCore638833 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_core8833 : Conjecture63 ↔ InteriorCore638833 := by
 rw [root_iff_interior8833]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht hs _ => hd i j h0 h1 h2 (by omega) hs⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs
   by_cases hb : (frame path).mid.a+2 ≤ (frame path).mid.b
   · by_cases hu : i+j+8 ≤ (frame path).mid.a+(frame path).mid.b-1
     · exact hd i j h0 h1 h2 hu hs hb
     · have ht' := h0.2
       exact first_six_raw05ef path ((frame path).mid.a+(frame path).mid.b-1-(i+j+2))
         i j (by omega) (by omega)
   · have hab := (frame_reduced path).2.1
     exact source_near_one_diagonal0618 path (by omega) i j h0 h1 h2

end
end MathGKM.Markov
