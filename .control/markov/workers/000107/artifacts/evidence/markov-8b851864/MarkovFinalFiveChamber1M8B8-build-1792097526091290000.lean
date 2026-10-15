import MarkovFinalSmallSource1M8B8
import MarkovFinalFiveGap1_1M8B8
import MarkovFinalFiveGap1_2M8B8
import MarkovFinalFiveGap1_3M8B8
import MarkovFinalFiveGap1_4M8B8
import MarkovFinalFiveGap1_5M8B8
import MarkovFinalFiveGap1_6M8B8
/-! Machine-authored request 8b851864. Final transition at run length six. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] frame coeff

theorem source_finalFive1_1M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(15+1)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+1+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+1)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+1+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFive_lc1_1M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff1_1M8B8 5 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff1_2M8B8 5 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff1_3M8B8 5 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFive1_2M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(15+2)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+2+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+2)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+2+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFive_lc1_2M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff1_2M8B8 5 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff1_3M8B8 5 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff1_4M8B8 5 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFive1_3M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(15+3)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+3+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+3)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+3+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFive_lc1_3M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff1_3M8B8 5 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff1_4M8B8 5 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff1_5M8B8 5 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFive1_4M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(15+4)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+4+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+4)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+4+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFive_lc1_4M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff1_4M8B8 5 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff1_5M8B8 5 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff1_6M8B8 5 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFive1_5M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(15+5)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+5+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+5)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+5+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFive_lc1_5M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff1_5M8B8 5 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff1_6M8B8 5 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff1_7M8B8 5 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFive1_6M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i : ℕ)
 (hs : i+(15+6)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+6+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+6)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+6+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : 7+4*x+3*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : 2+1*x+1*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalFive_lc1_6M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff1_6M8B8 5 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff1_7M8B8 5 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff1_8M8B8 5 rest (by omega) hc hl hu i (by omega)
 norm_num only [Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]

theorem source_finalFive_chamber1M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i k : ℕ) (hk : 1≤k) (hku : k≤6)
 (hs : i+(15+k)+2=(frame (List.replicate 5 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 5 true++false::rest)).mid.p i (15+k+2)*
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+2) (15+k)≤
 coeff (frame (List.replicate 5 true++false::rest)).mid.p (i+1) (15+k+1)^2 := by
 interval_cases k
 · exact source_finalFive1_1M8B8 rest hc hl hu i hs
 · exact source_finalFive1_2M8B8 rest hc hl hu i hs
 · exact source_finalFive1_3M8B8 rest hc hl hu i hs
 · exact source_finalFive1_4M8B8 rest hc hl hu i hs
 · exact source_finalFive1_5M8B8 rest hc hl hu i hs
 · exact source_finalFive1_6M8B8 rest hc hl hu i hs
end
end MathGKM.Markov
