import MathGKM.Round125CaseA

/- Machine-authored round125. Count exactly the unchanged pairEdit steps.
The two projections may take arbitrary valid intermediate objects. -/
namespace AugmentingPairR125
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open AugmentingCaseR125
open PacketsR120.Tile

inductive PairSteps (N : ℕ) : ℕ → Pair → Pair → Prop where
  | refl (z) : PairSteps N 0 z z
  | tail {k x y z} : PairSteps N k x y → pairEdit N y z → PairSteps N (k+1) x z

theorem layers {N k : ℕ} {z w : Pair} (h : PairSteps N k z w) :
    ∃ a b, a+b=k ∧ Steps N a z.1 w.1 ∧ Steps N b z.2 w.2 := by
  induction h with
  | refl z => exact ⟨0,0,rfl,Steps.refl _,Steps.refl _⟩
  | @tail k x y z hs he ih =>
    obtain ⟨a,b,hab,ha,hb⟩ := ih
    rcases he.2.2.2.2 with ⟨hl,hr⟩|⟨hl,hr⟩
    · refine ⟨a+1,b,by omega,Steps.tail ha hl,?_⟩
      rw [← hr]
      exact hb
    · refine ⟨a,b+1,by omega,?_,Steps.tail hb hr⟩
      rw [← hl]
      exact ha

theorem zero_steps {N : ℕ} {x y : Obj} (h : Steps N 0 x y) : x=y := by
  cases h
  rfl

theorem central_lower (k : ℕ) (w : Pair)
    (hs : PairSteps 46 k (low,high) w)
    (hw : valid 46 w.1 ∧ valid 46 w.2)
    (hd : du 0 w.1=7 ∧ du 0 w.2=7 ∧ dv 46 0 w.1=18 ∧ dv 46 0 w.2=18) :
    6≤k := by
  have h := source_degrees
  have hb := endpoint_matching_changes 46 0 6 18 (low,high) w ⟨h.1,h.2.1⟩ hw
    ⟨h.2.2.1,h.2.2.2.1,hd.1,hd.2.1,h.2.2.2.2.1,h.2.2.2.2.2,hd.2.2.1,hd.2.2.2⟩
  obtain ⟨a,b,hab,ha,hb'⟩ := layers hs
  have hgain : high.1.card<w.2.1.card := by simpa using Nat.lt_of_lt_of_le (Nat.lt_succ_self high.1.card) (Nat.le_of_eq hb.2.symm)
  have hh := high_gain_lower b w.2 hb' hgain
  have ha1 : 1≤a := by
    by_contra hn
    have hz : a=0 := by omega
    subst a
    have he := zero_steps ha
    have hc := congrArg (fun o : Obj => o.1.card) he
    simp only [Prod.fst] at hc
    have ht := hb.1
    change w.1.1.card+1=low.1.card at ht
    omega
  omega

theorem central_upper :
    PairSteps 46 9 (low,high) (decode lower1,decode central8) := by
  have vl : valid 46 low := source_degrees.1
  have vh : valid 46 high := source_degrees.2.1
  have vl' : valid 46 (decode lower1) := central_endpoints.2.2.1
  have lift : ∀ {k : ℕ} {x y : Obj}, Steps 46 k x y → valid 46 x →
      PairSteps 46 k (decode lower1,x) (decode lower1,y) := by
    intro k x y hs
    induction hs with
    | refl x => intro _; exact PairSteps.refl _
    | @tail k x y z hs he ih =>
      intro hv
      exact PairSteps.tail (ih hv) ⟨vl',he.1,vl',he.2.1,Or.inr ⟨rfl,he⟩⟩
  have hlow : PairSteps 46 1 (low,high) (decode lower1,high) :=
    PairSteps.tail (PairSteps.refl _) ⟨vl,vh,vl',vh,Or.inl ⟨lowerstep0,rfl⟩⟩
  have trans : ∀ {k l : ℕ} {x y z : Pair}, PairSteps 46 k x y → PairSteps 46 l y z →
      PairSteps 46 (k+l) x z := by
    intro k l x y z hxy hyz
    induction hyz with
    | refl y => simpa using hxy
    | @tail l y z w hyz he ih =>
      simpa [Nat.add_assoc] using PairSteps.tail (ih hxy) he
  exact trans hlow (lift centralpath vh)

theorem high_unmatched :
    ColorFibersR66.uncovered 46 high.1={0,9,18,27,36,45} := by decide

theorem family_words :
    highWord=V::(List.replicate 5 (List.replicate 4 PacketsR120.Tile.D++[V])).flatten ∧
    lowWord=[V]++List.replicate 16 PacketsR120.Tile.D++[V]++List.replicate 6 PacketsR120.Tile.D := by decide

end AugmentingPairR125
#print axioms AugmentingPairR125.central_lower
#print axioms AugmentingPairR125.central_upper
#print axioms AugmentingPairR125.high_unmatched
