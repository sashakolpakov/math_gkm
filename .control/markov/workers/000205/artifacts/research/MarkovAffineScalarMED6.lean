import Mathlib
/-! Machine-authored ed6bdbeb. Polynomial certificates for affine kernel ratios. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
theorem affine_scalar_firstMED6 (b r h : ℝ) (hb : 1 ≤ b) (hr : 1 ≤ r) (hh : 1/3 ≤ h) :
 (r-b*h)/((h+1)*r*(r+b)) ≤ 1/(r+b+1) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hr0 : 0 ≤ r-1 := by linarith
 have hh0 : 0 ≤ h-1/3 := by linarith
 have hp : 0 ≤ (h+1)*r*(r+b)-(r-b*h)*(r+b+1) := by
  have he : (h+1)*r*(r+b)-(r-b*h)*(r+b+1) =
   (2/3:ℝ)+
   5*(h-1/3)+
   (1/3:ℝ)*(r-1)+
   4*(r-1)*(h-1/3)+
   (1/3:ℝ)*(r-1)^2+
   1*(r-1)^2*(h-1/3)+
   (5/3:ℝ)*(b-1)+
   5*(b-1)*(h-1/3)+
   (2/3:ℝ)*(b-1)*(r-1)+
   2*(b-1)*(r-1)*(h-1/3)+
   (1/3:ℝ)*(b-1)^2+
   1*(b-1)^2*(h-1/3) := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < (h+1)*r*(r+b)) (by positivity : 0 < r+b+1)).mpr
 nlinarith only [hp]

theorem affine_scalar_tailMED6 (b n k : ℝ) (hb : 1 ≤ b) (hn : 2 ≤ n) (hk : 1/3 ≤ k) :
 (n-1-b*(k+1))/((k+2)*(n-1)*(n-1+b)) ≤
 (n-b*k)/((k+1)*n*(n+b)) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hn0 : 0 ≤ n-2 := by linarith
 have hk0 : 0 ≤ k-1/3 := by linarith
 have hn1 : 0 < n-1 := by linarith
 have hp : 0 ≤ (n-b*k)*(k+2)*(n-1)*(n-1+b)-
    (n-1-b*(k+1))*(k+1)*n*(n+b) := by
  have he : (n-b*k)*(k+2)*(n-1)*(n-1+b)-
    (n-1-b*(k+1))*(k+1)*n*(n+b) =
   (94/9:ℝ)+
   (26/3:ℝ)*(k-1/3)+
   4*(k-1/3)^2+
   (95/9:ℝ)*(n-2)+
   (7/3:ℝ)*(n-2)*(k-1/3)+
   1*(n-2)*(k-1/3)^2+
   (14/3:ℝ)*(n-2)^2+
   1*(n-2)^2*(k-1/3)+
   (125/9:ℝ)*(b-1)+
   (40/3:ℝ)*(b-1)*(k-1/3)+
   5*(b-1)*(k-1/3)^2+
   (95/9:ℝ)*(b-1)*(n-2)+
   (16/3:ℝ)*(b-1)*(n-2)*(k-1/3)+
   2*(b-1)*(n-2)*(k-1/3)^2+
   2*(b-1)*(n-2)^2+
   (25/9:ℝ)*(b-1)^2+
   (8/3:ℝ)*(b-1)^2*(k-1/3)+
   1*(b-1)^2*(k-1/3)^2+
   1*(b-1)^2*(n-2)+(n-2)*((n-2)-(k-1/3))^2 := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < (k+2)*(n-1)*(n-1+b))
   (by positivity : 0 < (k+1)*n*(n+b))).mpr
 nlinarith only [hp]
end
end MathGKM.Markov
