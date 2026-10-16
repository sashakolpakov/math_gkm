import MarkovUpperCrossMEC6
/-! Machine-authored ec6f4b83. Rising weights and zero-aware summand support. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem rising_inwardMEC6 (s h k : ℕ) (hk : h < k) :
 ((s+h).choose h:ℤ)*((s+k).choose k:ℤ) ≤
 ((s+(h+1)).choose (h+1):ℤ)*((s+(k-1)).choose (k-1):ℤ) := by
 have h0 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (s+h) h)
 have h1 := congrArg (fun x : ℕ => (x:ℤ)) (Nat.add_one_mul_choose_eq (s+(k-1)) (k-1))
 rw [show s+(k-1)+1=s+k by omega,show k-1+1=k by omega] at h1
 rw [show s+h+1=s+(h+1) by omega] at h0
 push_cast at h0 h1
 have hg : ((h:ℤ)+1)*k*
   (((s+(h+1)).choose (h+1):ℤ)*((s+(k-1)).choose (k-1):ℤ)-
     ((s+h).choose h:ℤ)*((s+k).choose k:ℤ))=
   (s:ℤ)*(k-h-1)*((s+h).choose h:ℤ)*((s+(k-1)).choose (k-1):ℤ) := by
   linear_combination -(k:ℤ)*((s+(k-1)).choose (k-1):ℤ)*h0+
     ((h:ℤ)+1)*((s+h).choose h:ℤ)*h1
 have hp : 0 ≤ (s:ℤ)*(k-h-1)*((s+h).choose h:ℤ)*((s+(k-1)).choose (k-1):ℤ) := by
   have : 0 ≤ (k:ℤ)-h-1 := by omega
   positivity
 rw [←hg] at hp
 have hd : 0 < ((h:ℤ)+1)*k := by
   have : 0 < (k:ℤ) := by omega
   positivity
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hd).mp hp)

theorem upper_weight_inwardMEC6 (d h k : ℕ) (hd : 1 ≤ d) (hk : h < k) :
 ((2*d+h-1).choose h:ℤ)*((2*d+k-1).choose k:ℤ) ≤
 ((2*d+(h+1)-1).choose (h+1):ℤ)*((2*d+(k-1)-1).choose (k-1):ℤ) := by
 have he (x : ℕ) : 2*d+x-1=2*d-1+x := by omega
 simpa only [he] using rising_inwardMEC6 (2*d-1) h k hk

theorem upper_term_coreMEC6 (N d i h : ℕ) (hi : 1 ≤ i) (hh : h ≤ i) :
 upperTermM2B3 N d i h=((2*d+h-1).choose h:ℤ)*upperCoreM2B3 N i h := by
 simp [upperTermM2B3,upperCoreM2B3,show ¬(i=0 ∨ i<h) by omega,mul_assoc]

theorem upper_term_supportMEC6 (N d i h : ℕ) (hn : upperTermM2B3 N d i h ≠ 0) :
 1 ≤ i ∧ h ≤ i ∧ i ≤ N+2 := by
 have hg : ¬(i=0 ∨ i<h) := by
   intro hg
   simp [upperTermM2B3,hg] at hn
 have hN : i ≤ N+2 := by
   by_contra hN
   simp [upperTermM2B3,hg,
     Nat.choose_eq_zero_of_lt (by omega : N+i-h+1<2*i-1-h),
     Nat.choose_eq_zero_of_lt (by omega : N+i-h<2*i-1-h)] at hn
 exact ⟨by omega,by omega,hN⟩

end
end MathGKM.Markov
