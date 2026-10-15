import MarkovOnsetSource0M1B
import MarkovPenFallingM00
/-! Machine-authored live request 00a02b28. Exact middle-slice extraction, not LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff penFallingM00

def middleValue0M00 (n c r j : ℤ) : ℤ :=
 16*backShape0M94 c r (4*n-j)+penFallingM00 n c r (0) (0) (0) (3*n+6-j)

theorem source_fourth_middle_value0M00 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue0M00 n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_twoM1B n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source0M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0)
  (0)
  (0) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue0M00
 linear_combination 5040*h+16*ht+hp
end
end MathGKM.Markov
