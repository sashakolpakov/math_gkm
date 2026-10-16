import MarkovPellMidpointReductionMA24
import MarkovPellUniformObstructionMA24
/-! Machine-authored a24fe23d. Sharp uniform band and explicit rejection of
the false remaining premise. This is not a root refutation. -/
namespace MathGKM.Markov
noncomputable section

theorem pell_midpoint_bandMA24 (a j s q r : ℕ) (hqr : q ≤ r+2) :
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) r ≤
 pellTermMA24 a j (s+1) ((q+r)/2)*pellTermMA24 a j (s+1) ((q+r+1)/2) := by
 by_cases h0 : q ≤ r
 · exact pell_half_midpointMA24 a j s q r h0
 have hc : q=r+1 ∨ q=r+2 := by omega
 rcases hc with hc | hc <;> subst q
 · simpa only [show (r+1+r)/2=r by omega,show (r+1+r+1)/2=r+1 by omega]
     using pell_reverse_oneMA24 a j s r
 · simpa only [show (r+2+r)/2=r+1 by omega,show (r+2+r+1)/2=r+1 by omega,pow_two]
     using pell_reverse_twoMA24 a j s r

theorem not_pell_reverse_midpointMA24 : ¬PellReverseMidpointMA24 := by
 intro h
 have hh := h 23 25 1 21 18 (by omega)
 norm_num only at hh
 have hf := pell_uniform_midpoint_failureMA24 0
 norm_num only [Nat.zero_add] at hf
 linarith

theorem pell_gap_three_unboundedMA24 (B : ℕ) :
 ∃ a j s q r : ℕ, B<a ∧ q=r+3 ∧
 pellTermMA24 a j (s+1) ((q+r)/2)*pellTermMA24 a j (s+1) ((q+r+1)/2) <
 pellTermMA24 a j s q*pellTermMA24 a j (s+2) r := by
 refine ⟨B+23,B+25,1,B+21,B+18,by omega,by omega,?_⟩
 simpa only [show (B+21+(B+18))/2=B+19 by omega,
   show (B+21+(B+18)+1)/2=B+20 by omega] using pell_uniform_midpoint_failureMA24 B

end
end MathGKM.Markov
