-- Machine-authored by Codex/gpt-6-astra, 2026-10-13.
import MathGKM.Continuation

namespace MathGKM.Continuation.Examples

def research : State :=
  ⟨⟨{ code := [.request 3] }, []⟩, ⟨12, .work (.search 7 .halt)⟩⟩

/-- A universal example, not an enumeration: all horizons, all environments,
    all rewards on observations, including arbitrary later engine changes. -/
theorem research_improves (n : Nat) (env : Environment) (reward : List View → Int) :
    utility reward (run (n + 1) research env) <
      utility reward (switchRun (n + 1) research env) :=
  (main n research env reward (by decide)).2.2

/-- The reply installs an engine which itself installs another engine. -/
def changingEnvironment : Environment
  | .science, _ => { science := { answer := 4, replacement := some [.record 9] }, delay := 2 }
  | .engine _, _ => { engine := some ⟨0, .install 0 (.work .halt) (.work .halt)⟩ }

theorem two_later_engine_changes :
    (run 1 research changingEnvironment).state.engine.code =
      .install 0 (.work .halt) (.work .halt) ∧
    (run 2 research changingEnvironment).state.engine.code = .work .halt ∧
    (run 2 research changingEnvironment).state.core.science.archive = [9, 4] := by
  exact ⟨rfl, rfl, rfl⟩

theorem concrete_costs :
    changeCost research = 5 ∧
    (run 2 research changingEnvironment).cost = 33 ∧
    (switchRun 2 research changingEnvironment).cost = 26 := by
  decide

def shortLived : State := ⟨⟨{ code := [] }, []⟩, ⟨2, .search 0 .halt⟩⟩
def immediateReplacement : Environment := fun _ _ => { engine := some ⟨0, .halt⟩ }

theorem immediate_coalescence :
    (tick (strip shortLived) immediateReplacement).state =
      (tick shortLived immediateReplacement).state := rfl

/-- For every horizon, the incumbent saves its own padding after round one.
    Freezing this improvement would falsely predict a growing saving. -/
theorem no_frozen_incumbent (n : Nat) :
    (run (n + 1) (strip shortLived) immediateReplacement).cost + 2 =
      (run (n + 1) shortLived immediateReplacement).cost := by
  have h := coalesced_cost n (strip shortLived) shortLived immediateReplacement
    immediate_coalescence
  have ha : (tick (strip shortLived) immediateReplacement).cost = 4 := by decide
  have hb : (tick shortLived immediateReplacement).cost = 6 := by decide
  omega

theorem change_cost_defeats_saving (n : Nat) (reward : List View → Int) :
    utility reward (switchRun (n + 1) shortLived immediateReplacement) <
      utility reward (run (n + 1) shortLived immediateReplacement) := by
  have hc := no_frozen_incumbent n
  have ho := continuation_observations (n + 1) (strip shortLived) shortLived
    immediateReplacement rfl
  have hk : changeCost shortLived = 4 := rfl
  simp only [utility, switchRun, ho, hk]
  omega

/-- Zero continuation rounds cannot repay a positive installation cost. -/
theorem zero_horizon (s : State) (env : Environment) (reward : List View → Int) :
    utility reward (switchRun 0 s env) < utility reward (run 0 s env) := by
  have h : 0 < changeCost s := by unfold changeCost installCost; omega
  simp only [utility, switchRun, run]
  have hv : view (strip s) = view s := rfl
  rw [hv]
  omega

/-- If padding or elapsed cost affects replies, the environment hypothesis
    is missing. Two such response laws can reverse the observation. -/
def paddingSensitive (padding : Nat) : Environment :=
  fun _ _ => { science := { answer := padding } }

def asks : State := ⟨⟨{ code := [.request 0] }, []⟩, ⟨8, .work .halt⟩⟩

theorem response_hypothesis_needed :
    (run 1 (strip asks) (paddingSensitive 0)).state.core.science.archive ≠
      (run 1 asks (paddingSensitive 8)).state.core.science.archive := by
  decide

/-- A reward for consuming resources reverses the preference. Thus the
    monotonicity claim depends on the *proved* reward-minus-cost objective. -/
def wasteReward (r : Outcome) : Int := r.cost

theorem utility_hypothesis_needed :
    wasteReward (switchRun 2 research changingEnvironment) <
      wasteReward (run 2 research changingEnvironment) := by
  decide

/-- A pushout's positive example: both copies retain the body and archive. -/
theorem gluing_observation_example :
    gluedView (embedLeft (strip research)) = gluedView (embedRight research) := by
  rw [glue_bridge (strip research) research rfl]

theorem installed_example (n : Nat) (env : Environment) (reward : List View → Int) :
    utility reward (run (n + 1) research env) <
      utility reward (afterChange (n + 1) ⟨strip research, 5⟩ env) :=
  (installed_main n research ⟨strip research, 5⟩ env reward (by rfl)).2

theorem additional_cost_example (n : Nat) (env : Environment) (reward : List View → Int) :
    utility reward (run (n + 1) research env) <
      utility reward (afterChange (n + 1) ⟨strip research, 11⟩ env) :=
  additional_change_cost 6 n research env reward (by decide)

def emptyCore : Core := ⟨{ code := [.record 7] }, []⟩

theorem body_compatibility_needed :
    (run 1 ⟨emptyCore, ⟨0, .halt⟩⟩ (fun _ _ => {})).state.core.science.archive = [] ∧
    (run 1 ⟨emptyCore, ⟨1, .work .halt⟩⟩ (fun _ _ => {})).state.core.science.archive = [7] := by
  exact ⟨rfl, rfl⟩

theorem padding_order_needed :
    (tick ⟨emptyCore, ⟨0, .halt⟩⟩ (fun _ _ => {})).cost <
      (tick ⟨emptyCore, ⟨1, .halt⟩⟩ (fun _ _ => {})).cost := by
  decide

theorem deadline_without_bound_fails :
    (run 1 shortLived immediateReplacement).cost ≤ 6 ∧
    ¬ (switchRun 1 shortLived immediateReplacement).cost ≤ 6 := by
  decide

def oneAccount : State := ⟨emptyCore, ⟨1, .halt⟩⟩

/-- The guard is sufficient, not a decision procedure for all useful changes. -/
theorem guard_is_incomplete :
    tryChange oneAccount = none ∧
    utility (fun _ => 0) (run 4 oneAccount (fun _ _ => {})) <
      utility (fun _ => 0) (switchRun 4 oneAccount (fun _ _ => {})) := by
  constructor
  · rfl
  · decide

theorem deadline_example (env : Environment) (j budget : Nat)
    (in_time : (run (j + 1) research env).cost ≤ budget) :
    changeCost research + (run (j + 1) (strip research) env).cost ≤ budget :=
  (deadline_preservation research env (by decide) j budget (fun _ => True) trivial in_time).2

end MathGKM.Continuation.Examples
