import MarkovFibonacciLC6ade
/-! Machine-authored 7d80a785. Stronger all-direction obstruction, not root negation. -/
namespace MathGKM.Markov
noncomputable section

theorem source_ninth_raw7d80 :
 let p := (frame (List.replicate 7 false)).mid.p
 coeff p 0 9=1 ∧ coeff p 1 6=7 ∧ coeff p 2 3=50 := by
 rw [source_fib6]
 change coeff (fib6 9) 0 9=1 ∧ coeff (fib6 9) 1 6=7 ∧ coeff (fib6 9) 2 3=50
 have h0 := fib_top6 0 9
 have h1 := fib_coeff_at6 9 0 6 2 (by norm_num)
 have h2 := fib_coeff_at6 9 1 3 4 (by norm_num)
 norm_num [Nat.choose] at h0 h1 h2
 exact ⟨h0,h1,h2⟩

theorem source_other_direction_failure7d80 :
 ∃ path : List Bool,
   (frame path).mid.a=1 ∧ (frame path).mid.b=9 ∧
   InPolygon (frame path).mid.a (frame path).mid.b 0 9 ∧
   InPolygon (frame path).mid.a (frame path).mid.b 1 6 ∧
   InPolygon (frame path).mid.a (frame path).mid.b 2 3 ∧
   coeff (frame path).mid.p 1 6^2 <
     coeff (frame path).mid.p 0 9*coeff (frame path).mid.p 2 3 := by
 refine ⟨List.replicate 7 false,?_,?_,?_,?_,?_,?_⟩
 · exact left_spine_a274 7
 · simpa using spine_b6 7
 · rw [left_spine_a274,spine_b6]; norm_num [InPolygon]
 · rw [left_spine_a274,spine_b6]; norm_num [InPolygon]
 · rw [left_spine_a274,spine_b6]; norm_num [InPolygon]
 · obtain ⟨h0,h1,h2⟩ := source_ninth_raw7d80
   rw [h0,h1,h2]
   norm_num

#print axioms source_other_direction_failure7d80
end
end MathGKM.Markov
