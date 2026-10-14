import MarkovVerticalCertificate7d80
/-! Machine-authored 7d80a785. Positive scalar clearing, without coefficient division. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem vertical_triple_bound7d80 (i j : ℕ) (b n f l m r s s0 : ℝ)
 (hb : 0 ≤ b) (hbn : b+1 ≤ n) (hs : n+b=(i:ℝ)+j+2) (hd : 3 ≤ i+j)
 (hs0 : s0 ≤ s) (hg : 0 ≤ verticalGap7d80 i j b s0)
 (hm : 2*((i:ℝ)+j)*(j+1)*m=f*verticalQ7d80 i j b n)
 (hr : ((j:ℝ)+1)*(j+2)*r=((i:ℝ)+j+1)*f*(b*(j+2)+n*i))
 (hl : 6*((i:ℝ)+j)*(i+j-1)*(i+j-2)*l=nextT7955 i j b n s*f) :
 l*r ≤ m^2 := by
 have hn : n=(i:ℝ)+j+2-b := by linarith
 have hj : 0 ≤ (j:ℝ)*(j-1) := by
   rcases j with _ | j
   · norm_num
   · simp only [Nat.cast_add,Nat.cast_one,add_sub_cancel_right]
     positivity
 have ht : nextT7955 i j b n s ≤ nextT7955 i j b n s0 := by
   have he : nextT7955 i j b n s0-nextT7955 i j b n s=12*(s-s0)*i*((j:ℝ)*(j-1)) := by
     unfold nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
     ring
   have hss : 0 ≤ s-s0 := sub_nonneg.mpr hs0
   have hp : 0 ≤ 12*(s-s0)*i*((j:ℝ)*(j-1)) := by positivity
   linarith
 have hb0 : 0 ≤ b := by linarith
 have hn0 : 0 ≤ n := by linarith
 have hc : 0 ≤ 2*((i:ℝ)+j)*(i+j+1)*(j+1)*(b*(j+2)+n*i) := by positivity
 have hh := mul_le_mul_of_nonneg_left ht hc
 have hactual : 0 ≤
   3*((i:ℝ)+j-1)*(i+j-2)*(j+2)*(verticalQ7d80 i j b n)^2-
   2*((i:ℝ)+j)*(i+j+1)*(j+1)*nextT7955 i j b n s*(b*(j+2)+n*i) := by
   unfold verticalGap7d80 at hg
   dsimp only at hg
   rw [←hn] at hg
   nlinarith only [hg,hh]
 have hid :
   12*((i:ℝ)+j)^2*(i+j-1)*(i+j-2)*(j+1)^2*(j+2)*(m^2-l*r)=
   f^2*(3*((i:ℝ)+j-1)*(i+j-2)*(j+2)*(verticalQ7d80 i j b n)^2-
   2*((i:ℝ)+j)*(i+j+1)*(j+1)*nextT7955 i j b n s*(b*(j+2)+n*i)) := by
   have hm2 := congrArg (fun z : ℝ => z^2) hm
   have hlr := congrArg₂ (fun x y : ℝ => x*y) hl hr
   linear_combination 3*((i:ℝ)+j-1)*(i+j-2)*(j+2)*hm2-2*((i:ℝ)+j)*(j+1)*hlr
 have hp := mul_nonneg (sq_nonneg f) hactual
 rw [←hid] at hp
 have hdR : (3:ℝ) ≤ (i:ℝ)+j := by exact_mod_cast hd
 have hf : 0 < 12*((i:ℝ)+j)^2*(i+j-1)*(i+j-2)*(j+1)^2*(j+2) := by
   have : 0 < (i:ℝ)+j := by linarith
   have : 0 < (i:ℝ)+j-1 := by linarith
   have : 0 < (i:ℝ)+j-2 := by linarith
   positivity
 have := (mul_nonneg_iff_of_pos_left hf).mp hp
 linarith

#print axioms vertical_triple_bound7d80
end
end MathGKM.Markov
