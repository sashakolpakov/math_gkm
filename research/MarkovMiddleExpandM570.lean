import MarkovMiddleDefsM570
/-! Machine-authored request 5703599b. Coefficient-wise middle-cone certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
theorem j_expandM570 (k l t : ℝ) :
 16*stripJMB9D ((k+l+9+t)/4) k (l+7)=j0M570 k l+j1M570 k l*t^1+j2M570 k l*t^2 := by
 unfold stripJMB9D j0M570 j1M570 j2M570
 ring
theorem h_expandM570 (k l t : ℝ) :
 64*stripHMB9D ((k+l+9+t)/4) k (l+7)=h0M570 k l+h1M570 k l*t^1+h2M570 k l*t^2+h3M570 k l*t^3 := by
 unfold stripHMB9D h0M570 h1M570 h2M570 h3M570
 ring
theorem r_expandM570 (k l t : ℝ) :
 256*stripMiddleIM570 ((k+l+9+t)/4) k (l+7) t=r0M570 k l+r1M570 k l*t^1+r2M570 k l*t^2+r3M570 k l*t^3+r4M570 k l*t^4 := by
 unfold stripMiddleIM570 stripIMD11 h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511 r0M570 r1M570 r2M570 r3M570 r4M570
 ring
theorem gap_expandM570 (k l t : ℝ) :
 4096*stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t=
 g0M570 k l+g1M570 k l*t^1+g2M570 k l*t^2+g3M570 k l*t^3+g4M570 k l*t^4+g5M570 k l*t^5+g6M570 k l*t^6 := by
 have hj := j_expandM570 k l t
 have hh := h_expandM570 k l t
 have hr := r_expandM570 k l t
 have he : 4096*stripMiddleGapM570 ((k+l+9+t)/4) k (l+7) t=
   gapFM570 k l*(h0M570 k l+h1M570 k l*t^1+h2M570 k l*t^2+h3M570 k l*t^3)^2-gapEM570 k l*(j0M570 k l+j1M570 k l*t^1+j2M570 k l*t^2)*(r0M570 k l+r1M570 k l*t^1+r2M570 k l*t^2+r3M570 k l*t^3+r4M570 k l*t^4) := by
   unfold stripMiddleGapM570 gapFM570 gapEM570
   linear_combination
    4*(k+l+2)*(k+l+1)*(l+6)*(k+1)*
      (64*stripHMB9D ((k+l+9+t)/4) k (l+7)+(h0M570 k l+h1M570 k l*t^1+h2M570 k l*t^2+h3M570 k l*t^3))*hh-
    3*(k+l+4)*(k+l+3)*(l+5)*
      (256*stripMiddleIM570 ((k+l+9+t)/4) k (l+7) t*hj+(j0M570 k l+j1M570 k l*t^1+j2M570 k l*t^2)*hr)
 rw [he]
 unfold g0M570 g1M570 g2M570 g3M570 g4M570 g5M570 g6M570
 ring
end
end MathGKM.Markov
