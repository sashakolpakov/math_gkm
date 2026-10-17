import MarkovTopSteinCorrectionM208
/-! Machine-authored 73199834. Exact scalar fourth-moment certificate.
The required normalized fourth-moment bound is a separate unproved attachment;
this file makes no source positivity or asymptotic claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
def fourthMomentDenM731 (a : ℝ) : ℝ := 16*(2*a+1)*(2*a+3)
def fourthMomentNumM731 (a m : ℝ) : ℝ := m*(2*a+m)*(3*m*(2*a+m)-4*a)
def fourthDeltaM731 (a m H : ℝ) : ℝ := (8*a+14)*m^2/2-steinEM208 a m H
def fourthCenterM731 (a m H : ℝ) : ℝ :=
 (a+m/2)*(H+m/2)*m*(H-a-3+m/2)
def fourthCertificateM731 (a m H : ℝ) : ℝ :=
 (steinC0M208 a m H+steinCpM208 a m H*m^2/4)*fourthDeltaM731 a m H*fourthMomentDenM731 a-
 steinCpM208 a m H*(fourthCenterM731 a m H*fourthMomentDenM731 a+
   (8*a+14)*fourthMomentNumM731 a m)
def fourthReducedM731 (a m H : ℝ) : ℝ :=
6048*H^2
  -4032*H^3
  +672*H^4
  +7728*m*H
  +336*m*H^2
  -672*m*H^3
  +2352*m^2
  +2016*m^2*H
  -672*m^2*H^2
  -336*m^3
  -3360*m^3*H
  -2688*m^4
  +9408*a*H
  +40416*a*H^2
  -22464*a*H^3
  +2848*a*H^4
  +5712*a*m
  +50336*a*m*H
  -5072*a*m*H^2
  -1504*a*m*H^3
  +13440*a*m^2
  -3552*a*m^2*H
  -3296*a*m^2*H^2
  -8704*a*m^3
  -5952*a*m^3*H
  -4000*a*m^4
  +2016*a^2
  +42784*a^2*H
  +101312*a^2*H^2
  -44672*a^2*H^3
  +4096*a^2*H^4
  +22752*a^2*m
  +104864*a^2*m*H
  -24288*a^2*m*H^2
  +256*a^2*m*H^3
  +20128*a^2*m^2
  -11536*a^2*m^2*H
  -3008*a^2*m^2*H^2
  -11808*a^2*m^3
  -3648*a^2*m^3*H
  -1968*a^2*m^4
  +3168*a^3
  +59680*a^3*H
  +117056*a^3*H^2
  -38656*a^3*H^3
  +2432*a^3*H^4
  +29840*a^3*m
  +109328*a^3*m*H
  -29408*a^3*m*H^2
  +1408*a^3*m*H^3
  +17968*a^3*m^2
  -10096*a^3*m^2*H
  -544*a^3*m^2*H^2
  -5312*a^3*m^3
  -768*a^3*m^3*H
  -320*a^3*m^4
  +1600*a^4
  +36224*a^4*H
  +67584*a^4*H^2
  -14848*a^4*H^3
  +512*a^4*H^4
  +17632*a^4*m
  +61888*a^4*m*H
  -13440*a^4*m*H^2
  +512*a^4*m*H^3
  +11104*a^4*m^2
  -3776*a^4*m^2*H
  +128*a^4*m^2*H^2
  -768*a^4*m^3
  +256*a^5
  +9984*a^5*H
  +18944*a^5*H^2
  -2048*a^5*H^3
  +4864*a^5*m
  +17920*a^5*m*H
  -2048*a^5*m*H^2
  +3840*a^5*m^2
  -512*a^5*m^2*H
  +1024*a^6*H
  +2048*a^6*H^2
  +512*a^6*m
  +2048*a^6*m*H
  +512*a^6*m^2
