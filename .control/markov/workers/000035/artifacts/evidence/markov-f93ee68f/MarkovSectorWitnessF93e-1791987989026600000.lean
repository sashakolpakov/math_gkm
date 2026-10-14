import MarkovRootCertificateF93e
import MarkovPellSum9a72
import MarkovHorizontalB46
/-! Machine-authored f93ee68f. A source horizontal root outside the
120-degree sector. This does NOT reverse any raw coefficient inequality. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 0
set_option maxRecDepth 10000

def sectorListF93e : List ℤ := [231, 18970, 790020, 21380814, 411390021, 5877864648, 63867821040, 535035189040, 3482178704004, 17673238724232, 70013501181456, 216200137267800, 518547977245980, 960132948955632, 1359501339086496, 1451168335625904, 1142452982137950, 640766198533860, 241484804873928, 54673498591404, 5608233007146]
def sectorXF93e : ℚ := (-141153211535284672280908573717185916735764943743485745431652136287565274400606361853446451104310531/5000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
def sectorYF93e : ℚ := (-508769767706914458262821320976240830332893704471957131021490043440911049707955710385385937464388143/10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
def sectorPolyF93e := hornerPolyF93e ℂ sectorListF93e
def sectorCenterF93e : ℂ := (sectorXF93e:ℂ)+(sectorYF93e:ℂ)*Complex.I

theorem sector_residualF93e :
 ‖sectorPolyF93e.eval sectorCenterF93e‖ < (1/10000:ℝ)^20 := by
 have h : |(ratHornerF93e sectorXF93e sectorYF93e sectorListF93e).1|+
   |(ratHornerF93e sectorXF93e sectorYF93e sectorListF93e).2| < (1/10000:ℚ)^20 := by
   norm_num [ratHornerF93e,sectorXF93e,sectorYF93e,sectorListF93e]
 simpa [sectorPolyF93e,sectorCenterF93e] using
   horner_norm_boundF93e sectorListF93e sectorXF93e sectorYF93e ((1/10000)^20) h

#print axioms sector_residualF93e

theorem sector_degreeF93e : sectorPolyF93e.natDegree=20 := by
 unfold sectorPolyF93e sectorListF93e
 simp only [hornerPolyF93e,mul_zero,add_zero]
 compute_degree!

theorem sector_leadingF93e : sectorPolyF93e.leadingCoeff=5608233007146 := by
 rw [Polynomial.leadingCoeff,sector_degreeF93e]
 norm_num [sectorPolyF93e,sectorListF93e,hornerPolyF93e,Polynomial.coeff_X_mul]

theorem sector_root_nearF93e : ∃ z : ℂ,
 sectorPolyF93e.eval z=0 ∧ ‖sectorCenterF93e-z‖<(1/10000:ℝ) := by
 apply exists_root_near_f93e _ _ _ (by norm_num)
 rw [sector_degreeF93e,sector_leadingF93e]
 have hn : ‖(5608233007146:ℂ)‖ = (5608233007146:ℝ) := by norm_num
 rw [hn]
 have h := sector_residualF93e
 norm_num at h ⊢
 linarith

theorem sector_disk_outsideF93e (z : ℂ)
 (h : ‖sectorCenterF93e-z‖<(1/10000:ℝ)) :
 z.re<0 ∧ 3*z.re^2<z.im^2 := by
 have hx := (Complex.abs_re_le_norm (sectorCenterF93e-z)).trans_lt h
 have hy := (Complex.abs_im_le_norm (sectorCenterF93e-z)).trans_lt h
 have hc : (-28331/1000000:ℝ)<z.re ∧ z.re<(-28130/1000000:ℝ) ∧
     (-50977/1000000:ℝ)<z.im ∧ z.im<(-50776/1000000:ℝ) := by
   norm_num [sectorCenterF93e,sectorXF93e,sectorYF93e,abs_lt] at hx hy
   constructor
   · linarith [hx.2]
   constructor
   · linarith [hx.1]
   constructor <;> linarith [hy.1,hy.2]
 rcases hc with ⟨h1,h2,h3,h4⟩
 constructor
 · linarith
 · nlinarith [sq_nonneg (z.re+28331/1000000),
     mul_nonneg (show 0≤z.re+28331/1000000 by linarith)
       (show 0≤-z.re+28331/1000000 by linarith),
     mul_nonneg (show 0≤-z.im-50776/1000000 by linarith)
       (show 0≤-z.im+50776/1000000 by linarith)]

theorem sector_root_outsideF93e : ∃ z : ℂ,
 sectorPolyF93e.eval z=0 ∧ z.re<0 ∧ 3*z.re^2<z.im^2 := by
 obtain ⟨z,hz,hd⟩ := sector_root_nearF93e
 exact ⟨z,hz,sector_disk_outsideF93e z hd⟩

#print axioms sector_root_outsideF93e
end
end MathGKM.Markov
