import MarkovThreeForceM96A
/-! Machine-authored 96ada19b. Lower-column candidate inequality.
The identification with source coefficients remains unproved in Lean. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
def lowerCoreM96A (q x c : ℚ) : ℚ :=
 7*(3*q+c)*(2*x^2+10*x+15)-x*(18*x^2+100*x+155)
def lowerCandidateM96A (q x c : ℚ) : ℚ :=
 (x+1)*(x+2)*(x+3)*(x+4)*lowerCoreM96A q x c/2520
def lowerGapM96A (x d c : ℚ) : ℚ :=
 3814650+
 1517040*c+
 167580*c^2+
 4551120*d+
 1005480*d*c+
 1508220*d^2+
 7167447*x+
 2275476*x*c+
 193452*x*c^2+
 6826428*x*d+
 1160712*x*d*c+
 1741068*x*d^2+
 5616597*x^2+
 1389444*x^2*c+
 85260*x^2*c^2+
 4168332*x^2*d+
 511560*x^2*d*c+
 767340*x^2*d^2+
 2360484*x^3+
 428232*x^3*c+
 16464*x^3*c^2+
 1284696*x^3*d+
 98784*x^3*d*c+
 148176*x^3*d^2+
 561120*x^4+
 65856*x^4*c+
 1176*x^4*c^2+
 197568*x^4*d+
 7056*x^4*d*c+
 10584*x^4*d^2+
 71316*x^5+
 4032*x^5*c+
 12096*x^5*d+
 3780*x^6
theorem lower_gap_identityM96A (x d c : ℚ) :
 (x+2)*(x+5)*lowerCoreM96A (x+d+2) (x+1) c^2-
 (x+1)*(x+6)*lowerCoreM96A (x+d+2) x c*lowerCoreM96A (x+d+2) (x+2) c=
 lowerGapM96A x d c := by unfold lowerCoreM96A lowerGapM96A; ring
theorem lower_gap_nonnegM96A (x d c : ℚ) (hx : 0 ≤ x) (hd : 0 ≤ d) (hc : 0 ≤ c) :
 0 ≤ lowerGapM96A x d c := by unfold lowerGapM96A; positivity
theorem lower_candidate_lcM96A (q x c : ℚ) (hx : 0 ≤ x) (hq : x+2 ≤ q) (hc : 0 ≤ c) :
 lowerCandidateM96A q x c*lowerCandidateM96A q (x+2) c ≤ lowerCandidateM96A q (x+1) c^2 := by
 have hg := lower_gap_nonnegM96A x (q-x-2) c hx (by linarith) hc
 have hi := lower_gap_identityM96A x (q-x-2) c
 have he : x+(q-x-2)+2=q := by ring
 rw [he] at hi
 have hf : 0 ≤ (x+2)*(x+3)^2*(x+4)^2*(x+5) := by positivity
 have hmul := mul_nonneg hf hg
 rw [←hi] at hmul
 unfold lowerCandidateM96A
 nlinarith only [hmul]
end
end MathGKM.Markov
