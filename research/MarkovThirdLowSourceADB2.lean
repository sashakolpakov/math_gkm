import MarkovSourceCubicADB2
import MarkovThirdChambersADB2
import MarkovLowSlices5a7
/-! Machine-authored request adb2c7b0. Unconditional third lower diagonal
for every low-slope source. Small cycles use already proved upper diagonals.
Original polygon guards and raw integer coefficients are retained. -/
namespace MathGKM.Markov
noncomputable section

theorem source_false_third_largeADB2 (rest : List Bool) (hc : 4≤(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (false::rest)).mid.a+3) :
 coeff (frame (false::rest)).mid.p i (j+2)*
 coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 exact source_third_of_formula75 (false::rest) _ _ _ _ _
   (source_third_formulaADB2 rest hc) (source_third_chamberADB2 rest hc) i j hs

theorem source_false_third_diagonalADB2 (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+3)
 (h0 : InPolygon (frame (false::rest)).mid.a (frame (false::rest)).mid.b i (j+2)) :
 coeff (frame (false::rest)).mid.p i (j+2)*
 coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 4≤(frame rest).mid.b
 · exact source_false_third_largeADB2 rest hc i j hs
 have hi := source_run_indicesBF 0 rest
 simp only [List.replicate_zero,List.nil_append,Nat.mul_zero,Nat.zero_add,
   Nat.zero_add,Nat.mul_one] at hi
 obtain ⟨ha,hb⟩ := hi
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hp := h0.2
 have hcases : (frame rest).mid.b=3 ∧
     ((frame rest).mid.a=1 ∨ (frame rest).mid.a=2) := by omega
 obtain ⟨hc3,hr1|hr2⟩ := hcases
 · exact top_raw_logConcave1998 (false::rest) i j (by omega)
 · exact second_raw_logConcave5a7 (false::rest) i j (by omega)

/-- Every path with 2a≤b, including all short paths and rational chamber
boundaries. No normalization and no support filtering. -/
theorem source_third_lower_lowADB2 (path : List Bool) (i j : ℕ)
 (hratio : 2*(frame path).mid.a≤(frame path).mid.b)
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
   have hn : n=0 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 1≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb hm
     omega
   subst n
   simpa using source_false_third_diagonalADB2 rest i j hs h0

#print axioms source_false_third_largeADB2
#print axioms source_false_third_diagonalADB2
#print axioms source_third_lower_lowADB2
end
end MathGKM.Markov
