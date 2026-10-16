import MarkovCentralSupportM6E1
import MarkovCentralWitnessM3A1
/-! Machine-authored 6e1369de. An unbounded source family newly removed
from the previous residual, at starting column three. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

theorem central_previous_guardsM6E1 (n : ℕ) :
 let m := (frame (centralPathM3A1 n)).mid
 2 ≤ m.a ∧ InPolygon m.a m.b 3 (n+5) ∧ InPolygon m.a m.b 4 (n+5) ∧
 InPolygon m.a m.b 5 (n+5) ∧ 3+(n+5)+4 ≤ m.a+m.b-1 ∧ 5 ≤ n+5 ∧
 ¬HorizontalMiddleMF1E m.a m.b 3 (n+5) ∧
 ¬(HorizontalRegionMAC3 m.a m.b 3 (n+5) ∨
   HorizontalVarianceMAC3 m.a m.b 3 (n+5)) ∧
 ¬HorizontalSharpM37B m.a m.b 3 (n+5) ∧
 ¬(m.a=2 ∧ (3:ℕ)=2 ∧ m.b=2*(n+5)+1) := by
 dsimp only
 obtain ⟨ha,hb⟩ := central_path_labelsM3A1 n
 rw [ha,hb]
 refine ⟨by omega,?_,?_,?_,by omega,by omega,?_,?_,?_,by omega⟩
 · rw [central_polygonM6E1]; omega
 · rw [central_polygonM6E1]; omega
 · rw [central_polygonM6E1]; omega
 · unfold HorizontalMiddleMF1E
   omega
 · unfold HorizontalRegionMAC3 HorizontalVarianceMAC3 MixtureRegionMAC3 VarianceRegionMAC3
   omega
 · unfold HorizontalSharpM37B SharpRegionM37B
   have hdiv : 2*(n+5)/(2*(n+5)+1)=0 := Nat.div_eq_of_lt (by omega)
   have he : 2*(n+5)+1-2*(n+5)-1=0 := by omega
   rw [hdiv,he]
   norm_num
   push_cast
   nlinarith [sq_nonneg (6-(2+((n:ℝ)+5))-2+3)]

theorem central_gain_rawM6E1 (n : ℕ) :
 let p := (frame (centralPathM3A1 n)).mid.p
 coeff p 3 (n+5)*coeff p 5 (n+5) ≤ coeff p 4 (n+5)^2 := by
 obtain ⟨ha,hb⟩ := central_path_labelsM3A1 n
 exact source_two_rowM6E1 _ _ _ ha hb

end
end MathGKM.Markov
