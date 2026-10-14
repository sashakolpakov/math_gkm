import MarkovTopBinomial58d2
import MarkovTopCertificate58d2
/-! Machine-authored 58d2f411. Algebraic aggregation of the top three layers. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem top_triple_bound58 (i j : ℕ) (b n f l m r : ℝ)
 (hb : 0 ≤ b) (hbn : b+1 ≤ n) (hs : n+b=(i:ℝ)+j+2) (hd : 2 ≤ i+j)
 (hm : ((i:ℝ)+1)*m=f*(n*(i+1)+b*j))
 (hr : ((i:ℝ)+1)*(i+2)*r=((i:ℝ)+j+1)*(i+j+2)*f)
 (hl : 2*((i:ℝ)+j)*(i+j-1)*l=
   (n*(n-1)*i*(i-1)+2*(b*n+n-3*b-1)*i*j+b*(b-1)*j*(j-1))*f) :
 2*n*l*r ≤ (n-1)*m^2 := by
 have hgap := topGap_nonneg58 i j b hb (by linarith) hd
 have hn : n=(i:ℝ)+j+2-b := by linarith
 have hid : ((i:ℝ)+j)*(i+j-1)*(i+1)^2*(i+2)*((n-1)*m^2-2*n*l*r)=
     f^2*topGap58 i j b := by
   have hm2 := congrArg (fun z : ℝ => z^2) hm
   have hlr := congrArg₂ (fun x y : ℝ => x*y) hl hr
   unfold topGap58
   dsimp only
   rw [← hn]
   linear_combination ((i:ℝ)+j)*(i+j-1)*(i+2)*(n-1)*hm2 - n*(i+1)*hlr
 have hp : 0 ≤ f^2*topGap58 i j b := mul_nonneg (sq_nonneg _) hgap
 rw [← hid] at hp
 have hdR : (2:ℝ) ≤ (i:ℝ)+j := by exact_mod_cast hd
 have hfactor : 0<((i:ℝ)+j)*(i+j-1)*(i+1)^2*(i+2) := by
   have : 0<(i:ℝ)+j-1 := by linarith
   positivity
 have := (mul_nonneg_iff_of_pos_left hfactor).mp hp
 linarith

#print axioms top_triple_bound58
end
end MathGKM.Markov
