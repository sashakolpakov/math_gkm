import MarkovHorizontalFourthSeedM511
/-! Machine-authored 81f80b2d. Raw row-two gap, with all statistics. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
def highJM81F (a k l q : ℝ) : ℝ :=
 8*q*l*(l-1)*(l-2)+(9*a^2-5*a+2)*k*l*(l-1)+
 (6*a^2+6*a*(k+l+2)-16*a+4)*k*(k-1)*l+
 (a+k+l+1)*(a+k+l)*k*(k-1)*(k-2)
def highHM81F (a k l q t u : ℝ) : ℝ :=
 (h3c0M13D u)*1*(l-1)*(l-1-1)*(l-1-2)*(l-1-3)*(l-1-4)+
 (h3c1M13D a q t)*(k+1)*(l-1)*(l-1-1)*(l-1-2)*(l-1-3)+
 (h3c2M13D a (k+l+2) q)*(k+1)*(k+1-1)*(l-1)*(l-1-1)*(l-1-2)+
 (h3c3M13D a (k+l+2))*(k+1)*(k+1-1)*(k+1-2)*(l-1)*(l-1-1)+
 (h3c4M13D a (k+l+2))*(k+1)*(k+1-1)*(k+1-2)*(k+1-3)*(l-1)+
 (h3c5M13D a (k+l+2))*(k+1)*(k+1-1)*(k+1-2)*(k+1-3)*(k+1-4)*1
def highIM81F (a k l q t u v w z : ℝ) : ℝ :=
 (h4c0M511 a (k+l+2) q t u v w z)*1*(l-2)*(l-2-1)*(l-2-2)*(l-2-3)*(l-2-4)*(l-2-5)*(l-2-6)+
 (h4c1M511 a (k+l+2) q t u v w z)*(k+2)*(l-2)*(l-2-1)*(l-2-2)*(l-2-3)*(l-2-4)*(l-2-5)+
 (h4c2M511 a (k+l+2) q t u v w z)*(k+2)*(k+2-1)*(l-2)*(l-2-1)*(l-2-2)*(l-2-3)*(l-2-4)+
 (h4c3M511 a (k+l+2) q t u v w z)*(k+2)*(k+2-1)*(k+2-2)*(l-2)*(l-2-1)*(l-2-2)*(l-2-3)+
 (h4c4M511 a (k+l+2) q t u v w z)*(k+2)*(k+2-1)*(k+2-2)*(k+2-3)*(l-2)*(l-2-1)*(l-2-2)+
 (h4c5M511 a (k+l+2) q t u v w z)*(k+2)*(k+2-1)*(k+2-2)*(k+2-3)*(k+2-4)*(l-2)*(l-2-1)+
 (h4c6M511 a (k+l+2) q t u v w z)*(k+2)*(k+2-1)*(k+2-2)*(k+2-3)*(k+2-4)*(k+2-5)*(l-2)+
 (h4c7M511 a (k+l+2) q t u v w z)*(k+2)*(k+2-1)*(k+2-2)*(k+2-3)*(k+2-4)*(k+2-5)*(k+2-6)*1
def highGapM81F (a k l q t u v w z : ℝ) : ℝ :=
 4*(k+l-5)*(k+l-6)*(k+2)*l*(highHM81F a k l q t u)^2-
 3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*highJM81F a k l q*highIM81F a k l q t u v w z
end
end MathGKM.Markov
