import MarkovVerticalCertificateB5
/-! Machine-authored b5dbe087. Zero-retaining algebraic aggregation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem vertical_triple_boundB5 (i j : ℕ) (b n f l m r : ℝ)
 (hb : 0 ≤ b) (hbn : b+1 ≤ n) (hs : n+b=(i:ℝ)+j+1) (hd : 2 ≤ i+j)
 (hm : ((j:ℝ)+1)*m=f*(b*(j+1)+n*i))
 (hr : ((j:ℝ)+1)*(j+2)*r=((i:ℝ)+j+1)*(i+j+2)*f)
 (hl : 2*((i:ℝ)+j)*(i+j-1)*l=
   (n*(n-1)*i*(i-1)+2*(b*n+n-3*b-1)*i*j+b*(b-1)*j*(j-1))*f) :
 l*r ≤ m^2 := by
 have hgap := verticalGap_nonnegB5 i j b hb (by linarith) hd
 have hn : n=(i:ℝ)+j+1-b := by linarith
 have hid : 2*((i:ℝ)+j)*(i+j-1)*(j+1)^2*(j+2)*(m^2-l*r)=
     f^2*verticalGapB5 i j b := by
   have hm2 := congrArg (fun z : ℝ => z^2) hm
   have hlr := congrArg₂ (fun x y : ℝ => x*y) hl hr
   unfold verticalGapB5
   dsimp only
   rw [← hn]
   linear_combination 2*((i:ℝ)+j)*(i+j-1)*(j+2)*hm2 - (j+1)*hlr
 have hp : 0 ≤ f^2*verticalGapB5 i j b := mul_nonneg (sq_nonneg _) hgap
 rw [← hid] at hp
 have hdR : (2:ℝ) ≤ (i:ℝ)+j := by exact_mod_cast hd
 have hfactor : 0 < 2*((i:ℝ)+j)*(i+j-1)*(j+1)^2*(j+2) := by
   have : 0 < (i:ℝ)+j-1 := by linarith
   positivity
 have := (mul_nonneg_iff_of_pos_left hfactor).mp hp
 linarith

#print axioms vertical_triple_boundB5
end
end MathGKM.Markov
