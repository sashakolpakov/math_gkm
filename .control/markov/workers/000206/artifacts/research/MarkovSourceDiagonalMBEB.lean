import MarkovBaseDiagonalMBEB
/-! Machine-authored bebe7940. Raw source transport outside correction support. -/
namespace MathGKM.Markov
noncomputable section
theorem source_above_diagonalMBEB (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i)
 (hc : sourceNME9C q r < i+j+q+2) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 have he (a b : ℕ) (ha : 3 ≤ a) (hab : a+b=i+j+2) :
   (threeRawM9E2 q r a b:ℝ)=baseValueM13E q r a b := by
   rw [source_two_kernelMED6 q a b r hq ha,correction_zero_aboveMED6 q a b r (by omega),add_zero]
 have h := base_diagonalMBEB q i j r hi
 rw [←he i (j+2) (by omega) (by omega),←he (i+1) (j+1) (by omega) (by omega),
   ←he (i+2) j (by omega) (by omega)] at h
 exact_mod_cast h

theorem source_support_column_diagonalMBEB (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i)
 (hc : q+(if r then 1 else 2) ≤ i) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 have he (a b : ℕ) (ha : i ≤ a) : (threeRawM9E2 q r a b:ℝ)=baseValueM13E q r a b := by
   rw [source_two_kernelMED6 q a b r hq (by omega),correction_zero_columnMED6 q a b r (by omega),add_zero]
 have h := base_diagonalMBEB q i j r hi
 rw [←he i (j+2) (by omega),←he (i+1) (j+1) (by omega),←he (i+2) j (by omega)] at h
 exact_mod_cast h

end
end MathGKM.Markov
