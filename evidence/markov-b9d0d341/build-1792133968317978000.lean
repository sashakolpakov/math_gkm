import MarkovStripSourceMB9D
import MarkovStripGapMB9D
/-! Machine-authored b9d0d341. Raw common-binomial identities. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem strip_choose_downMB9D (k l : ℕ) (hN : 1 ≤ k+l) :
 ((k:ℝ)+l)*((k+l-1).choose k:ℝ)=((k+l).choose k:ℝ)*l := by
 have h := Nat.choose_mul_succ_eq (k+l-1) k
 rw [Nat.sub_add_cancel hN,Nat.add_sub_cancel_left] at h
 have hR := congrArg (fun z : ℕ => (z:ℝ)) h
 push_cast at hR
 nlinarith only [hR]

theorem strip_linear_scaledMB9D (k l : ℕ) (hN : 1 ≤ k+l) (A B : ℝ) :
 ((k:ℝ)+l)*(linearRow77 (k+l-1) A B).coeff k=
 ((k+l).choose k:ℝ)*(A*l+B*k) := by
 have h0 : ((k:ℝ)+l)*((1+(X:ℝ[X]))^(k+l-1)).coeff k=
   ((k+l).choose k:ℝ)*l := by
   rw [Polynomial.coeff_one_add_X_pow]; exact strip_choose_downMB9D k l hN
 have h1 : ((k:ℝ)+l)*((1+(X:ℝ[X]))^(k+l-1)*X).coeff k=
   ((k+l).choose k:ℝ)*k := by
   cases k with
   | zero => simp
   | succ k =>
     rw [Polynomial.coeff_mul_X,Polynomial.coeff_one_add_X_pow]
     have h := Nat.choose_mul (n:=k+1+l) (k:=k+1) (s:=1) (by omega)
     simp only [Nat.choose_one_right,Nat.add_sub_cancel_right] at h
     have hR := congrArg (fun z : ℕ => (z:ℝ)) h
     push_cast at hR
     nlinarith only [hR]
 have he : linearRow77 (k+l-1) A B=
   C A*(1+X)^(k+l-1)+C B*((1+X)^(k+l-1)*X) := by unfold linearRow77; ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination A*h0+B*h1

theorem strip_quad_scaledMB9D (k l : ℕ) (hl : 2 ≤ l) (hN : 5 ≤ k+l) (a : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*
 (((1+(X:ℝ[X]))^(k+l-3)*stripQuadMB9D a (k+l+2)).coeff k)=
 ((k+l).choose k:ℝ)*l*stripJMB9D a k l := by
 have h0 := top_coeff_zero58 k (l-1) (by omega)
 have h1 := top_coeff_one58 k (l-1) (by omega)
 have h2 := top_coeff_two58 k (l-1) (by omega)
 rw [show k+(l-1)=k+l-1 by omega,show k+l-1-2=k+l-3 by omega] at h0 h1 h2
 push_cast [Nat.cast_sub (show 1 ≤ l by omega)] at h0 h1 h2
 have hb := strip_choose_downMB9D k l (by omega)
 have he : (1+(X:ℝ[X]))^(k+l-3)*stripQuadMB9D a (k+l+2)=
   C (9*a^2-5*a+2)*(1+X)^(k+l-3)+
   C (6*a^2+6*a*(k+l+2)-16*a+4)*((1+X)^(k+l-3)*X)+
   C ((a+k+l+1)*(a+k+l))*((1+X)^(k+l-3)*X^2) := by
   simp only [stripQuadMB9D,map_add,map_mul,map_sub,map_pow,map_ofNat,map_one]
   ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul]
 unfold stripJMB9D
 linear_combination
   ((k:ℝ)+l)*((9*a^2-5*a+2)*h0+(6*a^2+6*a*(k+l+2)-16*a+4)*h1+
     ((a+k+l+1)*(a+k+l))*h2)+
   ((9*a^2-5*a+2)*(l-1)*(l-2)+(6*a^2+6*a*(k+l+2)-16*a+4)*k*(l-1)+
     ((a+k+l+1)*(a+k+l))*k*(k-1))*hb

theorem strip_cubic_scaledMB9D (k l : ℕ) (hl : 2 ≤ l) (hN : 5 ≤ k+l) (a : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*
 (((1+(X:ℝ[X]))^(k+l-5)*stripCubicMB9D a (k+l+2)).coeff k)=
 ((k+l).choose k:ℝ)*l*(l-1)*stripHMB9D a k l := by
 have h := cubic_falling_coeff340 k (l-2) (by omega)
   (h3c2M13D a (k+l+2) 0) (h3c3M13D a (k+l+2))
   (h3c4M13D a (k+l+2)) (h3c5M13D a (k+l+2))
 rw [show k+(l-2)=k+l-2 by omega,show k+l-2-3=k+l-5 by omega] at h
 push_cast [Nat.cast_sub hl] at h
 have hb := top_coeff_zero58 k l (by omega)
 rw [Polynomial.coeff_one_add_X_pow] at hb
 have he : stripCubicMB9D a (k+l+2)=CubicPoly5a7
   (h3c2M13D a (k+l+2) 0) (h3c3M13D a (k+l+2))
   (h3c4M13D a (k+l+2)) (h3c5M13D a (k+l+2)) := by
   unfold stripCubicMB9D CubicPoly5a7; ring
 rw [he]
 unfold stripHMB9D h3c2M13D h3c3M13D h3c4M13D h3c5M13D at h ⊢
 linear_combination ((k:ℝ)+l)*(k+l-1)*h+
   ((27*a^3-18*a^2+21*a-6)*(l-2)*(l-3)*(l-4)+
   (27*a^3+27*a^2*(k+l+2)-114*a^2+3*a*(k+l+2)+33*a+6*(k+l+2)-18)*k*(l-2)*(l-3)+
   (9*a^3+18*a^2*(k+l+2)-54*a^2+9*a*(k+l+2)^2-51*a*(k+l+2)+87*a+3*(k+l+2)^2-3*(k+l+2)-18)*k*(k-1)*(l-2)+
   (a+k+l+1)*(a+k+l)*(a+k+l-1)*k*(k-1)*(k-2))*hb

end
end MathGKM.Markov
