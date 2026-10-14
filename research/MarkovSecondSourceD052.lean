import MarkovSecondAllD052
import MarkovSecondBandE273
/-! Machine-authored 0d052acb. Universal raw second-lower-diagonal inequality.
Every source path and all polygon triples are retained. -/
namespace MathGKM.Markov
noncomputable section

theorem source_run_secondD052 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+2) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hn : 2≤n
 · have h0 := source_second_explicitE273 n rest i (j+2) (by omega)
   have h1 := source_second_explicitE273 n rest (i+1) (j+1) (by omega)
   have h2 := source_second_explicitE273 n rest (i+2) j (by omega)
   obtain ⟨hr,hc,_⟩ := frame_reduced rest
   have hl := second_explicit_lcD052 n (frame rest).mid.b (frame rest).mid.a j hn hr hc
   rw [←h0,←h1,←h2] at hl
   nlinarith only [hl]
 · have hn' : n=0 ∨ n=1 := by omega
   rcases hn' with rfl | rfl
   · simpa using source_false_second_diagonal446 rest i j hs
   · simpa using source_true_false_secondE273 rest i j hs

theorem source_second_lower_diagonalD052 (path : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame path).mid.a+2)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   apply source_near_one_diagonal0618 _ _ i j h0 h1 h2
   rw [(right_labels650 n).1,(right_labels650 n).2]
 · subst path
   exact source_run_secondD052 n rest i j hs

#print axioms source_run_secondD052
#print axioms source_second_lower_diagonalD052
end
end MathGKM.Markov
