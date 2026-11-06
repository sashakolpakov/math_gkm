import MathGKM.Target28058e477551114afeacf94e
import MathGKM.Round122MassA
import Lean
def Accepted87f95d48cf4ed38398e0e1cb.interface : MathGKM.Target28058e477551114afeacf94e.Interface :=
  (
    True.intro
  )
theorem Accepted87f95d48cf4ed38398e0e1cb.transport : MathGKM.Target28058e477551114afeacf94e.Transport Accepted87f95d48cf4ed38398e0e1cb.interface :=
  (
    True.intro
  )
theorem Accepted87f95d48cf4ed38398e0e1cb.obligation : MathGKM.Target28058e477551114afeacf94e.Goal Accepted87f95d48cf4ed38398e0e1cb.interface :=
  (
    fun A B X Y w hn hr hc => EqualMassR122.finite_mass_cardinality X Y w hn hr hc
  )
