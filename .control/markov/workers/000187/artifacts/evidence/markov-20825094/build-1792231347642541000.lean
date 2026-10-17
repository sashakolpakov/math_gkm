import MarkovTopEndGroupsMCA9
/-! Machine-authored 20825094. Exact generator identities and positive
certificates for the additional wedge. Auxiliary quantities are not raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 20000
def steinBM208 (a m H k : ℝ) : ℝ := (a+k)*(H+k)*(m-k)*(H-a-3+m-k)
def steinDM208 (a m H k : ℝ) : ℝ := k*(H-a-3+k)*(a+m-k)*(H+m-k)
def steinLM208 (a m H k : ℝ) : ℝ :=
 steinBM208 a m H k*(m-2*k-1)+steinDM208 a m H k*(2*k-m-1)
def steinScalarM208 (a H k l : ℝ) : ℝ :=
 2*(a+1)*(a+4)*k*(H+k)*l*(H+l)-a*(a+3)*
 (k*(k-1)*(H+k)*(H+k+1)+l*(l-1)*(H+l)*(H+l+1))
def steinEM208 (a m H : ℝ) : ℝ :=
  6*H
  -2*H^2
  +3*m
  -2*m*H
  +3*m^2
  +6*a
  +14*a*H
  -4*a*H^2
  -4*a*m*H
  +2*a*m^2
  +2*a^2
  +4*a^2*H
def steinFM208 (a m H : ℝ) : ℝ :=
  3*a*m*H
  -1*a*m*H^2
  -4*a*m^2*H
  +1*a*m^2*H^2
  +1*a*m^3*H
  +1*a^2*m*H
  -1*a^2*m^2*H
def steinC0M208 (a m H : ℝ) : ℝ :=
  33*a*m*H
  +17*a*m*H^2
  +21*a*m^2
  +5*a*m^2*H
  -17*a*m^2*H^2
  -38*a*m^3*H
  -21*a*m^4
  +29*a^2*m*H
  +17*a^2*m*H^2
  +19*a^2*m^2
  +7*a^2*m^2*H
  -17*a^2*m^2*H^2
  -36*a^2*m^3*H
  -19*a^2*m^4
  +6*a^3*m*H
  +4*a^3*m*H^2
  +4*a^3*m^2
  +2*a^3*m^2*H
  -4*a^3*m^2*H^2
  -8*a^3*m^3*H
  -4*a^3*m^4
def steinCpM208 (a m H : ℝ) : ℝ :=
  24*H
  +48*H^2
  +12*m
  +48*m*H
  +12*m^2
  -18*a
  +26*a*H
  +124*a*H^2
  +6*a*m
  +208*a*m*H
  +98*a*m^2
  -18*a^2
  +6*a^2*H
  +84*a^2*H^2
  +160*a^2*m*H
  +80*a^2*m^2
  -4*a^3
  +16*a^3*H^2
  +32*a^3*m*H
  +16*a^3*m^2
def steindenM208 (a m H : ℝ) : ℝ :=
  -24*H
  +8*H^2
  -12*m
  +8*m*H
  +2*m^2
  -24*a
  -56*a*H
  +16*a*H^2
  +16*a*m*H
  -8*a^2
  -16*a^2*H
def steinreducedM208 (a m H : ℝ) : ℝ :=
  504*H^2
  -336*H^3
  +56*H^4
  +756*m*H
  +252*m*H^2
  -56*m*H^3
  +252*m^2
  +630*m^2*H
  -266*m^2*H^2
  +210*m^3
  -196*m^3*H
  -42*m^4
  +1008*a*H
  +2472*a*H^2
  -976*a*H^3
  +88*a*H^4
  +504*a*m
  +2700*a*m*H
  -612*a*m*H^2
  +24*a*m*H^3
  +732*a*m^2
  +318*a*m^2*H
  -194*a*m^2*H^2
  +190*a*m^3
  -168*a*m^3*H
  -38*a*m^4
  +1248*a^2*H
  +2592*a^2*H^2
  -672*a^2*H^3
  +32*a^2*H^4
  +624*a^2*m
  +2640*a^2*m*H
  -712*a^2*m*H^2
  +32*a^2*m*H^3
  +672*a^2*m^2
  -108*a^2*m^2*H
  -24*a^2*m^2*H^2
  +40*a^2*m^3
  -32*a^2*m^3*H
  -8*a^2*m^4
  +496*a^3*H
  +992*a^3*H^2
  -128*a^3*H^3
  +248*a^3*m
  +992*a^3*m*H
  -160*a^3*m*H^2
  +248*a^3*m^2
  -48*a^3*m^2*H
  +64*a^4*H
  +128*a^4*H^2
  +32*a^4*m
  +128*a^4*m*H
  +32*a^4*m^2

