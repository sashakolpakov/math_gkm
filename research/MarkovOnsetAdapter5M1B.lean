import MarkovOnsetChamberGaps5M1B
import MarkovOnsetSource5M1B
/-! Machine-authored 1b02dddc. Exact source onset transport. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff fullH3FA fullH4FA

theorem source_fourth_onset5_1M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+1)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+1+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+1)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+1+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc5_1M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff5_1M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_2M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_3M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+1+1=3*n+2 := by omega
 have he2 : 3*n+1+2=3*n+3 := by omega
 rw [he1,he2]
 nlinarith only [h]

theorem source_fourth_onset5_2M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+2)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+2+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+2)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+2+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc5_2M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff5_2M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_3M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_4M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+2+1=3*n+3 := by omega
 have he2 : 3*n+2+2=3*n+4 := by omega
 rw [he1,he2]
 nlinarith only [h]

theorem source_fourth_onset5_3M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+3)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+3+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+3)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+3+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc5_3M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff5_3M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_4M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_5M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+3+1=3*n+4 := by omega
 have he2 : 3*n+3+2=3*n+5 := by omega
 rw [he1,he2]
 nlinarith only [h]

theorem source_fourth_onset5_4M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+4)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+4+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+4)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+4+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc5_4M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff5_4M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_5M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_6M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+4+1=3*n+5 := by omega
 have he2 : 3*n+4+2=3*n+6 := by omega
 rw [he1,he2]
 nlinarith only [h]

theorem source_fourth_onset5_5M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+5)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+5+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+5)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+5+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc5_5M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff5_5M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_6M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_7M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+5+1=3*n+6 := by omega
 have he2 : 3*n+5+2=3*n+7 := by omega
 rw [he1,he2]
 nlinarith only [h]

theorem source_fourth_onset5_6M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+6)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+6+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+6)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+6+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := onset_columns_lc5_6M1B ((n:ℤ)-7) x y (by omega) hx hy
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr,show (n:ℤ)-7+7=n by ring] at h
 have h0 := source_fourth_onset_coeff5_6M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff5_7M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff5_8M1B n rest hn hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 have he1 : 3*n+6+1=3*n+7 := by omega
 have he2 : 3*n+6+2=3*n+8 := by omega
 rw [he1,he2]
 nlinarith only [h]
theorem source_fourth_onset_chamber5M1B (n k : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hk : 1≤k) (hku : k≤6) (hs : i+(3*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+k+1)^2 := by
 interval_cases k
 · exact source_fourth_onset5_1M1B n rest hn hc hl hu i hs
 · exact source_fourth_onset5_2M1B n rest hn hc hl hu i hs
 · exact source_fourth_onset5_3M1B n rest hn hc hl hu i hs
 · exact source_fourth_onset5_4M1B n rest hn hc hl hu i hs
 · exact source_fourth_onset5_5M1B n rest hn hc hl hu i hs
 · exact source_fourth_onset5_6M1B n rest hn hc hl hu i hs
end
end MathGKM.Markov
