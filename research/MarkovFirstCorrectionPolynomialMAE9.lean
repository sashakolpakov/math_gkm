import MarkovColumnPolynomialMAE9
import MarkovFirstRowM1BB
/-! Machine-authored ae9e841e. Polynomial-plus-binomial formula on the first
correction row for q>=2. The exceptional q=1 formula remains inherited and
is not discarded or replaced by a truncated negative binomial parameter. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000

theorem lower_column_polynomialMAE9 (n j t : ℕ) (hn : 2*j+1 ≤ n) :
 (lowerRawME9C n (t+3) j:ℚ)=lowColumnMAE9 n j t := by
 rw [←lower_row_formulaMFFD n j hn (t+3) j (by omega)]
 have h := lower_row_liftMAE9 (n-2*j-1) j t
 rw [show 2*j+1+(n-2*j-1)=n by omega] at h
 rw [h]
 unfold lowColumnMAE9 liftTermMAE9
 push_cast
 apply sum_congr rfl
 intro m hm
 simp only [choose_poly_natM0D3,Nat.cast_sub (by omega : 1 ≤ n-2*j),
   Nat.cast_sub (by omega : 2*j ≤ n),Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_add,Nat.cast_one]
 rw [show (t:ℚ)+j+3=j+t+3 by ring,show (t:ℚ)+j+4=j+t+4 by ring]
 ring

theorem first_correction_polynomialMAE9 (q t : ℕ) (r : Bool) (hq : 2 ≤ q) :
 (firstCorrectionM1BB q r (t+3):ℚ)=
   if r then 8*choosePolyM0D3 ((q:ℚ)-2) (t+1)
   else 4*choosePolyM0D3 ((q:ℚ)-1) (t+1) := by
 unfold firstCorrectionM1BB
 simp only [show 2 ≤ t+3 by omega,if_true,show q≠1 by omega,if_false,
   show t+3-2=t+1 by omega]
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,Int.cast_mul,
   Int.cast_ofNat,Int.cast_natCast,choose_poly_natM0D3,
   Nat.cast_sub (by omega : 2 ≤ q),Nat.cast_sub (by omega : 1 ≤ q),Nat.cast_ofNat,Nat.cast_one]

theorem source_first_correction_polynomialMAE9 (q t : ℕ) (r : Bool) (hq : 2 ≤ q) :
 (threeRawM9E2 q r (t+3) (q+1):ℚ)=
 lowColumnMAE9 (sourceNME9C q r) (q+1) t+
   (if r then 8*choosePolyM0D3 ((q:ℚ)-2) (t+1)
   else 4*choosePolyM0D3 ((q:ℚ)-1) (t+1)) := by
 rw [first_row_sourceM1BB q (t+3) r (by omega),Int.cast_add,
   lower_column_polynomialMAE9 _ _ _ ?_,first_correction_polynomialMAE9 q t r hq]
 · simp only [Nat.cast_add,Nat.cast_one]
 · unfold sourceNME9C
   split_ifs <;> omega

end
end MathGKM.Markov
