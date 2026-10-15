import MarkovFourthOne0BE
import MarkovFourthOne1BE
import MarkovFourthOne2BE
import MarkovFourthOne3BE
import MarkovFourthOne4BE
import MarkovFourthOne5BE
import MarkovFourthOneSmallPolyBE
import MarkovResidual897
/-! Machine-authored be5676f9. Entire fourth lower diagonal through slope 2/3. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
theorem source_fourth_one_chamber_0BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 1*((frame rest).mid.a:ℤ)-0*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 1*(x+1)+4*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 0*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_0BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_0BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq0BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_0BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_one_chamber_1BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 4*(x+1)+3*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_1BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_1BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq1BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_1BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_one_chamber_2BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-2*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 3*(x+1)+2*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_2BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_2BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq2BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_2BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_one_chamber_3BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 2*(x+1)+3*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+2*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_3BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_3BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq3BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_3BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_one_chamber_4BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 3*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 3*(x+1)+4*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 2*(x+1)+3*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_4BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_4BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq4BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_4BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_one_chamber_5BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 4*(x+1)+1*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 3*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_5BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_5BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq5BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_5BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_one_largeBE (rest : List Bool) (hc : 5≤(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_one_chamber_0BE rest hc (by omega) (by omega) i j hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_one_chamber_1BE rest hc (by omega) (by omega) i j hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_one_chamber_2BE rest hc (by omega) (by omega) i j hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_one_chamber_3BE rest hc (by omega) (by omega) i j hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_one_chamber_4BE rest hc (by omega) (by omega) i j hs
 · exact source_fourth_one_chamber_5BE rest hc (by omega) (by omega) i j hs

theorem source_fourth_oneBE (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (true::false::rest)).mid.a+4)
 (h0 : InPolygon (frame (true::false::rest)).mid.a (frame (true::false::rest)).mid.b i (j+2)) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 5≤(frame rest).mid.b
 · exact source_fourth_one_largeBE rest hc i j hs
 obtain ⟨ha,hb⟩ := source_run_indicesBF 1 rest
 simp only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append,
   Nat.mul_one] at ha hb
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 by_cases he : (frame rest).mid.a=3 ∧ (frame rest).mid.b=4
 · exact source_fourth_one_34BE rest he.1 he.2 i j hs
 have hp := h0.2
 have hsmall : (frame (true::false::rest)).mid.b≤10 := by omega
 exact first_six_raw05ef (true::false::rest)
   ((frame (true::false::rest)).mid.a+(frame (true::false::rest)).mid.b-1-(i+j+2))
   i j (by omega) (by omega)

theorem source_fourth_lower_two_thirdsBE (path : List Bool) (i j : ℕ)
 (hratio : 3*(frame path).mid.a≤2*(frame path).mid.b)
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
   have hn : n≤1 := by
     by_contra hn
     have hm := Nat.mul_le_mul_left (frame rest).mid.b (show 2≤n by omega)
     simp only [Nat.mul_add,Nat.mul_one] at ha hb hm
     omega
   interval_cases n
   · simpa using source_false_fourth897 rest i j hs h0
   · simpa using source_fourth_oneBE rest i j hs h0

end
end MathGKM.Markov
