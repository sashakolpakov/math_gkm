import MarkovCenteredVarianceME87
/-! Machine-authored e8743310. Exact positive scalar certificate with the
squared mean term retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
theorem centered_scalar_shiftME87 (x y z : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < centeredScalarME87 (x+10) (y+3) ((y+3)+2*(x+10)+9+z) := by
 have he : centeredScalarME87 (x+10) (y+3) ((y+3)+2*(x+10)+9+z) = 128*x^6*y+224*x^6+304*x^5*y^2+128*x^5*y*z+11248*x^5*y+224*x^5*z+18524*x^5+240*x^4*y^3+272*x^4*y^2*z+20616*x^4*y^2+32*x^4*y*z^2+9296*x^4*y*z+404440*x^4*y+56*x^4*z^2+15292*x^4*z+629728*x^4+60*x^3*y^4+120*x^3*y^3*z+11528*x^3*y^3+60*x^3*y^2*z^2+14324*x^3*y^2*z+544340*x^3*y^2+1836*x^3*y*z^2+264668*x^3*y*z+7598472*x^3*y+3015*x^3*z^2+412020*x^3*z+11234800*x^3+1640*x^2*y^4+4048*x^2*y^3*z+195200*x^2*y^3+2216*x^2*y^2*z^2+276328*x^2*y^2*z+6948272*x^2*y^2+38504*x^2*y*z^2+3689496*x^2*y*z+78412440*x^2*y+60018*x^2*z^2+5468108*x^2*z+110550984*x^2+11460*x*y^4+43656*x*y^3*z+1334392*x*y^3+27012*x*y^2*z^2+2309260*x*y^2*z+42433020*x*y^2+351060*x*y*z^2+25153700*x*y*z+419438024*x*y+523929*x*z^2+35680588*x*z+566087796*x+5176*y^4+148592*y^3*z+2850640*y^3+108856*y^2*z^2+7035240*y^2*z+97438312*y^2+1177880*y*z^2+67005112*y*z+902275920*y+1694110*z^2+91387800*z+1169969976 := by
   unfold centeredScalarME87 deficitSecondM41B
   ring
 rw [he]
 positivity
theorem centered_scalar_positiveME87 (i r H : ℝ) (hi : 10 ≤ i) (hr : 3 ≤ r)
 (hH : r+2*i+9 ≤ H) : 0 < centeredScalarME87 i r H := by
 have h := centered_scalar_shiftME87 (i-10) (r-3) (H-r-2*i-9)
   (by linarith) (by linarith) (by linarith)
 convert h using 1 <;> ring

theorem centered_controlME87 (i r H M E V G : ℝ)
 (hi : 10 ≤ i) (hr : 3 ≤ r) (hH : r+2*i+9 ≤ H)
 (hM : 0 ≤ M)
 (hsecond : (i+3)*(i+4)*G ≤ deficitSecondM41B i r*M)
 (hV : V+(r*H*M-E)^2 ≤ (H+r)^2*M*G) :
 0 ≤ (15*i+47)*E^2+(i+1)*(8*(i+4)+1)*(H-r+1)*M*E-(i+1)*(8*(i+4)+1)*V := by
 have hS := centered_scalar_positiveME87 i r H hi hr hH
 have hV' : (i+3)*(i+4)*(V+(r*H*M-E)^2) ≤
   (H+r)^2*deficitSecondM41B i r*M^2 := by
   have h0 := mul_le_mul_of_nonneg_left hV (by positivity : 0 ≤ (i+3)*(i+4))
   have h1 := mul_le_mul_of_nonneg_left hsecond (by positivity : 0 ≤ (H+r)^2*M)
   nlinarith only [h0,h1]
 exact centered_control_algebraME87 (i+3) (i+4) (deficitSecondM41B i r)
   (H+r) ((i+1)*(8*(i+4)+1)) (H-r+1) (15*i+47) (r*H) M E V
   (by linarith) (by linarith) (by positivity) (by positivity) hV'
   (by exact hS.le)
end
end MathGKM.Markov
