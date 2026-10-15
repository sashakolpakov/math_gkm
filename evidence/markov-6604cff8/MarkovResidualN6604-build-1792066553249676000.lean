import MarkovFourthTwoSourceK062
import MarkovFourthThreeSourceN6604
import MarkovResidualBE
/-! Machine-authored 6604cff8, derived from preserved 062809ba draft. Fourth lower diagonal through slope 4/5. -/
namespace MathGKM.Markov
noncomputable section
theorem source_fourth_lower_four_fifthsN6604 (path : List Bool) (i j : ℕ)
 (hratio : 5*(frame path).mid.a≤4*(frame path).mid.b)
 (hs : i+j+2=(frame path).mid.a+4)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h1 h2
   exact right_raw_diagonal0618 n i j h0 h1 h2
 · subst path
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hc,_⟩ := frame_reduced rest
   have hn : n≤3 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 4≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb hm
     omega
   interval_cases n
   · simpa using source_false_fourth897 rest i j hs h0
   · simpa using source_fourth_oneBE rest i j hs h0
   · exact source_fourth_twoK062 rest i j hs
   · exact source_fourth_threeN6604 rest i j hs
def InteriorCore63N6604 : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b → (m.a+5 ≤ i+j+2 ∨ 4*m.b < 5*m.a) →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreN6604 : Conjecture63 ↔ InteriorCore63N6604 := by
 rw [root_iff_coreBE]
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
   · by_cases hr : 5*(frame path).mid.a≤4*(frame path).mid.b
     · exact source_fourth_lower_four_fifthsN6604 path i j hr he h0 h1 h2
     · exact hd i j h0 h1 h2 ht hs hb (Or.inr (by omega))
   · exact hd i j h0 h1 h2 ht hs hb (Or.inl (by omega))

end
end MathGKM.Markov
