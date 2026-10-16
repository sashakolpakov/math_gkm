import MarkovHighCone0DefsM81F
/-! Machine-authored 81f80b2d. Raw row-two gap, with all statistics. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem c0j_expandM81F (k l q : ℝ) : 4*(highJM81F ((k+l+2+q)/2) k l (q))=c0j0M81F k l+c0j1M81F k l*q^1+c0j2M81F k l*q^2 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c0j0M81F,c0j1M81F,c0j2M81F]
 ring
theorem c0h_expandM81F (k l q : ℝ) : 8*(highHM81F ((k+l+2+q)/2) k l (q) (k+l+2-(k+l+2+q)/2) (0))=c0h0M81F k l+c0h1M81F k l*q^1+c0h2M81F k l*q^2+c0h3M81F k l*q^3 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c0h0M81F,c0h1M81F,c0h2M81F,c0h3M81F]
 ring
theorem c0i_expandM81F (k l q : ℝ) : 16*(highIM81F ((k+l+2+q)/2) k l (q) (k+l+2-(k+l+2+q)/2) (0) (0) (q) (0))=c0i0M81F k l+c0i1M81F k l*q^1+c0i2M81F k l*q^2+c0i3M81F k l*q^3+c0i4M81F k l*q^4 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c0i0M81F,c0i1M81F,c0i2M81F,c0i3M81F,c0i4M81F]
 ring
theorem high_expand0M81F (k l q : ℝ) :
 64*highCone0M81F k l q=c0g0M81F k l+c0g1M81F k l*q^1+c0g2M81F k l*q^2+c0g3M81F k l*q^3+c0g4M81F k l*q^4+c0g5M81F k l*q^5+c0g6M81F k l*q^6 := by
 have hj := c0j_expandM81F k l q
 have hh := c0h_expandM81F k l q
 have hi := c0i_expandM81F k l q
 have he : 64*highCone0M81F k l q=
  4*(k+l-5)*(k+l-6)*(k+2)*l*(c0h0M81F k l+c0h1M81F k l*q^1+c0h2M81F k l*q^2+c0h3M81F k l*q^3)^2-
  3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*(c0j0M81F k l+c0j1M81F k l*q^1+c0j2M81F k l*q^2)*(c0i0M81F k l+c0i1M81F k l*q^1+c0i2M81F k l*q^2+c0i3M81F k l*q^3+c0i4M81F k l*q^4) := by
  unfold highCone0M81F highGapM81F
  linear_combination
   4*(k+l-5)*(k+l-6)*(k+2)*l*(8*(highHM81F ((k+l+2+q)/2) k l (q) (k+l+2-(k+l+2+q)/2) (0))+(c0h0M81F k l+c0h1M81F k l*q^1+c0h2M81F k l*q^2+c0h3M81F k l*q^3))*hh-
   3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*(16*(highIM81F ((k+l+2+q)/2) k l (q) (k+l+2-(k+l+2+q)/2) (0) (0) (q) (0))*hj+(c0j0M81F k l+c0j1M81F k l*q^1+c0j2M81F k l*q^2)*hi)
 rw [he]
 unfold c0g0M81F c0g1M81F c0g2M81F c0g3M81F c0g4M81F c0g5M81F c0g6M81F
 ring
end
end MathGKM.Markov
