import MarkovFibonacciFormula6ade
import MarkovFibonacciLC6ade
/-! Machine-authored request 3edac4bf. Actual-source failure in direction
(1,-3), which is NOT among the three directions of the pinned conjecture. -/
namespace MathGKM.Markov
noncomputable section

theorem source_ninth_coeff3eda :
 coeff (frame (List.replicate 7 false)).mid.p 0 9=1 ∧
 coeff (frame (List.replicate 7 false)).mid.p 1 6=7 ∧
 coeff (frame (List.replicate 7 false)).mid.p 2 3=50 := by
 rw [source_fib6]
 have h0 := fib_top6 0 9
 have h1 := fib_formula6 0 6 2
 have h2 := fib_formula6 1 3 4
 norm_num [Nat.choose] at h0 h1 h2 ⊢
 exact ⟨h0,h1,h2⟩

theorem source_ninth_valid3eda :
 (frame (List.replicate 7 false)).mid.a=1 ∧
 (frame (List.replicate 7 false)).mid.b=9 ∧
 InPolygon 1 9 0 9 ∧ InPolygon 1 9 1 6 ∧ InPolygon 1 9 2 3 := by
 exact ⟨left_spine_a274 _,spine_b6 _,by norm_num [InPolygon],
   by norm_num [InPolygon],by norm_num [InPolygon]⟩

theorem source_nonprincipal_failure3eda :
 coeff (frame (List.replicate 7 false)).mid.p 1 6^2 <
 coeff (frame (List.replicate 7 false)).mid.p 0 9*
 coeff (frame (List.replicate 7 false)).mid.p 2 3 := by
 rw [source_ninth_coeff3eda.1,source_ninth_coeff3eda.2.1,source_ninth_coeff3eda.2.2]
 norm_num

#print axioms source_ninth_coeff3eda
#print axioms source_ninth_valid3eda
#print axioms source_nonprincipal_failure3eda
end
end MathGKM.Markov
