import MarkovDenseGapMC9F
/-! Machine-authored c9f23b44. Unconditional lower horizontal numerator-three
region; the exact remaining root clauses are retained without alteration. -/
namespace MathGKM.Markov
noncomputable section

theorem rational_pair_stepMC9F : RationalPairStepMAD5 :=
 rational_step_iff_polynomialMAD5.mpr
  (reduced_pair_iff_polynomialMAD5.mp reduced_pair_positiveMC9F)

theorem lift_middleMC9F : LiftMiddleMFEE :=
 lift_middle_of_pair_orderMAD5
  (shifted_order_of_kernel_stepsMAD5 (kernel_steps_of_rationalMAD5 rational_pair_stepMC9F))

theorem lift_all_cutsMC9F : LiftLCPositiveM7E2 :=
 lift_positive_iff_middleMFEE.mpr lift_middleMC9F

theorem lift_boundaryMC9F : LiftBoundaryM7E2 :=
 lift_positive_iff_boundaryM7E2.mp lift_all_cutsMC9F

theorem lift_output_lcMC9F (d j t : ℕ) :
 liftOutputMAE9 d j t*liftOutputMAE9 d j (t+2) ≤ liftOutputMAE9 d j (t+1)^2 :=
 lift_output_lc_of_boundaryMFEE lift_boundaryMC9F d j t

theorem lower_horizontalMC9F : LowerHorizontalMFEE :=
 lower_horizontal_of_reducedMAD5 reduced_pair_positiveMC9F

/-- Includes all natural columns, all zero coefficients and both residue classes. -/
theorem source_lower_horizontalMC9F (q i j : ℕ) (r : Bool) (hj : j ≤ q) :
 threeRawM9E2 q r i j * threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 :=
 source_lower_horizontal_of_boundaryMFEE lift_boundaryMC9F q i j r hj

theorem lower_horizontal_pathsMC9F (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i j, j ≤ q → coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 :=
 lower_horizontal_paths_of_middleMFEE lift_middleMC9F path ha

/-- Direct path statement, with the lower-region boundary in the root's indices. -/
theorem source_lower_horizontal_pathMC9F (path : List Bool)
 (ha : (frame path).mid.a=3) (i j : ℕ) (hj : 3*j ≤ (frame path).mid.b) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : j ≤ q := by
   rw [hb] at hj
   unfold sourceNME9C at hj
   split_ifs at hj <;> omega
 simp only [hp]
 exact source_lower_horizontalMC9F q i j r hjq

/-- Exact pinned root equivalence; both displayed residual predicates are open. -/
theorem root_iff_outside_lowerMC9F :
 Conjecture63 ↔ ThreeOutsideLowerMFEE ∧ OtherFourM9E2 := by
 constructor
 · intro h
   exact (root_iff_lower_horizontalMFEE.mp h).2
 · rintro ⟨h3,h4⟩
   exact root_iff_lower_horizontalMFEE.mpr ⟨lower_horizontalMC9F,h3,h4⟩

end
end MathGKM.Markov
