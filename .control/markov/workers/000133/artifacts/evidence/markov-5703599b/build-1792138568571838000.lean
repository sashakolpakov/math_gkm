import MarkovNextDefsM570
/-! Machine-authored 5703599b. Next-cone split certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
theorem nj_expandM570 (k l t : ℝ) :
 9*stripJMB9D ((k+l+9+t)/3) k (l+7)=nj0M570 k l+nj1M570 k l*t^1+nj2M570 k l*t^2 := by
 unfold stripJMB9D nj0M570 nj1M570 nj2M570
 ring
theorem nh_expandM570 (k l t : ℝ) :
 27*stripHMCE8 ((k+l+9+t)/3) k (l+7) t=nh0M570 k l+nh1M570 k l*t^1+nh2M570 k l*t^2+nh3M570 k l*t^3 := by
 unfold stripHMCE8 stripHMB9D nh0M570 nh1M570 nh2M570 nh3M570
 ring
theorem nr_expandM570 (k l t : ℝ) :
 81*stripNextIM570 ((k+l+9+t)/3) k (l+7) t=nr0M570 k l+nr1M570 k l*t^1+nr2M570 k l*t^2+nr3M570 k l*t^3+nr4M570 k l*t^4 := by
 unfold stripNextIM570 stripIMD11 h4c3M511 h4c4M511 h4c5M511 h4c6M511 h4c7M511 nr0M570 nr1M570 nr2M570 nr3M570 nr4M570
 ring
theorem next_expandM570 (k l t : ℝ) :
 729*stripNextGapM570 ((k+l+9+t)/3) k (l+7) t=
 ng0M570 k l+ng1M570 k l*t^1+ng2M570 k l*t^2+ng3M570 k l*t^3+ng4M570 k l*t^4+ng5M570 k l*t^5+ng6M570 k l*t^6 := by
 have hj := nj_expandM570 k l t
 have hh := nh_expandM570 k l t
 have hr := nr_expandM570 k l t
 have he : 729*stripNextGapM570 ((k+l+9+t)/3) k (l+7) t=
   nextFM570 k l*(nh0M570 k l+nh1M570 k l*t^1+nh2M570 k l*t^2+nh3M570 k l*t^3)^2-nextEM570 k l*(nj0M570 k l+nj1M570 k l*t^1+nj2M570 k l*t^2)*(nr0M570 k l+nr1M570 k l*t^1+nr2M570 k l*t^2+nr3M570 k l*t^3+nr4M570 k l*t^4) := by
   unfold stripNextGapM570 nextFM570 nextEM570
   linear_combination
    4*(k+l+2)*(k+l+1)*(l+6)*
      (27*stripHMCE8 ((k+l+9+t)/3) k (l+7) t+(nh0M570 k l+nh1M570 k l*t^1+nh2M570 k l*t^2+nh3M570 k l*t^3))*hh-
    3*(k+l+4)*(k+l+3)*(l+5)*(k+1)*
      (81*stripNextIM570 ((k+l+9+t)/3) k (l+7) t*hj+(nj0M570 k l+nj1M570 k l*t^1+nj2M570 k l*t^2)*hr)
 rw [he]
 unfold ng0M570 ng1M570 ng2M570 ng3M570 ng4M570 ng5M570 ng6M570
 ring
end
end MathGKM.Markov
