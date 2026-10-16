import MarkovFifthIdentityMFFD
import MarkovRowTransferMFFD
import MarkovFifthSmallMFFD
/-! Machine-authored ffd747f5. Complete horizontal j=5 for every numerator-three
source, with unbounded column indices, small parameters and zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem fifth_residual_crossMFFD (n : ℕ) (hn : 11 ≤ n) :
 CrossLC (CoeffSeq ((rowHMFFD n 5).map (Int.castRingHom ℝ))) := by
 rw [fifth_residual_mapMFFD n hn]
 apply fifth_crossMFFD
 have h : (11:ℝ) ≤ n := by exact_mod_cast hn
 linarith

theorem three_horizontal_fifthMFFD (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r i 5*threeRawM9E2 q r (i+2) 5 ≤ threeRawM9E2 q r (i+1) 5^2 := by
 by_cases hq5 : 5 ≤ q
 · apply source_horizontal_of_row_crossMFFD q 5 r hq5
     (fifth_residual_crossMFFD _ ?_) i
   unfold sourceNME9C
   split_ifs <;> omega
 · exact fifth_small_allMFFD q i r hq (by omega)

theorem source_three_horizontal_fifthMFFD (path : List Bool)
 (ha : (frame path).mid.a=3) (i : ℕ) :
 coeff (frame path).mid.p i 5*coeff (frame path).mid.p (i+2) 5 ≤
 coeff (frame path).mid.p (i+1) 5^2 := by
 obtain ⟨q,r,hq,_,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact three_horizontal_fifthMFFD q i r hq

end
end MathGKM.Markov
