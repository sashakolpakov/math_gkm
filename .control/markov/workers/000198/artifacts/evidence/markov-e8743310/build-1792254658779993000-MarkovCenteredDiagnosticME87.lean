import MarkovCenteredVarianceME87
/-! Machine-authored e8743310. Failure of an auxiliary sufficient scalar
condition one column below the proved uniform cutoff. Not a root refutation. -/
namespace MathGKM.Markov
theorem centered_cutoff_nine_failsME87 : centeredScalarME87 9 399 426 < 0 := by
 norm_num [centeredScalarME87,deficitSecondM41B]
end MathGKM.Markov
