import MarkovFourCycleClearedM0A5
import MarkovFourthSourceK0B
/-! Machine-authored 0a5fcabe. Raw fourth-slice initial interval for four-cycles. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff

theorem source_fourth_conv_fourM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j < n+2) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 convSevenK0B (fourthLowPolyK0B (C 4)
   (C ((n:ℤ)*4+(frame rest).mid.a)) X) j := by
 have hb := (source_run_indicesBF n rest).2
 rw [hc] at hb
 have hr := (frame_reduced rest).1
 rw [source_fourth_four_value_belowM0A5 n rest hc i j hs (by omega)]
 unfold fullFourthValueM06
 rw [←fourthNumerator_fullFA]
 have he : (∑ k ∈ Finset.range (j+1),
   (fourthNumeratorBC (n:ℤ[X]) (X^n) X 4 (frame rest).mid.a).coeff k *
     ((7+(j-k)).choose 7:ℤ))=
   convSevenK0B (fourthNumeratorBC (n:ℤ[X]) 0 X 4 (frame rest).mid.a) j := by
   apply Finset.sum_congr rfl
   intro k hk
   rw [fourthNumerator_coeff_shiftK0B n _ _ k (by have := Finset.mem_range.mp hk; omega)]
 rw [he,fourthNumerator_zeroK0B]
 simp only [map_add,map_mul,map_natCast]
 rfl

theorem source_fourth_initial_fourM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j < n) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_fourth_conv_fourM0A5 n rest hc (i+2) j (by omega) (by omega)
 have h1 := source_fourth_conv_fourM0A5 n rest hc (i+1) (j+1) (by omega) (by omega)
 have h2 := source_fourth_conv_fourM0A5 n rest hc i (j+2) (by omega) (by omega)
 have hr : (1:ℤ) ≤ (frame rest).mid.a := by exact_mod_cast (frame_reduced rest).1
 have hn : (j:ℤ)+1 ≤ n := by exact_mod_cast hj
 have h := fourthLow_convolution_lcK0B 4 ((n:ℤ)*4+(frame rest).mid.a) j
   (by norm_num) (by omega)
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
