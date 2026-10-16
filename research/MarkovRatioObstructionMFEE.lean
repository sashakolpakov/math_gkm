import MarkovLiftRootMFEE
/-! Machine-authored fee405c8. A stronger separate-ratio convexity shortcut
fails, although the relevant source lower triple satisfies its raw inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem previous_ratio_not_convexMFEE :
 (liftTermMAE9 13 1 1:ℚ)/(liftTermMAE9 13 2 2:ℚ)-
   2*((liftTermMAE9 13 1 0:ℚ)/(liftTermMAE9 13 2 1:ℚ)) =
   -18761/44990946 := by
 norm_num [liftTermMAE9,Nat.choose]

theorem previous_ratio_convex_failureMFEE :
 (liftTermMAE9 13 1 1:ℚ)/(liftTermMAE9 13 2 2:ℚ) <
   2*((liftTermMAE9 13 1 0:ℚ)/(liftTermMAE9 13 2 1:ℚ)) := by
 have h := previous_ratio_not_convexMFEE
 linarith

theorem ratio_obstruction_source_validMFEE :
 InPolygon 3 (sourceNME9C 13 true) 4 13 ∧
 InPolygon 3 (sourceNME9C 13 true) 5 13 ∧
 InPolygon 3 (sourceNME9C 13 true) 6 13 ∧
 threeRawM9E2 13 true 4 13*threeRawM9E2 13 true 6 13 ≤
   threeRawM9E2 13 true 5 13^2 := by
 refine ⟨lower_band_polygonMAE9 13 4 13 true (by omega) (by omega) (by omega),
   lower_band_polygonMAE9 13 5 13 true (by omega) (by omega) (by omega),
   lower_band_polygonMAE9 13 6 13 true (by omega) (by omega) (by omega),?_⟩
 exact source_horizontal1MAE9 13 13 true (by omega) (by omega)

end
end MathGKM.Markov
