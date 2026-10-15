import MarkovBackwardThreeSourceM5DC
import MarkovMiddleCanonicalM722
import MarkovMiddleValue0M00
import MarkovMiddleValue1M00
import MarkovMiddleValue2M00
import MarkovMiddleValue3M00
import MarkovMiddleValue4M00
import MarkovMiddleValue5M00
/-! Machine-authored request 5dc9c88d. Exact source identity with the third reflected block. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff penFallingM00

def middleCorrectionM5DC (n c r j : ℕ) : ℤ :=
 5040*(if j≤2*n+5 then convSevenK0B
  (reflect 13 (fullH2FA (n:ℤ[X]) c r (2*r-c:ℕ)
    (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) X)) (2*n+5-j) else 0)

theorem middleCorrection_zeroM5DC (n c r j : ℕ) (hj : 2*n+6≤j) :
 middleCorrectionM5DC n c r j=0 := by
 simp only [middleCorrectionM5DC,if_neg (by omega : ¬j≤2*n+5),mul_zero]

theorem source_fourth_middle_corrected_value0M5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue0M00 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_threeM5DC n rest hc i j hj (by omega) hs
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
 unfold middleValue0M00 middleCorrectionM5DC
 linear_combination 5040*h+16*ht+hp
theorem source_fourth_middle_corrected_value1M5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue1M00 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_threeM5DC n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split1M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect1M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution1M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source1M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0)
  (0)
  (0) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue1M00 middleCorrectionM5DC
 linear_combination 5040*h+16*ht+hp
theorem source_fourth_middle_corrected_value2M5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue2M00 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_threeM5DC n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source2M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0)
  (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ))
  (0) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue2M00 middleCorrectionM5DC
 linear_combination 5040*h+16*ht+hp
theorem source_fourth_middle_corrected_value3M5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a)
 (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue3M00 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_threeM5DC n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source3M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ))
  (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ))
  (0) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue3M00 middleCorrectionM5DC
 linear_combination 5040*h+16*ht+hp
theorem source_fourth_middle_corrected_value4M5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b)
 (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue4M00 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_threeM5DC n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split4M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect4M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution4M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source4M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ))
  (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ))
  (3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue4M00 middleCorrectionM5DC
 linear_combination 5040*h+16*ht+hp
theorem source_fourth_middle_corrected_value5M5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleValue5M00 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 have h := source_fourth_backward_threeM5DC n rest hc i j hj (by omega) hs
 have hsplit := tail_top_source_split5M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect5M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution5M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-j) (by omega)
 have he : ((4*n+7-j:ℕ):ℤ)-7=4*(n:ℤ)-j := by omega
 rw [he] at ht
 rw [if_pos (by omega : j≤3*n+6),pen_source5M1B n _ _ hl hu] at h
 have hp := pen_convolutionM00 (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ))
  (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ))
  (3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)) (3*n+6-j) (by omega)
 have he2 : ((3*n+6-j:ℕ):ℤ)=3*(n:ℤ)+6-j := by omega
 rw [he2] at hp
 unfold middleValue5M00 middleCorrectionM5DC
 linear_combination 5040*h+16*ht+hp
theorem source_fourth_middle_correctedM5DC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ) (hj : n+5≤j) (hju : j≤3*n+3)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 120960*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 middleRawValueM722 n (frame rest).mid.b (frame rest).mid.a j+
 middleCorrectionM5DC n (frame rest).mid.b (frame rest).mid.a j := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h41 := reduced_chamber_boundary897 _ _ 4 1 hc (by decide) (by decide) hcop
 have h31 := reduced_chamber_boundary897 _ _ 3 1 hc (by decide) (by decide) hcop
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h32 := reduced_chamber_boundary897 _ _ 3 2 hc (by decide) (by decide) hcop
 have h43 := reduced_chamber_boundary897 _ _ 4 3 hc (by decide) (by decide) hcop
 by_cases h0 : 4*(frame rest).mid.a<(frame rest).mid.b
 · have h := source_fourth_middle_corrected_value0M5DC n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape0M722] at h
   unfold middleRawValueM722
   rw [if_pos (by omega)]
   exact h
 by_cases h1 : 3*(frame rest).mid.a<(frame rest).mid.b
 · have h := source_fourth_middle_corrected_value1M5DC n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape1M722] at h
   unfold middleRawValueM722
   rw [if_pos (by omega)]
   exact h
 by_cases h2 : 2*(frame rest).mid.a<(frame rest).mid.b
 · have h := source_fourth_middle_corrected_value2M5DC n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape2M722] at h
   unfold middleRawValueM722
   rw [if_pos (by omega)]
   exact h
 by_cases h3 : 3*(frame rest).mid.a<2*(frame rest).mid.b
 · have h := source_fourth_middle_corrected_value3M5DC n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape3M722] at h
   unfold middleRawValueM722
   rw [if_neg (by omega)]
   exact h
 by_cases h4 : 4*(frame rest).mid.a<3*(frame rest).mid.b
 · have h := source_fourth_middle_corrected_value4M5DC n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape4M722] at h
   unfold middleRawValueM722
   rw [if_neg (by omega)]
   exact h
 · have h := source_fourth_middle_corrected_value5M5DC n rest hc (by omega) (by omega) i j hj hju hs
   rw [middle_shape5M722] at h
   unfold middleRawValueM722
   rw [if_neg (by omega)]
   exact h

end
end MathGKM.Markov
