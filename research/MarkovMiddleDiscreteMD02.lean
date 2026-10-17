import MarkovMiddleKernelSourceMD02
import MarkovMiddleJetResidualM80F
import MarkovNewtonMD02
/-! Machine-authored d0292f14. Exact integer parameterization and a sufficient
Newton-difference condition. The universal sign condition is not asserted. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2

def middleBaseMD02 (r : Bool) : ℕ := if r then 5 else 4
def middleRawMD02 (x k : ℕ) (r : Bool) (c : ℕ) : ℤ :=
 topShortSumMEB6 x (x+3*k+middleBaseMD02 r) c+
 correctionShortMD02 (x+middleBaseMD02 r-2) k c r
def middleGapMD02 (r : Bool) (c x k : ℕ) : ℤ :=
 middleRawMD02 x k r (c+1)^2-middleRawMD02 x k r c*middleRawMD02 x k r (c+2)

theorem middle_parameter_domainMD02 (x k : ℕ) (r : Bool) :
 1 ≤ x+2*k+middleBaseMD02 r ∧ k ≤ x+2*k+middleBaseMD02 r ∧
 2*((x+2*k+middleBaseMD02 r)+3+k) ≤ sourceNME9C (x+2*k+middleBaseMD02 r) r := by
 cases r <;> simp [middleBaseMD02,sourceNME9C] <;> omega

theorem middle_parameter_existsMD02 (q k : ℕ) (r : Bool)
 (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 ∃ x, q=x+2*k+middleBaseMD02 r := by
 refine ⟨q-(2*k+middleBaseMD02 r),?_⟩
 cases r <;> simp [middleBaseMD02,sourceNME9C] at hn ⊢ <;> omega

theorem source_middle_integerMD02 (x k c : ℕ) (r : Bool) :
 threeRawM9E2 (x+2*k+middleBaseMD02 r) r (c+3)
   (sourceNME9C (x+2*k+middleBaseMD02 r) r+2-((x+2*k+middleBaseMD02 r)+3+k))=
 middleRawMD02 x k r c := by
 obtain ⟨h1,h2,h3⟩ := middle_parameter_domainMD02 x k r
 rw [source_middle_shortMD02 _ _ _ r h1 h2 h3]
 unfold middleRawMD02
 congr 2
 · cases r <;> simp [middleBaseMD02,sourceNME9C] <;> omega
 · omega
 · cases r <;> simp [middleBaseMD02] <;> omega

theorem middle_gap_sourceMD02 (x k c : ℕ) (r : Bool) :
 (0 ≤ middleGapMD02 r c x k) ↔
 (threeRawM9E2 (x+2*k+middleBaseMD02 r) r (c+3)
   (sourceNME9C (x+2*k+middleBaseMD02 r) r+2-((x+2*k+middleBaseMD02 r)+3+k))*
 threeRawM9E2 (x+2*k+middleBaseMD02 r) r (c+5)
   (sourceNME9C (x+2*k+middleBaseMD02 r) r+2-((x+2*k+middleBaseMD02 r)+3+k)) ≤
 threeRawM9E2 (x+2*k+middleBaseMD02 r) r (c+4)
   (sourceNME9C (x+2*k+middleBaseMD02 r) r+2-((x+2*k+middleBaseMD02 r)+3+k))^2) := by
 rw [source_middle_integerMD02,
   show c+5=(c+2)+3 by omega,source_middle_integerMD02,
   show c+4=(c+1)+3 by omega,source_middle_integerMD02]
 exact sub_nonneg

def MiddleShortLCMD02 : Prop := ∀ r c x k, 0 ≤ middleGapMD02 r c x k
def MiddleNewtonMD02 : Prop := ∀ r c a b,
 0 ≤ newtonCoeffMD02 (middleGapMD02 r c) a b

theorem middle_newton_sufficientMD02 (h : MiddleNewtonMD02) : MiddleShortLCMD02 := by
 intro r c x k
 exact newton_nonnegMD02 _ (h r c) x k

theorem root_implies_middle_shortMD02 (h : Conjecture63) : MiddleShortLCMD02 := by
 have hh := (root_iff_three_arithmeticM9E2.mp h).1
 intro r c x k
 rw [middle_gap_sourceMD02]
 exact (hh _ (middle_parameter_domainMD02 x k r).1 r).1 (c+3) _

theorem middle_short_sourceMD02 (h : MiddleShortLCMD02) (q k c : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 by_cases hc : c ≤ 4
 · exact source_middle_jet_closedM80F q c _ r hq ⟨k,hk,hn,rfl,Or.inl hc⟩
 · obtain ⟨x,rfl⟩ := middle_parameter_existsMD02 q k r hn
   have hz := (middle_gap_sourceMD02 x k (c-3) r).mp (h r (c-3) x k)
   simpa only [show c-3+3=c by omega,show c-3+5=c+2 by omega,
     show c-3+4=c+1 by omega] using hz

theorem middle_short_pathMD02 (h : MiddleShortLCMD02)
 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k c, k ≤ q → 2*(q+3+k) ≤ sourceNME9C q r →
 coeff (frame path).mid.p c (sourceNME9C q r+2-(q+3+k))*
 coeff (frame path).mid.p (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 coeff (frame path).mid.p (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k c hk hn
 simp only [hp]
 exact middle_short_sourceMD02 h q k c r hq hk hn

end
end MathGKM.Markov
