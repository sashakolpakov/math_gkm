import MarkovMiddleGapM80F
import MarkovCorrectionHighDefsM80F
/-! Machine-authored 80fb7777. Full raw source jets via finite Vandermonde sums. -/
namespace MathGKM.Markov
noncomputable section
def sourceJet5M80F (q k : ℚ) (r : Bool) : ℚ :=
 topShortQMEB6 (q+(if r then 1 else 2)-6-2*k) (q+k) 2+correctionJet5M80F q k r

def sourceJet6M80F (q k : ℚ) (r : Bool) : ℚ :=
 topShortQMEB6 (q+(if r then 1 else 2)-6-2*k) (q+k) 3+correctionJet6M80F q k r

end
end MathGKM.Markov
