import MarkovSuppressionSourceM9C28
import MarkovCorrectionDiagonalMED6
/-! Machine-authored request 9c28b628. A sufficient quantitative base-kernel
inequality for every numerator-three diagonal starting at column at least three.
BaseCurvatureM9C28 is an OPEN proposition, not an asserted theorem. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000

def BaseCurvatureM9C28 : Prop := ∀ t j k : ℕ,
 ((t:ℝ)+5)*lowerDiagMF88 t (j+2) k*lowerDiagMF88 (t+2) j k ≤
 ((t:ℝ)+4)*lowerDiagMF88 (t+1) (j+1) k^2

theorem quantitative_glueM9C28 (m d₀ d₁ d₂ e₀ e₁ e₂ : ℝ)
 (hm : 0 < m) (hd0 : 0 ≤ d₀) (hd1 : 0 ≤ d₁) (hd2 : 0 ≤ d₂) (he1 : 0 ≤ e₁)
 (hb : (m+1)*d₀*d₂ ≤ m*d₁^2) (h0 : 2*m*e₀ ≤ d₀) (h2 : 2*m*e₂ ≤ d₂)
 (he : e₀*e₂ ≤ e₁^2) : (d₀+e₀)*(d₂+e₂) ≤ (d₁+e₁)^2 := by
 have h00 := mul_le_mul_of_nonneg_left h0 hd2
 have h22 := mul_le_mul_of_nonneg_left h2 hd0
 have hee := mul_le_mul_of_nonneg_left he hm.le
 have h11 := mul_nonneg hm.le (mul_nonneg hd1 he1)
 apply le_of_mul_le_mul_left (a:=m) _ hm
 nlinarith only [hb,h00,h22,hee,h11]

theorem source_diagonal_of_curvatureM9C28 (hcurv : BaseCurvatureM9C28)
 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q) (hi : 3 ≤ i) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases hd : i+j ≤ sourceNME9C q r
 · have hbase : ((i:ℝ)+2)*baseValueM13E q r i (j+2)*baseValueM13E q r (i+2) j ≤
     ((i:ℝ)+1)*baseValueM13E q r (i+1) (j+1)^2 := by
     have h := hcurv (i-3) j (sourceNME9C q r-i-j)
     have hiR : ((i-3:ℕ):ℝ)=(i:ℝ)-3 := by rw [Nat.cast_sub hi]; norm_num
     simp only [baseValueM13E,if_pos (show i+(j+2) ≤ sourceNME9C q r+2 by omega),
       if_pos (show i+2+j ≤ sourceNME9C q r+2 by omega),
       if_pos (show i+1+(j+1) ≤ sourceNME9C q r+2 by omega)]
     rw [show sourceNME9C q r+2-i-(j+2)=sourceNME9C q r-i-j by omega,
       show sourceNME9C q r+2-(i+2)-j=sourceNME9C q r-i-j by omega,
       show sourceNME9C q r+2-(i+1)-(j+1)=sourceNME9C q r-i-j by omega,
       show i+2-3=i-3+2 by omega,show i+1-3=i-3+1 by omega]
     rw [hiR] at h
     convert h using 1 <;> ring
   have he2 := correction_value_nonnegM13E q (i+2) j r
   have hs2 := source_correction_suppressedM9C28 q (i+2) j r (by omega)
   have hs2' : (2:ℝ)*(i+1)*correctionValueM13E q r (i+2) j ≤ baseValueM13E q r (i+2) j := by
     push_cast at hs2
     nlinarith only [hs2,he2]
   have hh := quantitative_glueM9C28 ((i:ℝ)+1)
     (baseValueM13E q r i (j+2)) (baseValueM13E q r (i+1) (j+1)) (baseValueM13E q r (i+2) j)
     (correctionValueM13E q r i (j+2)) (correctionValueM13E q r (i+1) (j+1)) (correctionValueM13E q r (i+2) j)
     (by positivity) (base_nonnegM9C28 _ _ _ _) (base_nonnegM9C28 _ _ _ _)
     (base_nonnegM9C28 _ _ _ _) (correction_value_nonnegM13E _ _ _ _)
     (by simpa using hbase) (source_correction_suppressedM9C28 q i (j+2) r hi) hs2'
     (correction_diagonalMED6 q i j r hi)
   rw [←source_two_kernelMED6 q i (j+2) r hq hi,
     ←source_two_kernelMED6 q (i+2) j r hq (by omega),
     ←source_two_kernelMED6 q (i+1) (j+1) r hq (by omega)] at hh
   exact_mod_cast hh
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),zero_mul]
   exact sq_nonneg _

end
end MathGKM.Markov
