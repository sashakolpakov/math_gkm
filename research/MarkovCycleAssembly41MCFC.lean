import MarkovCycleInterval41_0MCFC
import MarkovCycleInterval41_1MCFC
import MarkovCycleInterval41_2MCFC
import MarkovCycleInterval41_3MCFC
import MarkovCycleWindow41_0MCFC
import MarkovCycleWindow41_1MCFC
import MarkovCycleWindow41_2MCFC
import MarkovCycleWindow41_3MCFC
import MarkovCycleWindow41_4MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem cycle_interval_lc41_0MCFC (n j : ℕ) (hn : 7 ≤ n) (hl : 0*n+5 ≤ j)
 (hu : j ≤ 1*n-1) (hub : j+1 ≤ n) :
 smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
 let x : ℤ := j-(0*(n:ℤ)+5)
 let Z : ℤ := (1*(n:ℤ)+(-1))-j
 have hx : 0 ≤ x := by dsimp [x]; omega
 have hZ : 0 ≤ Z := by dsimp [Z]; omega
 have h := cycleIntervalGap41_0MCFC 0 Z x hZ hx
 have en : x+Z+6=(n:ℤ) := by dsimp [x,Z]; ring
 have ej0 : 0*(x+Z+6)+5+x=(j:ℤ)+0 := by dsimp [x,Z]; ring
 have ej1 : 0*(x+Z+6)+6+x=(j:ℤ)+1 := by dsimp [x,Z]; ring
 have ej2 : 0*(x+Z+6)+7+x=(j:ℤ)+2 := by dsimp [x,Z]; ring
 rw [ej0,ej1,ej2,en] at h
 simp only [add_zero] at h
 have h0 := cycleShape41_0MCFC_value n j hn (by omega) (by omega)
 have h1 := cycleShape41_0MCFC_value n (j+1) hn (by omega) (by omega)
 have h2 := cycleShape41_0MCFC_value n (j+2) hn (by omega) (by omega)
 push_cast at h0 h1 h2
 have hh : (16*cycleShape41_0MCFC n j)*(16*cycleShape41_0MCFC n ((j:ℤ)+2)) ≤ (16*cycleShape41_0MCFC n ((j:ℤ)+1))^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_interval_lc41_1MCFC (n j : ℕ) (hn : 7 ≤ n) (hl : 1*n+5 ≤ j)
 (hu : j ≤ 2*n+0) :
 smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
 let x : ℤ := j-(1*(n:ℤ)+5)
 let Z : ℤ := (2*(n:ℤ)+(0))-j
 have hx : 0 ≤ x := by dsimp [x]; omega
 have hZ : 0 ≤ Z := by dsimp [Z]; omega
 have h := cycleIntervalGap41_1MCFC 0 Z x hZ hx
 have en : x+Z+5=(n:ℤ) := by dsimp [x,Z]; ring
 have ej0 : 1*(x+Z+5)+5+x=(j:ℤ)+0 := by dsimp [x,Z]; ring
 have ej1 : 1*(x+Z+5)+6+x=(j:ℤ)+1 := by dsimp [x,Z]; ring
 have ej2 : 1*(x+Z+5)+7+x=(j:ℤ)+2 := by dsimp [x,Z]; ring
 rw [ej0,ej1,ej2,en] at h
 simp only [add_zero] at h
 have h0 := cycleShape41_1MCFC_value n j hn (by omega) (by omega)
 have h1 := cycleShape41_1MCFC_value n (j+1) hn (by omega) (by omega)
 have h2 := cycleShape41_1MCFC_value n (j+2) hn (by omega) (by omega)
 push_cast at h0 h1 h2
 have hh : (16*cycleShape41_1MCFC n j)*(16*cycleShape41_1MCFC n ((j:ℤ)+2)) ≤ (16*cycleShape41_1MCFC n ((j:ℤ)+1))^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_interval_lc41_2MCFC (n j : ℕ) (hn : 7 ≤ n) (hl : 2*n+5 ≤ j)
 (hu : j ≤ 3*n+1) :
 smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
 let x : ℤ := j-(2*(n:ℤ)+5)
 let Z : ℤ := (3*(n:ℤ)+(1))-j
 have hx : 0 ≤ x := by dsimp [x]; omega
 have hZ : 0 ≤ Z := by dsimp [Z]; omega
 have h := cycleIntervalGap41_2MCFC 0 Z x hZ hx
 have en : x+Z+4=(n:ℤ) := by dsimp [x,Z]; ring
 have ej0 : 2*(x+Z+4)+5+x=(j:ℤ)+0 := by dsimp [x,Z]; ring
 have ej1 : 2*(x+Z+4)+6+x=(j:ℤ)+1 := by dsimp [x,Z]; ring
 have ej2 : 2*(x+Z+4)+7+x=(j:ℤ)+2 := by dsimp [x,Z]; ring
 rw [ej0,ej1,ej2,en] at h
 simp only [add_zero] at h
 have h0 := cycleShape41_2MCFC_value n j hn (by omega) (by omega)
 have h1 := cycleShape41_2MCFC_value n (j+1) hn (by omega) (by omega)
 have h2 := cycleShape41_2MCFC_value n (j+2) hn (by omega) (by omega)
 push_cast at h0 h1 h2
 have hh : (16*cycleShape41_2MCFC n j)*(16*cycleShape41_2MCFC n ((j:ℤ)+2)) ≤ (16*cycleShape41_2MCFC n ((j:ℤ)+1))^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_interval_lc41_3MCFC (n j : ℕ) (hn : 7 ≤ n) (hl : 3*n+5 ≤ j)
 (hu : j ≤ 4*n+2) :
 smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
 let x : ℤ := j-(3*(n:ℤ)+5)
 let Z : ℤ := (4*(n:ℤ)+(2))-j
 have hx : 0 ≤ x := by dsimp [x]; omega
 have hZ : 0 ≤ Z := by dsimp [Z]; omega
 have h := cycleIntervalGap41_3MCFC 0 Z x hZ hx
 have en : x+Z+3=(n:ℤ) := by dsimp [x,Z]; ring
 have ej0 : 3*(x+Z+3)+5+x=(j:ℤ)+0 := by dsimp [x,Z]; ring
 have ej1 : 3*(x+Z+3)+6+x=(j:ℤ)+1 := by dsimp [x,Z]; ring
 have ej2 : 3*(x+Z+3)+7+x=(j:ℤ)+2 := by dsimp [x,Z]; ring
 rw [ej0,ej1,ej2,en] at h
 simp only [add_zero] at h
 have h0 := cycleShape41_3MCFC_value n j hn (by omega) (by omega)
 have h1 := cycleShape41_3MCFC_value n (j+1) hn (by omega) (by omega)
 have h2 := cycleShape41_3MCFC_value n (j+2) hn (by omega) (by omega)
 push_cast at h0 h1 h2
 have hh : (16*cycleShape41_3MCFC n j)*(16*cycleShape41_3MCFC n ((j:ℤ)+2)) ≤ (16*cycleShape41_3MCFC n ((j:ℤ)+1))^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_0_0MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (0*n+0)*smallValue41MCFC n (0*n+2) ≤ smallValue41MCFC n (0*n+1)^2 := by
 have h := cycleWindowGap41_0_0MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_0_0MCFC_value n 0 hn
 have h1 := cyclePoint41_0_1MCFC_value n 0 hn
 have h2 := cyclePoint41_0_2MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_0_0MCFC n 0)*(16*cyclePoint41_0_2MCFC n 0) ≤ (16*cyclePoint41_0_1MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_0_1MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (0*n+1)*smallValue41MCFC n (0*n+3) ≤ smallValue41MCFC n (0*n+2)^2 := by
 have h := cycleWindowGap41_0_1MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_0_1MCFC_value n 0 hn
 have h1 := cyclePoint41_0_2MCFC_value n 0 hn
 have h2 := cyclePoint41_0_3MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_0_1MCFC n 0)*(16*cyclePoint41_0_3MCFC n 0) ≤ (16*cyclePoint41_0_2MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_0_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (0*n+2)*smallValue41MCFC n (0*n+4) ≤ smallValue41MCFC n (0*n+3)^2 := by
 have h := cycleWindowGap41_0_2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_0_2MCFC_value n 0 hn
 have h1 := cyclePoint41_0_3MCFC_value n 0 hn
 have h2 := cyclePoint41_0_4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_0_2MCFC n 0)*(16*cyclePoint41_0_4MCFC n 0) ≤ (16*cyclePoint41_0_3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_0_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (0*n+3)*smallValue41MCFC n (0*n+5) ≤ smallValue41MCFC n (0*n+4)^2 := by
 have h := cycleWindowGap41_0_3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_0_3MCFC_value n 0 hn
 have h1 := cyclePoint41_0_4MCFC_value n 0 hn
 have h2 := cyclePoint41_0_5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_0_3MCFC n 0)*(16*cyclePoint41_0_5MCFC n 0) ≤ (16*cyclePoint41_0_4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_0_4MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (0*n+4)*smallValue41MCFC n (0*n+6) ≤ smallValue41MCFC n (0*n+5)^2 := by
 have h := cycleWindowGap41_0_4MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_0_4MCFC_value n 0 hn
 have h1 := cyclePoint41_0_5MCFC_value n 0 hn
 have h2 := cyclePoint41_0_6MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_0_4MCFC n 0)*(16*cyclePoint41_0_6MCFC n 0) ≤ (16*cyclePoint41_0_5MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_1_0MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (1*n+0)*smallValue41MCFC n (1*n+2) ≤ smallValue41MCFC n (1*n+1)^2 := by
 have h := cycleWindowGap41_1_0MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_1_0MCFC_value n 0 hn
 have h1 := cyclePoint41_1_1MCFC_value n 0 hn
 have h2 := cyclePoint41_1_2MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_1_0MCFC n 0)*(16*cyclePoint41_1_2MCFC n 0) ≤ (16*cyclePoint41_1_1MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_1_1MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (1*n+1)*smallValue41MCFC n (1*n+3) ≤ smallValue41MCFC n (1*n+2)^2 := by
 have h := cycleWindowGap41_1_1MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_1_1MCFC_value n 0 hn
 have h1 := cyclePoint41_1_2MCFC_value n 0 hn
 have h2 := cyclePoint41_1_3MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_1_1MCFC n 0)*(16*cyclePoint41_1_3MCFC n 0) ≤ (16*cyclePoint41_1_2MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_1_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (1*n+2)*smallValue41MCFC n (1*n+4) ≤ smallValue41MCFC n (1*n+3)^2 := by
 have h := cycleWindowGap41_1_2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_1_2MCFC_value n 0 hn
 have h1 := cyclePoint41_1_3MCFC_value n 0 hn
 have h2 := cyclePoint41_1_4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_1_2MCFC n 0)*(16*cyclePoint41_1_4MCFC n 0) ≤ (16*cyclePoint41_1_3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_1_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (1*n+3)*smallValue41MCFC n (1*n+5) ≤ smallValue41MCFC n (1*n+4)^2 := by
 have h := cycleWindowGap41_1_3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_1_3MCFC_value n 0 hn
 have h1 := cyclePoint41_1_4MCFC_value n 0 hn
 have h2 := cyclePoint41_1_5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_1_3MCFC n 0)*(16*cyclePoint41_1_5MCFC n 0) ≤ (16*cyclePoint41_1_4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_1_4MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (1*n+4)*smallValue41MCFC n (1*n+6) ≤ smallValue41MCFC n (1*n+5)^2 := by
 have h := cycleWindowGap41_1_4MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_1_4MCFC_value n 0 hn
 have h1 := cyclePoint41_1_5MCFC_value n 0 hn
 have h2 := cyclePoint41_1_6MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_1_4MCFC n 0)*(16*cyclePoint41_1_6MCFC n 0) ≤ (16*cyclePoint41_1_5MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_2_1MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (2*n+1)*smallValue41MCFC n (2*n+3) ≤ smallValue41MCFC n (2*n+2)^2 := by
 have h := cycleWindowGap41_2_1MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_2_1MCFC_value n 0 hn
 have h1 := cyclePoint41_2_2MCFC_value n 0 hn
 have h2 := cyclePoint41_2_3MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_2_1MCFC n 0)*(16*cyclePoint41_2_3MCFC n 0) ≤ (16*cyclePoint41_2_2MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_2_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (2*n+2)*smallValue41MCFC n (2*n+4) ≤ smallValue41MCFC n (2*n+3)^2 := by
 have h := cycleWindowGap41_2_2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_2_2MCFC_value n 0 hn
 have h1 := cyclePoint41_2_3MCFC_value n 0 hn
 have h2 := cyclePoint41_2_4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_2_2MCFC n 0)*(16*cyclePoint41_2_4MCFC n 0) ≤ (16*cyclePoint41_2_3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_2_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (2*n+3)*smallValue41MCFC n (2*n+5) ≤ smallValue41MCFC n (2*n+4)^2 := by
 have h := cycleWindowGap41_2_3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_2_3MCFC_value n 0 hn
 have h1 := cyclePoint41_2_4MCFC_value n 0 hn
 have h2 := cyclePoint41_2_5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_2_3MCFC n 0)*(16*cyclePoint41_2_5MCFC n 0) ≤ (16*cyclePoint41_2_4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_2_4MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (2*n+4)*smallValue41MCFC n (2*n+6) ≤ smallValue41MCFC n (2*n+5)^2 := by
 have h := cycleWindowGap41_2_4MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_2_4MCFC_value n 0 hn
 have h1 := cyclePoint41_2_5MCFC_value n 0 hn
 have h2 := cyclePoint41_2_6MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_2_4MCFC n 0)*(16*cyclePoint41_2_6MCFC n 0) ≤ (16*cyclePoint41_2_5MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_3_2MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (3*n+2)*smallValue41MCFC n (3*n+4) ≤ smallValue41MCFC n (3*n+3)^2 := by
 have h := cycleWindowGap41_3_2MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_3_2MCFC_value n 0 hn
 have h1 := cyclePoint41_3_3MCFC_value n 0 hn
 have h2 := cyclePoint41_3_4MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_3_2MCFC n 0)*(16*cyclePoint41_3_4MCFC n 0) ≤ (16*cyclePoint41_3_3MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_3_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (3*n+3)*smallValue41MCFC n (3*n+5) ≤ smallValue41MCFC n (3*n+4)^2 := by
 have h := cycleWindowGap41_3_3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_3_3MCFC_value n 0 hn
 have h1 := cyclePoint41_3_4MCFC_value n 0 hn
 have h2 := cyclePoint41_3_5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_3_3MCFC n 0)*(16*cyclePoint41_3_5MCFC n 0) ≤ (16*cyclePoint41_3_4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_3_4MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (3*n+4)*smallValue41MCFC n (3*n+6) ≤ smallValue41MCFC n (3*n+5)^2 := by
 have h := cycleWindowGap41_3_4MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_3_4MCFC_value n 0 hn
 have h1 := cyclePoint41_3_5MCFC_value n 0 hn
 have h2 := cyclePoint41_3_6MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_3_4MCFC n 0)*(16*cyclePoint41_3_6MCFC n 0) ≤ (16*cyclePoint41_3_5MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_window_lc41_4_3MCFC (n : ℕ) (hn : 7 ≤ n) :
 smallValue41MCFC n (4*n+3)*smallValue41MCFC n (4*n+5) ≤ smallValue41MCFC n (4*n+4)^2 := by
 have h := cycleWindowGap41_4_3MCFC ((n:ℤ)-7) 0 0 (by omega)
 rw [sub_add_cancel] at h
 have h0 := cyclePoint41_4_3MCFC_value n 0 hn
 have h1 := cyclePoint41_4_4MCFC_value n 0 hn
 have h2 := cyclePoint41_4_5MCFC_value n 0 hn
 norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢
 have hh : (16*cyclePoint41_4_3MCFC n 0)*(16*cyclePoint41_4_5MCFC n 0) ≤ (16*cyclePoint41_4_4MCFC n 0)^2 := by nlinarith only [h]
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem cycle_value_lc41MCFC (n j : ℕ) (hn : 7 ≤ n) (hj : j ≤ 4*n+3) :
 smallValue41MCFC n j*smallValue41MCFC n (j+2) ≤ smallValue41MCFC n (j+1)^2 := by
 by_cases h0 : 0*n+5 ≤ j ∧ j ≤ n-1
 · exact cycle_interval_lc41_0MCFC n j hn (by omega) (by omega) (by omega)
 by_cases h1 : 1*n+5 ≤ j ∧ j ≤ 2*n+0
 · exact cycle_interval_lc41_1MCFC n j hn (by omega) (by omega)
 by_cases h2 : 2*n+5 ≤ j ∧ j ≤ 3*n+1
 · exact cycle_interval_lc41_2MCFC n j hn (by omega) (by omega)
 by_cases h3 : 3*n+5 ≤ j ∧ j ≤ 4*n+2
 · exact cycle_interval_lc41_3MCFC n j hn (by omega) (by omega)
 have he : j=0*n+0 ∨ j=0*n+1 ∨ j=0*n+2 ∨ j=0*n+3 ∨ j=0*n+4 ∨ j=1*n+0 ∨ j=1*n+1 ∨ j=1*n+2 ∨ j=1*n+3 ∨ j=1*n+4 ∨ j=2*n+1 ∨ j=2*n+2 ∨ j=2*n+3 ∨ j=2*n+4 ∨ j=3*n+2 ∨ j=3*n+3 ∨ j=3*n+4 ∨ j=4*n+3 := by omega
 rcases he with he | he | he | he | he | he | he | he | he | he | he | he | he | he | he | he | he | he
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_0_0MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_0_1MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_0_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_0_3MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_0_4MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_1_0MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_1_1MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_1_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_1_3MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_1_4MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_2_1MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_2_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_2_3MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_2_4MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_3_2MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_3_3MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_3_4MCFC n hn
 · subst j
   simpa only [Nat.add_assoc] using cycle_window_lc41_4_3MCFC n hn

theorem source_cycle_fourth_ge_seven41MCFC (n : ℕ) (rest : List Bool)
 (hn : 7 ≤ n) (hc : (frame rest).mid.b=4) (hr : (frame rest).mid.a=1) (i j : ℕ)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤ 
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have ha := (source_run_indicesBF n rest).1
 rw [hc,hr] at ha
 have hj : j ≤ 4*n+3 := by omega
 have h := cycle_value_lc41MCFC n j hn hj
 rw [←source_small_value41MCFC n rest hc hr (i+2) j (by omega),
  ←source_small_value41MCFC n rest hc hr i (j+2) (by omega),
  ←source_small_value41MCFC n rest hc hr (i+1) (j+1) (by omega)] at h
 nlinarith only [h]
end
end MathGKM.Markov