theorem stein_generator_radialM208 (a m H k : ℝ) :
 steinLM208 a m H k=steinFM208 a m H+steinEM208 a m H*(k*(m-k))-
 (8*a+14)*(k*(m-k))^2 := by
 unfold steinLM208 steinBM208 steinDM208 steinFM208 steinEM208
 ring
theorem stein_scalar_generatorM208 (a m H k : ℝ) :
 (4*a+7)*steinScalarM208 a H k (m-k)=
 -2*(a+2)*steinLM208 a m H k+steinC0M208 a m H+steinCpM208 a m H*(k*(m-k)) := by
 unfold steinScalarM208 steinLM208 steinBM208 steinDM208 steinC0M208 steinCpM208
 ring
theorem stein_den_identityM208 (a m H : ℝ) :
 steindenM208 a m H=(8*a+14)*m^2-4*steinEM208 a m H := by
 unfold steindenM208 steinEM208
 ring
theorem stein_certificate_identityM208 (a m H : ℝ) :
 steinC0M208 a m H*steindenM208 a m H+4*steinCpM208 a m H*steinFM208 a m H=
 a*m*(m-1)*steinreducedM208 a m H := by
 unfold steinC0M208 steindenM208 steinCpM208 steinFM208 steinreducedM208
 ring
theorem stein_den_shift_positiveM208 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < steindenM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
 have he : 1*steindenM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z)=
  14448
  +2088*z
  +72*z^2
  +18696*y
  +1792*y*z
  +32*y*z^2
  +8032*y^2
  +384*y^2*z
  +1144*y^3
  +8216*x
  +824*x*z
  +16*x*z^2
  +7076*x*y
  +352*x*y*z
  +1516*x*y^2
  +1544*x^2
  +80*x^2*z
  +664*x^2*y
  +96*x^3 := by unfold steindenM208; ring
 have hp : 0 < 1*steindenM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
  rw [he]
  positivity
 linarith
theorem stein_den_positiveM208 (a m H : ℝ)
 (hm : 2 ≤ m) (ha : 2*m ≤ a) (hH : 6*a+m+8 ≤ 2*H) :
 0 < steindenM208 a m H := by
 have h := stein_den_shift_positiveM208 (a-2*m) (m-2) (H-3*a-m/2-4)
  (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
theorem stein_Cp_shift_positiveM208 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < steinCpM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
 have he : 1*steinCpM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z)=
  1042256
  +110208*z
  +2912*z^2
  +1944020*y
  +161940*y*z
  +3128*y*z^2
  +1444698*y^2
  +88624*y^2*z
  +1104*y^2*z^2
  +534430*y^3
  +21392*y^3*z
  +128*y^3*z^2
  +98356*y^4
  +1920*y^4*z
  +7200*y^5
  +892376*x
  +76770*x*z
  +1564*x*z^2
  +1326231*x*y
  +84036*x*y*z
  +1104*x*y*z^2
  +736149*x*y^2
  +30448*x*y^2*z
  +192*x*y^2*z^2
  +180772*x*y^3
  +3648*x*y^3*z
  +16560*x*y^4
  +303486*x^2
  +19862*x^2*z
  +276*x^2*z^2
  +337031*x^2*y
  +14404*x^2*y*z
  +96*x^2*y*z^2
  +124237*x^2*y^2
  +2592*x^2*y^2*z
  +15192*x^2*y^3
  +51282*x^3
  +2264*x^3*z
  +16*x^3*z^2
  +37836*x^3*y
  +816*x^3*y*z
  +6948*x^3*y^2
  +4308*x^4
  +96*x^4*z
  +1584*x^4*y
  +144*x^5 := by unfold steinCpM208; ring
 have hp : 0 < 1*steinCpM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
  rw [he]
  positivity
 linarith
