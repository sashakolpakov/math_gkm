import MarkovTopTailRepresentationMDCB
/-! Machine-authored dcb64029. Scalar part of a proposed beta-binomial
comparison. Actual beta moments and likelihood attachment remain separate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000

def betaGapMDCB (a m H : ℤ) : ℤ :=
 (2*a+2)*(2*a+3)*(H^2-(3*a+7)*H-5*a-14)-
 4*(m-2)*(2*a+3)*(H+a^2+5*a+7)-
 2*(m-2)*(m-3)*(a^2+6*a+7)

theorem beta_gap_shift_positiveMDCB (x y z : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hz : 0 ≤ z) :
 0 < betaGapMDCB (x+1) (y+2) (3*(x+1)+2*(y+2)+5+z) := by
 have he : betaGapMDCB (x+1) (y+2) (3*(x+1)+2*(y+2)+5+z)=
  100+
  280*z^1+
  20*z^2+
  88*y^1+
  60*y^1*z^1+
  12*y^2+
  110*x^1+
  312*x^1*z^1+
  18*x^1*z^2+
  240*x^1*y^1+
  64*x^1*y^1*z^1+
  40*x^1*y^2+
  38*x^2+
  110*x^2*z^1+
  4*x^2*z^2+
  122*x^2*y^1+
  16*x^2*y^1*z^1+
  14*x^2*y^2+
  4*x^3+
  12*x^3*z^1+
  16*x^3*y^1 := by unfold betaGapMDCB; ring
 rw [he]
 positivity

theorem beta_gap_positiveMDCB (a m H : ℤ)
 (ha : 1 ≤ a) (hm : 2 ≤ m) (hH : 3*a+2*m+5 ≤ H) :
 0 < betaGapMDCB a m H := by
 have h := beta_gap_shift_positiveMDCB (a-1) (m-2) (H-(3*a+2*m+5))
   (by omega) (by omega) (by omega)
 convert h using 1 <;> ring

theorem beta_gap_tail_regionMDCB (d i r m : ℕ)
 (hd : i+4*r ≤ d+1) (hm : 2 ≤ m) (hmr : m ≤ 2*r) :
 0 < betaGapMDCB ((i:ℤ)+1) m ((d:ℤ)+2*i+9) := by
 apply beta_gap_positiveMDCB
 · omega
 · exact_mod_cast hm
 · have hd' : (i:ℤ)+4*r ≤ d+1 := by exact_mod_cast hd
   have hm' : (m:ℤ) ≤ 2*r := by exact_mod_cast hmr
   omega

end
end MathGKM.Markov
