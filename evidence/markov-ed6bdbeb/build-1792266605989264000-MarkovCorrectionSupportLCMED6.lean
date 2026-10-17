import MarkovBaseShapeMED6
/-! Machine-authored ed6bdbeb. New raw source inequalities outside the exact
correction support. All rows and parameters are unbounded; zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem source_above_verticalMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hc : sourceNME9C q r < i+j+q) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 by_cases hi : i ≤ 3
 · exact source_first_four_verticalMF88 q i j r hq hi
 have h := base_verticalMED6 q i j r
 have he (k : ℕ) (hk : j ≤ k) : (threeRawM9E2 q r i k:ℝ)=baseValueM13E q r i k := by
   rw [source_two_kernelMED6 q i k r hq (by omega),correction_zero_aboveMED6 q i k r (by omega),add_zero]
 rw [←he j (by omega),←he (j+1) (by omega),←he (j+2) (by omega)] at h
 exact_mod_cast h

theorem source_above_diagonalMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 4 ≤ i)
 (hc : sourceNME9C q r < i+j+q+2) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 have he (a b : ℕ) (ha : 3 ≤ a) (hab : a+b=i+j+2) :
   (threeRawM9E2 q r a b:ℝ)=baseValueM13E q r a b := by
   rw [source_two_kernelMED6 q a b r hq ha,correction_zero_aboveMED6 q a b r (by omega),add_zero]
 have h := base_diagonalMED6 q i j r hi
 rw [←he i (j+2) (by omega) (by omega),←he (i+1) (j+1) (by omega) (by omega),
   ←he (i+2) j (by omega) (by omega)] at h
 exact_mod_cast h

theorem source_support_column_verticalMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hc : q+(if r then 1 else 2) ≤ i) :
 threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2 := by
 by_cases hi : i ≤ 3
 · exact source_first_four_verticalMF88 q i j r hq hi
 have he (k : ℕ) : (threeRawM9E2 q r i k:ℝ)=baseValueM13E q r i k := by
   rw [source_two_kernelMED6 q i k r hq (by omega),correction_zero_columnMED6 q i k r hc,add_zero]
 have h := base_verticalMED6 q i j r
 rw [←he j,←he (j+1),←he (j+2)] at h
 exact_mod_cast h

theorem source_support_column_diagonalMED6 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 4 ≤ i)
 (hc : q+(if r then 1 else 2) ≤ i) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 have he (a b : ℕ) (ha : i ≤ a) : (threeRawM9E2 q r a b:ℝ)=baseValueM13E q r a b := by
   rw [source_two_kernelMED6 q a b r hq (by omega),correction_zero_columnMED6 q a b r (by omega),add_zero]
 have h := base_diagonalMED6 q i j r hi
 rw [←he i (j+2) (by omega),←he (i+1) (j+1) (by omega),←he (i+2) j (by omega)] at h
 exact_mod_cast h

end
end MathGKM.Markov
