import MarkovCorrectionDominationM41B
import MarkovMiddleAfterThirdM9DB
/-! Machine-authored 41b38611. A uniform perturbation bound and its exact
raw-source consequence, conditional only on a quantitative template gap. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 4000000
attribute [local irreducible] topShortSumMEB6 middleRawMD02

theorem exponential_linearM41B (c : ℕ) (hc : 5 ≤ c) :
 84*(c+5) ≤ (3:ℕ)^(c+2) := by
 induction c, hc using Nat.le_induction with
 | base => norm_num
 | succ c hc ih =>
   have he : c+1+2=(c+2)+1 := by omega
   rw [he,pow_succ]
   nlinarith

theorem correction_relative_boundM41B (x k c : ℕ) (r : Bool) (hc : 5 ≤ c) :
 4*((c:ℤ)+5)*middleCorrMD02 x k r c ≤ middleTemplateMD02 x k r c := by
 have h := correction_exponential_boundM41B x k c r
 have he : 84*((c:ℤ)+5) ≤ (3:ℤ)^(c+2) := by exact_mod_cast exponential_linearM41B c hc
 have hn : 0 ≤ middleCorrMD02 x k r c := correction_short_nonnegMD02 _ _ _ _
 have hm := mul_le_mul_of_nonneg_right he hn
 nlinarith

theorem template_nonnegM41B (x k c : ℕ) (r : Bool) :
 0 ≤ middleTemplateMD02 x k r c := by
 unfold middleTemplateMD02 topShortSumMEB6
 positivity

theorem positive_perturbationM41B (a b z u v w n : ℤ)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (hz : 0 ≤ z)
 (hu : 0 ≤ u) (hv : 0 ≤ v) (hw : 0 ≤ w) (hn : 1 ≤ n)
 (hgap : n*b^2 ≥ (n+1)*a*z)
 (huB : 4*(n+1)*u ≤ a) (hwB : 4*(n+1)*w ≤ z) :
 (a+u)*(z+w) ≤ (b+v)^2 := by
 have han : 0 ≤ a+u := by omega
 have hzn : 0 ≤ z+w := by omega
 have haB : 4*(n+1)*(a+u) ≤ (4*(n+1)+1)*a := by nlinarith
 have hzB : 4*(n+1)*(z+w) ≤ (4*(n+1)+1)*z := by nlinarith
 have hp := mul_le_mul haB hzB (by positivity) (by positivity)
 have hscale : n*(4*(n+1)+1)^2 ≤ (n+1)*(4*(n+1))^2 := by
   nlinarith [sq_nonneg n]
 have hp' := mul_le_mul_of_nonneg_left hp (by omega : 0 ≤ n)
 have hg := mul_le_mul_of_nonneg_left hgap (sq_nonneg (4*(n+1)))
 have hs := mul_le_mul_of_nonneg_right hscale (mul_nonneg ha hz)
 have hprod : 0 < n*(4*(n+1))^2 := by positivity
 have hc : n*(4*(n+1))^2*((a+u)*(z+w)) ≤ n*(4*(n+1))^2*b^2 := by
   nlinarith only [hp',hg,hs]
 have hbase := (mul_le_mul_left hprod).mp hc
 nlinarith [mul_nonneg hb hv,sq_nonneg v]

def TemplateStrongM41B : Prop := ∀ x k c r, 5 ≤ c → 3 ≤ k →
 c < middleConeBoundM6C0 k r →
 ((c:ℤ)+4)*middleTemplateMD02 x k r (c+1)^2 ≥
 ((c:ℤ)+5)*middleTemplateMD02 x k r c*middleTemplateMD02 x k r (c+2)

theorem middle_gap_of_template_strongM41B (x k c : ℕ) (r : Bool) (hc : 5 ≤ c)
 (h : ((c:ℤ)+4)*middleTemplateMD02 x k r (c+1)^2 ≥
 ((c:ℤ)+5)*middleTemplateMD02 x k r c*middleTemplateMD02 x k r (c+2)) :
 0 ≤ middleGapMD02 r c x k := by
 have hu := correction_relative_boundM41B x k c r hc
 have hw := correction_relative_boundM41B x k (c+2) r (by omega)
 have hun : 0 ≤ middleCorrMD02 x k r c := correction_short_nonnegMD02 _ _ _ _
 have hvn : 0 ≤ middleCorrMD02 x k r (c+1) := correction_short_nonnegMD02 _ _ _ _
 have hwn : 0 ≤ middleCorrMD02 x k r (c+2) := correction_short_nonnegMD02 _ _ _ _
 have hw' : 4*((c:ℤ)+5)*middleCorrMD02 x k r (c+2) ≤ middleTemplateMD02 x k r (c+2) := by
   push_cast at hw
   nlinarith
 have hh := positive_perturbationM41B
   (middleTemplateMD02 x k r c) (middleTemplateMD02 x k r (c+1))
   (middleTemplateMD02 x k r (c+2)) (middleCorrMD02 x k r c)
   (middleCorrMD02 x k r (c+1)) (middleCorrMD02 x k r (c+2)) ((c:ℤ)+4)
   (template_nonnegM41B _ _ _ _) (template_nonnegM41B _ _ _ _) (template_nonnegM41B _ _ _ _)
   hun hvn hwn (by omega) (by convert h using 1 <;> ring)
   (by convert hu using 1 <;> ring) (by convert hw' using 1 <;> ring)
 unfold middleGapMD02 middleRawMD02
 change 0 ≤ (middleTemplateMD02 x k r (c+1)+middleCorrMD02 x k r (c+1))^2-
   (middleTemplateMD02 x k r c+middleCorrMD02 x k r c)*
   (middleTemplateMD02 x k r (c+2)+middleCorrMD02 x k r (c+2))
 exact sub_nonneg.mpr hh

theorem middle_after_third_of_template_strongM41B (h : TemplateStrongM41B) :
 MiddleAfterThirdM9DB := by
 intro r c x k hc hk hb
 exact middle_gap_of_template_strongM41B x k c r hc (h x k c r hc hk hb)

theorem root_of_template_strongM41B (h : TemplateStrongM41B)
 (ht : ThreeOutsideMiddleMD02) (ho : OtherFourM9E2) : Conjecture63 := by
 exact root_iff_after_thirdM9DB.mpr ⟨middle_after_third_of_template_strongM41B h,ht,ho⟩

end
end MathGKM.Markov
