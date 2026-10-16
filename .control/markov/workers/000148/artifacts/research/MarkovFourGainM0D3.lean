import MarkovResidualM0D3
/-! Machine-authored 0d346fa7. An unbounded actual-source family satisfying
every previous residual guard, now covered by the fourth-column theorem. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem four_previous_guardsM0D3 (n : ℕ) :
 let m := (frame (twoPath3af (n+5))).mid
 2 ≤ m.a ∧ InPolygon m.a m.b 4 (n+6) ∧ InPolygon m.a m.b 4 (n+7) ∧
 InPolygon m.a m.b 4 (n+8) ∧ 4+(n+6)+4 ≤ m.a+m.b-1 ∧ 4 ≤ 4 ∧ 3 ≤ n+6 ∧
 ¬VerticalMiddleMF1E m.a m.b 4 (n+6) ∧
 ¬(VerticalRegionMAC3 m.a m.b 4 (n+6) ∨ VerticalVarianceMAC3 m.a m.b 4 (n+6)) ∧
 ¬VerticalSharpM37B m.a m.b 4 (n+6) := by
 dsimp only
 obtain ⟨ha,hb⟩ := two_path_labels3af (n+5)
 rw [ha,hb]
 refine ⟨by omega,?_,?_,?_,by omega,by omega,by omega,?_,?_,?_⟩
 · constructor <;> omega
 · constructor <;> omega
 · constructor <;> omega
 · unfold VerticalMiddleMF1E
   omega
 · unfold VerticalRegionMAC3 VerticalVarianceMAC3
   omega
 · unfold VerticalSharpM37B
   omega

theorem four_gain_rawM0D3 (n : ℕ) :
 let p := (frame (twoPath3af (n+5))).mid.p
 coeff p 4 (n+6)*coeff p 4 (n+8) ≤ coeff p 4 (n+7)^2 := by
 simpa only [show n+6+2=n+8 by omega,show n+6+1=n+7 by omega] using
   source_two_vertical_fourM0D3 _ (two_path_labels3af (n+5)).1 (n+6)

end
end MathGKM.Markov
