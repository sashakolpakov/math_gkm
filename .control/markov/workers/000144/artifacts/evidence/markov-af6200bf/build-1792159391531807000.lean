import MarkovResidualMAF6
/-! Machine-authored af6200bf. Unbounded actual-source witnesses newly covered. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1500000

theorem lower_previous_guardsMAF6 (n : ℕ) :
 let m := (frame (lowerPathM58E (n+5) 1)).mid
 2 ≤ m.a ∧ InPolygon m.a m.b 3 (n+5) ∧ InPolygon m.a m.b 4 (n+5) ∧
 InPolygon m.a m.b 5 (n+5) ∧ 3+(n+5)+4 ≤ m.a+m.b-1 ∧ 5 ≤ n+5 ∧
 ¬HorizontalMiddleMF1E m.a m.b 3 (n+5) ∧
 ¬(HorizontalRegionMAC3 m.a m.b 3 (n+5) ∨ HorizontalVarianceMAC3 m.a m.b 3 (n+5)) ∧
 ¬HorizontalSharpM37B m.a m.b 3 (n+5) ∧
 ¬(m.a=2 ∧ m.b=2*(n+5)+1) := by
 dsimp only
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E (n+5) 1 (by omega)
 rw [ha,hb]
 refine ⟨by omega,?_,?_,?_,by omega,by omega,?_,?_,?_,by omega⟩
 · rw [lower_polygonM58E]; omega
 · rw [lower_polygonM58E]; omega
 · rw [lower_polygonM58E]; omega
 · unfold HorizontalMiddleMF1E
   omega
 · unfold HorizontalRegionMAC3 HorizontalVarianceMAC3 MixtureRegionMAC3 VarianceRegionMAC3
   omega
 · unfold HorizontalSharpM37B SharpRegionM37B
   have hdiv : 2*(n+5)/(2*(n+5+1)+1)=0 := Nat.div_eq_of_lt (by omega)
   have he : 2*(n+5+1)+1-2*(n+5)-1=2 := by omega
   rw [hdiv,he]
   norm_num
   push_cast
   nlinarith [sq_nonneg (6-(2+((n:ℝ)+5))-2+3)]

theorem lower_gain_rawMAF6 (n : ℕ) :
 let p := (frame (lowerPathM58E (n+5) 1)).mid.p
 coeff p 3 (n+5)*coeff p 5 (n+5) ≤ coeff p 4 (n+5)^2 := by
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E (n+5) 1 (by omega)
 exact source_two_lower_lcMAF6 _ _ 1 _ ha hb

end
end MathGKM.Markov
