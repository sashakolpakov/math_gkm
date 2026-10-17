import MarkovTopFourthMomentCertificateM731
/-! Machine-authored 73199834. A conditional finite-sum consequence of the
fourth-moment certificate. Its moment and generator hypotheses are explicit;
no actual source-family conclusion is asserted in this module. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 10000000

theorem fourth_point_certificateM731 (a m H k : ℝ) :
 fourthMomentDenM731 a*fourthDeltaM731 a m H*(4*a+7)*steinScalarM208 a H k (m-k)+
 fourthMomentDenM731 a*(2*(a+2)*fourthDeltaM731 a m H+steinCpM208 a m H)*steinLM208 a m H k+
 steinCpM208 a m H*(8*a+14)*(fourthMomentDenM731 a*(k-m/2)^4-fourthMomentNumM731 a m)=
 fourthCertificateM731 a m H := by
 unfold fourthCertificateM731 fourthCenterM731 fourthDeltaM731 fourthMomentDenM731 fourthMomentNumM731 steinScalarM208 steinLM208 steinBM208 steinDM208 steinEM208 steinC0M208 steinCpM208
 ring

theorem fourth_sum_positive_of_controlM731 (a H : ℝ) (m : ℕ) (w : ℕ → ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (ham : 4*((m:ℝ)-2) ≤ (a-3)^2)
 (hH : 6*a+m+8 ≤ 2*H)
 (hD : 0 < fourthDeltaM731 a m H) (hC : 0 ≤ steinCpM208 a m H)
 (hMass : 0 < ∑ k ∈ range (m+1), w k)
 (hL : (∑ k ∈ range (m+1), w k*steinLM208 a m H k) ≤ 0)
 (h4 : (∑ k ∈ range (m+1), w k*(fourthMomentDenM731 a*((k:ℝ)-(m:ℝ)/2)^4-
   fourthMomentNumM731 a m)) ≤ 0) :
 0 < ∑ k ∈ range (m+1), w k*steinScalarM208 a H k ((m:ℝ)-k) := by
 have hden : 0 < fourthMomentDenM731 a := by
   unfold fourthMomentDenM731
   have : 0 < a := by linarith
   positivity
 have hcoef : 0 ≤ fourthMomentDenM731 a*(2*(a+2)*fourthDeltaM731 a m H+steinCpM208 a m H) := by
   have : 0 < a+2 := by linarith
   positivity
 have hcoef4 : 0 ≤ steinCpM208 a m H*(8*a+14) := by
   have : 0 < 8*a+14 := by linarith
   exact mul_nonneg hC this.le
 have hj := fourth_certificate_positiveM731 a m H ha (by exact_mod_cast hm) ham hH
 have hs := sum_congr (s₁:=range (m+1)) rfl (fun k _ =>
   congrArg (fun v : ℝ => w k*v) (fourth_point_certificateM731 a m H k))
 have hmul (c : ℝ) (f : ℕ → ℝ) :
   (∑ k ∈ range (m+1), w k*(c*f k))=c*∑ k ∈ range (m+1), w k*f k := by
   rw [mul_sum]
   apply sum_congr rfl
   intro k hk
   ring
 simp only [mul_add,sum_add_distrib] at hs
 rw [hmul,hmul,hmul,←sum_mul] at hs
 have hl := mul_nonpos_of_nonneg_of_nonpos hcoef hL
 have hfour := mul_nonpos_of_nonneg_of_nonpos hcoef4 h4
 have hp := mul_pos hMass hj
 have hscaled : 0 < fourthMomentDenM731 a*fourthDeltaM731 a m H*(4*a+7)*
   (∑ k ∈ range (m+1), w k*steinScalarM208 a H k ((m:ℝ)-k)) := by
   linarith only [hs,hl,hfour,hp]
 exact (mul_pos_iff_of_pos_left (mul_pos (mul_pos hden hD) (by linarith))).mp hscaled

end
end MathGKM.Markov
