import MarkovOnsetSource0M1B
/-! Machine-authored request 8b851864. Final transition at run length six. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] frame coeff fullH3FA fullH4FA
theorem source_fourth_onset_coeff0_1M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+1)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+1)=
 onsetValue0_1M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+1) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+1)) (by omega)
 have he : ((4*n+7-(3*n+1):ℕ):ℤ)-7=(n:ℤ)-1 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+1≤3*n+6),show 3*n+6-(3*n+1)=5 by omega,
   pen_source0M1B n _ _ hl hu] at h
 have hp := pen_conv1M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (0) (0)
 rw [onsetCorrection0_1_eqM1B] at hp
 unfold onsetValue0_1M1B
 linear_combination 315*h+ht+hp

theorem source_fourth_onset_coeff0_2M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+2)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+2)=
 onsetValue0_2M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+2) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+2)) (by omega)
 have he : ((4*n+7-(3*n+2):ℕ):ℤ)-7=(n:ℤ)-2 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+2≤3*n+6),show 3*n+6-(3*n+2)=4 by omega,
   pen_source0M1B n _ _ hl hu] at h
 have hp := pen_conv2M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (0) (0)
 rw [onsetCorrection0_2_eqM1B] at hp
 unfold onsetValue0_2M1B
 linear_combination 315*h+ht+hp

theorem source_fourth_onset_coeff0_3M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+3)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+3)=
 onsetValue0_3M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+3) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+3)) (by omega)
 have he : ((4*n+7-(3*n+3):ℕ):ℤ)-7=(n:ℤ)-3 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+3≤3*n+6),show 3*n+6-(3*n+3)=3 by omega,
   pen_source0M1B n _ _ hl hu] at h
 have hp := pen_conv3M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (0) (0)
 rw [onsetCorrection0_3_eqM1B] at hp
 unfold onsetValue0_3M1B
 linear_combination 315*h+ht+hp

theorem source_fourth_onset_coeff0_4M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+4)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+4)=
 onsetValue0_4M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+4) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+4)) (by omega)
 have he : ((4*n+7-(3*n+4):ℕ):ℤ)-7=(n:ℤ)-4 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+4≤3*n+6),show 3*n+6-(3*n+4)=2 by omega,
   pen_source0M1B n _ _ hl hu] at h
 have hp := pen_conv4M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (0) (0)
 rw [onsetCorrection0_4_eqM1B] at hp
 unfold onsetValue0_4M1B
 linear_combination 315*h+ht+hp

theorem source_fourth_onset_coeff0_5M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+5)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+5)=
 onsetValue0_5M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+5) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+5)) (by omega)
 have he : ((4*n+7-(3*n+5):ℕ):ℤ)-7=(n:ℤ)-5 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+5≤3*n+6),show 3*n+6-(3*n+5)=1 by omega,
   pen_source0M1B n _ _ hl hu] at h
 have hp := pen_conv5M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (0) (0)
 rw [onsetCorrection0_5_eqM1B] at hp
 unfold onsetValue0_5M1B
 linear_combination 315*h+ht+hp

theorem source_fourth_onset_coeff0_6M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+6)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+6)=
 onsetValue0_6M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+6) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+6)) (by omega)
 have he : ((4*n+7-(3*n+6):ℕ):ℤ)-7=(n:ℤ)-6 := by omega
 rw [he] at ht
 rw [if_pos (by omega : 3*n+6≤3*n+6),show 3*n+6-(3*n+6)=0 by omega,
   pen_source0M1B n _ _ hl hu] at h
 have hp := pen_conv6M1B (n:ℤ) ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (0) (0) (0)
 rw [onsetCorrection0_6_eqM1B] at hp
 unfold onsetValue0_6M1B
 linear_combination 315*h+ht+hp

theorem source_fourth_onset_coeff0_7M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+7)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+7)=
 onsetValue0_7M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+7) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+7)) (by omega)
 have he : ((4*n+7-(3*n+7):ℕ):ℤ)-7=(n:ℤ)-7 := by omega
 rw [he] at ht
 rw [if_neg (by omega : ¬3*n+7≤3*n+6),add_zero] at h
 unfold onsetValue0_7M1B onsetCorrection0_7M1B
 linear_combination 315*h+ht

theorem source_fourth_onset_coeff0_8M8B8 (n : ℕ) (rest : List Bool)
 (hn : 5≤n) (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+8)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+8)=
 onsetValue0_8M1B n (frame rest).mid.b (frame rest).mid.a := by
 have h := source_fourth_backward_twoM1B n rest hc i (3*n+8) (by omega) (by omega) hs
 have hsplit := tail_top_source_split0M06 (n:ℤ[X]) X _ _ hl hu
 rw [hsplit] at h
 have href := back_reflect0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
 simp only [Int.cast_natCast] at href
 rw [href] at h
 have ht := back_convolution0M94 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)
  (4*n+7-(3*n+8)) (by omega)
 have he : ((4*n+7-(3*n+8):ℕ):ℤ)-7=(n:ℤ)-8 := by omega
 rw [he] at ht
 rw [if_neg (by omega : ¬3*n+8≤3*n+6),add_zero] at h
 unfold onsetValue0_8M1B onsetCorrection0_8M1B
 linear_combination 315*h+ht
end
end MathGKM.Markov
