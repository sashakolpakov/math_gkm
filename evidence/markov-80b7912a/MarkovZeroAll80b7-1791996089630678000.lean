import MarkovZeroWeight80b7
/-! Machine-authored 80b7912a. All three raw directions for the zero-weight
Pell deformation. This is not the weight-one source target. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def zeroBin80 (a k j : ℕ) : ℤ := (a.choose k : ℤ)*((2*k).choose j : ℤ)

theorem zeroBin_step80 (a k j : ℕ) (hk : k ≤ a) (hj : j ≤ 2*k) :
 zeroBin80 a (k+1) (j+1)*((j:ℤ)+1)*(2*k+1-j)=
 2*(a-k)*(2*k+1)*zeroBin80 a k j := by
 have h0 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_succ_right_eq a k)
 have h1 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.succ_mul_choose_eq (2*k+1) j)
 have h2 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.choose_mul_succ_eq (2*k) j)
 push_cast at h0 h1 h2
 rw [Nat.cast_sub hk] at h0
 rw [Nat.cast_sub (show j ≤ 2*k+1 by omega)] at h2
 push_cast at h0 h2
 have he : 2*(k+1)=2*k+1+1 := by omega
 unfold zeroBin80
 rw [he]
 have h : ((k:ℤ)+1)*
   ((((a.choose (k+1) : ℤ)*((2*k+1+1).choose (j+1) : ℤ))*
       (j+1)*(2*k+1-j))-2*(a-k)*(2*k+1)*
       ((a.choose k : ℤ)*((2*k).choose j : ℤ)))=0 := by
   linear_combination
     -((k:ℤ)+1)*(a.choose (k+1) : ℤ)*(2*k+1-j)*h1 -
     ((k:ℤ)+1)*(a.choose (k+1) : ℤ)*(2*k+2)*h2 +
     2*(2*(k:ℤ)+1)*((2*k).choose j : ℤ)*h0
 have hp : (0:ℤ)<k+1 := by omega
 exact (mul_eq_zero.mp h).resolve_left (ne_of_gt hp) |> sub_eq_zero.mp

theorem zeroBin_vertical80 (a k j : ℕ) :
 zeroBin80 a k j*zeroBin80 a (k+2) (j+2) ≤ zeroBin80 a (k+1) (j+1)^2 := by
 by_cases hk : a<k+2
 · have hz : zeroBin80 a (k+2) (j+2)=0 := by
     simp [zeroBin80,Nat.choose_eq_zero_of_lt hk]
   rw [hz,mul_zero]; exact sq_nonneg _
 by_cases hj : 2*k<j
 · have hz : zeroBin80 a k j=0 := by simp [zeroBin80,Nat.choose_eq_zero_of_lt hj]
   rw [hz,zero_mul]; exact sq_nonneg _
 have h0 := zeroBin_step80 a k j (by omega) (by omega)
 have h1 := zeroBin_step80 a (k+1) (j+1) (by omega) (by omega)
 simp only [show k+1+1=k+2 by omega,show j+1+1=j+2 by omega] at h1
 push_cast at h1
 let r : ℤ := 2*k-j
 have hr : 0 ≤ r := by dsimp [r]; omega
 have ha : (1:ℤ) ≤ a-k-1 := by omega
 have hcert :
   2*((a:ℤ)-k)*(2*k+1)*(j+2)*(r+2)-
   2*((a:ℤ)-k-1)*(2*k+3)*(j+1)*(r+1)=
   2*((a:ℤ)-k-1)*((j+1)^2+(r+1)^2-1)+
   2*(2*(k:ℤ)+1)*(j+2)*(r+2) := by dsimp [r]; ring
 have hc : 0 ≤
   2*((a:ℤ)-k)*(2*k+1)*(j+2)*(r+2)-
   2*((a:ℤ)-k-1)*(2*k+3)*(j+1)*(r+1) := by
   rw [hcert]
   have hj0 : (0:ℤ)≤j := by positivity
   have hs : (0:ℤ)≤(j+1)^2+(r+1)^2-1 := by nlinarith
   positivity
 have hz0 : 0 ≤ zeroBin80 a k j := by unfold zeroBin80; positivity
 have hz1 : 0 ≤ zeroBin80 a (k+1) (j+1) := by unfold zeroBin80; positivity
 have hid : (j+1)*(r+1)*(j+2)*(r+2)*
   (zeroBin80 a (k+1) (j+1)^2-zeroBin80 a k j*zeroBin80 a (k+2) (j+2))=
   zeroBin80 a k j*zeroBin80 a (k+1) (j+1)*
   (2*((a:ℤ)-k)*(2*k+1)*(j+2)*(r+2)-
    2*((a:ℤ)-k-1)*(2*k+3)*(j+1)*(r+1)) := by
   dsimp [r] at *
   linear_combination
     (j+2)*(2*(k:ℤ)-j+2)*zeroBin80 a (k+1) (j+1)*h0 -
     (j+1)*(2*(k:ℤ)-j+1)*zeroBin80 a k j*h1
 have hp : (0:ℤ)<(j+1)*(r+1)*(j+2)*(r+2) := by positivity
 have hn := mul_nonneg (mul_nonneg hz0 hz1) hc
 rw [← hid] at hn
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hp).mp hn)

theorem zero_weight_vertical80 (a i j : ℕ) :
 coeff (typeP3 0 a) i j*coeff (typeP3 0 a) i (j+2) ≤
 coeff (typeP3 0 a) i (j+1)^2 := by
 by_cases h : i+j<a
 · rw [zero_weight_below80 a i j h,zero_mul]; exact sq_nonneg _
 · let k := i+j-a
   have he : i+j=a+k := by dsimp [k]; omega
   rw [zero_weight_raw_coeff80 a i j k he,
     zero_weight_raw_coeff80 a i (j+2) (k+2) (by omega),
     zero_weight_raw_coeff80 a i (j+1) (k+1) (by omega)]
   exact zeroBin_vertical80 a k j

theorem zero_weight_diagonal80 (a i j : ℕ) :
 coeff (typeP3 0 a) i (j+2)*coeff (typeP3 0 a) (i+2) j ≤
 coeff (typeP3 0 a) (i+1) (j+1)^2 := by
 by_cases h : i+(j+2)<a
 · rw [zero_weight_below80 a i (j+2) h,zero_mul]; exact sq_nonneg _
 · let k := i+j+2-a
   have he : i+(j+2)=a+k := by dsimp [k]; omega
   rw [zero_weight_raw_coeff80 a i (j+2) k he,
     zero_weight_raw_coeff80 a (i+2) j k (by omega),
     zero_weight_raw_coeff80 a (i+1) (j+1) k (by omega)]
   have h := choose_raw_lc1998 (2*k) j
   have hh := mul_le_mul_of_nonneg_left h (sq_nonneg (a.choose k : ℤ))
   nlinarith

theorem zero_weight_all80 (a : ℕ) : GlobalLC18 (typeP3 0 a) :=
 ⟨zero_weight_horizontal80 a,zero_weight_vertical80 a,zero_weight_diagonal80 a⟩

#print axioms zeroBin_step80
#print axioms zeroBin_vertical80
#print axioms zero_weight_all80
end
end MathGKM.Markov
