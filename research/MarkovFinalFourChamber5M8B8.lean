import MarkovFinalFourSource5M8B8
import MarkovFinalFourGap5_2M8B8
import MarkovFinalFourGap5_3M8B8
import MarkovFinalFourGap5_4M8B8
import MarkovFinalFourGap5_5M8B8
import MarkovFinalFourGap5_6M8B8
/-! Machine-authored request 8b851864. Final transition at run length six. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] frame coeff

theorem source_finalFour5_2M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(12+2)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+2+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+2)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+2+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFour_lc5_2M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff5_2FourM8B8 4 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_3FourM8B8 4 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_4FourM8B8 4 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFour5_3M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(12+3)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+3+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+3)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+3+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFour_lc5_3M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff5_3FourM8B8 4 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_4FourM8B8 4 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_5FourM8B8 4 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFour5_4M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(12+4)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+4+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+4)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+4+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFour_lc5_4M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff5_4FourM8B8 4 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_5FourM8B8 4 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_6FourM8B8 4 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFour5_5M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(12+5)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+5+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+5)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+5+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFour_lc5_5M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff5_5FourM8B8 4 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_6FourM8B8 4 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_7FourM8B8 4 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFour5_6M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(12+6)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+6+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+6)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+6+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 5+4*x+1*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 4+3*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFour_lc5_6M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff5_6FourM8B8 4 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_7FourM8B8 4 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_8FourM8B8 4 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFour_chamber5M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i k : ℕ) (hk : 2≤k) (hku : k≤6)
 (hs : i+(12+k)+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i (12+k+2)*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) (12+k)≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) (12+k+1)^2 := by
 interval_cases k
 · exact source_finalFour5_2M8B8 rest hc hl hu i hs
 · exact source_finalFour5_3M8B8 rest hc hl hu i hs
 · exact source_finalFour5_4M8B8 rest hc hl hu i hs
 · exact source_finalFour5_5M8B8 rest hc hl hu i hs
 · exact source_finalFour5_6M8B8 rest hc hl hu i hs
end
end MathGKM.Markov
