import MarkovResidualMEC6
/-! Machine-authored ec6f4b83. Unbounded newly covered actual-source triples. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem upper_previous_guardsMEC6 (n : ℕ) :
 let m := (frame (lowerPathM58E (n+5) 1)).mid
 2 ≤ m.a ∧ InPolygon m.a m.b 3 (n+7) ∧ InPolygon m.a m.b 4 (n+7) ∧
 InPolygon m.a m.b 5 (n+7) ∧ 3+(n+7)+4 ≤ m.a+m.b-1 ∧ 5 ≤ n+7 ∧
 ¬HorizontalMiddleMF1E m.a m.b 3 (n+7) ∧
 ¬(HorizontalRegionMAC3 m.a m.b 3 (n+7) ∨ HorizontalVarianceMAC3 m.a m.b 3 (n+7)) ∧
 ¬HorizontalSharpM37B m.a m.b 3 (n+7) ∧
 ¬(m.a=2 ∧ 2*(n+7)+1 ≤ m.b) := by
 dsimp only
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E (n+5) 1 (by omega)
 rw [ha,hb]
 refine ⟨by omega,?_,?_,?_,by omega,by omega,?_,?_,?_,by omega⟩
 · exact (upper_polygonM2B3 (n+5) 1 3 (by omega) (by omega)).mpr ⟨by omega,by omega⟩
 · exact (upper_polygonM2B3 (n+5) 1 4 (by omega) (by omega)).mpr ⟨by omega,by omega⟩
 · exact (upper_polygonM2B3 (n+5) 1 5 (by omega) (by omega)).mpr ⟨by omega,by omega⟩
 · unfold HorizontalMiddleMF1E
   omega
 · unfold HorizontalRegionMAC3 HorizontalVarianceMAC3
   omega
 · unfold HorizontalSharpM37B
   omega

theorem upper_gain_rawMEC6 (n : ℕ) :
 let p := (frame (lowerPathM58E (n+5) 1)).mid.p
 coeff p 3 (n+7)*coeff p 5 (n+7) ≤ coeff p 4 (n+7)^2 := by
 obtain ⟨ha,hb⟩ := lower_path_labelsM58E (n+5) 1 (by omega)
 obtain ⟨_,h0,h1,h2,_⟩ := upper_previous_guardsMEC6 n
 exact numerator_two_horizontalMEC6 _ ha _ _ h0 h1 h2

end
end MathGKM.Markov
