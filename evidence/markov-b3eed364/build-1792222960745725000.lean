import MarkovTopEdgesMB3E
/-! Machine-authored b3eed364. Exact positive certificate for the first
upper-sector horizontal triple. Generated algebra is checked by ring. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
def topEdgeThirdMB3E (s d : ℚ) : ℚ :=
 choosePolyM0D3 (2*s+d+6) 3+4*(choosePolyM0D3 (2*s+d+7) 5-
 choosePolyM0D3 (s+d+7) 5-s*choosePolyM0D3 (s+d+6) 4)
def topEdgeSecondMB3E (s d : ℚ) : ℚ := 4*(s+1)*choosePolyM0D3 (s+d+4) 2
theorem top_edge_gap_positiveMB3E (s d : ℚ) (hs : 0 ≤ s) (hd : 0 ≤ d) :
 4*(d+1)*topEdgeThirdMB3E s d < topEdgeSecondMB3E s d^2 := by
 have he : 15*(topEdgeSecondMB3E s d^2-4*(d+1)*topEdgeThirdMB3E s d)=
  7440+
  8140*d^1+
  3490*d^2+
  680*d^3+
  50*d^4+
  23972*s^1+
  23652*s^1*d^1+
  9060*s^1*d^2+
  1560*s^1*d^3+
  100*s^1*d^4+
  28950*s^2+
  23740*s^2*d^1+
  7270*s^2*d^2+
  940*s^2*d^3+
  40*s^2*d^4+
  17360*s^3+
  10860*s^3*d^1+
  2300*s^3*d^2+
  160*s^3*d^3+
  5550*s^4+
  2320*s^4*d^1+
  250*s^4*d^2+
  908*s^5+
  188*s^5*d^1+
  60*s^6 := by
   unfold topEdgeSecondMB3E topEdgeThirdMB3E
   rw [binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295]
   simp only [binomial_poly_5M295]
   ring
 have hp : (0:ℚ)<7440+
  8140*d^1+
  3490*d^2+
  680*d^3+
  50*d^4+
  23972*s^1+
  23652*s^1*d^1+
  9060*s^1*d^2+
  1560*s^1*d^3+
  100*s^1*d^4+
  28950*s^2+
  23740*s^2*d^1+
  7270*s^2*d^2+
  940*s^2*d^3+
  40*s^2*d^4+
  17360*s^3+
  10860*s^3*d^1+
  2300*s^3*d^2+
  160*s^3*d^3+
  5550*s^4+
  2320*s^4*d^1+
  250*s^4*d^2+
  908*s^5+
  188*s^5*d^1+
  60*s^6 := by positivity
 linarith
end
end MathGKM.Markov
