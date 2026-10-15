import MarkovBackwardColumnsGap1M94
import MarkovBackwardSourceM94
/-! Machine-authored 94b1de05. Actual-source backwards third-block inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
attribute [local irreducible] backShape1M94 backPoly1M94 fullH4FA coeff frame
theorem source_fourth_backward_coeff1M94 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hj : 3*n+7≤j) (hju : j≤4*n+4)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 backShape1M94 (frame rest).mid.b (frame rest).mid.a (4*(n:ℤ)-j) := by
 have h := source_fourth_backwardM94 n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split1M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect1M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 change 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
  convSevenK0B (backPoly1M94 (frame rest).mid.b (frame rest).mid.a) (4*n+7-j) at h
 have ht := back_convolution1M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-(j:ℤ) := by omega
 rw [he,←h] at ht
 nlinarith only [ht]

theorem source_fourth_third_chamber1M94 (n k : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hk : 7≤k) (hkn : k≤n)
 (hs : i+(3*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+k+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 7+3*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 2+1*y+1*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := back_columns_lc1M94 x y ((n:ℤ)-k) hx hy (by omega)
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr] at h
 have h0 := source_fourth_backward_coeff1M94 n rest hc hl hu (i+2) (3*n+k)
  (by omega) (by omega) (by omega)
 have h1 := source_fourth_backward_coeff1M94 n rest hc hl hu (i+1) (3*n+k+1)
  (by omega) (by omega) (by omega)
 have h2 := source_fourth_backward_coeff1M94 n rest hc hl hu i (3*n+k+2)
  (by omega) (by omega) (by omega)
 have he0 : 4*(n:ℤ)-(3*n+k:ℕ)=(n:ℤ)-k := by push_cast; ring
 have he1 : 4*(n:ℤ)-(3*n+k+1:ℕ)=(n:ℤ)-k-1 := by push_cast; ring
 have he2 : 4*(n:ℤ)-(3*n+k+2:ℕ)=(n:ℤ)-k-2 := by push_cast; ring
 rw [he0] at h0
 rw [he1] at h1
 rw [he2] at h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
