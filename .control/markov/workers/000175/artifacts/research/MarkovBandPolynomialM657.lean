import MarkovBandOutputM657
import MarkovColumnPolynomialMAE9
/-! Machine-authored 6576ccc5. Polynomial-in-parameters coefficients for
every fixed source column in the complete correction band. The identity is
universal in the column; no finite interpolation is used in its proof. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def correctionPolyM657 (d k : ℚ) (t : ℕ) (r : Bool) : ℚ :=
 4*∑ m ∈ range (t+1), choosePolyM0D3 d (t-m)*((t+m+1).choose m:ℚ)*
   ((if r then 2 else 1)*choosePolyM0D3 (k+t+3) (t+m+3)+
    (if r then 1 else 2)*choosePolyM0D3 (k+t+2) (t+m+3))

theorem correction_lift_polynomialM657 (d k t : ℕ) (r : Bool) :
 (correctionLiftM657 d k t r:ℚ)=correctionPolyM657 d k t r := by
 unfold correctionLiftM657 correctionPolyM657
 push_cast
 congr 1
 apply sum_congr rfl
 intro m hm
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,Int.cast_ofNat,
   Int.cast_one,choose_poly_natM0D3,Nat.cast_add,Nat.cast_ofNat]

theorem lift_output_polynomialM657 (d j t : ℕ) :
 (liftOutputMAE9 d j t:ℚ)=lowColumnMAE9 (2*(j:ℚ)+1+d) j t := by
 unfold liftOutputMAE9 liftTermMAE9 lowColumnMAE9
 push_cast
 apply sum_congr rfl
 intro m hm
 simp only [choose_poly_natM0D3,Nat.cast_add,Nat.cast_ofNat]
 rw [show 2*(j:ℚ)+1+d-2*j-1=d by ring]
 rw [show (t:ℚ)+j+3=j+t+3 by ring,show (t:ℚ)+j+4=j+t+4 by ring]
 ring

def bandColumnM657 (d k : ℚ) (t : ℕ) (r : Bool) : ℚ :=
 let j := d+3*k+(if r then 3 else 2)
 lowColumnMAE9 (2*j+1+d) j t+correctionPolyM657 d k (t+1) r

theorem source_band_polynomialM657 (d k t : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 (threeRawM9E2 (d+2*k+(if r then 2 else 1)) r (t+3)
   ((d+2*k+(if r then 2 else 1))+k+1):ℚ)=bandColumnM657 d k t r := by
 have hn : 2*((d+2*k+(if r then 2 else 1))+k+1)+1 ≤
     sourceNME9C (d+2*k+(if r then 2 else 1)) r := by
   cases r <;> simp [sourceNME9C] <;> omega
 have he : bandExponentM139 (d+2*k+(if r then 2 else 1)) k r=d := by
   cases r <;> simp [band_exponent_falseM139,band_exponent_trueM139] <;> omega
 rw [source_band_liftM657 _ k t r hq hn,he,Int.cast_add,
   lift_output_polynomialM657,correction_lift_polynomialM657]
 unfold bandColumnM657
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true,
   Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one]
 all_goals congr 2 <;> ring

end
end MathGKM.Markov
