import MarkovMiddleJetResidualM80F
/-! Machine-authored f8d0715b. Four actual small source cases outside
the polynomial strip. Kernel reduction, with zeros and full row support. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 150000

theorem second_exceptions_boundedMF8D (q c : ℕ) (r : Bool)
 (he : (q=4 ∧ r=false) ∨ (q=5 ∧ r=false) ∨
   (q=5 ∧ r=true) ∨ (q=6 ∧ r=true)) (hc : c ≤ q+4) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+4))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+4)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+4))^2 := by
 rcases he with ⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;>
   interval_cases c <;> decide

end
end MathGKM.Markov
