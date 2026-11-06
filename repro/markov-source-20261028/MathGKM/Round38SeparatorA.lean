import MathGKM.Round30RightCoefficientsA

/-! Machine-authored exact reachable cross-state separator, round38.
This is not a refutation of an original coefficient inequality. -/
namespace StateCrossR38
open MathGKM.Markov

theorem actual_separator :
    InPolygon 4 5 4 0 ∧ InPolygon 4 5 4 1 ∧ InPolygon 4 5 4 2 ∧
    coeff (RightR30.M 3) 4 0=1 ∧ coeff (RightR30.M 3) 4 1=11 ∧
    coeff (RightR30.M 3) 4 2=63 ∧
    coeff (RightR30.G 3) 4 0=0 ∧ coeff (RightR30.G 3) 4 1=3 ∧
    coeff (RightR30.G 3) 4 2=37 ∧
    coeff (RightR30.M 3) 4 0*coeff (RightR30.G 3) 4 2 >
      coeff (RightR30.M 3) 4 1*coeff (RightR30.G 3) 4 1 ∧
    coeff (RightR30.M 3) 4 1^2-coeff (RightR30.M 3) 4 0*coeff (RightR30.M 3) 4 2=58 ∧
    coeff (RightR30.G 3) 4 1^2-coeff (RightR30.G 3) 4 0*coeff (RightR30.G 3) 4 2=9 := by
  simp only [(RightR30.coefficient_recovery 3).1,(RightR30.coefficient_recovery 3).2]
  norm_num [InPolygon,RightR30.array,RightR30.quad,RightR30.shift,RightR30.delta]

end StateCrossR38
