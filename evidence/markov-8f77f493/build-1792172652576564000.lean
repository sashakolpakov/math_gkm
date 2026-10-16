import MarkovPrefixM8F7
/-! Machine-authored 8f77f493. The exceptional weight-two comparison. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem weighted_nonnegM8F7 (b r k : ℕ) : 0≤weightedReverseM8F7 b r k := by
 unfold weightedReverseM8F7 weightNatM8F7 nbNatM8F7
 split_ifs <;> positivity

theorem prefix_nonnegM8F7 {f : ℕ → ℝ} (hf : ∀ k,0≤f k) (k : ℕ) :
 0≤prefixM8F7 f k := sum_nonneg (fun k _ => hf k)

theorem prefix_monoM8F7 {f : ℕ → ℝ} (hf : ∀ k,0≤f k) : Monotone (prefixM8F7 f) := by
 intro a b hab
 apply sum_le_sum_of_subset_of_nonneg (range_mono (by omega))
 intro k hk hn; exact hf k

theorem weighted_tail_antitoneM8F7 (b r x y : ℕ) (hx : 1≤x) (hxy : x≤y) :
 weightedReverseM8F7 b r y≤weightedReverseM8F7 b r x := by
 by_cases hy : y≤r
 · simp only [weightedReverseM8F7,if_pos hy,if_pos (show x≤r by omega),
     weightNatM8F7,if_neg (show x≠0 by omega),if_neg (show y≠0 by omega),nbNatM8F7]
   exact mul_le_mul_of_nonneg_left (by exact_mod_cast Nat.choose_le_choose b (by omega : r-y+b≤r-x+b)) (by norm_num)
 · rw [weightedReverseM8F7,if_neg hy]
   exact weighted_nonnegM8F7 _ _ _

theorem weight_initial_scalarM8F7 (b u : ℕ) :
 2*nbNatM8F7 b u*nbNatM8F7 (b+1) (u+1)≤
 nbNatM8F7 b (u+1)*(nbNatM8F7 (b+1) (u+1)+2*nbNatM8F7 (b+1) u) := by
 let A := nbNatM8F7 b (u+1)
 let D := nbNatM8F7 b u
 let E := nbNatM8F7 (b+1) (u+1)
 let F := nbNatM8F7 (b+1) u
 have hd : ((u:ℝ)+b+1)*D=((u:ℝ)+1)*A := by
   have h := Nat.choose_mul_succ_eq (u+b) b
   have h' : ((u+b).choose b:ℝ)*(u+b+1)=((u+b+1).choose b:ℝ)*(u+1) := by
     exact_mod_cast (show (u+b).choose b*(u+b+1)=(u+b+1).choose b*(u+1) by
       simpa only [show u+b+1-b=u+1 by omega] using h)
   simpa [A,D,nbNatM8F7,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm,mul_comm] using h'
 have he : ((b:ℝ)+1)*E=((u:ℝ)+b+2)*A := by
   have h := Nat.succ_mul_choose_eq (u+1+b) b
   have h' : ((u+1+b+1:ℕ):ℝ)*((u+1+b).choose b:ℝ)=
       ((u+1+b+1).choose (b+1):ℝ)*(b+1) := by exact_mod_cast h
   simpa [A,E,nbNatM8F7,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm,mul_comm,
     add_assoc,add_left_comm,add_comm] using h'.symm
 have hf : ((b:ℝ)+1)*F=((u:ℝ)+1)*A := by
   have h := Nat.choose_succ_right_eq (u+1+b) b
   have h' : ((u+1+b).choose (b+1):ℝ)*(b+1)=((u+1+b).choose b:ℝ)*(u+1) := by
     exact_mod_cast (show (u+1+b).choose (b+1)*(b+1)=(u+1+b).choose b*(u+1) by simpa using h)
   simpa [A,F,nbNatM8F7,Nat.add_assoc,Nat.add_left_comm,Nat.add_comm,mul_comm] using h'
 have hid : ((b:ℝ)+1)*((u:ℝ)+b+1)*(A*(E+2*F)-2*D*E)=
   A^2*((u:ℝ)^2+2*u*b+(b:ℝ)^2+u+3*b) := by
   linear_combination A*((u:ℝ)+b+1-2*(u+1))*he+
     2*((u:ℝ)+b+1)*A*hf-2*((b:ℝ)+1)*E*hd
 have hn : 0≤A^2*((u:ℝ)^2+2*u*b+(b:ℝ)^2+u+3*b) := by positivity
 have hp : 0<((b:ℝ)+1)*((u:ℝ)+b+1) := by positivity
 have hh : 0≤A*(E+2*F)-2*D*E := (mul_nonneg_iff_of_pos_left hp).mp (by rw [hid]; exact hn)
 change 2*D*E≤A*(E+2*F)
 linarith

theorem weighted_prefix_firstM8F7 (b r : ℕ) :
 weightedReverseM8F7 b r 1*prefixM8F7 (weightedReverseM8F7 (b+1) r) 0≤
 weightedReverseM8F7 b r 0*prefixM8F7 (weightedReverseM8F7 (b+1) r) 1 := by
 cases r with
 | zero => simp [weightedReverseM8F7,weightNatM8F7,nbNatM8F7,prefixM8F7]
 | succ u =>
   simpa [weightedReverseM8F7,weightNatM8F7,prefixM8F7,Finset.sum_range_succ,
     Nat.succ_eq_add_one,mul_comm,mul_left_comm,mul_assoc] using weight_initial_scalarM8F7 b u

theorem weighted_prefix_orderM8F7 (b r x y : ℕ) (hxy : x<y) :
 0≤weightedReverseM8F7 b r x*prefixM8F7 (weightedReverseM8F7 (b+1) r) y-
   weightedReverseM8F7 b r y*prefixM8F7 (weightedReverseM8F7 (b+1) r) x := by
 have hn := weighted_nonnegM8F7 b r
 have hc := prefix_nonnegM8F7 (weighted_nonnegM8F7 (b+1) r)
 have hm := prefix_monoM8F7 (weighted_nonnegM8F7 (b+1) r)
 by_cases hx : x=0
 · subst x
   have h1 := weighted_prefix_firstM8F7 b r
   have h2 := mul_le_mul_of_nonneg_right (weighted_tail_antitoneM8F7 b r 1 y (by omega) (by omega)) (hc 0)
   have h3 := mul_le_mul_of_nonneg_left (hm (by omega : 1≤y)) (hn 0)
   linarith
 · have h := mul_le_mul (weighted_tail_antitoneM8F7 b r x y (by omega) (by omega))
     (hm (by omega : x≤y)) (hc x) (hn x)
   linarith

end
end MathGKM.Markov
