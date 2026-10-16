import MarkovFiveForceM468
import MarkovLowSourceME9C
/-! Machine-authored 4687d03f. Unbounded source identification and first
horizontal lower-region triple. All coefficients are raw. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem source_low_fiveM468 (q : ℕ) (r : Bool) (hq : 1 ≤ q) :
 ∀ j, j ≤ q → (threeRawM9E2 q r 5 j:ℚ)=lowFiveM468 (sourceNME9C q r) j := by
 have h3 := source_low_threeME9C q r hq
 have h4 := source_low_fourME9C q r hq
 have h0 : (threeRawM9E2 q r 5 0:ℚ)=lowFiveM468 (sourceNME9C q r) 0 := by
   have h := raw_disc_zeroME9C q 3 r
   norm_num only at h
   rw [h3 0 (by omega),h4 0 (by omega),low_force_fiveM468 q 0 r (by omega)] at h
   norm_num [lowForceFiveM468,deltaFiveM468,deltaThreeME9C,deltaFourME9C,
     lowThreeME9C,lowFourME9C,lowFiveM468] at h ⊢
   linarith
 apply second_difference_uniqueME9C q _ _ h0
 · intro hq1
   have h := raw_disc_oneME9C q 3 r
   norm_num only at h
   rw [h3 1 hq1,h4 1 hq1,h4 0 (by omega),h0,low_force_fiveM468 q 1 r hq1] at h
   norm_num [lowForceFiveM468,deltaFiveM468,deltaThreeME9C,deltaFourME9C,
     lowThreeME9C,lowFourME9C,lowFiveM468] at h ⊢
   linarith
 · intro j hj
   have h := raw_disc_stepME9C q 3 j r
   norm_num only at h
   rw [h3 (j+2) hj,h4 (j+2) hj,h4 (j+1) (by omega),low_force_fiveM468 q (j+2) r hj] at h
   simp only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_one] at h ⊢
   rw [low_five_equationM468]
   linarith

theorem source_first_horizontalM468 (q j : ℕ) (r : Bool) (hq : 1 ≤ q) (hj : j ≤ q) :
 threeRawM9E2 q r 3 j*threeRawM9E2 q r 5 j ≤ threeRawM9E2 q r 4 j^2 := by
 have hn : 3*j+1 ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hh : (threeRawM9E2 q r 3 j:ℚ)*(threeRawM9E2 q r 5 j:ℚ) ≤
     (threeRawM9E2 q r 4 j:ℚ)^2 := by
   rw [source_low_threeME9C q r hq j hj,source_low_fiveM468 q r hq j hj,
     source_low_fourME9C q r hq j hj]
   have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-1 := by
     have hnn : (3:ℚ)*j+1 ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
     linarith
   have he := first_horizontal_identityM468 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-1) j
   have hp := first_horizontal_nonnegM468 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-1) j hd (by positivity)
   rw [show 3*(j:ℚ)+1+((sourceNME9C q r:ℚ)-3*(j:ℚ)-1)=(sourceNME9C q r:ℚ) by ring] at he
   linarith only [he,hp]
 exact_mod_cast hh

end
end MathGKM.Markov
