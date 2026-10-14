import MarkovNextCertificate7955
/-! Machine-authored 7955df0c. No coefficient division; zeros retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem next_triple_bound7955 (i j : ℕ) (b n f l m r s : ℝ)
 (hb : 0 ≤ b) (hbn : b+1 ≤ n) (hs : n+b=(i:ℝ)+j+2) (hd : 3 ≤ i+j)
 (hs0 : 0 ≤ s)
 (hm : 2*((i:ℝ)+j)*(i+1)*m=f*nextQ7955 i j b n)
 (hr : ((i:ℝ)+1)*(i+2)*r=((i:ℝ)+j+1)*f*(n*(i+2)+b*j))
 (hl : 6*((i:ℝ)+j)*(i+j-1)*(i+j-2)*l=nextT7955 i j b n s*f) :
 l*r ≤ m^2 := by
 have hn : n=(i:ℝ)+j+2-b := by linarith
 have hg := nextGap_nonneg7955 i j b hb (by linarith) hd
 have hj : 0 ≤ (j:ℝ)*(j-1) := by
   rcases j with _ | j
   · norm_num
   · simp only [Nat.cast_add,Nat.cast_one,add_sub_cancel_right]
     positivity
 have ht : nextT7955 i j b n s ≤ nextT7955 i j b n 0 := by
   have he : nextT7955 i j b n 0-nextT7955 i j b n s=12*s*i*((j:ℝ)*(j-1)) := by
     unfold nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
     ring
   have hp : 0 ≤ 12*s*i*((j:ℝ)*(j-1)) := by positivity
   linarith
 have hn0 : 0 ≤ n := by linarith
 have hc : 0 ≤ 2*((i:ℝ)+j)*(i+j+1)*(i+1)*(n*(i+2)+b*j) := by positivity
 have hh := mul_le_mul_of_nonneg_left ht hc
 have hactual : 0 ≤
   3*((i:ℝ)+j-1)*(i+j-2)*(i+2)*(nextQ7955 i j b n)^2-
   2*((i:ℝ)+j)*(i+j+1)*(i+1)*nextT7955 i j b n s*(n*(i+2)+b*j) := by
   unfold nextGap7955 at hg
   dsimp only at hg
   rw [←hn] at hg
   nlinarith only [hg,hh]
 have hid :
   12*((i:ℝ)+j)^2*(i+j-1)*(i+j-2)*(i+1)^2*(i+2)*(m^2-l*r)=
   f^2*(3*((i:ℝ)+j-1)*(i+j-2)*(i+2)*(nextQ7955 i j b n)^2-
   2*((i:ℝ)+j)*(i+j+1)*(i+1)*nextT7955 i j b n s*(n*(i+2)+b*j)) := by
   have hm2 := congrArg (fun z : ℝ => z^2) hm
   have hlr := congrArg₂ (fun x y : ℝ => x*y) hl hr
   linear_combination 3*((i:ℝ)+j-1)*(i+j-2)*(i+2)*hm2-2*((i:ℝ)+j)*(i+1)*hlr
 have hp := mul_nonneg (sq_nonneg f) hactual
 rw [←hid] at hp
 have hdR : (3:ℝ) ≤ (i:ℝ)+j := by exact_mod_cast hd
 have hf : 0 < 12*((i:ℝ)+j)^2*(i+j-1)*(i+j-2)*(i+1)^2*(i+2) := by
   have : 0 < (i:ℝ)+j := by linarith
   have : 0 < (i:ℝ)+j-1 := by linarith
   have : 0 < (i:ℝ)+j-2 := by linarith
   positivity
 have := (mul_nonneg_iff_of_pos_left hf).mp hp
 linarith

#print axioms next_triple_bound7955
end
end MathGKM.Markov
