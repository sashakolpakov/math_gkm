import MarkovQuinticE273
import MarkovSecondLowSource446
import MarkovPellRawLC0618
/-! Machine-authored e27336bc. A raw-source second-slice inequality for
all rational source labels with 3a ≤ 2b. No denominator bound. -/
namespace MathGKM.Markov
noncomputable section

theorem source_true_false_secondE273 (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (true::false::rest)).mid.a+2) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_second_raw_compressed446 1 rest i (j+2)
   (by change i+(j+2)=(frame (true::false::rest)).mid.a+2; omega)
 have h1 := source_second_raw_compressed446 1 rest (i+1) (j+1)
   (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+2; omega)
 have h2 := source_second_raw_compressed446 1 rest (i+2) j
   (by change (i+2)+j=(frame (true::false::rest)).mid.a+2; omega)
 simp only [List.replicate_succ,List.replicate_zero,List.cons_append,List.nil_append,
   secondCompressed_oneE273,quinticPoly_coeffE273] at h0 h1 h2
 obtain ⟨hr,hc,_⟩ := frame_reduced rest
 have h := quinticSeq_lcE273 (frame rest).mid.b (frame rest).mid.a j hr hc
 rw [← h0,← h1,← h2] at h
 nlinarith

theorem source_second_lower_bandE273 (path : List Bool) (i j : ℕ)
 (hratio : 3*(frame path).mid.a≤2*(frame path).mid.b)
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
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hc,_⟩ := frame_reduced rest
   have hn : n≤1 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 2≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb
     omega
   interval_cases n
   · simpa using source_false_second_diagonal446 rest i j hs
   · simpa using source_true_false_secondE273 rest i j hs

#print axioms source_true_false_secondE273
#print axioms source_second_lower_bandE273
end
end MathGKM.Markov
