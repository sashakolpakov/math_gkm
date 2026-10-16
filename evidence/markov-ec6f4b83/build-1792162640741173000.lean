import MarkovUpperFirstMEC6
/-! Machine-authored ec6f4b83. Universal shifted bound and horizontal source theorem. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem upper_core_shiftedMEC6 (N i h k : ℕ) (hN : 1 ≤ N) (hi : 1 ≤ i)
 (hh : h ≤ i) (hk : k ≤ i+2) (hiN : i ≤ N) :
 upperCoreM2B3 N i h*upperCoreM2B3 N (i+2) k ≤
 upperCoreM2B3 N (i+1) (min (h+1) k)*
 upperCoreM2B3 N (i+1) (max (h+1) k-1) := by
 by_cases hi1 : i=1
 · subst i
   have he : h=0 ∨ h=1 := by omega
   rcases he with he | he
   · subst h
     have hz : upperCoreM2B3 N 1 0=0 := by norm_num [upperCoreM2B3]
     rw [hz,zero_mul]
     exact mul_nonneg (upper_core_nonnegMEC6 _ _ _) (upper_core_nonnegMEC6 _ _ _)
   · subst h
     have hz : upperCoreM2B3 N 1 1=2 := by norm_num [upperCoreM2B3]
     rw [hz]
     exact upper_core_firstMEC6 N k hN hk
 have hi2 : 2 ≤ i := by omega
 by_cases hkh : k ≤ h
 · rw [min_eq_right (by omega : k ≤ h+1),max_eq_left (by omega : k ≤ h+1),Nat.add_sub_cancel]
   simpa [mul_comm] using upper_core_orderedMEC6 N i h k hi2 hkh hh hiN
 · rw [min_eq_left (by omega : h+1 ≤ k),max_eq_right (by omega : h+1 ≤ k)]
   by_cases he : k=h+1
   · subst k
     simpa [mul_comm] using upper_core_localMEC6 N i h hi2 hh hiN
   · exact upper_core_separatedMEC6 N i h k hi2 hh (by omega) hk hiN

theorem upper_weight_shiftedMEC6 (d h k : ℕ) (hd : 1 ≤ d) :
 ((2*d+h-1).choose h:ℤ)*((2*d+k-1).choose k:ℤ) ≤
 ((2*d+min (h+1) k-1).choose (min (h+1) k):ℤ)*
 ((2*d+(max (h+1) k-1)-1).choose (max (h+1) k-1):ℤ) := by
 by_cases hk : k ≤ h
 · rw [min_eq_right (by omega : k ≤ h+1),max_eq_left (by omega : k ≤ h+1),Nat.add_sub_cancel]
   exact le_of_eq (mul_comm _ _)
 · rw [min_eq_left (by omega : h+1 ≤ k),max_eq_right (by omega : h+1 ≤ k)]
   exact upper_weight_inwardMEC6 d h k hd (by omega)

theorem upper_term_shiftedMEC6 : UpperShiftedM2B3 := by
 intro N d i h k hN hd
 by_cases hz0 : upperTermM2B3 N d i h=0
 · rw [hz0,zero_mul]
   exact mul_nonneg (upper_term_nonnegM2B3 _ _ _ _) (upper_term_nonnegM2B3 _ _ _ _)
 by_cases hz2 : upperTermM2B3 N d (i+2) k=0
 · rw [hz2,mul_zero]
   exact mul_nonneg (upper_term_nonnegM2B3 _ _ _ _) (upper_term_nonnegM2B3 _ _ _ _)
 obtain ⟨hi,hh,hiN⟩ := upper_term_supportMEC6 N d i h hz0
 obtain ⟨_,hk,hkN⟩ := upper_term_supportMEC6 N d (i+2) k hz2
 have hm : min (h+1) k ≤ i+1 := by omega
 have hx : max (h+1) k-1 ≤ i+1 := by omega
 have hc := upper_core_shiftedMEC6 N i h k hN hi hh hk (by omega)
 have hw := upper_weight_shiftedMEC6 d h k hd
 rw [upper_term_coreMEC6 N d i h hi hh,
   upper_term_coreMEC6 N d (i+2) k (by omega) hk,
   upper_term_coreMEC6 N d (i+1) (min (h+1) k) (by omega) hm,
   upper_term_coreMEC6 N d (i+1) (max (h+1) k-1) (by omega) hx]
 have hwp : 0 ≤ ((2*d+h-1).choose h:ℤ)*((2*d+k-1).choose k:ℤ) := by positivity
 have hcp : 0 ≤ upperCoreM2B3 N (i+1) (min (h+1) k)*
   upperCoreM2B3 N (i+1) (max (h+1) k-1) :=
   mul_nonneg (upper_core_nonnegMEC6 _ _ _) (upper_core_nonnegMEC6 _ _ _)
 calc
  _ = (((2*d+h-1).choose h:ℤ)*((2*d+k-1).choose k:ℤ))*
      (upperCoreM2B3 N i h*upperCoreM2B3 N (i+2) k) := by ring
  _ ≤ (((2*d+h-1).choose h:ℤ)*((2*d+k-1).choose k:ℤ))*
      (upperCoreM2B3 N (i+1) (min (h+1) k)*upperCoreM2B3 N (i+1) (max (h+1) k-1)) :=
        mul_le_mul_of_nonneg_left hc hwp
  _ ≤ _ := mul_le_mul_of_nonneg_right hw hcp
  _ = _ := by ring

theorem upper_binomial_lcMEC6 : UpperBinomialLCM2B3 := by
 intro N d i hN hd
 exact upper_lc_of_shiftedM2B3 N d i (fun h k => upper_term_shiftedMEC6 N d i h k hN hd)

theorem numerator_two_horizontalMEC6 : NumeratorTwoHorizontalM2B3 :=
 upper_shifted_implies_horizontalM2B3 upper_term_shiftedMEC6

end
end MathGKM.Markov
