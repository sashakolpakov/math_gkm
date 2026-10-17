import MarkovMiddleTotalC5MF8D
import MarkovMiddleTotalC6MF8D
import MarkovMiddleTotalC7MF8D
/-! Machine-authored f8d0715b. New total-gap columns attached to actual
raw source coefficients. Unbounded denominator and middle depth. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
attribute [local irreducible] threeRawM9E2

theorem middle_gap_smallMF8D (x k c : ℕ) (r : Bool) (hc : c ≤ 4) :
 0 ≤ middleGapMD02 r c x k := by
 by_cases hc2 : 2 ≤ c
 · interval_cases c
   · exact middle_gap_2_nonnegMF8D x k r
   · exact middle_gap_3_nonnegMF8D x k r
   · exact middle_gap_4_nonnegMF8D x k r
 · rw [middle_gap_sourceMD02]
   obtain ⟨hq,hk,hn⟩ := middle_parameter_domainMD02 x k r
   have h := source_middle_jet_closedM80F (x+2*k+middleBaseMD02 r) (c+3) _ r hq
     ⟨k,hk,hn,rfl,Or.inl (by omega)⟩
   simpa only [Nat.add_assoc,Nat.reduceAdd] using h

theorem source_middle_sevenMF8D (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : c ≤ 7) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 by_cases h4 : c ≤ 4
 · exact source_middle_jet_closedM80F q c _ r hq ⟨k,hk,hn,rfl,Or.inl h4⟩
 · obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
   have h := (middle_gap_sourceMD02 x k (c-3) r).mp
     (middle_gap_smallMF8D x k (c-3) r (by omega))
   simpa only [show c-3+3=c by omega,show c-3+5=c+2 by omega,
     show c-3+4=c+1 by omega] using h

theorem source_middle_seven_pathMF8D (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k c, k ≤ q → 2*(q+3+k) ≤ sourceNME9C q r → c ≤ 7 →
 coeff (frame path).mid.p c (sourceNME9C q r+2-(q+3+k))*
 coeff (frame path).mid.p (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 coeff (frame path).mid.p (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k c hk hn hc
 simp only [hp]
 exact source_middle_sevenMF8D q k c r hq hk hn hc

theorem source_middle_seven_polygonMF8D (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 5 ≤ c)
 (hc7 : c ≤ 7) (hct : c+2 ≤ q+3+k) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+1) (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) (c+2) (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 :=
 ⟨middle_polygonM99A q k c r hq hk (by omega) (by omega),
 middle_polygonM99A q k (c+1) r hq hk (by omega) (by omega),
 middle_polygonM99A q k (c+2) r hq hk (by omega) hct,
 source_middle_sevenMF8D q k c r hq hk hn hc7⟩

end
end MathGKM.Markov
