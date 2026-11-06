import MathGKM.Round126DistanceA

/- Machine-authored round126. Closed typed proposals, independent admission
pending. These statements obstruct restricted transport, not the root. -/
namespace UniformDistanceSubmissionR126
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open AugmentingPairR125 (PairSteps)
open UniformDistanceR126
open MathGKM.Markov (frame InPolygon)
attribute [local irreducible] ColorForgettingR108.rankFiber

def OriginalScope (h : ℕ) : Prop :=
    let E := (frame (List.replicate (10*h+2) true)).mid
    E.a=10*h+3 ∧ E.b=10*h+4 ∧
    InPolygon E.a E.b (4*h-2) (6*h+6) ∧
    InPolygon E.a E.b (4*h-1) (6*h+6) ∧
    InPolygon E.a E.b (4*h) (6*h+6)

def FamilyResult : Prop := ∀ h : ℕ, 1≤h →
    (valid (20*h+6) (low h) ∧ valid (20*h+6) (high h) ∧
      du 0 (low h)=4*h-2 ∧ du 0 (high h)=4*h ∧
      dv (20*h+6) 0 (low h)=6*h+6 ∧ dv (20*h+6) 0 (high h)=6*h+6) ∧
    ((low h,high h)∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-2)) ∧ OriginalScope h

theorem family_result : FamilyResult := by
  intro h hh
  exact ⟨family_degrees h hh,family_member h hh,original_scope h hh⟩

def DistanceResult : Prop := ∀ h : ℕ, 1≤h →
    (∀ e : ℕ, 2*h+1≤weight h e+weight h (e+1)+(if e∈(high h).1 then 0 else 1)) ∧
    weightSum (weight h) 0 (20*h+6)=10*h*(2*h+1) ∧
    ∀ (k : ℕ) (y : Obj), Steps (20*h+6) k (high h) y →
      (high h).1.card<y.1.card → 2*h+1≤k

theorem distance_result : DistanceResult := by
  intro h hh
  exact ⟨dual_edges h,total_weight h,fun k y => high_gain_lower h k hh y⟩

def ObstructionResult : Prop :=
    (∀ (N : ℕ) (z w : Pair), packet N z w → ∃ k≤3, PairSteps N k z w) ∧
    (∀ h : ℕ, 1≤h →
      (∀ (k : ℕ) (w : Pair),
        w∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
          (2*(4*h-2)+2) (4*h-1) →
        PairSteps (20*h+6) k (low h,high h) w → 2*h+2≤k) ∧
      ¬ EqualMassR122.PacketLoad (20*h+6) 0 (4*h-2) (6*h+6)) ∧
    (∀ K : ℕ, let h := K+1
      OriginalScope h ∧
      (low h,high h)∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
        (2*(4*h-2)+2) (4*h-2) ∧
      ∀ w∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
        (2*(4*h-2)+2) (4*h-1), ∀ k≤K,
          ¬ PairSteps (20*h+6) k (low h,high h) w)

theorem obstruction_result : ObstructionResult := by
  refine ⟨packet_steps,?_,?_⟩
  · intro h hh
    exact ⟨fun k w => central_rank_lower h k hh w,no_packet_load h hh⟩
  · intro K
    exact ⟨original_scope (K+1) (by omega),fixed_budget K⟩

end UniformDistanceSubmissionR126
#print axioms UniformDistanceSubmissionR126.family_result
#print axioms UniformDistanceSubmissionR126.distance_result
#print axioms UniformDistanceSubmissionR126.obstruction_result
