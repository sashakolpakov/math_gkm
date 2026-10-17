import MarkovThirdOutputM964
/-! Machine-authored 9647c1ba. Exact small-source arithmetic plus a universal
zero tail. Ordinary kernel reduction, no native evaluation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem third_small_boundedM964 (q i : ℕ) (r : Bool)
 (hq : 3 ≤ q) (hq5 : q ≤ 5) (hi : i ≤ 11) :
 threeRawM9E2 q r i (q+3)*threeRawM9E2 q r (i+2) (q+3) ≤
 threeRawM9E2 q r (i+1) (q+3)^2 := by
 interval_cases q <;> cases r <;> interval_cases i <;> decide

theorem third_small_allM964 (q i : ℕ) (r : Bool) (hq : 1 ≤ q) (hq5 : q ≤ 5) :
 threeRawM9E2 q r i (q+3)*threeRawM9E2 q r (i+2) (q+3) ≤
 threeRawM9E2 q r (i+1) (q+3)^2 := by
 by_cases hq1 : q=1
 · subst q; exact three_small_horizontalMAE9 1 i 4 r (by omega) (by omega)
 by_cases hq2 : q=2
 · subst q; exact three_horizontal_fifthMFFD 2 i r (by omega)
 by_cases hi : i ≤ 11
 · exact third_small_boundedM964 q i r (by omega) hq5 hi
 · rw [three_raw_degreeME9C q i (q+3) r hq ?_,zero_mul]
   · exact sq_nonneg _
   · unfold sourceNME9C; split_ifs <;> omega

end
end MathGKM.Markov
