import MarkovStripGeneralSourceMCE8
import MarkovStripGeneralChooseMCE8
import MarkovStripGeneralGapMCE8
/-! Machine-authored ce882be3. Full source-statistic coefficient scaling. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false

theorem strip_second_scaledMCE8 (k l : ℕ) (hl : 2 ≤ l) (hN : 5 ≤ k+l) (a q : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+1)*
 (((1+(X:ℝ[X]))^(k+l-3)*stripSecondSeedMCE8 a (k+l+2) q).coeff (k+1))=
 ((k+l).choose k:ℝ)*l*stripGeneralJMCE8 a k l q := by
 have he : (1+(X:ℝ[X]))^(k+l-3)*stripSecondSeedMCE8 a (k+l+2) q=
   C (8*q)*(1+X)^(k+l-3)+((1+X)^(k+l-3)*stripQuadMB9D a (k+l+2))*X := by
   unfold stripSecondSeedMCE8; ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_mul_X,Polynomial.coeff_one_add_X_pow]
 have h := strip_quad_scaledMB9D k l hl hN a
 have hc := strip_choose_correction_threeMCE8 k l (by omega)
 unfold stripGeneralJMCE8
 linear_combination ((k:ℝ)+1)*h+8*q*hc

theorem strip_third_scaledMCE8 (k l : ℕ) (hl : 2 ≤ l) (hN : 5 ≤ k+l) (a q t u : ℝ) :
 ((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*(k+2)*
 (((1+(X:ℝ[X]))^(k+l-5)*h3seedM13D a (k+l+2) q t u).coeff (k+2))=
 ((k+l).choose k:ℝ)*l*(l-1)*stripGeneralHMCE8 a k l q t u := by
 have he : (1+(X:ℝ[X]))^(k+l-5)*h3seedM13D a (k+l+2) q t u=
   C (24*u)*(1+X)^(k+l-5)+C (24*t+(72*a-120)*q)*((1+X)^(k+l-5)*X)+
   C (24*(a+k+l-5)*q)*((1+X)^(k+l-5)*X^2)+
   ((1+X)^(k+l-5)*stripCubicMB9D a (k+l+2))*X^2 := by
   simp only [h3seedM13D,stripCubicMB9D,h3c0M13D,h3c1M13D,h3c2M13D,
     map_add,map_mul,map_sub,map_pow,map_ofNat,map_one,map_zero]
   ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_mul_X,
   Polynomial.coeff_mul_X_pow,Polynomial.coeff_one_add_X_pow]
 have h := strip_cubic_scaledMB9D k l hl hN a
 have h0 := strip_choose_fiveMCE8 (k+l) k hN
 push_cast at h0
 have h1 := strip_choose_correctionMCE8 k l hN
 have h2 := strip_choose_correction_twoMCE8 k l hN
 unfold stripGeneralHMCE8
 linear_combination ((k:ℝ)+1)*(k+2)*h+
   24*(a+k+l-5)*q*(k+1)*(k+2)*h0+(24*t+(72*a-120)*q)*(k+2)*h1+24*u*h2
end
end MathGKM.Markov
