import Mathlib
/-! Machine-authored 9f234835. Checked scalar polynomial positivity certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem ramp_scalar_initialM9F23 (b r : ℝ) (hb : 1 ≤ b) (hr : 1 ≤ r) :
 (3*r-b)/(4*r*(r+b)) ≤ 1/(r+b+1) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hr0 : 0 ≤ r-1 := by linarith
 have hp : 0 ≤ 4*r*(r+b)-(3*r-b)*(r+b+1) := by
  have he : 4*r*(r+b)-(3*r-b)*(r+b+1) = 2+
   5*(b-1)+
   (b-1)^2+
   (r-1)+
   2*(r-1)*(b-1)+
   (r-1)^2 := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < 4*r*(r+b)) (by positivity : 0 < r+b+1)).mpr
 nlinarith only [hp]

theorem ramp_scalar_firstM9F23 (b r : ℝ) (hb : 1 ≤ b) (hr : 2 ≤ r) :
 (r-1-b)/(2*(r-1)*(r-1+b)) ≤ (3*r-b)/(4*r*(r+b)) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hr0 : 0 ≤ r-2 := by linarith
 have hr1 : 0 < r-1 := by linarith
 have hp : 0 ≤ (3*r-b)*2*(r-1)*(r-1+b)-(r-1-b)*4*r*(r+b) := by
  have he : (3*r-b)*2*(r-1)*(r-1+b)-(r-1-b)*4*r*(r+b) = 20+
   30*(b-1)+
   6*(b-1)^2+
   18*(r-2)+
   22*(r-2)*(b-1)+
   2*(r-2)*(b-1)^2+
   8*(r-2)^2+
   4*(r-2)^2*(b-1)+
   2*(r-2)^3 := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < 2*(r-1)*(r-1+b)) (by positivity : 0 < 4*r*(r+b))).mpr
 nlinarith only [hp]

theorem ramp_scalar_tailM9F23 (b n k : ℝ) (hb : 1 ≤ b) (hn : 2 ≤ n) (hk : 1 ≤ k) :
 (n-1-b*(k+1))/((k+2)*(n-1)*(n-1+b)) ≤
 (n-b*k)/((k+1)*n*(n+b)) := by
 have hb0 : 0 ≤ b-1 := by linarith
 have hn0 : 0 ≤ n-2 := by linarith
 have hk0 : 0 ≤ k-1 := by linarith
 have hn1 : 0 < n-1 := by linarith
 have hp : 0 ≤ (n-b*k)*(k+2)*(n-1)*(n-1+b)-
    (n-1-b*(k+1))*(k+1)*n*(n+b) := by
  have he : (n-b*k)*(k+2)*(n-1)*(n-1+b)-
    (n-1-b*(k+1))*(k+1)*n*(n+b) = 18+
   14*(k-1)+
   4*(k-1)^2+
   25*(b-1)+
   20*(b-1)*(k-1)+
   5*(b-1)*(k-1)^2+
   5*(b-1)^2+
   4*(b-1)^2*(k-1)+
   (b-1)^2*(k-1)^2+
   13*(n-2)+
   5*(n-2)*(k-1)+
   (n-2)*(k-1)^2+
   15*(n-2)*(b-1)+
   8*(n-2)*(b-1)*(k-1)+
   2*(n-2)*(b-1)*(k-1)^2+
   (n-2)*(b-1)^2+
   4*(n-2)^2+
   (n-2)^2*(k-1)+
   2*(n-2)^2*(b-1)+
   (n-2)*((n-2)-(k-1))^2 := by ring
  rw [he]; positivity
 apply (div_le_div_iff₀ (by positivity : 0 < (k+2)*(n-1)*(n-1+b))
   (by positivity : 0 < (k+1)*n*(n+b))).mpr
 nlinarith only [hp]

end
end MathGKM.Markov
