import MarkovMiddleThirdPartialM6C0
import MarkovThirdOneC10M9DB
import MarkovThirdOneC11M9DB
import MarkovThirdOneC12M9DB
import MarkovThirdOneC13M9DB
import MarkovThirdOneC14M9DB
import MarkovThirdOneC15M9DB
import MarkovThirdOneC16M9DB
/-! Machine-authored 9db2326d. Entire third middle row within its strip,
with every starting column, denominator and zero retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 middleRawMD02 topMassM55C

theorem middle_gap_two_allM9DB (x c : ℕ) (r : Bool) :
 0 ≤ middleGapMD02 r c x 2 := by
 by_cases hc : c ≤ 9
 · exact middle_gap_two_nineM6C0 x c r hc
 by_cases hh : 17 ≤ c
 · exact middle_gap_two_highM6C0 c x r hh
 interval_cases c
 · exact third_one_10_nonnegM9DB x r
 · exact third_one_11_nonnegM9DB x r
 · exact third_one_12_nonnegM9DB x r
 · exact third_one_13_nonnegM9DB x r
 · exact third_one_14_nonnegM9DB x r
 · exact third_one_15_nonnegM9DB x r
 · exact third_one_16_nonnegM9DB x r

theorem source_middle_third_stripM9DB (q c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hn : 2*(q+5) ≤ sourceNME9C q r) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+5))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+5)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+5))^2 := by
 have hk : 2 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 have hn' : 2*(q+3+2) ≤ sourceNME9C q r := by omega
 by_cases hc4 : c ≤ 4
 · exact source_middle_jet_closedM80F q c _ r hq ⟨2,hk,hn',rfl,Or.inl hc4⟩
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q 2 r hn'
 have h := (middle_gap_sourceMD02 x 2 (c-3) r).mp (middle_gap_two_allM9DB x (c-3) r)
 simpa only [show c-3+3=c by omega,show c-3+5=c+2 by omega,
   show c-3+4=c+1 by omega,Nat.add_assoc,Nat.reduceAdd] using h

end
end MathGKM.Markov
