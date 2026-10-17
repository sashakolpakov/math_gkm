import MarkovMiddleJetResidualM80F
/-! Machine-authored 9db2326d. Six actual small source rows outside the
third-middle-row strip; exact raw coefficients including zero tails. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 40000000
set_option maxRecDepth 150000

theorem third_exceptions_boundedM9DB (q c : ℕ) (r : Bool)
 (he : (q=5 ∧ r=false) ∨ (q=6 ∧ r=false) ∨ (q=7 ∧ r=false) ∨
   (q=6 ∧ r=true) ∨ (q=7 ∧ r=true) ∨ (q=8 ∧ r=true)) (hc : c ≤ q+5) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+5))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+5)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+5))^2 := by
 rcases he with ⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;>
   interval_cases c <;> decide

end
end MathGKM.Markov
