import MarkovLowSolutionsME9C
/-! Machine-authored e9cdd527. Source identification throughout j < =q,
including j=q. Raw integer coefficients and their rational casts only. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_three_low_zeroME9C (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hi : i ≤ 2) (hj : j ≤ q) : threeRawM9E2 q r i j=0 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2]
 apply raw_outside_polygon18
 rw [(three_path_labelsM9E2 n r).1,(three_path_labelsM9E2 n r).2]
 intro h
 have hh := h.1
 have hm := Nat.mul_le_mul_left (3*(n+1)+(if r then 1 else 2)) hi
 cases r  <;> simp only [Bool.false_eq_true,if_false,if_true] at hh hm
  <;> nlinarith

theorem raw_disc_zeroME9C (q i : ℕ) (r : Bool) :
 (threeRawM9E2 q r (i+2) 0:ℚ)+2*(threeRawM9E2 q r (i+1) 0:ℚ)+
 (threeRawM9E2 q r i 0:ℚ)=(threeForceM96A q r (i+2) 0:ℚ) := by
 have h := three_raw_equationM96A q r (i+2) 0
 simp [discriminantActionM96A,shiftRawM9E2,show 1 ≤ i+2 by omega,
   show 2 ≤ i+2 by omega,show i+2-1=i+1 by omega] at h
 exact_mod_cast h

theorem raw_disc_oneME9C (q i : ℕ) (r : Bool) :
 (threeRawM9E2 q r (i+2) 1:ℚ)+2*(threeRawM9E2 q r (i+1) 1:ℚ)-
 2*(threeRawM9E2 q r (i+2) 0:ℚ)+(threeRawM9E2 q r i 1:ℚ)+
 2*(threeRawM9E2 q r (i+1) 0:ℚ)=(threeForceM96A q r (i+2) 1:ℚ) := by
 have h := three_raw_equationM96A q r (i+2) 1
 simp [discriminantActionM96A,shiftRawM9E2,show 1 ≤ i+2 by omega,
   show 2 ≤ i+2 by omega,show i+2-1=i+1 by omega] at h
 exact_mod_cast h

theorem raw_disc_stepME9C (q i j : ℕ) (r : Bool) :
 (threeRawM9E2 q r (i+2) (j+2):ℚ)+2*(threeRawM9E2 q r (i+1) (j+2):ℚ)-
 2*(threeRawM9E2 q r (i+2) (j+1):ℚ)+(threeRawM9E2 q r i (j+2):ℚ)+
 2*(threeRawM9E2 q r (i+1) (j+1):ℚ)+(threeRawM9E2 q r (i+2) j:ℚ)=
 (threeForceM96A q r (i+2) (j+2):ℚ) := by
 have h := three_raw_equationM96A q r (i+2) (j+2)
 simp [discriminantActionM96A,shiftRawM9E2,show 1 ≤ i+2 by omega,
   show 2 ≤ i+2 by omega,show i+2-1=i+1 by omega,
   show 1 ≤ j+2 by omega,show 2 ≤ j+2 by omega,show j+2-1=j+1 by omega] at h
 exact_mod_cast h

theorem source_low_threeME9C (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 ∀ j, j ≤ q → (threeRawM9E2 q r 3 j:ℚ)=lowThreeME9C j := by
 have hz (i j : ℕ) (hi : i ≤ 2) (hj : j ≤ q) : (threeRawM9E2 q r i j:ℚ)=0 := by
   rw [source_three_low_zeroME9C q i j r hq hi hj]; norm_num
 have h0 : (threeRawM9E2 q r 3 0:ℚ)=lowThreeME9C 0 := by
   have h := raw_disc_zeroME9C q 1 r
   norm_num only at h
   rw [hz 2 0 (by omega) (by omega),hz 1 0 (by omega) (by omega),
     low_force_threeME9C q 0 r (by omega)] at h
   norm_num [lowForceThreeME9C,deltaThreeME9C,lowThreeME9C] at h ⊢
   exact h
 apply second_difference_uniqueME9C q _ _ h0
 · intro hq1
   have h := raw_disc_oneME9C q 1 r
   norm_num only at h
   rw [hz 2 1 (by omega) hq1,hz 1 1 (by omega) hq1,hz 2 0 (by omega) (by omega),
     low_force_threeME9C q 1 r hq1,h0] at h
   norm_num [lowForceThreeME9C,deltaThreeME9C,lowThreeME9C] at h ⊢
   linarith
 · intro j hj
   have h := raw_disc_stepME9C q 1 j r
   norm_num only at h
   rw [hz 2 (j+2) (by omega) hj,hz 1 (j+2) (by omega) hj,
     hz 2 (j+1) (by omega) (by omega),low_force_threeME9C q (j+2) r hj] at h
   simp only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_one]
   rw [low_three_equationME9C]
   simpa using h

theorem source_low_fourME9C (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 ∀ j, j ≤ q → (threeRawM9E2 q r 4 j:ℚ)=lowFourME9C (sourceNME9C q r) j := by
 have hz (j : ℕ) (hj : j ≤ q) : (threeRawM9E2 q r 2 j:ℚ)=0 := by
   rw [source_three_low_zeroME9C q 2 j r hq (by omega) hj]; norm_num
 have ht := source_low_threeME9C q r hq
 have h0 : (threeRawM9E2 q r 4 0:ℚ)=lowFourME9C (sourceNME9C q r) 0 := by
   have h := raw_disc_zeroME9C q 2 r
   norm_num only at h
   rw [hz 0 (by omega),ht 0 (by omega),low_force_fourME9C q 0 r (by omega)] at h
   norm_num [lowForceFourME9C,deltaThreeME9C,deltaFourME9C,lowThreeME9C,lowFourME9C] at h ⊢
   linarith
 apply second_difference_uniqueME9C q _ _ h0
 · intro hq1
   have h := raw_disc_oneME9C q 2 r
   norm_num only at h
   rw [hz 1 hq1,ht 1 hq1,ht 0 (by omega),h0,low_force_fourME9C q 1 r hq1] at h
   norm_num [lowForceFourME9C,deltaThreeME9C,deltaFourME9C,lowThreeME9C,lowFourME9C] at h ⊢
   linarith
 · intro j hj
   have h := raw_disc_stepME9C q 2 j r
   norm_num only at h
   rw [hz (j+2) hj,ht (j+2) hj,ht (j+1) (by omega),low_force_fourME9C q (j+2) r hj] at h
   simp only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_one] at h ⊢
   rw [low_four_equationME9C]
   linarith

end
end MathGKM.Markov
