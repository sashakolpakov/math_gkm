import MarkovThreeCharge863a
/-! Machine-authored be07ef75. Exact source 12/13 distinguishes ambient
degree-12 binomial scaling from the stronger support-degree-10 scaling.
Only the latter fails; the pinned raw inequality holds strictly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem source_twelve_coefficientsBe07 :
 coeff (frame (List.replicate 11 true)).mid.p 0 14=11 ∧
 coeff (frame (List.replicate 11 true)).mid.p 1 14=510 ∧
 coeff (frame (List.replicate 11 true)).mid.p 2 14=10680 := by
 rw [right_horizontal_sum_fixed9a72 11 0 14 1 (by omega) (by omega),
   right_horizontal_sum_fixed9a72 11 1 14 2 (by omega) (by omega),
   right_horizontal_sum_fixed9a72 11 2 14 3 (by omega) (by omega)]
 norm_num [Finset.sum_range_succ,horizontalTerm9a72,Nat.choose]

theorem source_twelve_polygonBe07 :
 (frame (List.replicate 11 true)).mid.a=12 ∧
 (frame (List.replicate 11 true)).mid.b=13 ∧
 InPolygon 12 13 0 14 ∧ InPolygon 12 13 1 14 ∧ InPolygon 12 13 2 14 := by
 have h := right_labels650 11
 norm_num at h
 exact ⟨h.1,h.2,by norm_num [InPolygon],by norm_num [InPolygon],by norm_num [InPolygon]⟩

theorem source_twelve_scaling_distinctionBe07 :
 let P := (frame (List.replicate 11 true)).mid.p
 coeff P 0 14*coeff P 2 14 < coeff P 1 14^2 ∧
 4*10*(coeff P 0 14*coeff P 2 14) ≤ 3*9*coeff P 1 14^2 ∧
 9*coeff P 1 14^2 < 20*(coeff P 0 14*coeff P 2 14) := by
 dsimp only
 obtain ⟨h0,h1,h2⟩ := source_twelve_coefficientsBe07
 rw [h0,h1,h2]
 norm_num

#print axioms source_twelve_coefficientsBe07
#print axioms source_twelve_polygonBe07
#print axioms source_twelve_scaling_distinctionBe07
end
end MathGKM.Markov
