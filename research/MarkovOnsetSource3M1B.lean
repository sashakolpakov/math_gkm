import MarkovOnsetValues3M1B
import MarkovBackwardTwoSourceM1B
/-! Machine-authored 1b02dddc. Exact source onset transport. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff fullH3FA fullH4FA

theorem pen_source3M1B (n c r : ℕ)
 (hl : 1*c<2*r) (hu : 3*r<2*c) :
 reflect 14 (fullH3FA (n:ℤ[X]) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) X)=
 penPolyM1B n c r (2*(r:ℤ)-(c:ℤ)) ((c:ℤ)-(r:ℤ)) (0) := by
 have hp := pen_reflectM1B (n:ℤ) (c:ℤ) (r:ℤ)
   ((2*r-c:ℕ):ℤ) ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)
 simp only [Int.cast_natCast] at hp
 have hi0 : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hi1 : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have hi2 : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 rw [hi0,hi1,hi2] at hp
 exact hp

theorem source_fourth_onset_coeff3_1M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+1)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+1)=
 onsetValue3_1M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+1) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+1)) (by omega)
 have he : ((4*n+7-(3*n+1):ℕ):ℤ)-7=(n:ℤ)-1 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+1≤3*n+6),show 3*n+6-(3*n+1)=5 by omega,
   pen_source3M1B n _ _ hl hu] at h
 have hp := pen_conv1M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ)) (0)
 have hpc := onsetCorrection3_1_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection3_1M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue3_1M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff3_2M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+2)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+2)=
 onsetValue3_2M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+2) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+2)) (by omega)
 have he : ((4*n+7-(3*n+2):ℕ):ℤ)-7=(n:ℤ)-2 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+2≤3*n+6),show 3*n+6-(3*n+2)=4 by omega,
   pen_source3M1B n _ _ hl hu] at h
 have hp := pen_conv2M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ)) (0)
 have hpc := onsetCorrection3_2_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection3_2M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue3_2M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff3_3M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+3)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+3)=
 onsetValue3_3M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+3) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+3)) (by omega)
 have he : ((4*n+7-(3*n+3):ℕ):ℤ)-7=(n:ℤ)-3 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+3≤3*n+6),show 3*n+6-(3*n+3)=3 by omega,
   pen_source3M1B n _ _ hl hu] at h
 have hp := pen_conv3M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ)) (0)
 have hpc := onsetCorrection3_3_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection3_3M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue3_3M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff3_4M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+4)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+4)=
 onsetValue3_4M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+4) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+4)) (by omega)
 have he : ((4*n+7-(3*n+4):ℕ):ℤ)-7=(n:ℤ)-4 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+4≤3*n+6),show 3*n+6-(3*n+4)=2 by omega,
   pen_source3M1B n _ _ hl hu] at h
 have hp := pen_conv4M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ)) (0)
 have hpc := onsetCorrection3_4_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection3_4M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue3_4M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff3_5M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+5)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+5)=
 onsetValue3_5M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+5) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+5)) (by omega)
 have he : ((4*n+7-(3*n+5):ℕ):ℤ)-7=(n:ℤ)-5 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+5≤3*n+6),show 3*n+6-(3*n+5)=1 by omega,
   pen_source3M1B n _ _ hl hu] at h
 have hp := pen_conv5M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ)) (0)
 have hpc := onsetCorrection3_5_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection3_5M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue3_5M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff3_6M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+6)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+6)=
 onsetValue3_6M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+6) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+6)) (by omega)
 have he : ((4*n+7-(3*n+6):ℕ):ℤ)-7=(n:ℤ)-6 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+6≤3*n+6),show 3*n+6-(3*n+6)=0 by omega,
   pen_source3M1B n _ _ hl hu] at h
 have hp := pen_conv6M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ)) (((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ)) (0)
 have hpc := onsetCorrection3_6_eqM1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 have hp2 : _ = onsetCorrection3_6M1B n (frame rest).mid.b (frame rest).mid.a := hp.trans (by
   convert hpc using 1 <;> congr 1 <;> ring)
 unfold onsetValue3_6M1B
 linear_combination 315*h+ht+hp2

theorem source_fourth_onset_coeff3_7M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+7)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+7)=
 onsetValue3_7M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+7) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+7)) (by omega)
 have he : ((4*n+7-(3*n+7):ℕ):ℤ)-7=(n:ℤ)-7 := by omega
 rw [he] at ht
 rw [if_neg (by omega : ¬3*n+7≤3*n+6),add_zero] at h
 unfold onsetValue3_7M1B onsetCorrection3_7M1B
 linear_combination 315*h+ht

theorem source_fourth_onset_coeff3_8M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+8)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+8)=
 onsetValue3_8M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+8) (by omega) (by omega) hs
 have hsplit := tail_top_source_split3M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution3M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+8)) (by omega)
 have he : ((4*n+7-(3*n+8):ℕ):ℤ)-7=(n:ℤ)-8 := by omega
 rw [he] at ht
 rw [if_neg (by omega : ¬3*n+8≤3*n+6),add_zero] at h
 unfold onsetValue3_8M1B onsetCorrection3_8M1B
 linear_combination 315*h+ht
end
end MathGKM.Markov
