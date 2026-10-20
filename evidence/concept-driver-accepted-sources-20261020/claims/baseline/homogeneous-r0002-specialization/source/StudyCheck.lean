import MathGKM.Targetad189249118938c71fcbffc4
import MathGKM.HomogeneousBridgeR2
import Lean
def StudyInterface : MathGKM.Targetad189249118938c71fcbffc4.Interface :=
  (
    True.intro
  )
theorem StudyTransport : MathGKM.Targetad189249118938c71fcbffc4.Transport StudyInterface :=
  (
    True.intro
  )
theorem StudyObligation : MathGKM.Targetad189249118938c71fcbffc4.Goal StudyInterface :=
  (
    by
      have spec_U : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.U = MathGKM.Markov.U :=
        by
          simp [MathGKM.HomogeneousBridgeR2.specialize, MathGKM.HomogeneousBridgeR2.U]

      have spec_V : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.V = MathGKM.Markov.V :=
        by
          simp [MathGKM.HomogeneousBridgeR2.specialize, MathGKM.HomogeneousBridgeR2.V]

      have spec_W : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.W = 1 :=
        by
          simp [MathGKM.HomogeneousBridgeR2.specialize, MathGKM.HomogeneousBridgeR2.W]

      have spec_S : MathGKM.HomogeneousBridgeR2.specialize MathGKM.HomogeneousBridgeR2.S = MathGKM.Markov.S :=
        by
          simp [MathGKM.HomogeneousBridgeR2.S, MathGKM.Markov.S, spec_U, spec_V, spec_W]
      have spec_initial : MathGKM.HomogeneousBridgeR2.specializeFrame MathGKM.HomogeneousBridgeR2.initial = MathGKM.Markov.initial :=
        by
          simp [MathGKM.HomogeneousBridgeR2.specializeFrame, MathGKM.HomogeneousBridgeR2.specializeLabel, MathGKM.HomogeneousBridgeR2.initial, MathGKM.Markov.initial,
            spec_U, spec_V, spec_W]
      have spec_advance (f : MathGKM.HomogeneousBridgeR2.Frame) (r : Bool) :
        MathGKM.HomogeneousBridgeR2.specializeFrame (MathGKM.HomogeneousBridgeR2.advance f r) = MathGKM.Markov.advance (MathGKM.HomogeneousBridgeR2.specializeFrame f) r :=
        by
          cases r <;> simp [MathGKM.HomogeneousBridgeR2.advance, MathGKM.Markov.advance, MathGKM.HomogeneousBridgeR2.specializeFrame, MathGKM.HomogeneousBridgeR2.specializeLabel,
            spec_U, spec_V, spec_W, spec_S]
      have lift : ∀ (p : List Bool) (f : MathGKM.HomogeneousBridgeR2.Frame),
          MathGKM.HomogeneousBridgeR2.specializeFrame (p.foldl MathGKM.HomogeneousBridgeR2.advance f) =
            p.foldl MathGKM.Markov.advance (MathGKM.HomogeneousBridgeR2.specializeFrame f) := by
        intro p
        induction p with
        | nil => intro f; rfl
        | cons r p ih =>
          intro f
          simp only [List.foldl_cons]
          rw [ih, spec_advance]
      intro path
      simpa [MathGKM.HomogeneousBridgeR2.frame, MathGKM.Markov.frame, spec_initial] using lift path MathGKM.HomogeneousBridgeR2.initial
  )
