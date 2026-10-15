import MarkovAllCycleValueM0A5
import MarkovFourCycleInitialM0A5
/-! Machine-authored 0a5fcabe. Universal raw initial interval, all predecessor cycles. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff

theorem source_fourth_conv_allM0A5 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j < n) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 convSevenK0B (fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
   (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X) j := by
 have hb := (source_run_indicesBF n rest).2
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hc : 2 ≤ (frame rest).mid.b := by omega
 have hb0 := Nat.mul_le_mul_right (n+1) hc
 rw [source_fourth_all_belowM0A5 n rest i j hs (by rw [hb]; nlinarith)]
 unfold fullFourthValueM06
 rw [←fourthNumerator_fullFA]
 have he : (∑ k ∈ Finset.range (j+1),
   (fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a).coeff k *
     ((7+(j-k)).choose 7:ℤ))=
   convSevenK0B (fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a) j := by
   apply Finset.sum_congr rfl
   intro k hk
   rw [fourthNumerator_coeff_initialK0B n _ _ k (by have := Finset.mem_range.mp hk; omega)]
 rw [he,fourthNumerator_zeroK0B]
 simp only [map_add,map_mul,map_natCast]

theorem source_fourth_initial_all_cyclesM0A5 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : j+2 < n) (hj5 : 5 ≤ j) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h0 := source_fourth_conv_allM0A5 n rest (i+2) j (by omega) (by omega)
 have h1 := source_fourth_conv_allM0A5 n rest (i+1) (j+1) (by omega) (by omega)
 have h2 := source_fourth_conv_allM0A5 n rest i (j+2) (by omega) hj
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have hc : (2:ℤ) ≤ (frame rest).mid.b := by exact_mod_cast (show 2 ≤ (frame rest).mid.b by omega)
 have hr' : (1:ℤ) ≤ (frame rest).mid.a := by exact_mod_cast hr
 have hn : (j:ℤ)+1 ≤ n := by exact_mod_cast (show j+1 ≤ n by omega)
 have hh := mul_le_mul_of_nonneg_left hn (show (0:ℤ) ≤ (frame rest).mid.b by omega)
 have h := fourthLow_lc_ge_fiveM0A5 (frame rest).mid.b
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) j hc (by nlinarith only [hh,hr']) hj5
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov
