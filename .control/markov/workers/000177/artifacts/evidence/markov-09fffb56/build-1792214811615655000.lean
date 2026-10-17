import MarkovSeparatedChooseMBE3
/-! Machine-authored 09fffb56. Treat the two correction binomials together. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def weightedChooseM09F (a k s : ℕ) : ℝ :=
 a*((k+s+4).choose (s+5):ℝ)+(3-a:ℝ)*((k+s+3).choose (s+5):ℝ)
def weightedLinearM09F (a k s : ℕ) : ℝ := 3*k+a*s+5*a-3

theorem weighted_choose_scaledM09F (a k s : ℕ) (hk : 1 ≤ k) :
 weightedChooseM09F a k s*(k+s+4)=((k+s+4).choose (s+5):ℝ)*weightedLinearM09F a k s := by
 have h := Nat.choose_mul_succ_eq (k+s+3) (s+5)
 rw [show k+s+3+1=k+s+4 by omega,show k+s+4-(s+5)=k-1 by omega] at h
 have hh : ((k+s+3).choose (s+5):ℝ)*(k+s+4)=((k+s+4).choose (s+5):ℝ)*(k-1) := by
   exact_mod_cast h
 unfold weightedChooseM09F weightedLinearM09F
 linear_combination (3-a:ℝ)*hh

theorem weighted_choose_stepM09F (a k s : ℕ) (hk : 1 ≤ k) :
 weightedChooseM09F a (k+1) s*k*weightedLinearM09F a k s=
 weightedChooseM09F a k s*(k+s+4)*(weightedLinearM09F a k s+3) := by
 have h0 := weighted_choose_scaledM09F a k s hk
 have h1 := weighted_choose_scaledM09F a (k+1) s (by omega)
 have ha := Nat.choose_mul_succ_eq (k+s+4) (s+5)
 rw [show k+s+4+1=k+1+s+4 by omega,show k+1+s+4-(s+5)=k by omega] at ha
 have ha' : ((k+s+4).choose (s+5):ℝ)*(k+s+5)=((k+1+s+4).choose (s+5):ℝ)*k := by
   have hh := congrArg (fun n : ℕ => (n:ℝ)) ha
   push_cast at hh
   linear_combination hh
 have hl : weightedLinearM09F a (k+1) s=weightedLinearM09F a k s+3 := by
   unfold weightedLinearM09F; push_cast; ring
 rw [hl] at h1
 push_cast at h1
 have hh : weightedChooseM09F a (k+1) s*k=
     ((k+s+4).choose (s+5):ℝ)*(weightedLinearM09F a k s+3) := by
   apply (mul_left_inj' (by positivity : (k:ℝ)+s+5≠0)).mp
   linear_combination (k:ℝ)*h1-(weightedLinearM09F a k s+3)*ha'
 rw [hh,h0]
 ring

theorem weighted_step_certificateM09F (a : ℕ) (ha : 1 ≤ a) (ha2 : a ≤ 2)
 (u x : ℝ) (hu : 0 ≤ u) (hx : 0 ≤ x) :
 (u+1+x+3+4)*(3*(u+1)+a*(x+3)+5*a)*
   (3*(u+1)+a+1)*(3*(u+1)+a+2)*(3*(u+1)+a+3) ≤
 (u+1)*(3*(u+1)+a*(x+3)+5*a-3)*
   (3*(u+1)+x+3+a+6)*(3*(u+1)+x+3+a+7)*(3*(u+1)+x+3+a+8) := by
 interval_cases a
 · norm_num
   have he : (u+1)*(3*(u+1)+(x+3)+5-3)*
       (3*(u+1)+x+3+1+6)*(3*(u+1)+x+3+1+7)*(3*(u+1)+x+3+1+8)-
       (u+1+x+3+4)*(3*(u+1)+(x+3)+5)*
       (3*(u+1)+1+1)*(3*(u+1)+1+2)*(3*(u+1)+1+3)=
     (3360+x*(3436+x*(713+x*(50+x))))+
       u*((8520+x*(6025+x*(1052+x*(62+x))))+
       u*((4464+x*(2526+x*(342+12*x)))+u*(648+x*(297+27*x)))) := by ring
   have hp : 0 ≤ (3360+x*(3436+x*(713+x*(50+x))))+
       u*((8520+x*(6025+x*(1052+x*(62+x))))+
       u*((4464+x*(2526+x*(342+12*x)))+u*(648+x*(297+27*x)))) := by positivity
   nlinarith only [he,hp]
 · norm_num
   have he : (u+1)*(3*(u+1)+2*(x+3)+10-3)*
       (3*(u+1)+x+3+2+6)*(3*(u+1)+x+3+2+7)*(3*(u+1)+x+3+2+8)-
       (u+1+x+3+4)*(3*(u+1)+2*(x+3)+10)*
       (3*(u+1)+2+1)*(3*(u+1)+2+2)*(3*(u+1)+2+3)=
     (2688+x*(5744+x*(1396+x*(106+2*x))))+
       u*((15168+x*(10880+x*(2011+x*(127+2*x))))+
       u*((6408+x*(3633+x*(522+21*x)))+u*(648+x*(297+27*x)))) := by ring
   have hp : 0 ≤ (2688+x*(5744+x*(1396+x*(106+2*x))))+
       u*((15168+x*(10880+x*(2011+x*(127+2*x))))+
       u*((6408+x*(3633+x*(522+21*x)))+u*(648+x*(297+27*x)))) := by positivity
   nlinarith only [he,hp]

theorem weighted_separated_chooseM09F (a k s : ℕ) (ha : 1 ≤ a) (ha2 : a ≤ 2)
 (hk : 1 ≤ k) (hs : 3 ≤ s) :
 ((s+9).choose 4:ℝ)*weightedChooseM09F a k s ≤ ((3*k+a+s+5).choose (s+5):ℝ) := by
 induction k, hk using Nat.le_induction with
 | base =>
   have hsym : (s+9).choose (s+5)=(s+9).choose 4 := by
     rw [←Nat.choose_symm (by omega : s+5 ≤ s+9),show s+9-(s+5)=4 by omega]
   have hw : weightedChooseM09F a 1 s=a := by
     unfold weightedChooseM09F
     rw [show 1+s+4=s+5 by omega,show 1+s+3=s+4 by omega,Nat.choose_self,
       Nat.choose_eq_zero_of_lt (by omega : s+4<s+5)]
     simp
   rw [hw]
   interval_cases a
   · simpa [show 3*1+1+s+5=s+9 by omega,hsym]
   · have h := Nat.choose_mul_succ_eq (s+9) (s+5)
     rw [show s+9+1=s+10 by omega,show s+10-(s+5)=5 by omega,hsym] at h
     have hh : ((s+9).choose 4:ℝ)*(s+10)=((s+10).choose (s+5):ℝ)*5 := by exact_mod_cast h
     simp only [show 3*1+2+s+5=s+10 by omega,Nat.cast_ofNat]
     nlinarith [mul_nonneg (show (0:ℝ) ≤ s by positivity) (show (0:ℝ) ≤ (s+9).choose 4 by positivity)]
 | succ k hk ih =>
   have hW := weighted_choose_stepM09F a k s hk
   have hB := choose_rise_threeMBE3 (3*k+a) (s+5)
   rw [show 3*k+a+(s+5)=3*k+a+s+5 by omega,
     show 3*k+a+s+5+3=3*(k+1)+a+s+5 by omega] at hB
   push_cast at hB
   have hkR : (1:ℝ) ≤ k := by exact_mod_cast hk
   have hsR : (3:ℝ) ≤ s := by exact_mod_cast hs
   have haR : (1:ℝ) ≤ a := by exact_mod_cast ha
   have hl : 0 < weightedLinearM09F a k s := by
     unfold weightedLinearM09F
     have h : (0:ℝ) ≤ a*s := by positivity
     nlinarith
   have hS := weighted_step_certificateM09F a ha ha2 (k-1) (s-3) (by linarith) (by linarith)
   simp only [sub_add_cancel] at hS
   have hp : (0:ℝ)<k*weightedLinearM09F a k s*((3*k+a+1)*(3*k+a+2)*(3*k+a+3)) := by positivity
   apply (mul_le_mul_iff_of_pos_right hp).mp
   calc
    _ = ((s+9).choose 4:ℝ)*weightedChooseM09F a k s*(k+s+4)*
       (weightedLinearM09F a k s+3)*((3*k+a+1)*(3*k+a+2)*(3*k+a+3)) := by
      linear_combination -((s+9).choose 4:ℝ)*((3*k+a+1)*(3*k+a+2)*(3*k+a+3))*hW
    _ ≤ ((3*k+a+s+5).choose (s+5):ℝ)*(k+s+4)*
       (weightedLinearM09F a k s+3)*((3*k+a+1)*(3*k+a+2)*(3*k+a+3)) := by
      exact mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right
        (mul_le_mul_of_nonneg_right ih (by positivity)) (by positivity)) (by positivity)
    _ ≤ ((3*k+a+s+5).choose (s+5):ℝ)*
       (k*weightedLinearM09F a k s*(3*k+a+s+6)*(3*k+a+s+7)*(3*k+a+s+8)) := by
      have h := mul_le_mul_of_nonneg_left hS (show (0:ℝ) ≤ (3*k+a+s+5).choose (s+5) by positivity)
      unfold weightedLinearM09F at *
      nlinarith only [h]
    _ = _ := by linear_combination -(k:ℝ)*weightedLinearM09F a k s*hB

end
end MathGKM.Markov
