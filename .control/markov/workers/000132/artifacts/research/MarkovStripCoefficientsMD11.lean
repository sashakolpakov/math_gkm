import MarkovStripChooseMD11
import MarkovStripSourceMD11
/-! Machine-authored d11e335e. Zero-inclusive common-binomial fourth-row bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000

theorem strip_quartic_scaledMD11 (k l : ℕ) (hl : 3 ≤ l) (hN : 7 ≤ k+l) (a : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*
 (((1+(X:ℝ[X]))^(k+l-7)*stripQuarticMD11 a (k+l+2)).coeff k)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*stripIMD11 a k l := by
 have h := quartic_allMD11 k (l-3) (by omega)
   (h4c3M511 a (k+l+2) 0 0 0 0 0 0)
   (h4c4M511 a (k+l+2) 0 0 0 0 0 0)
   (h4c5M511 a (k+l+2) 0 0 0 0 0 0)
   (h4c6M511 a (k+l+2) 0 0 0 0 0 0)
   (h4c7M511 a (k+l+2) 0 0 0 0 0 0)
 rw [show k+(l-3)=k+l-3 by omega,show k+l-3-4=k+l-7 by omega] at h
 push_cast [Nat.cast_sub hl] at h
 have hb := next_coeff_zero7955 k l (by omega)
 rw [Polynomial.coeff_one_add_X_pow] at hb
 change ((k:ℝ)+((l:ℝ)-3))*((k:ℝ)+((l:ℝ)-3)-1)*((k:ℝ)+((l:ℝ)-3)-2)*((k:ℝ)+((l:ℝ)-3)-3)*
   (((1+(X:ℝ[X]))^(k+l-7)*stripQuarticMD11 a (k+l+2)).coeff k)=_ at h
 unfold stripIMD11
 linear_combination ((k:ℝ)+l)*(k+l-1)*(k+l-2)*h+
   (h4c3M511 a (k+l+2) 0 0 0 0 0 0*(l-3)*(l-4)*(l-5)*(l-6)+
    h4c4M511 a (k+l+2) 0 0 0 0 0 0*k*(l-3)*(l-4)*(l-5)+
    h4c5M511 a (k+l+2) 0 0 0 0 0 0*k*(k-1)*(l-3)*(l-4)+
    h4c6M511 a (k+l+2) 0 0 0 0 0 0*k*(k-1)*(k-2)*(l-3)+
    h4c7M511 a (k+l+2) 0 0 0 0 0 0*k*(k-1)*(k-2)*(k-3))*hb
end
end MathGKM.Markov
