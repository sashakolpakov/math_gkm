import MarkovResidualLowM657
/-! Machine-authored 6576ccc5. Scalar certificate for the first augmented
residual inequality. All quantities encode ordinary coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000

def correctionZeroM657 (k : ℚ) (r : Bool) : ℚ :=
 if r then 2*(k+1)*(k+2)^2 else 2*(k+1)^2*(k+2)
def correctionOneM657 (d k : ℚ) (r : Bool) : ℚ :=
 k*(k+1)*(k+2)*(5*(3*k+(if r then 5 else 1))*d+
   3*(3*k+(if r then 7 else 2))*(k+3))/30
def correctionTwoM657 (d k : ℚ) (r : Bool) : ℚ :=
 let q := d+2*k+(if r then 2 else 1)
 k*(k-1)*(k+1)*(k+2)*
 (if r then (84+63*k)*q^2+(252-105*k-168*k^2)*q+120-298*k-4*k^2+114*k^3
 else (-21+63*k)*q^2+(21+273*k-168*k^2)*q+120+136*k-326*k^2+114*k^3)/1260

theorem correction_zeroM657 (d k : ℕ) (r : Bool) :
 ((bandAtM139 d k r).coeff 0:ℚ)=correctionZeroM657 k r := by
 rw [bandAtM139,band_Q_constantM139]
 cases r <;> simp [correctionZeroM657]

theorem correction_oneM657 (d k : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 ((bandAtM139 d k r).coeff 1:ℚ)=correctionOneM657 d k r := by
 have h := congrArg (fun z : ℤ => (z:ℚ)) (band_Q_linear_positive_formM139 d k r hq)
 cases r <;> simp only [correctionOneM657,bandAtM139,Bool.false_eq_true,if_false,if_true] at *
   <;> push_cast at h <;> linarith

theorem correction_twoM657 (d k : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 ((bandAtM139 d k r).coeff 2:ℚ)=correctionTwoM657 d k r := by
 have hn : 2*((d+2*k+(if r then 2 else 1))+k+1)+1 ≤
     sourceNME9C (d+2*k+(if r then 2 else 1)) r := by
   cases r <;> simp [sourceNME9C] <;> omega
 have h := congrArg (fun z : ℤ => (z:ℚ)) (band_Q_quadraticM139 _ k r hq hn)
 cases r <;> simp only [correctionTwoM657,bandQuadraticM139,bandAtM139,
   Bool.false_eq_true,if_false,if_true] at * <;> push_cast at h <;> linarith

theorem residual_first_certificateM657 (d k : ℚ) (r : Bool) (hd : 0 ≤ d) (hk : 0 ≤ k) :
 correctionZeroM657 k r*(correctionTwoM657 d k r+
   lowerOneM657 d (d+3*k+(if r then 3 else 2))) ≤
 (correctionOneM657 d k r+lowerZeroM657 (d+3*k+(if r then 3 else 2)))^2 := by
 apply sub_nonneg.mp
 cases r <;> simp only [correctionZeroM657,correctionOneM657,correctionTwoM657,
   lowerZeroM657,lowerOneM657,Bool.false_eq_true,if_false,if_true,
   binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,
   binomial_poly_6M295,binomial_poly_7M295]
   <;> ring_nf <;> positivity

end
end MathGKM.Markov
