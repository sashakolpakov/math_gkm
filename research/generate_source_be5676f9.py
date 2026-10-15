"""Machine-authored exact source adapters, no unproved identity premises."""
from pathlib import Path
import re
from fourth_probe_01f51d63 import BOUNDS
s=''.join(f'import MarkovFourthOne{z}BE\n' for z in range(6))+'import MarkovFourthOneSmallPolyBE\nimport MarkovResidual897\n'
s+='''/-! Machine-authored be5676f9. Entire fourth lower diagonal through slope 2/3. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
'''
def src(x):return re.sub(r'\b[cr]\b',lambda m:'(frame rest).mid.'+('b' if m[0]=='c' else 'a'),x)
for z in range(6):
 p,q=BOUNDS[z];a,b=BOUNDS[z+1];lo=f'{p}*c<{q}*r';hi=f'{b}*r<{a}*c'
 s+=f'''theorem source_fourth_one_chamber_{z}BE (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : {src(lo)}) (hu : {src(hi)})
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+4) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 let x : ℤ := {a}*((frame rest).mid.b:ℤ)-{b}*((frame rest).mid.a:ℤ)-1
 let y : ℤ := {q}*((frame rest).mid.a:ℤ)-{p}*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : {q}*(x+1)+{b}*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : {p}*(x+1)+{a}*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := fourth_one_lc_{z}BE x y hx hy j
 rw [hcc,hrr] at h
 have he := fourth_one_expand_{z}BE (frame rest).mid.b (frame rest).mid.a hc hr hrc (by omega) (by omega)
 have hf (k : ℕ) :
   (fourthExplicitRunBE 1 (frame rest).mid.b (frame rest).mid.a).coeff k=
   fourthOneSeq{z}BE (frame rest).mid.b (frame rest).mid.a k := by
   rw [he,fourth_one_coeff_{z}BE]
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [←source_fourth_explicit_rawBE 1 rest hc i (j+2) (by change i+(j+2)=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+2) j (by change (i+2)+j=(frame (true::false::rest)).mid.a+4; omega),
   ←source_fourth_explicit_rawBE 1 rest hc (i+1) (j+1) (by change (i+1)+(j+1)=(frame (true::false::rest)).mid.a+4; omega)] at h
 simpa only [List.replicate_succ,List.replicate_zero,List.nil_append,List.cons_append] using
   (show coeff (frame (List.replicate 1 true++false::rest)).mid.p i (j+2)*
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+2) j≤
     coeff (frame (List.replicate 1 true++false::rest)).mid.p (i+1) (j+1)^2 by nlinarith only [h])
'''
s+='''theorem source_fourth_one_largeBE (rest : List Bool) (hc : 5≤(frame rest).mid.b)
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
'''
Path('research/MarkovFourthOneSourceBE.lean').write_text(s)
print('Generated six chamber source transfers and universal slope theorem.')
