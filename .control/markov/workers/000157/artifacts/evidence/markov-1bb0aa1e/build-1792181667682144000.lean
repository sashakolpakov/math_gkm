import MarkovCrossCertificateM1BB
import MarkovLowLCME9C
/-! Machine-authored 1bb0aa1e. Strict raw LC through the first correction
row, columns 3 and 4, universally in both numerator-three source families. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] threeRawM9E2

theorem three_cross_threeM1BB (k : ℕ) (r : Bool) :
 threeRawM9E2 (k+1) r 3 k*threeRawM9E2 (k+1) r 3 (k+2)<
 threeRawM9E2 (k+1) r 3 (k+1)^2 := by
 have hh : (threeRawM9E2 (k+1) r 3 k:ℚ)*(threeRawM9E2 (k+1) r 3 (k+2):ℚ)<
     (threeRawM9E2 (k+1) r 3 (k+1):ℚ)^2 := by
   rw [source_low_threeME9C _ _ (by omega) k (by omega),source_first_threeM1BB,
     source_low_threeME9C _ _ (by omega) (k+1) (by omega)]
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
   cases r
   · have he := cross_identity3FM1BB (k:ℚ)
     have hp := cross_positive3FM1BB (k:ℚ) (by positivity)
     linarith only [he,hp]
   · have he := cross_identity3TM1BB (k:ℚ)
     have hp := cross_positive3TM1BB (k:ℚ) (by positivity)
     linarith only [he,hp]
 exact_mod_cast hh

theorem three_cross_fourM1BB (k : ℕ) (r : Bool) :
 threeRawM9E2 (k+1) r 4 k*threeRawM9E2 (k+1) r 4 (k+2)<
 threeRawM9E2 (k+1) r 4 (k+1)^2 := by
 have hh : (threeRawM9E2 (k+1) r 4 k:ℚ)*(threeRawM9E2 (k+1) r 4 (k+2):ℚ)<
     (threeRawM9E2 (k+1) r 4 (k+1):ℚ)^2 := by
   rw [source_low_fourME9C _ _ (by omega) k (by omega),source_first_fourM1BB,
     source_low_fourME9C _ _ (by omega) (k+1) (by omega)]
   cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_mul]
   · have he := cross_identity4FM1BB (k:ℚ)
     have hp := cross_positive4FM1BB (k:ℚ) (by positivity)
     linarith only [he,hp]
   · have he := cross_identity4TM1BB (k:ℚ)
     have hp := cross_positive4TM1BB (k:ℚ) (by positivity)
     linarith only [he,hp]
 exact_mod_cast hh

theorem three_low_threeM1BB (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r 3 j*threeRawM9E2 q r 3 (j+2)<threeRawM9E2 q r 3 (j+1)^2 := by
 have hh : (threeRawM9E2 q r 3 j:ℚ)*(threeRawM9E2 q r 3 (j+2):ℚ)<
     (threeRawM9E2 q r 3 (j+1):ℚ)^2 := by
   rw [source_low_threeME9C _ _ (by omega) j (by omega),
     source_low_threeME9C _ _ (by omega) (j+2) hj,
     source_low_threeME9C _ _ (by omega) (j+1) (by omega)]
   simpa only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] using low_three_strictM1BB (j:ℚ) (by positivity)
 exact_mod_cast hh

theorem three_low_tail_verticalM1BB (q i j : ℕ) (r : Bool)
 (hi : i=3 ∨ i=4) (hj : j+1 ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2)<threeRawM9E2 q r i (j+1)^2 := by
 by_cases h : j+2 ≤ q
 · rcases hi with rfl|rfl
   · exact three_low_threeM1BB q j r h
   · exact three_low_four_strictME9C q j r h
 · have he : q=j+1 := by omega
   subst q
   rcases hi with rfl|rfl
   · exact three_cross_threeM1BB j r
   · exact three_cross_fourM1BB j r

end
end MathGKM.Markov
