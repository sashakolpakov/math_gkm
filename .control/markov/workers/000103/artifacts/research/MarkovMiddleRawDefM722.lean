import MarkovMiddleShapesM722
/-! Machine-authored 722898f8. A common scale on all source coefficients. -/
namespace MathGKM.Markov
noncomputable section
def middleRawValueM722 (n c r j : ℤ) : ℤ :=
 if 2*r<c then middleShape0M722 n c r j else middleShape3M722 n c r j
end
end MathGKM.Markov
