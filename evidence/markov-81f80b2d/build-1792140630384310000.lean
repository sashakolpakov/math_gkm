import MarkovHighCone1DefsM81F
/-! Machine-authored 81f80b2d. Raw row-two gap, with all statistics. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem c1j_expandM81F (k l q : ℝ) : 9*(highJM81F ((2*(k+l+2)+q)/3) k l (2*((2*(k+l+2)+q)/3)-(k+l+2)))=c1j0M81F k l+c1j1M81F k l*q^1+c1j2M81F k l*q^2 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c1j0M81F,c1j1M81F,c1j2M81F]
 ring
theorem c1h_expandM81F (k l q : ℝ) : 27*(highHM81F ((2*(k+l+2)+q)/3) k l (2*((2*(k+l+2)+q)/3)-(k+l+2)) (k+l+2-(2*(k+l+2)+q)/3) (q))=c1h0M81F k l+c1h1M81F k l*q^1+c1h2M81F k l*q^2+c1h3M81F k l*q^3 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c1h0M81F,c1h1M81F,c1h2M81F,c1h3M81F]
 ring
theorem c1i_expandM81F (k l q : ℝ) : 81*(highIM81F ((2*(k+l+2)+q)/3) k l (2*((2*(k+l+2)+q)/3)-(k+l+2)) (k+l+2-(2*(k+l+2)+q)/3) (q) (0) (k+l+2-(2*(k+l+2)+q)/3) (0))=c1i0M81F k l+c1i1M81F k l*q^1+c1i2M81F k l*q^2+c1i3M81F k l*q^3+c1i4M81F k l*q^4 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c1i0M81F,c1i1M81F,c1i2M81F,c1i3M81F,c1i4M81F]
 ring
theorem high_expand1M81F (k l q : ℝ) :
 729*highCone1M81F k l q=c1g0M81F k l+c1g1M81F k l*q^1+c1g2M81F k l*q^2+c1g3M81F k l*q^3+c1g4M81F k l*q^4+c1g5M81F k l*q^5+c1g6M81F k l*q^6 := by
 have hj := c1j_expandM81F k l q
 have hh := c1h_expandM81F k l q
 have hi := c1i_expandM81F k l q
 have he : 729*highCone1M81F k l q=
  4*(k+l-5)*(k+l-6)*(k+2)*l*(c1h0M81F k l+c1h1M81F k l*q^1+c1h2M81F k l*q^2+c1h3M81F k l*q^3)^2-
  3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*(c1j0M81F k l+c1j1M81F k l*q^1+c1j2M81F k l*q^2)*(c1i0M81F k l+c1i1M81F k l*q^1+c1i2M81F k l*q^2+c1i3M81F k l*q^3+c1i4M81F k l*q^4) := by
  unfold highCone1M81F highGapM81F
  linear_combination
   4*(k+l-5)*(k+l-6)*(k+2)*l*(27*(highHM81F ((2*(k+l+2)+q)/3) k l (2*((2*(k+l+2)+q)/3)-(k+l+2)) (k+l+2-(2*(k+l+2)+q)/3) (q))+(c1h0M81F k l+c1h1M81F k l*q^1+c1h2M81F k l*q^2+c1h3M81F k l*q^3))*hh-
   3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*(81*(highIM81F ((2*(k+l+2)+q)/3) k l (2*((2*(k+l+2)+q)/3)-(k+l+2)) (k+l+2-(2*(k+l+2)+q)/3) (q) (0) (k+l+2-(2*(k+l+2)+q)/3) (0))*hj+(c1j0M81F k l+c1j1M81F k l*q^1+c1j2M81F k l*q^2)*hi)
 rw [he]
 unfold c1g0M81F c1g1M81F c1g2M81F c1g3M81F c1g4M81F c1g5M81F c1g6M81F
 ring
end
end MathGKM.Markov
