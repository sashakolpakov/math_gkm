import MathGKM.Round36RecoveryA

/-! Machine-authored exact raw recovery wrapper, round36. -/
namespace MidpointInterfaceR36
theorem raw_recovery :
∀ n : ℕ, 1 ≤ n → ∀ i j : ℕ, MathGKM.Markov.coeff (MathGKM.Markov.frame (List.replicate (n-1) true)).mid.p i j = Finset.sum (Finset.range (n+1)) (fun s => MidpointR36.W n i j s) := MidpointR36.recovery
end MidpointInterfaceR36
#print axioms MidpointInterfaceR36.raw_recovery
