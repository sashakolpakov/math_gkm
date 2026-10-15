import MarkovFirstNormM0A5
import MarkovSecondNormM0A5
import MarkovFourthBinomialBC
/-! Machine-authored 0a5fcabe: normalization valid from c=4. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
theorem fourth_normalizeM0A5 (n c r : ℕ) (hc : 4≤c) :
 (1-runXBDEE)^8*closedFourthN6604 n c r=
 fourthNumeratorBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE c r := by
 have hm4 := fourMoment_scaleBC (closedLocalFourN6604 n) ((1-runXBDEE)^8) c r
 have he4 : (fun a b d e => (1-runXBDEE)^8*closedLocalFourN6604 n a b d e)=
     localFourNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
   funext a b d e; exact localFour_normalizeBC n a b d e
 rw [he4] at hm4
 have hm3 := boolMoment_scaleBC (closedLocalBDEE n) ((1-runXBDEE)^6)
   (c:RunFieldBDEE) r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 have he3 : (fun a b d => (1-runXBDEE)^6*closedLocalBDEE n a b d)=
     localThirdNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
   funext a b d; exact localThird_normalizeBC n a b d
 rw [he3] at hm3
 have hf := first_normalizeM0A5 n c r
 have hs := second_normalizeM0A5 n c r (by omega)
 unfold closedFourthN6604 correctedClosedThirdBDEE closedThirdBDEE
 rw [if_neg (by omega : ¬c=2),if_neg (by omega : ¬c=3)]
 dsimp only
 calc
  _ = (1-runXBDEE)^8*fourMomentBE (closedLocalFourN6604 n) c r+
    6*(1+runXBDEE)^4*(1-runXBDEE)^8+
    4*((1-runXBDEE)^2*closedFirstBDEE n c r)*
      ((1-runXBDEE)^6*boolMomentADB2 (closedLocalBDEE n) c r (2*r-c:ℕ)
        (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ))-
    8*((1-runXBDEE)^2*closedFirstBDEE n c r)*(1+runXBDEE)^3*(1-runXBDEE)^6+
    3*((1-runXBDEE)^4*closedSecondBDEE n c r)^2-
    2*((1-runXBDEE)^2*closedFirstBDEE n c r)^4 := by ring
  _ = _ := by rw [hm4,hm3,hf,hs]; rfl


end
end MathGKM.Markov
