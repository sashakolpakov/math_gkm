import MathGKM.Round127FamilyA

/- Machine-authored round127. Closed candidates for independent admission. -/
namespace PropagatingR127
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open AugmentingPairR125 (PairSteps)
open UniformDistanceR126 PacketsR120.Tile
open MathGKM.Markov (frame InPolygon)
attribute [local irreducible] ColorForgettingR108.rankFiber

theorem lift_left {N k : ℕ} {x y u : Obj} (h : Steps N k x y)
    (hu : valid N u) : PairSteps N k (x,u) (y,u) := by
  induction h with
  | refl => exact PairSteps.refl _
  | tail hs he ih =>
    exact PairSteps.tail ih ⟨he.1,hu,he.2.1,hu,Or.inl ⟨he,rfl⟩⟩

theorem lift_right {N k : ℕ} {x y u : Obj} (h : Steps N k x y)
    (hu : valid N u) : PairSteps N k (u,x) (u,y) := by
  induction h with
  | refl => exact PairSteps.refl _
  | tail hs he ih =>
    exact PairSteps.tail ih ⟨hu,he.1,hu,he.2.1,Or.inr ⟨rfl,he⟩⟩

theorem pair_trans {N k l : ℕ} {x y z : Pair}
    (h : PairSteps N k x y) (g : PairSteps N l y z) :
    PairSteps N (k+l) x z := by
  induction g with
  | refl => simpa using h
  | tail hs he ih => simpa [Nat.add_assoc] using PairSteps.tail (ih h) he

theorem pair_route (h : ℕ) (hh : 1≤h) :
    PairSteps (20*h+6) (4*h+1) (low h,high h) (endpoint h) := by
  have hw := family_width h hh
  have lo := word_steps (low_route h hh) hw.2
  have hi := word_steps (high_route h hh) hw.1
  have hl := lift_left lo (family_valid h hh).2
  have hr := lift_right hi (endpoints_degrees h hh).1
  simpa only [Nat.add_comm,endpoint,low,high] using pair_trans hl hr

def GenericResult : Prop :=
  (∀ xs : List Tile, valid (width xs) (decode xs)) ∧
  (∀ (k : ℕ) (pre post : List Tile),
    Steps (width (pre++[V]++List.replicate k D++post)) k
      (decode (pre++[V]++List.replicate k D++post))
      (decode (pre++List.replicate k D++[V]++post)))

theorem generic_result : GenericResult :=
  ⟨valid_decode,fun k pre post => word_steps (slide_many k pre post) rfl⟩

def EndpointsResult : Prop := ∀ h : ℕ, 1≤h →
    (valid (20*h+6) (endpoint h).1 ∧ valid (20*h+6) (endpoint h).2 ∧
      du 0 (endpoint h).1=4*h-1 ∧ du 0 (endpoint h).2=4*h-1 ∧
      dv (20*h+6) 0 (endpoint h).1=6*h+6 ∧
      dv (20*h+6) 0 (endpoint h).2=6*h+6) ∧
    endpoint h∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1)

theorem endpoints_result : EndpointsResult := fun h hh =>
  ⟨endpoints_degrees h hh,endpoint_member h hh⟩

def ReachResult : Prop := ∀ h : ℕ, 1≤h →
    (low h,high h)∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-2) ∧
    endpoint h∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1) ∧
    PairSteps (20*h+6) (4*h+1) (low h,high h) (endpoint h) ∧
    (∀ (k : ℕ) (w : Pair), w∈ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1) →
      PairSteps (20*h+6) k (low h,high h) w → 2*h+2≤k) ∧
    (let E := (frame (List.replicate (10*h+2) true)).mid;
      E.a=10*h+3 ∧ E.b=10*h+4 ∧
      InPolygon E.a E.b (4*h-2) (6*h+6) ∧
      InPolygon E.a E.b (4*h-1) (6*h+6) ∧
      InPolygon E.a E.b (4*h) (6*h+6))

theorem reach_result : ReachResult := by
  intro h hh
  exact ⟨family_member h hh,endpoint_member h hh,pair_route h hh,
    fun k w => central_rank_lower h k hh w,original_scope h hh⟩

end PropagatingR127
#print axioms PropagatingR127.generic_result
#print axioms PropagatingR127.endpoints_result
#print axioms PropagatingR127.reach_result
