import MarkovPellMidpointReductionMA24
/-! Machine-authored a24fe23d. Sharp midpoint band. Only a summand obstruction. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

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

theorem pell_gap_three_failureMA24 :
 pellTermMA24 22 25 3 17*pellTermMA24 22 25 3 18 <
 pellTermMA24 22 25 2 19*pellTermMA24 22 25 4 16 := by
 have h0 : Nat.choose 21 19=210 := by rw [←Nat.choose_symm (by decide : 19 ≤ 21)]; norm_num [Nat.choose]
 have h1 : Nat.choose 20 16=4845 := by rw [←Nat.choose_symm (by decide : 16 ≤ 20)]; norm_num [Nat.choose]
 have h2 : Nat.choose 20 17=1140 := by rw [←Nat.choose_symm (by decide : 17 ≤ 20)]; norm_num [Nat.choose]
 have h3 : Nat.choose 21 18=1330 := by rw [←Nat.choose_symm (by decide : 18 ≤ 21)]; norm_num [Nat.choose]
 norm_num only [pellTermMA24,horizontalTerm9a72]
 rw [h0,h1,h2,h3]
 norm_num [Nat.choose]

theorem not_pell_reverse_midpointMA24 : ¬PellReverseMidpointMA24 := by
 intro h
 have hh := h 22 25 2 19 16 (by omega)
 norm_num only at hh
 exact not_le_of_gt pell_gap_three_failureMA24 hh

end
end MathGKM.Markov
