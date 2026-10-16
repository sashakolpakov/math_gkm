import MarkovBottomGapMAA6
/-! Machine-authored aa6c518b. Exhaustive source-parameter gap assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem bottom_gap_nonnegMAA6 (a k l : ℕ) (ha : 1≤a) (hk : 1≤k)
 (hl : 2≤l) (hN : 4≤k+l) :
 0≤bottomGapMAA6 a k l (2*((2*a-(k+l+1):ℕ):ℝ)) := by
 have haR : (1:ℝ)≤a := by exact_mod_cast ha
 have hkR : (1:ℝ)≤k := by exact_mod_cast hk
 have hlR : (2:ℝ)≤l := by exact_mod_cast hl
 by_cases hsmall : l≤4
 · interval_cases l
   · have hk2 : (2:ℝ)≤k := by exact_mod_cast (show 2≤k by omega)
     have h := bottom_smallTwoMAA6 ((a:ℝ)-1) ((k:ℝ)-2) 0 0 (by linarith) (by linarith) (by norm_num) (by norm_num)
     norm_num at h
     simpa [bottomGapMAA6,bottomJMAA6] using h
   · have h := bottom_smallThreeMAA6 ((a:ℝ)-1) ((k:ℝ)-1) 0 0 (by linarith) (by linarith) (by norm_num) (by norm_num)
     norm_num at h
     simpa [bottomGapMAA6,bottomJMAA6] using h
   · have h := bottom_smallFourMAA6 ((a:ℝ)-1) ((k:ℝ)-1) 0 0 (by linarith) (by linarith) (by norm_num) (by norm_num)
     norm_num at h
     simpa [bottomGapMAA6,bottomJMAA6] using h
 · have hl5 : (5:ℝ)≤l := by exact_mod_cast (show 5≤l by omega)
   by_cases hs : 2*a≤k+l+1
   · rw [Nat.sub_eq_zero_of_le hs]
     have h := bottom_zeroLargeMAA6 ((a:ℝ)-1) ((k:ℝ)-1) ((l:ℝ)-3) 0
       (by linarith) (by linarith) (by linarith) (by norm_num)
     simpa using h
   · have hs' : k+l+1≤2*a := by omega
     have hT : (0:ℝ)≤2*a-((k:ℝ)+l+1) := by exact_mod_cast (Nat.sub_nonneg_iff_le.mpr hs')
     have h := bottom_highLargeMAA6 0 ((k:ℝ)-1) ((l:ℝ)-5)
       (2*a-((k:ℝ)+l+1)) (by norm_num) (by linarith) (by linarith) hT
     have he : (((k:ℝ)-1)+((l:ℝ)-5)+7+(2*a-((k:ℝ)+l+1)))/2=a := by ring
     rw [he] at h
     norm_num only [sub_add_cancel] at h
     rw [Nat.cast_sub hs']
     push_cast
     nlinarith only [h]
end
end MathGKM.Markov
