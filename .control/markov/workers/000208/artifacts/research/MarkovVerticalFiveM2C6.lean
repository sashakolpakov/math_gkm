import MarkovVerticalSourceM9C28
/-! Machine-authored request 2c6e5ef0. Complete raw vertical column five,
using the inherited universal chamber bridges and new kernel sign checks.
This is a partial result, not Conjecture63. -/
namespace MathGKM.Markov
set_option maxHeartbeats 600000000
set_option maxRecDepth 1000000
set_option compiler.extract_closed false

theorem vertical_signs_oneM2C6 : VerticalSignsM9C28 1 := by
 constructor
 · intro u r
   cases u <;> cases r <;> decide +kernel
 · intro e s r
   cases e <;> cases s <;> cases r <;> decide +kernel

theorem source_five_verticalM2C6 (q j : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r 5 j*threeRawM9E2 q r 5 (j+2) ≤
 threeRawM9E2 q r 5 (j+1)^2 :=
 source_vertical_of_massM9C28 1 q j r hq
   (vertical_signs_to_massM9C28 1 vertical_signs_oneM2C6)

theorem path_five_verticalM2C6 (path : List Bool) (ha : (frame path).mid.a=3) (j : ℕ) :
 coeff (frame path).mid.p 5 j*coeff (frame path).mid.p 5 (j+2) ≤
 coeff (frame path).mid.p 5 (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 simp only [hp]
 exact source_five_verticalM2C6 q j r hq

end MathGKM.Markov
