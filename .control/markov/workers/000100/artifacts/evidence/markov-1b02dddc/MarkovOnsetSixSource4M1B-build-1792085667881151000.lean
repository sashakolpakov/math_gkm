import MarkovOnsetSource4M1B
import MarkovBackwardColumnsGap4M94
import MarkovRawMatrix18
import MarkovOnsetSixExceptionM1B
/-! Machine-authored 1b02dddc. Sixth onset position via a nonpositive correction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff

theorem source_fourth_onset_six4M1B (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b)
 (i : ℕ) (hs : i+(3*n+6)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (3*n+8)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+6)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (3*n+7)^2 := by
 have h0 := source_fourth_onset_coeff4_6M1B n rest hn hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff4_7M1B n rest hn hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff4_8M1B n rest hn hc hl hu i (by omega)
 have hc6 : 6≤(frame rest).mid.b := by omega
 let x : ℤ := 3*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 7+4*y+3*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 5+3*y+2*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hb := back_columns_lc4M94 x y ((n:ℤ)-6) hx hy (by omega)
 try simp only [zero_mul,zero_add,add_zero,one_mul] at hb hcc hrr
 rw [hcc,hrr] at hb
 rw [show (n:ℤ)-6-1=(n:ℤ)-7 by ring,show (n:ℤ)-6-2=(n:ℤ)-8 by ring] at hb
 have hd : onsetCorrection4_6M1B n (frame rest).mid.b (frame rest).mid.a≤0 := by
  have hu0 : 0≤3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ) := by omega
  have hr3 : 3≤((frame rest).mid.a:ℤ) := by omega
  have hp := mul_nonpos_of_nonneg_of_nonpos (show (0:ℤ)≤n by omega)
    (show 6-((frame rest).mid.b:ℤ)≤0 by omega)
  have hz : 3-((frame rest).mid.a:ℤ)+(n:ℤ)*(6-((frame rest).mid.b:ℤ))≤0 := by omega
  have ht := mul_nonpos_of_nonneg_of_nonpos
    (mul_nonneg (show (0:ℤ)≤30240 by norm_num) hu0) hz
  convert ht using 1 <;> unfold onsetCorrection4_6M1B <;> push_cast <;> ring
 have hn2 := raw_coeff_nonneg18 (List.replicate n true++false::rest) i (3*n+8)
 have hprod := mul_nonpos_of_nonpos_of_nonneg hd hn2
 unfold onsetValue4_6M1B at h0
 unfold onsetValue4_7M1B onsetCorrection4_7M1B at h1
 unfold onsetValue4_8M1B onsetCorrection4_8M1B at h2
 simp only [add_zero] at h1 h2
 rw [←h1,←h2] at hb
 have he : backShape4M94 (frame rest).mid.b (frame rest).mid.a ((n:ℤ)-6)=
   7560*coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (3*n+6)-
     onsetCorrection4_6M1B n (frame rest).mid.b (frame rest).mid.a := by linarith only [h0]
 rw [he] at hb
 nlinarith only [hb,hprod]
end
end MathGKM.Markov
