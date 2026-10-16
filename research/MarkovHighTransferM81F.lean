import MarkovHighDefsM81F
/-! Machine-authored 81f80b2d. Positive clearing preserves the raw inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
theorem high_transferM81F (a k l q t u v w z C c₂ c₃ c₄ : ℝ)
 (hk : 0 ≤ k) (hl : 2 ≤ l) (hN : 7 ≤ k+l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*c₂=C*highJM81F a k l q)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*c₃=C*l*highHM81F a k l q t u)
 (h₄ : 24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*(k+2)*c₄=
   C*l*(l-1)*highIM81F a k l q t u v w z)
 (hg : 0 ≤ highGapM81F a k l q t u v w z) : c₂*c₄ ≤ c₃^2 := by
 have he : 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*(k+1)^2*(k+2)*
   (c₃^2-c₂*c₄)=C^2*l*highGapM81F a k l q t u v w z := by
   unfold highGapM81F
   linear_combination
     4*(k+l-5)*(k+l-6)*(k+2)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*c₃+
       C*l*highHM81F a k l q t u)*h₃-
     3*(k+l-3)*(k+l-4)*(k+1)*(24*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*(k+1)*(k+2)*c₄*h₂+
       C*highJM81F a k l q*h₄)
 have hp : 0 < 144*((k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4))^2*(k+l-5)*(k+l-6)*(k+1)^2*(k+2) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   have : 0<k+l-5 := by linarith
   have : 0<k+l-6 := by linarith
   have : 0<k+1 := by linarith
   have : 0<k+2 := by linarith
   positivity
 have hn : 0 ≤ C^2*l*highGapM81F a k l q t u v w z :=
   mul_nonneg (by positivity) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
