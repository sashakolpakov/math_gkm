import MarkovMiddleThirdBatch6M6C0
/-! Machine-authored 6c0f2afd. First thirteen source starting columns of
the third middle row in the admissible strip. The remaining row is open. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 middleRawMD02 topMassM55C

theorem middle_gap_two_smallM6C0 (x c : ℕ) (r : Bool) (hc : c ≤ 5) :
 0 ≤ middleGapMD02 r c x 2 := by
 by_cases hc2 : c ≤ 2
 · exact middle_gap_first_threeMF8D x 2 c r hc2
 have he (j : ℕ) (hj : 1 ≤ j) :
   middleRawMD02 x 2 r j=topMassM55C x (x+3*2+middleBaseMD02 r) j := by
   rw [middleRawMD02,correction_short_zeroMD02 _ _ _ r (by omega),add_zero,
     ←top_mass_short_sumMEB6]
 rw [middleGapMD02,he c (by omega),he (c+1) (by omega),he (c+2) (by omega)]
 apply sub_nonneg.mpr
 by_cases ht : c+2 ≤ x+3*2+middleBaseMD02 r
 · interval_cases c
   · exact (top_mass_small_3_strictM97B _ _ ht).le
   · exact (top_mass_small_4_strictM97B _ _ ht).le
   · exact (top_mass_small_5_strictM97B _ _ ht).le
 · rw [top_mass_zeroM55C _ _ _ (by omega),mul_zero]
   exact sq_nonneg _

theorem middle_gap_two_nineM6C0 (x c : ℕ) (r : Bool) (hc : c ≤ 9) :
 0 ≤ middleGapMD02 r c x 2 := by
 by_cases hc5 : c ≤ 5
 · exact middle_gap_two_smallM6C0 x c r hc5
 interval_cases c
 · exact middle_two_6_nonnegM6C0 x r
 · exact middle_two_7_nonnegM6C0 x r
 · exact middle_two_8_nonnegM6C0 x r
 · exact middle_two_9_nonnegM6C0 x r

theorem source_middle_third_partialM6C0 (q c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hn : 2*(q+5) ≤ sourceNME9C q r) (hc : c ≤ 12) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+5))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+5)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+5))^2 := by
 have hk : 2 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have hn' : 2*(q+3+2) ≤ sourceNME9C q r := by omega
 by_cases hc4 : c ≤ 4
 · exact source_middle_jet_closedM80F q c _ r hq ⟨2,hk,hn',rfl,Or.inl hc4⟩
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q 2 r hn'
 have h := (middle_gap_sourceMD02 x 2 (c-3) r).mp
   (middle_gap_two_nineM6C0 x (c-3) r (by omega))
 simpa only [show c-3+3=c by omega,show c-3+5=c+2 by omega,
   show c-3+4=c+1 by omega,Nat.add_assoc,Nat.reduceAdd] using h

end
end MathGKM.Markov
