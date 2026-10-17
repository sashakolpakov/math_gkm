import MarkovWeakMarginM673
/-! Machine-authored 6738b4ea. Explicit positive scalar certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
def weakScalarM673 (i r H : ℝ) : ℝ :=
 (15*i+47)*deficitLowerM41B i r H^2*(i+4)+
 (H-r+1)*deficitLowerM41B i r H*(i+1)*(8*(i+4)+1)*(i+3)*(i+4)-
 (H+r)^2*deficitSecondM41B i r*(i+1)*(8*(i+4)+1)*(i+3)
theorem weak_scalar_shiftM673 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < weakScalarM673 (x+16) (y+3) ((y+3)+2*(x+16)+9+z) := by
 have he : weakScalarM673 (x+16) (y+3) ((y+3)+2*(x+16)+9+z) = 32*x^7*y+32*x^7+76*x^6*y^2+32*x^6*y*z+4356*x^6*y+32*x^6*z+3972*x^6+60*x^5*y^3+68*x^5*y^2*z+8394*x^5*y^2+8*x^5*y*z^2+3692*x^5*y*z+250886*x^5*y+8*x^5*z^2+3372*x^5*z+205410*x^5+15*x^4*y^4+30*x^4*y^3*z+5042*x^4*y^3+15*x^4*y^2*z^2+6143*x^4*y^2*z+379305*x^4*y^2+757*x^4*y*z^2+175241*x^4*y*z+7910194*x^4*y+693*x^4*z^2+144219*x^4*z+5672462*x^4+845*x^3*y^4+1942*x^3*y^3*z+163298*x^3*y^3+1049*x^3*y^2*z^2+218785*x^3*y^2*z+8939475*x^3*y^2+28303*x^3*y*z^2+4374513*x^3*y*z+147063384*x^3*y+23479*x^3*z^2+3174653*x^3*z+88501218*x^3+15949*x^2*y^4+45922*x^2*y^3*z+2507702*x^2*y^3+27339*x^2*y^2*z^2+3832049*x^2*y^2*z+115186925*x^2*y^2+522613*x^2*y*z^2+60466311*x^2*y*z+1606249800*x^2*y+386427*x^2*z^2+37320193*x^2*z+746572562*x^2+103155*x*y^4+465610*x*y^3*z+17685954*x*y^3+314523*x*y^2*z^2+32909795*x*y^2*z+761834711*x*y^2+4764065*x*y*z^2+437735355*x*y*z+9490487906*x*y+3057521*x*z^2+215022871*x*z+2778596140*x+43428*y^4+1679328*y^3*z+42301560*y^3+1346842*y^2*z^2+110375832*y^2*z+1985721682*y^2+17140046*y*z^2+1292125800*y*z+23197066466*y+9131584*z^2+436963716*z+1422720236 := by
   unfold weakScalarM673 deficitLowerM41B deficitSecondM41B
   ring
 rw [he]
 positivity
theorem weak_lower_shiftM673 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < deficitLowerM41B (x+16) (y+3) ((y+3)+2*(x+16)+9+z) := by
 have he : deficitLowerM41B (x+16) (y+3) ((y+3)+2*(x+16)+9+z) = 2*x^2*y+4*x^2+1*x*y^2+1*x*y*z+79*x*y+2*x*z+153*x+15*y^2+17*y*z+753*y+34*z+1427 := by
   unfold deficitLowerM41B
   ring
 rw [he]
 positivity
theorem weak_scalar_positiveM673 (i r H : ℝ) (hi : 16 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < weakScalarM673 i r H := by
 have h := weak_scalar_shiftM673 (i-16) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring
theorem weak_lower_positiveM673 (i r H : ℝ) (hi : 16 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < deficitLowerM41B i r H := by
 have h := weak_lower_shiftM673 (i-16) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

theorem weak_controlM673 (i r H M E V F G : ℝ)
 (hi : 16 ≤ i) (hr : 3 ≤ r) (hH : r+2*i+9 ≤ H)
 (hM : 0 ≤ M)
 (hfirst : (i+3)*F ≤ (2*r+i+1)*M)
 (hsecond : (i+3)*(i+4)*G ≤ deficitSecondM41B i r*M)
 (hE : r*H*M-(H+r)*F ≤ E)
 (hV : V ≤ (H+r)^2*M*G) :
 0 ≤ (15*i+47)*E^2+(i+1)*(8*(i+4)+1)*(H-r+1)*M*E-(i+1)*(8*(i+4)+1)*V := by
 have hL := weak_lower_positiveM673 i r H hi hr hH
 have hS := weak_scalar_positiveM673 i r H hi hr hH
 have hE' : deficitLowerM41B i r H*M ≤ (i+3)*E := by
   have h0 := mul_le_mul_of_nonneg_left hfirst (by linarith : 0 ≤ H+r)
   have h1 := mul_le_mul_of_nonneg_left hE (by linarith : 0 ≤ i+3)
   unfold deficitLowerM41B
   nlinarith only [h0,h1]
 have hV' : (i+3)*(i+4)*V ≤ (H+r)^2*deficitSecondM41B i r*M^2 := by
   have h0 := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ (i+3)*(i+4))
   have h1 := mul_le_mul_of_nonneg_left hsecond (by positivity : 0 ≤ (H+r)^2*M)
   nlinarith only [h0,h1]
 exact weak_control_algebraM673 (i+3) (i+4) (deficitLowerM41B i r H)
   (deficitSecondM41B i r) (H+r) ((i+1)*(8*(i+4)+1)) (H-r+1) (15*i+47) M E V
   (by linarith) (by linarith) hL.le (by positivity) (by linarith) (by linarith)
   hM hE' hV' (by unfold weakScalarM673 at hS; nlinarith only [hS])
end
end MathGKM.Markov
