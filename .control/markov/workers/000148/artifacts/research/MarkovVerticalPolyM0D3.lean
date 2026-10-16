import MarkovBinomialPolyM0D3
import MarkovVerticalRegionsM0D3
/-! Machine-authored 0d346fa7. Exact polynomial expressions for the two
coefficient regions. These are raw-coefficient identities, not sign claims. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def lowerPolynomialM0D3 (i : ℕ) (x y : ℚ) : ℚ :=
 ∑ h∈range (i-1), choosePolyM0D3 (2*y) h*((2*i-2-h).choose i:ℚ)*
  (choosePolyM0D3 (x+i+1) (2*i-1-h)+choosePolyM0D3 (x+i) (2*i-1-h))

def upperPolynomialM0D3 (i : ℕ) (x y : ℚ) : ℚ :=
 ∑ h∈range (i+1), choosePolyM0D3 (2*y+h-1) h*((2*i-2-h).choose (i-h):ℚ)*
  (choosePolyM0D3 (x+(i-h:ℕ)+1) (2*i-1-h)+
   choosePolyM0D3 (x+(i-h:ℕ)) (2*i-1-h))

theorem lower_polynomial_eqM0D3 (i j d : ℕ) :
 (lowerValM58E j d i:ℚ)=lowerPolynomialM0D3 i j d := by
 unfold lowerValM58E lowerPolynomialM0D3
 push_cast
 apply sum_congr rfl
 intro h hh
 simp only [choose_poly_natM0D3,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_add,Nat.cast_one]

theorem upper_polynomial_eqM0D3 (i N d : ℕ) (hi : 1 ≤ i) (hd : 1 ≤ d) :
 (upperValM2B3 N d i:ℚ)=upperPolynomialM0D3 i N d := by
 unfold upperValM2B3 upperPolynomialM0D3
 rw [if_neg (by omega : i≠0)]
 push_cast
 apply sum_congr rfl
 intro h hh
 have hh' : h ≤ i := by simpa using mem_range.mp hh
 have he : N+i-h=N+(i-h) := by omega
 rw [he]
 simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_one]
 rw [Nat.cast_sub (by omega : 1 ≤ 2*d+h)]
 push_cast
 rfl

end
end MathGKM.Markov
