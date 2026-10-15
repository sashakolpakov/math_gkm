import MarkovOnsetValues2M1B
import MarkovBackwardTwoSourceM1B
/-! Machine-authored 1b02dddc. Exact source onset transport. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff fullH3FA fullH4FA

theorem pen_source2M1B (n c r : ℕ)
 (hl : 1*c<3*r) (hu : 2*r<1*c) :
 reflect 14 (fullH3FA (n:ℤ[X]) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) X)=
 penPolyM1B n c r (0) (3*(r:ℤ)-(c:ℤ)) (0) := by
 have hp := pen_reflectM1B (n:ℤ) (c:ℤ) (r:ℤ)
   ((2*r-c:ℕ):ℤ) ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at hp
 have hi0 : ((2*r-c:ℕ):ℤ)=0 := by omega
 have hi1 : ((min (c-r) (3*r-c):ℕ):ℤ)=3*(r:ℤ)-(c:ℤ) := by omega
 have hi2 : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 rw [hi0,hi1,hi2] at hp
 exact hp

theorem source_fourth_onset_coeff2_1M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+1)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+1)=
 onsetValue2_1M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+1) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+1)) (by omega)
 have he : ((4*n+7-(3*n+1):ℕ):ℤ)-7=(n:ℤ)-1 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+1≤3*n+6),show 3*n+6-(3*n+1)=5 by omega,
   pen_source2M1B n _ _ hl hu] at h
 have hp := pen_conv1M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (0)
 have hpc := onsetCorrection2_1_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection2_1M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue2_1M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff2_2M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+2)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+2)=
 onsetValue2_2M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+2) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+2)) (by omega)
 have he : ((4*n+7-(3*n+2):ℕ):ℤ)-7=(n:ℤ)-2 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+2≤3*n+6),show 3*n+6-(3*n+2)=4 by omega,
   pen_source2M1B n _ _ hl hu] at h
 have hp := pen_conv2M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (0)
 have hpc := onsetCorrection2_2_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection2_2M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue2_2M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff2_3M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+3)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+3)=
 onsetValue2_3M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+3) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+3)) (by omega)
 have he : ((4*n+7-(3*n+3):ℕ):ℤ)-7=(n:ℤ)-3 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+3≤3*n+6),show 3*n+6-(3*n+3)=3 by omega,
   pen_source2M1B n _ _ hl hu] at h
 have hp := pen_conv3M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (0)
 have hpc := onsetCorrection2_3_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection2_3M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue2_3M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff2_4M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+4)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+4)=
 onsetValue2_4M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+4) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+4)) (by omega)
 have he : ((4*n+7-(3*n+4):ℕ):ℤ)-7=(n:ℤ)-4 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+4≤3*n+6),show 3*n+6-(3*n+4)=2 by omega,
   pen_source2M1B n _ _ hl hu] at h
 have hp := pen_conv4M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (0)
 have hpc := onsetCorrection2_4_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection2_4M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue2_4M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff2_5M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+5)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+5)=
 onsetValue2_5M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+5) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+5)) (by omega)
 have he : ((4*n+7-(3*n+5):ℕ):ℤ)-7=(n:ℤ)-5 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+5≤3*n+6),show 3*n+6-(3*n+5)=1 by omega,
   pen_source2M1B n _ _ hl hu] at h
 have hp := pen_conv5M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (0)
 have hpc := onsetCorrection2_5_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection2_5M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue2_5M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff2_6M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+6)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+6)=
 onsetValue2_6M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+6) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+6)) (by omega)
 have he : ((4*n+7-(3*n+6):ℕ):ℤ)-7=(n:ℤ)-6 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+6≤3*n+6),show 3*n+6-(3*n+6)=0 by omega,
   pen_source2M1B n _ _ hl hu] at h
 have hp := pen_conv6M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (0)
 have hpc := onsetCorrection2_6_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection2_6M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue2_6M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff2_7M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+7)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+7)=
 onsetValue2_7M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+7) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+7)) (by omega)
 have he : ((4*n+7-(3*n+7):ℕ):ℤ)-7=(n:ℤ)-7 := by omega
 rw [he] at ht
 rw [if_neg (by omega : ¬3*n+7≤3*n+6),add_zero] at h
 unfold onsetValue2_7M1B onsetCorrection2_7M1B
 linear_combination 315*h+ht

theorem source_fourth_onset_coeff2_8M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+8)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+8)=
 onsetValue2_8M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+8) (by omega) (by omega) hs
 have hsplit := tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution2M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+8)) (by omega)
 have he : ((4*n+7-(3*n+8):ℕ):ℤ)-7=(n:ℤ)-8 := by omega
 rw [he] at ht
 rw [if_neg (by omega : ¬3*n+8≤3*n+6),add_zero] at h
 unfold onsetValue2_8M1B onsetCorrection2_8M1B
 linear_combination 315*h+ht
end
end MathGKM.Markov
