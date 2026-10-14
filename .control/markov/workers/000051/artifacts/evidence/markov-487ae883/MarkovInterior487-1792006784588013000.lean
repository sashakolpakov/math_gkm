import MarkovLowerSource487
import MarkovInteriorReductionB5
/-! Machine-authored 487ae883. Exact infinite residual, not root closure. -/
namespace MathGKM.Markov
noncomputable section

def Interior63487 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+3≤m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j≤coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+3≤m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2)≤coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+5≤m.a+m.b-1 → m.a+2≤i+j+2 →
   coeff m.p i (j+2)*coeff m.p (i+2) j≤coeff m.p (i+1) (j+1)^2)

theorem polygon_diagonal_lower487 (path : List Bool) (i j : ℕ)
 (h : InPolygon (frame path).mid.a (frame path).mid.b i (j+2)) :
 (frame path).mid.a+1≤i+j+2 := by
 obtain ⟨ha,hab,_⟩ := frame_reduced path
 have hp := h.1
 by_contra hn
 have hs : i+j+2≤(frame path).mid.a := by omega
 have hm := Nat.mul_le_mul_left (frame path).mid.b hs
 have hg : 0<((frame path).mid.b-(frame path).mid.a)*(j+2) :=
   Nat.mul_pos (by omega) (by omega)
 have he : (frame path).mid.b-(frame path).mid.a+(frame path).mid.a=
   (frame path).mid.b := Nat.sub_add_cancel (by omega)
 nlinarith

theorem root_iff_interior487 : Conjecture63 ↔ Interior63487 := by
 rw [root_iff_interiorB5]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   exact ⟨hh,hv,fun i j h0 h1 h2 ht _ => hd i j h0 h1 h2 ht⟩
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht
   by_cases hs : (frame path).mid.a+2≤i+j+2
   · exact hd i j h0 h1 h2 ht hs
   · have hl := polygon_diagonal_lower487 path i j h0
     exact source_first_lower_diagonal487 path i j (by omega) h0 h1 h2

#print axioms root_iff_interior487
end
end MathGKM.Markov
