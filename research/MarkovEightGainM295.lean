import MarkovResidualM295
/-! Machine-authored 29509309. An unbounded actual source family satisfying
all old residual guards, including exclusion of the fourth column. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem eight_previous_guardsM295 (n : ℕ) :
 let m := (frame (twoPath3af (n+9))).mid
 2 ≤ m.a ∧ InPolygon m.a m.b 8 (n+10) ∧ InPolygon m.a m.b 8 (n+11) ∧
 InPolygon m.a m.b 8 (n+12) ∧ 8+(n+10)+4 ≤ m.a+m.b-1 ∧ 4 ≤ 8 ∧ 3 ≤ n+10 ∧
 ¬VerticalMiddleMF1E m.a m.b 8 (n+10) ∧
 ¬(VerticalRegionMAC3 m.a m.b 8 (n+10) ∨ VerticalVarianceMAC3 m.a m.b 8 (n+10)) ∧
 ¬VerticalSharpM37B m.a m.b 8 (n+10) ∧ ¬(m.a=2 ∧ (8:ℕ)=4) := by
 dsimp only
 obtain ⟨ha,hb⟩ := two_path_labels3af (n+9)
 rw [ha,hb]
 refine ⟨by omega,?_,?_,?_,by omega,by omega,by omega,?_,?_,?_,by omega⟩
 · constructor <;> omega
 · constructor <;> omega
 · constructor <;> omega
 · unfold VerticalMiddleMF1E
   omega
 · unfold VerticalRegionMAC3 VerticalVarianceMAC3
   omega
 · unfold VerticalSharpM37B
   omega

theorem eight_gain_rawM295 (n : ℕ) :
 let p := (frame (twoPath3af (n+9))).mid.p
 coeff p 8 (n+10)*coeff p 8 (n+12) ≤ coeff p 8 (n+11)^2 := by
 simpa only [show n+10+2=n+12 by omega,show n+10+1=n+11 by omega] using
   source_two_vertical_eightM295 _ (two_path_labels3af (n+9)).1 (n+10)

end
end MathGKM.Markov
