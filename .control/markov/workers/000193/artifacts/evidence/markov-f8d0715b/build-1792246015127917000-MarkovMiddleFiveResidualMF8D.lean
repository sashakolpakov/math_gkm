import MarkovMiddleTotalC5MF8D
import MarkovMiddleSecondAllMF8D
import MarkovMiddleShortResidualMD02
/-! Machine-authored f8d0715b. Independently usable source/root attachment
of the checked column-five gap and complete second middle row. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
attribute [local irreducible] threeRawM9E2

theorem source_middle_fiveMF8D (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 5 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 7 (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r 6 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
 exact (middle_gap_sourceMD02 x k 2 r).mp (middle_gap_2_nonnegMF8D x k r)

theorem source_middle_five_pathMF8D (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k, k ≤ q → 2*(q+3+k) ≤ sourceNME9C q r →
 coeff (frame path).mid.p 5 (sourceNME9C q r+2-(q+3+k))*
 coeff (frame path).mid.p 7 (sourceNME9C q r+2-(q+3+k)) ≤
 coeff (frame path).mid.p 6 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k hk hn
 simp only [hp]
 exact source_middle_fiveMF8D q k r hq hk hn

theorem source_middle_five_polygonMF8D (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 InPolygon 3 (sourceNME9C q r) 5 (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) 6 (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) 7 (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r 5 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 7 (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r 6 (sourceNME9C q r+2-(q+3+k))^2 := by
 have hq4 : 4 ≤ q := by cases r <;> simp [sourceNME9C] at hn <;> omega
 exact ⟨middle_polygonM99A q k 5 r hq hk (by omega) (by omega),
   middle_polygonM99A q k 6 r hq hk (by omega) (by omega),
   middle_polygonM99A q k 7 r hq hk (by omega) (by omega),
   source_middle_fiveMF8D q k r hq hk hn⟩

theorem middle_gap_first_two_baseMF8D (x k c : ℕ) (r : Bool) (hk : k ≤ 1) :
 0 ≤ middleGapMD02 r c x k := by
 rw [middle_gap_sourceMD02]
 have hq := (middle_parameter_domainMD02 x k r).1
 interval_cases k
 · simpa only [Nat.add_zero,Nat.mul_zero,Nat.add_assoc,Nat.reduceAdd] using
     source_middle_first_allM99A (x+2*0+middleBaseMD02 r) (c+3) r hq
 · simpa only [Nat.mul_one,Nat.add_assoc,Nat.reduceAdd] using
     source_middle_second_allMF8D (x+2*1+middleBaseMD02 r) (c+3) r hq

theorem middle_gap_first_threeMF8D (x k c : ℕ) (r : Bool) (hc : c ≤ 2) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hc2 : c=2
 · subst c; exact middle_gap_2_nonnegMF8D x k r
 · rw [middle_gap_sourceMD02]
   obtain ⟨hq,hk,hn⟩ := middle_parameter_domainMD02 x k r
   have h := source_middle_jet_closedM80F (x+2*k+middleBaseMD02 r) (c+3) _ r hq
     ⟨k,hk,hn,rfl,Or.inl (by omega)⟩
   simpa only [Nat.add_assoc,Nat.reduceAdd] using h

def MiddleTailMF8D : Prop := ∀ r c x k,
 3 ≤ c → 2 ≤ k → 0 ≤ middleGapMD02 r c x k

theorem middle_short_iff_tailMF8D : MiddleShortLCMD02 ↔ MiddleTailMF8D := by
 constructor
 · intro h r c x k _ _; exact h r c x k
 · intro h r c x k
   by_cases hc : c ≤ 2
   · exact middle_gap_first_threeMF8D x k c r hc
   · by_cases hk : k ≤ 1
     · exact middle_gap_first_two_baseMF8D x k c r hk
     · exact h r c x k (by omega) (by omega)

theorem root_iff_middle_tailMF8D :
 Conjecture63 ↔ MiddleTailMF8D ∧ ThreeOutsideMiddleMD02 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_shortMD02,middle_short_iff_tailMF8D]

end
end MathGKM.Markov