theorem stein_Cp_positiveM208 (a m H : ℝ)
 (hm : 2 ≤ m) (ha : 2*m ≤ a) (hH : 6*a+m+8 ≤ 2*H) :
 0 < steinCpM208 a m H := by
 have h := stein_Cp_shift_positiveM208 (a-2*m) (m-2) (H-3*a-m/2-4)
  (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
theorem stein_reduced_shift_positiveM208 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < steinreducedM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
 have he : 1*steinreducedM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z)=
  1920960
  +2507920*z
  +563960*z^2
  +40480*z^3
  +920*z^4
  +4381096*y
  +5277924*y*z
  +911644*y*z^2
  +47384*y*z^3
  +688*y*z^4
  +4777336*y^2
  +4515438*y^2*z
  +557110*y^2*z^2
  +18576*y^2*z^3
  +128*y^2*z^4
  +3097422*y^3
  +1954824*y^3*z
  +152204*y^3*z^2
  +2432*y^3*z^3
  +1193234*y^4
  +426312*y^4*z
  +15648*y^4*z^2
  +248172*y^5
  +37312*y^5*z
  +21280*y^6
  +3340272*x
  +2558784*x*z
  +426152*x*z^2
  +22496*x*z^3
  +344*x*z^4
  +6820452*x*y
  +4325860*x*y*z
  +518868*x*y*z^2
  +17608*x*y*z^3
  +128*x*y*z^4
  +5996810*x*y^2
  +2775210*x*y^2*z
  +211878*x*y^2*z^2
  +3456*x*y^2*z^3
  +2785670*x*y^3
  +797972*x*y^3*z
  +28960*x*y^3*z^2
  +667414*x*y^4
  +86464*x*y^4*z
  +64672*x*y^5
  +2060136*x^2
  +1026400*x^2*z
  +120352*x^2*z^2
  +4160*x^2*z^3
  +32*x^2*z^4
  +3460672*x^2*y
  +1304400*x^2*y*z
  +98000*x^2*y*z^2
  +1632*x^2*y*z^3
  +2284304*x^2*y^2
  +557384*x^2*y^2*z
  +20040*x^2*y^2*z^2
  +693140*x^2*y^3
  +79856*x^2*y^3*z
  +80424*x^2*y^4
  +624504*x^3
  +202992*x^3*z
  +15056*x^3*z^2
  +256*x^3*z^3
  +797652*x^3*y
  +172168*x^3*y*z
  +6144*x^3*y*z^2
  +350642*x^3*y^2
  +36736*x^3*y^2*z
  +52544*x^3*y^3
  +101304*x^4
  +19840*x^4*z
  +704*x^4*z^2
  +86896*x^4*y
  +8416*x^4*y*z
  +19064*x^4*y^2
  +8472*x^5
  +768*x^5*z
  +3648*x^5*y
  +288*x^6 := by unfold steinreducedM208; ring
 have hp : 0 < 1*steinreducedM208 (x+2*(y+2)) (y+2) (3*(x+2*(y+2))+(y+2)/2+4+z) := by
  rw [he]
  positivity
 linarith
theorem stein_reduced_positiveM208 (a m H : ℝ)
 (hm : 2 ≤ m) (ha : 2*m ≤ a) (hH : 6*a+m+8 ≤ 2*H) :
 0 < steinreducedM208 a m H := by
 have h := stein_reduced_shift_positiveM208 (a-2*m) (m-2) (H-3*a-m/2-4)
  (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
end
end MathGKM.Markov
