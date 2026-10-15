import MarkovFourthBoundaryK0B
import MarkovFourthShiftK0B
/-! Machine-authored request 0b212317. Raw, source-connected fourth-slice initial interval. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_fourth_convK0B (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j<n+2) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j =
 convSevenK0B (fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
   (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X) j := by
 have he := source_fourth_shift_binomialK0B n rest hc i j hs hj
 have hp : fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a =
     fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
       (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X := by
   rw [fourthNumerator_zeroK0B]
   simp only [map_add,map_mul,map_natCast]
 rw [hp] at he
 exact he

theorem source_fourth_initial_allK0B (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j<n) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_fourth_convK0B n rest hc (i+2) j (by omega) (by omega)
 have h1 := source_fourth_convK0B n rest hc (i+1) (j+1) (by omega) (by omega)
 have h2 := source_fourth_convK0B n rest hc i (j+2) (by omega) (by omega)
 have hC : (2:ℤ)≤(frame rest).mid.b := by exact_mod_cast (by omega : 2≤(frame rest).mid.b)
 have hR : (1:ℤ)≤(frame rest).mid.a := by
   exact_mod_cast (frame_reduced rest).1
 have hN : (j:ℤ)+1≤n := by exact_mod_cast hj
 have hH : ((frame rest).mid.b:ℤ)*((j:ℤ)+1)+1 ≤
     (n:ℤ)*(frame rest).mid.b+(frame rest).mid.a := by
   have h := mul_le_mul_of_nonneg_left hN (show (0:ℤ)≤(frame rest).mid.b by positivity)
   nlinarith only [h,hR]
 have hg := fourthLow_convolution_lcK0B (frame rest).mid.b
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) j hC hH
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]

end
end MathGKM.Markov
