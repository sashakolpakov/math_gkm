import MathGKM.Targete2acb94e473db39f8642f450
import MathGKM.MarkovCoverageR0000
import Lean
def Accepted54255e349b93aabd9e655107.interface : MathGKM.Targete2acb94e473db39f8642f450.Interface :=
  (
    True.intro
  )
theorem Accepted54255e349b93aabd9e655107.transport : MathGKM.Targete2acb94e473db39f8642f450.Transport Accepted54255e349b93aabd9e655107.interface :=
  (
    True.intro
  )
theorem Accepted54255e349b93aabd9e655107.obligation : MathGKM.Targete2acb94e473db39f8642f450.Goal Accepted54255e349b93aabd9e655107.interface :=
  (
    fun p => ⟨MathGKM.Markov.frame_farey p, MathGKM.Markov.frame_adjacent_determinants p⟩
  )
