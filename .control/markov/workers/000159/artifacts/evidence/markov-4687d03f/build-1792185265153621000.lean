import MarkovFiveSourceM468
import MarkovFiveShapeM468
/-! Machine-authored 4687d03f. Strict vertical and diagonal raw inequalities
throughout the proved lower region; correction rows are not included. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem source_five_verticalM468 (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r 5 j*threeRawM9E2 q r 5 (j+2) < threeRawM9E2 q r 5 (j+1)^2 := by
 have hn : 3*j+7 ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hh : (threeRawM9E2 q r 5 j:ℚ)*(threeRawM9E2 q r 5 (j+2):ℚ) <
     (threeRawM9E2 q r 5 (j+1):ℚ)^2 := by
   rw [source_low_fiveM468 q r (by omega) j (by omega),
     source_low_fiveM468 q r (by omega) (j+2) hj,
     source_low_fiveM468 q r (by omega) (j+1) (by omega)]
   simp only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_one]
   have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-7 := by
     have hnn : (3:ℚ)*j+7 ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
     linarith
   have he := verticalFive_identityM468 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) j
   have hp := verticalFive_positiveM468 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) j hd (by positivity)
   rw [show 3*(j:ℚ)+7+((sourceNME9C q r:ℚ)-3*(j:ℚ)-7)=(sourceNME9C q r:ℚ) by ring] at he
   linarith only [he,hp]
 exact_mod_cast hh

theorem source_first_diagonalM468 (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r 3 (j+2)*threeRawM9E2 q r 5 j < threeRawM9E2 q r 4 (j+1)^2 := by
 have hn : 3*j+7 ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hh : (threeRawM9E2 q r 3 (j+2):ℚ)*(threeRawM9E2 q r 5 j:ℚ) <
     (threeRawM9E2 q r 4 (j+1):ℚ)^2 := by
   rw [source_low_threeME9C q r (by omega) (j+2) hj,
     source_low_fiveM468 q r (by omega) j (by omega),
     source_low_fourME9C q r (by omega) (j+1) (by omega)]
   simp only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_one]
   have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-7 := by
     have hnn : (3:ℚ)*j+7 ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
     linarith
   have he := diagonalFirst_identityM468 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) j
   have hp := diagonalFirst_positiveM468 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) j hd (by positivity)
   rw [show 3*(j:ℚ)+7+((sourceNME9C q r:ℚ)-3*(j:ℚ)-7)=(sourceNME9C q r:ℚ) by ring] at he
   linarith only [he,hp]
 exact_mod_cast hh

end
end MathGKM.Markov
