import MarkovFinalSmallSource3M8B8
import MarkovFinalSixGap3_1M8B8
import MarkovFinalSixGap3_2M8B8
import MarkovFinalSixGap3_3M8B8
import MarkovFinalSixGap3_4M8B8
import MarkovFinalSixGap3_5M8B8
import MarkovFinalSixGap3_6M8B8
/-! Machine-authored request 8b851864. Final transition at run length six. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] frame coeff

theorem source_finalSix3_1M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+1)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+1+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+1)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+1+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc3_1M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff3_1M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff3_2M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff3_3M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalSix3_2M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+2)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+2+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+2)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+2+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc3_2M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff3_2M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff3_3M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff3_4M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalSix3_3M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+3)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+3+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+3)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+3+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc3_3M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff3_3M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff3_4M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff3_5M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalSix3_4M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+4)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+4+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+4)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+4+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc3_4M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff3_4M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff3_5M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff3_6M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalSix3_5M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+5)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+5+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+5)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+5+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc3_5M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff3_5M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff3_6M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff3_7M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalSix3_6M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+6)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+6+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+6)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+6+1)^2 := by
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+2*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 3+1*x+2*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc3_6M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff3_6M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff3_7M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff3_8M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalSix_chamber3M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i k : ℕ) (hk : 1≤k) (hku : k≤6)
 (hs : i+(18+k)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+k+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+k)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+k+1)^2 := by
 interval_cases k
 · exact source_finalSix3_1M8B8 rest hc hl hu i hs
 · exact source_finalSix3_2M8B8 rest hc hl hu i hs
 · exact source_finalSix3_3M8B8 rest hc hl hu i hs
 · exact source_finalSix3_4M8B8 rest hc hl hu i hs
 · exact source_finalSix3_5M8B8 rest hc hl hu i hs
 · exact source_finalSix3_6M8B8 rest hc hl hu i hs
end
end MathGKM.Markov
