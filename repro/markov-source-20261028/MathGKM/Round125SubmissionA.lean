import MathGKM.Round125InterfaceA
import MathGKM.Round125PairA

/- Machine-authored round125. Three closed proposals; independent admission
and the unchanged exact-root/publication gates remain separate. -/
namespace AugmentingSubmissionR125
set_option maxRecDepth 10000
set_option linter.constructorNameAsVariable false
attribute [local irreducible] ColorForgettingR108.rankFiber
open LocalRetilingR76 PacketsR120 PacketStructureR121 AugmentingR125
open ColorForgettingR108 MathGKM.Markov

def MetricResult : Prop :=
    (∀ y : Obj, two 26 PacketObstructionR124.high y → y.1.card≤10) ∧
    (∀ (N : ℕ) (M : Finset ℕ) (x y : Obj), edit N x y →
      (y.1 \ M).card≤(x.1 \ M).card+1) ∧
    (∀ (N k : ℕ) (x y : Obj), Steps N k x y → (y.1 \ x.1).card≤k) ∧
    (∀ (N q : ℕ) (M : Finset ℕ) (W : ℕ → ℕ),
      (∀ e, e+1<N → q≤W e+W (e+1)+(if e∈M then 0 else 1)) →
      ∀ (xs : List Tile) (v : ℕ), v+width xs≤N →
        q*dimers xs≤weightSum W v (width xs)+newCount M v xs)

theorem metric_result : MetricResult :=
  ⟨PacketObstructionR124.two_no_gain,edit_new_edges,steps_new_edges,weighted_word_bound⟩

def OriginalResult : Prop :=
    (PacketObstructionR124.low,PacketObstructionR124.high) ∈ rankFiber 26 0 12 6 2 ∧
    (∀ w ∈ rankFiber 26 0 12 6 3,
      ¬ packet 26 (PacketObstructionR124.low,PacketObstructionR124.high) w) ∧
    ¬ EqualMassR122.PacketLoad 26 0 2 12 ∧
    (let E := (frame (List.replicate 12 true)).mid;
      E.a=13 ∧ E.b=14 ∧ InPolygon E.a E.b 2 12 ∧
      InPolygon E.a E.b 3 12 ∧ InPolygon E.a E.b 4 12)

theorem original_result : OriginalResult := PacketInterfaceR125.obstruction_in_original_scope

open AugmentingCaseR125 AugmentingPairR125
open PacketsR120.Tile

def CaseResult : Prop :=
    (highWord=Tile.V::(List.replicate 5 (List.replicate 4 D++[Tile.V])).flatten ∧
      lowWord=[Tile.V]++List.replicate 16 D++[Tile.V]++List.replicate 6 D) ∧
    ColorFibersR66.uncovered 46 high.1={0,9,18,27,36,45} ∧
    (valid 46 low ∧ valid 46 high ∧ du 0 low=6 ∧ du 0 high=8 ∧
      dv 46 0 low=18 ∧ dv 46 0 high=18) ∧
    (low,high) ∈ rankFiber 46 0 18 14 6 ∧
    (let E := (frame (List.replicate 22 true)).mid;
      E.a=23 ∧ E.b=24 ∧ InPolygon E.a E.b 6 18 ∧
      InPolygon E.a E.b 7 18 ∧ InPolygon E.a E.b 8 18) ∧
    (∀ (k : ℕ) (y : Obj), Steps 46 k high y → high.1.card<y.1.card → 5≤k) ∧
    (Steps 46 5 high (decode gain5) ∧ (decode gain5).1.card=high.1.card+1 ∧
      du 0 (decode gain5)=13 ∧ dv 46 0 (decode gain5)=12) ∧
    (∀ (k : ℕ) (w : Pair), PairSteps 46 k (low,high) w →
      (valid 46 w.1 ∧ valid 46 w.2) →
      (du 0 w.1=7 ∧ du 0 w.2=7 ∧ dv 46 0 w.1=18 ∧ dv 46 0 w.2=18) → 6≤k) ∧
    PairSteps 46 9 (low,high) (decode lower1,decode central8) ∧
    (Steps 46 1 low (decode lower1) ∧ Steps 46 8 high (decode central8) ∧
      valid 46 (decode lower1) ∧ valid 46 (decode central8) ∧
      du 0 (decode lower1)=7 ∧ du 0 (decode central8)=7 ∧
      dv 46 0 (decode lower1)=18 ∧ dv 46 0 (decode central8)=18)

theorem case_result : CaseResult :=
  ⟨family_words,high_unmatched,source_degrees,source_member,original_scope,
    high_gain_lower,sharp_gain,central_lower,central_upper,central_endpoints⟩

end AugmentingSubmissionR125
#print axioms AugmentingSubmissionR125.metric_result
#print axioms AugmentingSubmissionR125.original_result
#print axioms AugmentingSubmissionR125.case_result
