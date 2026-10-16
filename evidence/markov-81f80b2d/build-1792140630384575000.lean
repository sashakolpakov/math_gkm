import MarkovHighCone2DefsM81F
/-! Machine-authored 81f80b2d. Raw row-two gap, with all statistics. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 20000
theorem c2j_expandM81F (k l q : ℝ) : 16*(highJM81F ((3*(k+l+2)+q)/4) k l (2*((3*(k+l+2)+q)/4)-(k+l+2)))=c2j0M81F k l+c2j1M81F k l*q^1+c2j2M81F k l*q^2 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c2j0M81F,c2j1M81F,c2j2M81F]
 ring
theorem c2h_expandM81F (k l q : ℝ) : 64*(highHM81F ((3*(k+l+2)+q)/4) k l (2*((3*(k+l+2)+q)/4)-(k+l+2)) (k+l+2-(3*(k+l+2)+q)/4) (3*((3*(k+l+2)+q)/4)-2*(k+l+2)))=c2h0M81F k l+c2h1M81F k l*q^1+c2h2M81F k l*q^2+c2h3M81F k l*q^3 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c2h0M81F,c2h1M81F,c2h2M81F,c2h3M81F]
 ring
theorem c2i_expandM81F (k l q : ℝ) : 256*(highIM81F ((3*(k+l+2)+q)/4) k l (2*((3*(k+l+2)+q)/4)-(k+l+2)) (k+l+2-(3*(k+l+2)+q)/4) (3*((3*(k+l+2)+q)/4)-2*(k+l+2)) (0) (k+l+2-(3*(k+l+2)+q)/4) (q))=c2i0M81F k l+c2i1M81F k l*q^1+c2i2M81F k l*q^2+c2i3M81F k l*q^3+c2i4M81F k l*q^4 := by
 simp only [highJM81F,highHM81F,highIM81F,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,h4c0M511,h4c1M511,h4c2M511,h4c3M511,h4c4M511,h4c5M511,h4c6M511,h4c7M511,c2i0M81F,c2i1M81F,c2i2M81F,c2i3M81F,c2i4M81F]
 ring
theorem high_expand2M81F (k l q : ℝ) :
 4096*highCone2M81F k l q=c2g0M81F k l+c2g1M81F k l*q^1+c2g2M81F k l*q^2+c2g3M81F k l*q^3+c2g4M81F k l*q^4+c2g5M81F k l*q^5+c2g6M81F k l*q^6 := by
 have hj := c2j_expandM81F k l q
 have hh := c2h_expandM81F k l q
 have hi := c2i_expandM81F k l q
 have he : 4096*highCone2M81F k l q=
  4*(k+l-5)*(k+l-6)*(k+2)*l*(c2h0M81F k l+c2h1M81F k l*q^1+c2h2M81F k l*q^2+c2h3M81F k l*q^3)^2-
  3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*(c2j0M81F k l+c2j1M81F k l*q^1+c2j2M81F k l*q^2)*(c2i0M81F k l+c2i1M81F k l*q^1+c2i2M81F k l*q^2+c2i3M81F k l*q^3+c2i4M81F k l*q^4) := by
  unfold highCone2M81F highGapM81F
  linear_combination
   4*(k+l-5)*(k+l-6)*(k+2)*l*(64*(highHM81F ((3*(k+l+2)+q)/4) k l (2*((3*(k+l+2)+q)/4)-(k+l+2)) (k+l+2-(3*(k+l+2)+q)/4) (3*((3*(k+l+2)+q)/4)-2*(k+l+2)))+(c2h0M81F k l+c2h1M81F k l*q^1+c2h2M81F k l*q^2+c2h3M81F k l*q^3))*hh-
   3*(k+l-3)*(k+l-4)*(k+1)*(l-1)*(256*(highIM81F ((3*(k+l+2)+q)/4) k l (2*((3*(k+l+2)+q)/4)-(k+l+2)) (k+l+2-(3*(k+l+2)+q)/4) (3*((3*(k+l+2)+q)/4)-2*(k+l+2)) (0) (k+l+2-(3*(k+l+2)+q)/4) (q))*hj+(c2j0M81F k l+c2j1M81F k l*q^1+c2j2M81F k l*q^2)*hi)
 rw [he]
 unfold c2g0M81F c2g1M81F c2g2M81F c2g3M81F c2g4M81F c2g5M81F c2g6M81F
 ring
end
end MathGKM.Markov
