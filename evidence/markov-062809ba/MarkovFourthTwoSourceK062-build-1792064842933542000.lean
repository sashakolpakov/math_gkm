import MarkovFourthTwo0K062
import MarkovFourthTwo1K062
import MarkovFourthTwo2K062
import MarkovFourthTwo3K062
import MarkovFourthTwo4K062
import MarkovFourthTwo5K062
import MarkovFourthShort221K062
import MarkovFourthShort231K062
import MarkovFourthShort232K062
import MarkovFourthShort241K062
import MarkovFourthShort243K062
import MarkovResidual897
/-! Machine-authored 062809ba. Entire fourth lower diagonal for run 2. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
theorem source_fourth_two_chamber_0K062 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 1*((frame rest).mid.a:ℤ)-0*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 1*(x+1)+4*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 0*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_two_lc_0K062 x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_two_expand_0K062 (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 2 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthTwoSeq0K062 (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_two_coeff_0K062]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 2 rest hc i (j+2) (by change i+(j+2)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+2) j (by change (i+2)+j=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_two_chamber_1K062 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 4*(x+1)+3*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_two_lc_1K062 x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_two_expand_1K062 (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 2 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthTwoSeq1K062 (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_two_coeff_1K062]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 2 rest hc i (j+2) (by change i+(j+2)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+2) j (by change (i+2)+j=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_two_chamber_2K062 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-2*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 3*(x+1)+2*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_two_lc_2K062 x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_two_expand_2K062 (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 2 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthTwoSeq2K062 (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_two_coeff_2K062]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 2 rest hc i (j+2) (by change i+(j+2)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+2) j (by change (i+2)+j=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_two_chamber_3K062 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 2*(x+1)+3*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+2*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_two_lc_3K062 x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_two_expand_3K062 (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 2 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthTwoSeq3K062 (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_two_coeff_3K062]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 2 rest hc i (j+2) (by change i+(j+2)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+2) j (by change (i+2)+j=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_two_chamber_4K062 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 3*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 3*(x+1)+4*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 2*(x+1)+3*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_two_lc_4K062 x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_two_expand_4K062 (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 2 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthTwoSeq4K062 (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_two_coeff_4K062]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 2 rest hc i (j+2) (by change i+(j+2)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+2) j (by change (i+2)+j=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_two_chamber_5K062 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 4*(x+1)+1*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 3*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_two_lc_5K062 x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_two_expand_5K062 (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 2 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthTwoSeq5K062 (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_two_coeff_5K062]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 2 rest hc i (j+2) (by change i+(j+2)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+2) j (by change (i+2)+j=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 2 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (List.replicate 2 true++false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
theorem source_fourth_two_largeK062 (rest : List Bool) (hc : 5≤(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_two_chamber_0K062 rest hc (by omega) (by omega) i j hs
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_two_chamber_1K062 rest hc (by omega) (by omega) i j hs
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · exact source_fourth_two_chamber_2K062 rest hc (by omega) (by omega) i j hs
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · exact source_fourth_two_chamber_3K062 rest hc (by omega) (by omega) i j hs
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · exact source_fourth_two_chamber_4K062 rest hc (by omega) (by omega) i j hs
 · exact source_fourth_two_chamber_5K062 rest hc (by omega) (by omega) i j hs

theorem source_fourth_twoK062 (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate 2 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 2 true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate 2 true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hc : 5≤(frame rest).mid.b
 · exact source_fourth_two_largeK062 rest hc i j hs
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have hn : ¬((frame rest).mid.a=2 ∧ (frame rest).mid.b=4) := by
   rintro ⟨ha,hb⟩
   rw [ha,hb] at hcop
   norm_num at hcop
 have hcases : ((frame rest).mid.b=2 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=3 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=3 ∧ (frame rest).mid.a=2) ∨
   ((frame rest).mid.b=4 ∧ (frame rest).mid.a=1) ∨
   ((frame rest).mid.b=4 ∧ (frame rest).mid.a=3) := by omega
 rcases hcases with ⟨hb,ha⟩|⟨hb,ha⟩|⟨hb,ha⟩|⟨hb,ha⟩|⟨hb,ha⟩
 · exact source_fourth_short221K062 rest hb ha i j hs
 · exact source_fourth_short231K062 rest hb ha i j hs
 · exact source_fourth_short232K062 rest hb ha i j hs
 · exact source_fourth_short241K062 rest hb ha i j hs
 · exact source_fourth_short243K062 rest hb ha i j hs
end
end MathGKM.Markov
