import MarkovMiddleTotalSourceMF8D
import MarkovMiddleSecondAllMF8D
import MarkovMiddleShortResidualMD02
/-! Machine-authored f8d0715b. Exact residual after the second complete row
and new total-gap columns. All other directions and source families retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
attribute [local irreducible] threeRawM9E2

theorem middle_gap_first_twoMF8D (x k c : ℕ) (r : Bool) (hk : k ≤ 1) :
 0 ≤ middleGapMD02 r c x k := by
 rw [middle_gap_sourceMD02]
 have hq := (middle_parameter_domainMD02 x k r).1
 interval_cases k
 · simpa only [Nat.add_zero,Nat.mul_zero,Nat.add_assoc,Nat.reduceAdd] using
     source_middle_first_allM99A (x+2*0+middleBaseMD02 r) (c+3) r hq
 · simpa only [Nat.mul_one,Nat.add_assoc,Nat.reduceAdd] using
     source_middle_second_allMF8D (x+2*1+middleBaseMD02 r) (c+3) r hq

def MiddleInteriorMF8D : Prop := ∀ r c x k,
 5 ≤ c → 2 ≤ k → 0 ≤ middleGapMD02 r c x k

theorem middle_short_iff_interiorMF8D : MiddleShortLCMD02 ↔ MiddleInteriorMF8D := by
 constructor
 · intro h r c x k _ _
   exact h r c x k
 · intro h r c x k
   by_cases hc : c ≤ 4
   · exact middle_gap_smallMF8D x k c r hc
   · by_cases hk : k ≤ 1
     · exact middle_gap_first_twoMF8D x k c r hk
     · exact h r c x k (by omega) (by omega)

theorem root_iff_middle_interiorMF8D :
 Conjecture63 ↔ MiddleInteriorMF8D ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02,middle_short_iff_interiorMF8D]

end
end MathGKM.Markov
