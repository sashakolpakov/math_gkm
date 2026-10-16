import MarkovMiddleGapM570
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
theorem strip_middle_transferM570 (a k l t C c₂ c₃ c₄ : ℝ)
 (hk : 0 ≤ k) (hl : 3 ≤ l) (hN : 7 ≤ k+l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*c₂=C*l*stripJMB9D a k l)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃=C*l*(l-1)*stripHMB9D a k l)
 (h₄ : 24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*c₄=
   C*l*(l-1)*(l-2)*stripMiddleIM570 a k l t)
 (hg : 0 ≤ stripMiddleGapM570 a k l t) : c₂*c₄ ≤ c₃^2 := by
 have he : 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*(k+1)*
   (c₃^2-c₂*c₄)=C^2*l^2*(l-1)*stripMiddleGapM570 a k l t := by
   unfold stripMiddleGapM570
   linear_combination
     4*(k+l-5)*(k+l-6)*(k+1)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*c₃+
       C*l*(l-1)*stripHMB9D a k l)*h₃-
     3*(k+l-3)*(k+l-4)*(24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*c₄*h₂+
       C*l*stripJMB9D a k l*h₄)
 have hp : 0 < 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*(k+1) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   have : 0<k+l-5 := by linarith
   have : 0<k+l-6 := by linarith
   have : 0<k+1 := by linarith
   positivity
 have hn : 0 ≤ C^2*l^2*(l-1)*stripMiddleGapM570 a k l t :=
   mul_nonneg (mul_nonneg (by positivity) (by linarith)) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
