import MarkovTwoVerticalMDB9
import MarkovResidualM295
/-! Machine-authored db972d62. Newly covered unbounded columns and denominators. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem vertical_previous_guardsMDB9 (n : ℕ) :
 let m := (frame (twoPath3af (2*n+20))).mid
 2 ≤ m.a ∧ InPolygon m.a m.b (n+9) (2*n+21) ∧
 InPolygon m.a m.b (n+9) (2*n+22) ∧ InPolygon m.a m.b (n+9) (2*n+23) ∧
 (n+9)+(2*n+21)+4 ≤ m.a+m.b-1 ∧ 4 ≤ n+9 ∧ 3 ≤ 2*n+21 ∧
 ¬VerticalMiddleMF1E m.a m.b (n+9) (2*n+21) ∧
 ¬(VerticalRegionMAC3 m.a m.b (n+9) (2*n+21) ∨
   VerticalVarianceMAC3 m.a m.b (n+9) (2*n+21)) ∧
 ¬VerticalSharpM37B m.a m.b (n+9) (2*n+21) ∧
 ¬(m.a=2 ∧ n+9=4) ∧ ¬(m.a=2 ∧ n+9=8) := by
 dsimp only
 obtain ⟨ha,hb⟩ := two_path_labels3af (2*n+20)
 rw [ha,hb]
 refine ⟨by omega,?_,?_,?_,by omega,by omega,by omega,?_,?_,?_,by omega,by omega⟩
 · constructor <;> nlinarith
 · constructor <;> nlinarith
 · constructor <;> nlinarith
 · unfold VerticalMiddleMF1E; omega
 · unfold VerticalRegionMAC3 VerticalVarianceMAC3; omega
 · unfold VerticalSharpM37B; omega

theorem vertical_gain_rawMDB9 (n : ℕ) :
 let p := (frame (twoPath3af (2*n+20))).mid.p
 coeff p (n+9) (2*n+21)*coeff p (n+9) (2*n+23)≤coeff p (n+9) (2*n+22)^2 := by
 simpa only [show 2*n+21+2=2*n+23 by omega,show 2*n+21+1=2*n+22 by omega] using
   source_two_vertical_allMDB9 _ (two_path_labels3af (2*n+20)).1 (n+9) (2*n+21)
end
end MathGKM.Markov
