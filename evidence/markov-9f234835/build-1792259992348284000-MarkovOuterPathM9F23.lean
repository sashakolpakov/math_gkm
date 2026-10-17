import MarkovUpperCompleteM9F23
/-! Machine-authored 9f234835. Exact path bounds for both residue classes.
The upper cutoff includes its first row in the residue-one family. -/
namespace MathGKM.Markov
noncomputable section

theorem path_upper_transverse_exactM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 2*(frame path).mid.b+1 ≤ 3*j) :
 (coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2) ∧
 (coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) (j+1)^2) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : sourceNME9C q r ≤ j+q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 simp only [hp]
 exact ⟨source_upper_verticalM9F23 q i j r hq hjq,
   source_upper_diagonal_allM9F23 q i j r hq hjq⟩

theorem path_outer_transverseM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 3*(j+2) ≤ (frame path).mid.b ∨ 2*(frame path).mid.b+1 ≤ 3*j) :
 (coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2) ∧
 (coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) (j+1)^2) := by
 rcases hj with hj|hj
 · exact ⟨path_lower_verticalMF88 path ha i j hj,path_lower_diagonalM9F23 path ha i j hj⟩
 · exact path_upper_transverse_exactM9F23 path ha i j hj

theorem path_outer_weakLC_triplesM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 3*(j+2) ≤ (frame path).mid.b ∨ 2*(frame path).mid.b+1 ≤ 3*j) :
 (InPolygon (frame path).mid.a (frame path).mid.b i j →
  InPolygon (frame path).mid.a (frame path).mid.b (i+1) j →
  InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
  coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
    coeff (frame path).mid.p (i+1) j^2) ∧
 (InPolygon (frame path).mid.a (frame path).mid.b i j →
  InPolygon (frame path).mid.a (frame path).mid.b i (j+1) →
  InPolygon (frame path).mid.a (frame path).mid.b i (j+2) →
  coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
    coeff (frame path).mid.p i (j+1)^2) ∧
 (InPolygon (frame path).mid.a (frame path).mid.b i (j+2) →
  InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1) →
  InPolygon (frame path).mid.a (frame path).mid.b (i+2) j →
  coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
    coeff (frame path).mid.p (i+1) (j+1)^2) := by
 have ht := path_outer_transverseM9F23 path ha i j hj
 refine ⟨?_,fun _ _ _ => ht.1,fun _ _ _ => ht.2⟩
 intro _ _ _
 exact path_three_horizontalMF88 path ha i j

end
end MathGKM.Markov
