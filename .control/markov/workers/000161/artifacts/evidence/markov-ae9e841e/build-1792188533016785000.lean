import MarkovHorizontalGap1MAE9
import MarkovVerticalGap1MAE9
import MarkovDiagonalGap1MAE9
import MarkovSmallHorizontalMAE9
/-! Machine-authored ae9e841e. Exact polynomial certificates, checked by ring.
These mathematical files use no external evaluator or added axiom. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 12000000
set_option maxRecDepth 4096
attribute [local irreducible] threeRawM9E2
theorem source_horizontal1MAE9 (q j : ℕ) (r : Bool) (hq : 1 ≤ q) (hj : j ≤ q) :
 threeRawM9E2 q r 4 j*threeRawM9E2 q r 6 j ≤ threeRawM9E2 q r 5 j^2 := by
 by_cases hsmall : j < 1
 · exact three_small_horizontalMAE9 q 4 j r hq (by omega)
 have hx : (0:ℚ) ≤ (j:ℚ)-1 := by
   have hjj : (1:ℚ) ≤ j := by exact_mod_cast (show 1 ≤ j by omega)
   linarith
 have hn : 3*j+1 ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-1 := by
   have hnq : (3:ℚ)*j+1 ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
   linarith
 have hh : (threeRawM9E2 q r 4 j:ℚ)*(threeRawM9E2 q r 6 j:ℚ) ≤ (threeRawM9E2 q r 5 j:ℚ)^2 := by
   rw [source_column1MAE9 q j r (by omega),
     source_column3MAE9 q j r (by omega),
     source_column2MAE9 q j r (by omega)]
   have he := horizontal_identity1MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-1) ((j:ℚ)-1)
   have hp := horizontal_nonneg1MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-1) ((j:ℚ)-1) hd hx
   rw [show (j:ℚ)-1+1=(j:ℚ) by ring] at he
   rw [show 3*(j:ℚ)+1+((sourceNME9C q r:ℚ)-3*(j:ℚ)-1)=(sourceNME9C q r:ℚ) by ring] at he
   linarith only [he,hp]
 exact_mod_cast hh
theorem source_vertical1MAE9 (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r 6 j*threeRawM9E2 q r 6 (j+2) ≤ threeRawM9E2 q r 6 (j+1)^2 := by
 have hn : 3*j+7 ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-7 := by
   have hnq : (3:ℚ)*j+7 ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
   linarith
 have hh : (threeRawM9E2 q r 6 j:ℚ)*(threeRawM9E2 q r 6 (j+2):ℚ) ≤ (threeRawM9E2 q r 6 (j+1):ℚ)^2 := by
   rw [source_column3MAE9 q j r (by omega),
     source_column3MAE9 q (j+2) r (by omega),
     source_column3MAE9 q (j+1) r (by omega)]
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
   have he := vertical_identity1MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) (j:ℚ)
   have hp := vertical_nonneg1MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) (j:ℚ) hd (by positivity)
   rw [show 3*(j:ℚ)+7+((sourceNME9C q r:ℚ)-3*(j:ℚ)-7)=(sourceNME9C q r:ℚ) by ring] at he
   linarith only [he,hp]
 exact_mod_cast hh
theorem source_diagonal1MAE9 (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r 4 (j+2)*threeRawM9E2 q r 6 j ≤ threeRawM9E2 q r 5 (j+1)^2 := by
 have hn : 3*j+7 ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-7 := by
   have hnq : (3:ℚ)*j+7 ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
   linarith
 have hh : (threeRawM9E2 q r 4 (j+2):ℚ)*(threeRawM9E2 q r 6 j:ℚ) ≤ (threeRawM9E2 q r 5 (j+1):ℚ)^2 := by
   rw [source_column1MAE9 q (j+2) r (by omega),
     source_column3MAE9 q j r (by omega),
     source_column2MAE9 q (j+1) r (by omega)]
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
   have he := diagonal_identity1MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) (j:ℚ)
   have hp := diagonal_nonneg1MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-7) (j:ℚ) hd (by positivity)
   rw [show 3*(j:ℚ)+7+((sourceNME9C q r:ℚ)-3*(j:ℚ)-7)=(sourceNME9C q r:ℚ) by ring] at he
   linarith only [he,hp]
 exact_mod_cast hh
end
end MathGKM.Markov
