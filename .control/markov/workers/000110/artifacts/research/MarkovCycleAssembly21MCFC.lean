import MarkovTwoGapsMCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem cycle_interval_lc21_0MCFC (n j : ℕ) (hn : 7 ≤ n) (hl : 0*n+5 ≤ j)
 (hu : j ≤ 1*n-1) (hub : j+1 ≤ n) :
 smallValue21MCFC n j*smallValue21MCFC n (j+2) ≤ smallValue21MCFC n (j+1)^2 := by
 let x : ℤ := j-(0*(n:ℤ)+5)
 let Z : ℤ := (1*(n:ℤ)+(-1))-j
 have hx : 0 ≤ x := by dsimp [x]; omega
 have hZ : 0 ≤ Z := by dsimp [Z]; omega
 have h := twoInitial_lcMCFC 0 Z x hZ hx
 have en : x+Z+6=(n:ℤ) := by dsimp [x,Z]; ring
 have ej0 : x+5=(j:ℤ)+0 := by dsimp [x,Z]; ring
 have ej1 : x+6=(j:ℤ)+1 := by dsimp [x,Z]; ring
 have ej2 : x+7=(j:ℤ)+2 := by dsimp [x,Z]; ring
 rw [ej0,ej1,ej2,en] at h
 simp only [add_zero] at h
 have h0 := twoInitialMCFC_value n j (by omega) (by omega)
 have h1 := twoInitialMCFC_value n (j+1) (by omega) (by omega)
 have h2 := twoInitialMCFC_value n (j+2) (by omega) (by omega)
 push_cast at h0 h1 h2
 have hh : (16*twoInitialMCFC n j)*(16*twoInitialMCFC n ((j:ℤ)+2)) ≤ (16*twoInitialMCFC n ((j:ℤ)+1))^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_interval_lc21_1MCFC (n j : ℕ) (hn : 7 ≤ n) (hl : 1*n+5 ≤ j)
 (hu : j ≤ 2*n+0) :
 smallValue21MCFC n j*smallValue21MCFC n (j+2) ≤ smallValue21MCFC n (j+1)^2 := by
 let x : ℤ := j-(1*(n:ℤ)+5)
 let Z : ℤ := (2*(n:ℤ)+(0))-j
 have hx : 0 ≤ x := by dsimp [x]; omega
 have hZ : 0 ≤ Z := by dsimp [Z]; omega
 have h := twoMiddle_lcMCFC 0 Z x hZ hx
 have en : x+Z+5=(n:ℤ) := by dsimp [x,Z]; ring
 have ej0 : 2*x+Z+10=(j:ℤ)+0 := by dsimp [x,Z]; ring
 have ej1 : 2*x+Z+11=(j:ℤ)+1 := by dsimp [x,Z]; ring
 have ej2 : 2*x+Z+12=(j:ℤ)+2 := by dsimp [x,Z]; ring
 rw [ej0,ej1,ej2,en] at h
 simp only [add_zero] at h
 have h0 := twoMiddleMCFC_value n j (by omega) (by omega)
 have h1 := twoMiddleMCFC_value n (j+1) (by omega) (by omega)
 have h2 := twoMiddleMCFC_value n (j+2) (by omega) (by omega)
 push_cast at h0 h1 h2
 have hh : (16*twoMiddleMCFC n j)*(16*twoMiddleMCFC n ((j:ℤ)+2)) ≤ (16*twoMiddleMCFC n ((j:ℤ)+1))^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_0_0MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (0*n+0)*smallValue21MCFC n (0*n+2) ≤ smallValue21MCFC n (0*n+1)^2 := by
 have h := twoLowGap0MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoLow0MCFC_value n 0 hn
 have h1 := twoLow1MCFC_value n 0 hn
 have h2 := twoLow2MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoLow0MCFC n 0)*(16*twoLow2MCFC n 0) ≤ (16*twoLow1MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_0_1MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (0*n+1)*smallValue21MCFC n (0*n+3) ≤ smallValue21MCFC n (0*n+2)^2 := by
 have h := twoLowGap1MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoLow1MCFC_value n 0 hn
 have h1 := twoLow2MCFC_value n 0 hn
 have h2 := twoLow3MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoLow1MCFC n 0)*(16*twoLow3MCFC n 0) ≤ (16*twoLow2MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_0_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (0*n+2)*smallValue21MCFC n (0*n+4) ≤ smallValue21MCFC n (0*n+3)^2 := by
 have h := twoLowGap2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoLow2MCFC_value n 0 hn
 have h1 := twoLow3MCFC_value n 0 hn
 have h2 := twoLow4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoLow2MCFC n 0)*(16*twoLow4MCFC n 0) ≤ (16*twoLow3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_0_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (0*n+3)*smallValue21MCFC n (0*n+5) ≤ smallValue21MCFC n (0*n+4)^2 := by
 have h := twoLowGap3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoLow3MCFC_value n 0 hn
 have h1 := twoLow4MCFC_value n 0 hn
 have h2 := twoLow5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoLow3MCFC n 0)*(16*twoLow5MCFC n 0) ≤ (16*twoLow4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_0_4MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (0*n+4)*smallValue21MCFC n (0*n+6) ≤ smallValue21MCFC n (0*n+5)^2 := by
 have h := twoLowGap4MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoLow4MCFC_value n 0 hn
 have h1 := twoLow5MCFC_value n 0 hn
 have h2 := twoLow6MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoLow4MCFC n 0)*(16*twoLow6MCFC n 0) ≤ (16*twoLow5MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_1_0MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (1*n+0)*smallValue21MCFC n (1*n+2) ≤ smallValue21MCFC n (1*n+1)^2 := by
 have h := twoOnsetGap0MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoOnset0MCFC_value n 0 hn
 have h1 := twoOnset1MCFC_value n 0 hn
 have h2 := twoOnset2MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoOnset0MCFC n 0)*(16*twoOnset2MCFC n 0) ≤ (16*twoOnset1MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_1_1MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (1*n+1)*smallValue21MCFC n (1*n+3) ≤ smallValue21MCFC n (1*n+2)^2 := by
 have h := twoOnsetGap1MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoOnset1MCFC_value n 0 hn
 have h1 := twoOnset2MCFC_value n 0 hn
 have h2 := twoOnset3MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoOnset1MCFC n 0)*(16*twoOnset3MCFC n 0) ≤ (16*twoOnset2MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_1_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (1*n+2)*smallValue21MCFC n (1*n+4) ≤ smallValue21MCFC n (1*n+3)^2 := by
 have h := twoOnsetGap2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoOnset2MCFC_value n 0 hn
 have h1 := twoOnset3MCFC_value n 0 hn
 have h2 := twoOnset4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoOnset2MCFC n 0)*(16*twoOnset4MCFC n 0) ≤ (16*twoOnset3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_1_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (1*n+3)*smallValue21MCFC n (1*n+5) ≤ smallValue21MCFC n (1*n+4)^2 := by
 have h := twoOnsetGap3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoOnset3MCFC_value n 0 hn
 have h1 := twoOnset4MCFC_value n 0 hn
 have h2 := twoOnset5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoOnset3MCFC n 0)*(16*twoOnset5MCFC n 0) ≤ (16*twoOnset4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_1_4MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (1*n+4)*smallValue21MCFC n (1*n+6) ≤ smallValue21MCFC n (1*n+5)^2 := by
 have h := twoOnsetGap4MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoOnset4MCFC_value n 0 hn
 have h1 := twoOnset5MCFC_value n 0 hn
 have h2 := twoOnset6MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoOnset4MCFC n 0)*(16*twoOnset6MCFC n 0) ≤ (16*twoOnset5MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_2_1MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (2*n+1)*smallValue21MCFC n (2*n+3) ≤ smallValue21MCFC n (2*n+2)^2 := by
 have h := twoTailGap1MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoTail1MCFC_value n 0 hn
 have h1 := twoTail2MCFC_value n 0 hn
 have h2 := twoTail3MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoTail1MCFC n 0)*(16*twoTail3MCFC n 0) ≤ (16*twoTail2MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_2_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (2*n+2)*smallValue21MCFC n (2*n+4) ≤ smallValue21MCFC n (2*n+3)^2 := by
 have h := twoTailGap2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoTail2MCFC_value n 0 hn
 have h1 := twoTail3MCFC_value n 0 hn
 have h2 := twoTail4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoTail2MCFC n 0)*(16*twoTail4MCFC n 0) ≤ (16*twoTail3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc21_2_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue21MCFC n (2*n+3)*smallValue21MCFC n (2*n+5) ≤ smallValue21MCFC n (2*n+4)^2 := by
 have h := twoTailGap3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := twoTail3MCFC_value n 0 hn
 have h1 := twoTail4MCFC_value n 0 hn
 have h2 := twoTail5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*twoTail3MCFC n 0)*(16*twoTail5MCFC n 0) ≤ (16*twoTail4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_value_lc21MCFC (n j : ℕ) (hn : 7 ≤ n) (hj : j ≤ 2*n+3) :
 smallValue21MCFC n j*smallValue21MCFC n (j+2) ≤ smallValue21MCFC n (j+1)^2 := by
 by_cases h0 : 0*n+5 ≤ j ∧ j ≤ n-1
 · exact cycle_interval_lc21_0MCFC n j hn (by omega) (by omega) (by omega)
 by_cases h1 : 1*n+5 ≤ j ∧ j ≤ 2*n+0
 · exact cycle_interval_lc21_1MCFC n j hn (by omega) (by omega)
 have he : j=0*n+0 ∨ j=0*n+1 ∨ j=0*n+2 ∨ j=0*n+3 ∨ j=0*n+4 ∨ j=1*n+0 ∨ j=1*n+1 ∨ j=1*n+2 ∨ j=1*n+3 ∨ j=1*n+4 ∨ j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 := by omega
 rcases he with he | he | he | he | he | he | he | he | he | he | he | he | he
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_0_0MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_0_1MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_0_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_0_3MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_0_4MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_1_0MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_1_1MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_1_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_1_3MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_1_4MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_2_1MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_2_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc21_2_3MCFC n hn

theorem source_cycle_fourth_ge_seven21MCFC (n : ℕ) (rest : List Bool)
 (hn : 7 ≤ n) (hc : (frame rest).mid.b=2) (hr : (frame rest).mid.a=1) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤ 
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have ha := (source_run_indicesBF n rest).1
 rw [hc,hr] at ha
 have hj : j ≤ 2*n+3 := by omega
 have h := cycle_value_lc21MCFC n j hn hj
 rw [←source_small_value21MCFC n rest hc hr (i+2) j (by omega),
  ←source_small_value21MCFC n rest hc hr i (j+2) (by omega),
  ←source_small_value21MCFC n rest hc hr (i+1) (j+1) (by omega)] at h
 nlinarith only [h]
end
end MathGKM.Markov
