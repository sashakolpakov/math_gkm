import MarkovRowRecurrenceMFFD
import MarkovHorizontalLCB46
/-! Machine-authored ffd747f5. Conditional transport from the exact residual
row to all raw horizontal coefficients. The general shape hypothesis is open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem lower_row_crossMFFD (n j : ℕ)
 (h : CrossLC (CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)))) :
 CrossLC (CoeffSeq ((lowerRowMFFD n j).map (Int.castRingHom ℝ))) := by
 have hp := crossLC_pascal h (n-2*j-1)
 rw [←coeffSeq_binomial_mul] at hp
 have hh := crossLC_X_pow_mul46 _ hp 3
 simpa only [lowerRowMFFD,Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,
   Polynomial.map_add,Polynomial.map_one,add_comm (1:ℝ[X]) X] using hh

theorem source_horizontal_of_row_crossMFFD (q j : ℕ) (r : Bool) (hj : j ≤ q)
 (h : CrossLC (CoeffSeq ((rowHMFFD (sourceNME9C q r) j).map (Int.castRingHom ℝ))))
 (i : ℕ) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 have hh := crossLC_adjacent (lower_row_crossMFFD (sourceNME9C q r) j h) (i+1)
 simp only [CoeffSeq,show ¬(i:ℤ)<0 by omega,show ¬(i:ℤ)+1<0 by omega,
   show ¬(i:ℤ)+1+1<0 by omega,add_sub_cancel_right,if_false,
   Int.toNat_natCast,Polynomial.coeff_map] at hh
 have h1 : ((i:ℤ)+1).toNat=i+1 := by omega
 have h2 : ((i:ℤ)+1+1).toNat=i+2 := by omega
 rw [h1,h2] at hh
 simp only [←source_lower_rowMFFD q _ j r hj,Int.coe_castRingHom] at hh
 exact_mod_cast hh

def LowerRowShapeMFFD : Prop := ∀ n j : ℕ, 2*j+1 ≤ n →
 CrossLC (CoeffSeq ((rowHMFFD n j).map (Int.castRingHom ℝ)))

theorem source_lower_horizontal_of_shapeMFFD (h : LowerRowShapeMFFD)
 (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 apply source_horizontal_of_row_crossMFFD q j r hj (h _ _ ?_) i
 unfold sourceNME9C
 split_ifs <;> omega

end
end MathGKM.Markov
