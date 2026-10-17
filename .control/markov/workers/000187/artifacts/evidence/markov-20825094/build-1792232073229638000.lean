import MarkovTopWeightedBetaMeanMCA9
/-! Machine-authored 20825094. Positive endpoint margin at m=r.
The comparison-mass and endpoint-sum attachment are separate statements. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 14000000
set_option maxRecDepth 20000
def firstCentralDenM208 (a : ℤ) : ℤ :=
 (2*a)*(2*a+1)*(2*a+2)*(2*a+3)*(2*a+4)*(2*a+5)
def firstCentralMeanM208 (a r H : ℤ) : ℤ :=
 2*a^2*(a+1)*r*(r-1)*betaWeightedPolynomialMCA9 a r r H
def firstCentralMarginM208 (a r H : ℤ) : ℤ :=
 2*firstCentralMeanM208 a r H*(r+1)+
 r*betaScalarMCA9 a H 0 r*firstCentralDenM208 a
def firstCentralReducedM208 (a r H : ℤ) : ℤ :=
64*r
  -720*r*H
  -400*r*H^2
  -592*r^2
  -1120*r^2*H
  +640*r^2*H^2
  -592*r^3
  +640*r^3*H
  +320*r^3*H^2
  +128*r^4
  +320*r^4*H
  +64*r^5
  +128*a
  +640*a*H^2
  +336*a*r
  -1688*a*r*H
  -840*a*r*H^2
  -2152*a*r^2
  -2928*a*r^2*H
  +1856*a*r^2*H^2
  -1816*a*r^3
  +1856*a*r^3*H
  +528*a*r^3*H^2
  +464*a*r^4
  +288*a*r^4*H
  -80*a*r^5
  +160*a^2
  -480*a^2*H
  +1856*a^2*H^2
  +56*a^2*r
  -40*a^2*r*H
  -592*a^2*r*H^2
  -1856*a^2*r^2
  -2432*a^2*r^2*H
  +1600*a^2*r^2*H^2
  -1688*a^2*r^3
  +880*a^2*r^3*H
  +360*a^2*r^3*H^2
  -88*a^2*r^4
  +64*a^2*r^4*H
  -152*a^2*r^5
  -48*a^3
  -592*a^3*H
  +1600*a^3*H^2
  -224*a^3*r
  +1128*a^3*r*H
  -168*a^3*r*H^2
  -448*a^3*r^2
  -816*a^3*r^2*H
  +544*a^3*r^2*H^2
  -688*a^3*r^3
  -344*a^3*r^3*H
  +120*a^3*r^3*H^2
  -480*a^3*r^4
  -64*a^3*r^5
  -112*a^4
  -240*a^4*H
  +544*a^4*H^2
  -120*a^4*r
  +568*a^4*r*H
  -16*a^4*r*H^2
  +72*a^4*r^2
  -96*a^4*r^2*H
  +64*a^4*r^2*H^2
  -144*a^4*r^3
  -296*a^4*r^3*H
  +16*a^4*r^3*H^2
  -232*a^4*r^4
  -8*a^4*r^5
  -32*a^5
  -32*a^5*H
  +64*a^5*H^2
  -16*a^5*r
  +80*a^5*r*H
  +32*a^5*r^2
  -16*a^5*r^3
  -48*a^5*r^3*H
  -32*a^5*r^4
theorem first_central_margin_identityM208 (a r H : ℤ) :
 firstCentralMarginM208 a r H=a^2*(a+1)*r*(r-1)*firstCentralReducedM208 a r H := by
 unfold firstCentralMarginM208 firstCentralMeanM208 firstCentralDenM208
   betaWeightedPolynomialMCA9 betaScalarMCA9 firstCentralReducedM208
 ring
theorem first_central_reduced_shift_positiveM208 (x y z : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < firstCentralReducedM208 (x+2) (y+5) (3*(x+2)+(y+5)+4+z) := by
 have he : firstCentralReducedM208 (x+2) (y+5) (3*(x+2)+(y+5)+4+z)=
193090176
  +27303840*z
  +909216*z^2
  +124422336*y
  +15805728*y*z
  +457632*y*z^2
  +30930624*y^2
  +3344256*y^2*z
  +76608*y^2*z^2
  +3609408*y^3
  +296064*y^3*z
  +4032*y^3*z^2
  +195264*y^4
  +9216*y^4*z
  +3840*y^5
  +248679168*x
  +31768712*x*z
  +931912*x*z^2
  +148708432*x*y
  +17455400*x*y*z
  +456584*x*y*z^2
  +34118896*x*y^2
  +3516896*x*y^2*z
  +75632*x*y^2*z^2
  +3589744*x*y^3
  +291872*x*y^3*z
  +3920*x*y^3*z^2
  +169424*x*y^4
  +8384*x*y^4*z
  +2752*x*y^5
  +134235096*x^2
  +14877480*x^2*z
  +362712*x^2*z^2
  +73362312*x^2*y
  +7672248*x^2*y*z
  +171816*x^2*y*z^2
  +15350032*x^2*y^2
  +1466272*x^2*y^2*z
  +28360*x^2*y^2*z^2
  +1432200*x^2*y^3
  +113312*x^2*y^3*z
  +1464*x^2*y^3*z^2
  +58248*x^2*y^4
  +2992*x^2*y^4*z
  +800*x^2*y^5
  +39125808*x^3
  +3531200*x^3*z
  +64432*x^3*z^2
  +19059552*x^3*y
  +1671312*x^3*y*z
  +28864*x^3*y*z^2
  +3564560*x^3*y^2
  +300104*x^3*y^2*z
  +4776*x^3*y^2*z^2
  +285256*x^3*y^3
  +21144*x^3*y^3*z
  +248*x^3*y^3*z^2
  +9744*x^3*y^4
  +496*x^3*y^4*z
  +120*x^3*y^5
  +6590760*x^4
  +434592*x^4*z
  +4704*x^4*z^2
  +2738952*x^4*y
  +179520*x^4*y*z
  +1824*x^4*y*z^2
  +442096*x^4*y^2
  +29688*x^4*y^2*z
  +304*x^4*y^2*z^2
  +28080*x^4*y^3
  +1800*x^4*y^3*z
  +16*x^4*y^3*z^2
  +744*x^4*y^4
  +32*x^4*y^4*z
  +8*x^4*y^5
  +632496*x^5
  +24512*x^5*z
  +64*x^5*z^2
  +205376*x^5*y
  +7552*x^5*y*z
  +26816*x^5*y^2
  +1104*x^5*y^2*z
  +1072*x^5*y^3
  +48*x^5*y^3*z
  +16*x^5*y^4
  +31200*x^6
  +384*x^6*z
  +6240*x^6*y
  +576*x^6*y^2
  +576*x^7 := by unfold firstCentralReducedM208; ring
 rw [he]
 positivity
theorem first_central_margin_positiveM208 (a r H : ℤ)
 (ha : 2 ≤ a) (hr : 5 ≤ r) (hH : 3*a+r+4 ≤ H) :
 0 < firstCentralMarginM208 a r H := by
 have hh := first_central_reduced_shift_positiveM208 (a-2) (r-5) (H-3*a-r-4)
  (by omega) (by omega) (by omega)
 have hred : 0 < firstCentralReducedM208 a r H := by
  convert hh using 1 <;> ring
 rw [first_central_margin_identityM208]
 have : 0 < r-1 := by omega
 positivity
end
end MathGKM.Markov
