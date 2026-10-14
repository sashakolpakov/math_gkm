import MarkovCubicBounds446
/-! Machine-authored 446bbcdc. Raw second lower diagonal for the low-slope
half of the universal source family. All zero coefficients are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_false_second_diagonal446 (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+2) :
 coeff (frame (false::rest)).mid.p i (j+2)*
 coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_second_raw_compressed446 0 rest i (j+2) (by simpa using hs)
 have h1 := source_second_raw_compressed446 0 rest (i+1) (j+1) (by simpa [Nat.add_assoc] using hs)
 have h2 := source_second_raw_compressed446 0 rest (i+2) j (by simpa [Nat.add_assoc] using hs)
 simp only [List.replicate_zero,List.nil_append,secondCompressed_zero446,
   cubicPoly_coeff446] at h0 h1 h2
 obtain ⟨hr,hc,_⟩ := frame_reduced rest
 have h := cubicSeq_lc446 (frame rest).mid.b (frame rest).mid.a j hr hc
 rw [← h0,← h1,← h2] at h
 nlinarith

/-- An unconditional raw-source result on i+j=a+2 whenever 2a≤b.
The statement retains the original polygon guards and coefficient orientation. -/
theorem source_second_lower_low446 (path : List Bool) (i j : ℕ)
 (hratio : 2*(frame path).mid.a≤(frame path).mid.b)
 (hs : i+j+2=(frame path).mid.a+2)
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
   simpa using source_false_second_diagonal446 rest i j hs

#print axioms source_false_second_diagonal446
#print axioms source_second_lower_low446
end
end MathGKM.Markov
