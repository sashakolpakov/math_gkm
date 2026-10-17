import MarkovMiddleSourceM99A
/-! Machine-authored 99a0f3b8. The entire first middle row for both source
residues and every positive q, including the finite low-parameter exceptions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 100000

theorem middle_first_exception_boundedM99A (q c : ℕ) (r : Bool)
 (he : (q=3 ∧ r=false) ∨ (q=4 ∧ r=true)) (hc : c ≤ q+3) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3))^2 := by
 rcases he with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> interval_cases c <;> decide

attribute [local irreducible] threeRawM9E2
theorem source_middle_first_allM99A (q c : ℕ) (r : Bool) (hq : 1 ≤ q) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3))^2 := by
 by_cases hn : 2*(q+3) ≤ sourceNME9C q r
 · exact source_middle_firstM99A q c r hq hn
 by_cases hj : sourceNME9C q r+2-(q+3) ≤ q+3
 · exact lower_and_three_correctionsM964 q c _ r hq hj
 have he : (q=3 ∧ r=false) ∨ (q=4 ∧ r=true) := by
   cases r <;> simp [sourceNME9C] at hn hj ⊢ <;> omega
 by_cases hc : c ≤ q+3
 · exact middle_first_exception_boundedM99A q c r he hc
 · rw [three_raw_degreeME9C q c _ r hq ?_,zero_mul]
   · exact sq_nonneg _
   · cases r <;> simp [sourceNME9C] at hn hj ⊢ <;> omega

theorem source_middle_first_polygonM99A (q c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hc : 2 ≤ c) (hct : c+2 ≤ q+3) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+3)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+3)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3))^2 := by
 have hp (i : ℕ) (hi : 2 ≤ i) (hi' : i ≤ q+3) :
   InPolygon 3 (sourceNME9C q r) i (sourceNME9C q r+2-(q+3)) := by
   have hn : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
   constructor
   · have hm := Nat.mul_le_mul_left (sourceNME9C q r) hi
     have hs : q+3 ≤ sourceNME9C q r+2 := by omega
     have hb : sourceNME9C q r+2-(q+3)+(q+3)=sourceNME9C q r+2 := by omega
     nlinarith
   · omega
 exact ⟨hp c hc (by omega),hp (c+1) (by omega) (by omega),hp (c+2) (by omega) hct,
   source_middle_first_allM99A q c r hq⟩

end
end MathGKM.Markov
