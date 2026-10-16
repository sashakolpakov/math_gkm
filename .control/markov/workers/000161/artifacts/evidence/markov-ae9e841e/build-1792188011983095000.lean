import MarkovBinomialLiftMAE9
import MarkovBinomialTableM295
/-! Machine-authored ae9e841e. Uniform polynomial form for each raw lower
column, derived by Vandermonde and a double finite sum. Zero cases retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000

def lowColumnMAE9 (n x : ℚ) (t : ℕ) : ℚ :=
 ∑ m ∈ range (t+1), choosePolyM0D3 (n-2*x-1) (t-m)*
   ((t+m+3).choose m:ℚ)*
   (choosePolyM0D3 (x+t+3) (t+m+3)+4*choosePolyM0D3 (x+t+4) (t+m+5))

theorem source_column_polynomialMAE9 (q j t : ℕ) (r : Bool) (hj : j ≤ q) :
 (threeRawM9E2 q r (t+3) j:ℚ)=lowColumnMAE9 (sourceNME9C q r) j t := by
 rw [source_lower_liftMAE9 q j t r hj]
 have hn : 2*j+1 ≤ sourceNME9C q r := by unfold sourceNME9C; split_ifs <;> omega
 unfold lowColumnMAE9 liftTermMAE9
 push_cast
 apply sum_congr rfl
 intro m hm
 simp only [choose_poly_natM0D3,Nat.cast_sub (by omega : 1 ≤ sourceNME9C q r-2*j),
   Nat.cast_sub (by omega : 2*j ≤ sourceNME9C q r),Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_add,Nat.cast_one]
 rw [show (t:ℚ)+j+3=j+t+3 by ring,show (t:ℚ)+j+4=j+t+4 by ring]

end
end MathGKM.Markov