theorem fourth_certificate_factorM731 (a m H : ℝ) :
 fourthCertificateM731 a m H=a*m*(m-1)*fourthReducedM731 a m H := by
 unfold fourthCertificateM731 fourthReducedM731 fourthDeltaM731 fourthCenterM731
   fourthMomentDenM731 fourthMomentNumM731 steinC0M208 steinCpM208 steinEM208
 ring

theorem fourth_reduced_shift_positiveM731 (x y z : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) (hxy : 4*y ≤ x^2) :
 0 < fourthReducedM731 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z) := by
 have he : 2*fourthReducedM731 (x+3) (y+2) (3*(x+3)+(y+2)/2+4+z)=
 (9937152
  +408955392*z
  +123710976*z^2
  +11031552*z^3
  +306432*z^4
  +79544640*y*z
  +17419200*y*z^2
  +766080*y*z^3
  +4268160*y^2*z
  +605568*y^2*z^2
  +34656*y^3*z
  +346267456*x
  +737942400*x*z
  +177969024*x*z^2
  +13135104*x*z^3
  +296768*x*z^4
  +139622432*x*y*z
  +22293280*x*y*z^2
  +780224*x*y*z^3
  +8190912*x*y^2*z
  +680768*x*y^2*z^2
  +146832*x*y^3*z
  +492748016*x^2
  +563145792*x^2*z
  +106388736*x^2*z^2
  +6235648*x^2*z^3
  +107264*x^2*z^4
  +53499288*x^2*y
  +97205920*x^2*y*z
  +11298752*x^2*y*z^2
  +295680*x^2*y*z^3
  +5284160*x^2*y^2*z
  +280640*x^2*y^2*z^2
  +91392*x^2*y^3*z
  +335915312*x^3
  +235999744*x^3*z
  +33823872*x^3*z^2
  +1475584*x^3*z^3
  +17152*x^3*z^4
  +55934324*x^3*y
  +34868960*x^3*y*z
  +2836032*x^3*y*z^2
  +49408*x^3*y*z^3
  +3477806*x^3*y^2
  +1560800*x^3*y^2*z
  +50368*x^3*y^2*z^2
  +120127*x^3*y^3
  +20352*x^3*y^3*z
  +2048*x^3*y^4
  +130587648*x^4
  +58736128*x^4*z
  +6031360*x^4*z^2
  +174080*x^4*z^3
  +1024*x^4*z^4
  +22298755*x^4*y
  +6856704*x^4*y*z
  +352768*x^4*y*z^2
  +3072*x^4*y*z^3
  +1352347*x^4*y^2
  +218368*x^4*y^2*z
  +3328*x^4*y^2*z^2
  +35632*x^4*y^3
  +1536*x^4*y^3*z
  +256*x^4*y^4
  +29116992*x^5
  +8691200*x^5*z
  +571904*x^5*z^2
  +8192*x^5*z^3
  +4215232*x^5*y
  +704768*x^5*y*z
  +17408*x^5*y*z^2
  +191808*x^5*y^2
  +11776*x^5*y^2*z
  +2560*x^5*y^3
  +3896064*x^6
  +708608*x^6*z
  +22528*x^6*z^2
  +398336*x^6*y
  +29696*x^6*y*z
  +9472*x^6*y^2
  +289536*x^7
  +24576*x^7*z
  +15360*x^7*y
  +9216*x^8)+(x^2-4*y)*(35930064
  +10798536*y
  +1067268*y^2
  +34884*y^3
  +15910544*x
  +7419564*x*y
  +661954*x*y^2
  +16673*x*y^3
  +558685*x^2*y
  +76229*x^2*y^2
  +976*x^2*y^3) := by unfold fourthReducedM731; ring
 have hp : (0:ℝ)<9937152
  +408955392*z
  +123710976*z^2
  +11031552*z^3
  +306432*z^4
  +79544640*y*z
  +17419200*y*z^2
  +766080*y*z^3
  +4268160*y^2*z
  +605568*y^2*z^2
  +34656*y^3*z
  +346267456*x
  +737942400*x*z
  +177969024*x*z^2
  +13135104*x*z^3
  +296768*x*z^4
  +139622432*x*y*z
  +22293280*x*y*z^2
  +780224*x*y*z^3
  +8190912*x*y^2*z
  +680768*x*y^2*z^2
  +146832*x*y^3*z
  +492748016*x^2
  +563145792*x^2*z
  +106388736*x^2*z^2
  +6235648*x^2*z^3
  +107264*x^2*z^4
  +53499288*x^2*y
  +97205920*x^2*y*z
  +11298752*x^2*y*z^2
  +295680*x^2*y*z^3
  +5284160*x^2*y^2*z
  +280640*x^2*y^2*z^2
  +91392*x^2*y^3*z
  +335915312*x^3
  +235999744*x^3*z
  +33823872*x^3*z^2
  +1475584*x^3*z^3
  +17152*x^3*z^4
  +55934324*x^3*y
  +34868960*x^3*y*z
  +2836032*x^3*y*z^2
  +49408*x^3*y*z^3
  +3477806*x^3*y^2
  +1560800*x^3*y^2*z
  +50368*x^3*y^2*z^2
  +120127*x^3*y^3
  +20352*x^3*y^3*z
  +2048*x^3*y^4
  +130587648*x^4
  +58736128*x^4*z
  +6031360*x^4*z^2
  +174080*x^4*z^3
  +1024*x^4*z^4
  +22298755*x^4*y
  +6856704*x^4*y*z
  +352768*x^4*y*z^2
  +3072*x^4*y*z^3
  +1352347*x^4*y^2
  +218368*x^4*y^2*z
  +3328*x^4*y^2*z^2
  +35632*x^4*y^3
  +1536*x^4*y^3*z
  +256*x^4*y^4
  +29116992*x^5
  +8691200*x^5*z
  +571904*x^5*z^2
  +8192*x^5*z^3
  +4215232*x^5*y
  +704768*x^5*y*z
  +17408*x^5*y*z^2
  +191808*x^5*y^2
  +11776*x^5*y^2*z
  +2560*x^5*y^3
  +3896064*x^6
  +708608*x^6*z
  +22528*x^6*z^2
  +398336*x^6*y
  +29696*x^6*y*z
  +9472*x^6*y^2
  +289536*x^7
  +24576*x^7*z
  +15360*x^7*y
  +9216*x^8 := by positivity
 have hf : (0:ℝ)≤35930064
  +10798536*y
  +1067268*y^2
  +34884*y^3
  +15910544*x
  +7419564*x*y
  +661954*x*y^2
  +16673*x*y^3
  +558685*x^2*y
  +76229*x^2*y^2
  +976*x^2*y^3 := by positivity
 have hc : 0 ≤ (x^2-4*y)*(35930064
  +10798536*y
  +1067268*y^2
  +34884*y^3
  +15910544*x
  +7419564*x*y
  +661954*x*y^2
  +16673*x*y^3
  +558685*x^2*y
  +76229*x^2*y^2
  +976*x^2*y^3) := mul_nonneg (sub_nonneg.mpr hxy) hf
 linarith only [he,hp,hc]

attribute [local irreducible] fourthReducedM731 fourthCertificateM731
theorem fourth_certificate_positiveM731 (a m H : ℝ)
 (ha : 3 ≤ a) (hm : 2 ≤ m) (ham : 4*(m-2) ≤ (a-3)^2)
 (hH : 6*a+m+8 ≤ 2*H) : 0 < fourthCertificateM731 a m H := by
 have h := fourth_reduced_shift_positiveM731 (a-3) (m-2) (H-3*a-m/2-4)
   (by linarith) (by linarith) (by linarith) ham
 have hr : 0 < fourthReducedM731 a m H := by
   convert h using 1 <;> ring
 have hp : 0 < a*m*(m-1)*fourthReducedM731 a m H :=
   mul_pos (mul_pos (mul_pos (by linarith) (by linarith)) (by linarith)) hr
 exact hp.trans_eq (fourth_certificate_factorM731 a m H).symm
end
end MathGKM.Markov
