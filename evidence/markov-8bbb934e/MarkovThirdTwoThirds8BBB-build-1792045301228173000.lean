import MarkovThirdOneLarge8BBB
import MarkovThirdOneSmall8BBB
import MarkovThirdLowSourceADB2
/-! Machine-authored request 8bbb934e. Universal raw third LOWER diagonal
for every source of slope at most 2/3, including all small-cycle boundaries. -/
namespace MathGKM.Markov
noncomputable section

theorem source_third_one8BBB (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (true::false::rest)).mid.a+3) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 4≤(frame rest).mid.b
 · exact source_third_one_large8BBB rest hc i j hs
 · obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   exact source_third_all_cycles_of_lc8BBB 1 rest
     (corrected_one_small_lc8BBB _ _ (by omega) hr hrc) i j hs

theorem source_third_lower_twoThirds8BBB (path : List Bool) (i j : ℕ)
 (hratio : 3*(frame path).mid.a≤2*(frame path).mid.b)
 (hs : i+j+2=(frame path).mid.a+3)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true)
   rw [source_pell_word446] at ha hb
   simp at ha hb
   have ht := h0.2
   omega
 · subst path
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hc,_⟩ := frame_reduced rest
   have hn : n≤1 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 2≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb hm
     omega
   interval_cases n
   · simpa using source_false_third_diagonalADB2 rest i j hs h0
   · exact source_third_one8BBB rest i j hs

#print axioms source_third_one8BBB
#print axioms source_third_lower_twoThirds8BBB
end
end MathGKM.Markov
