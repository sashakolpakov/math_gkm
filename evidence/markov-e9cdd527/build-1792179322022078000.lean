import MarkovLowerCandidateM96A
import MarkovLowForceME9C
/-! Machine-authored e9cdd527. Polynomial solutions to the exact lower equations. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def lowThreeME9C (x : ℚ) : ℚ := (x+1)*(x+2)*(x+3)*(x^2+4*x+5)/30
def lowFourME9C (n x : ℚ) : ℚ :=
 (x+1)*(x+2)*(x+3)*(x+4)*
 (7*(n-1)*(2*x^2+10*x+15)-x*(18*x^2+100*x+155))/2520

theorem low_three_equationME9C (x : ℚ) :
 lowThreeME9C (x+2)-2*lowThreeME9C (x+1)+lowThreeME9C x=
 lowForceThreeME9C (x+2) := by
 unfold lowThreeME9C lowForceThreeME9C deltaThreeME9C
 ring

theorem low_four_equationME9C (n x : ℚ) :
 lowFourME9C n (x+2)-2*lowFourME9C n (x+1)+lowFourME9C n x=
 lowForceFourME9C n (x+2)-2*lowThreeME9C (x+2)-2*lowThreeME9C (x+1) := by
 unfold lowFourME9C lowThreeME9C lowForceFourME9C deltaFourME9C deltaThreeME9C
 ring

theorem low_four_candidateME9C (q x : ℚ) (r : Bool) :
 lowFourME9C (3*q+(if r then 1 else 2)) x=
 lowerCandidateM96A q x (if r then 0 else 1) := by
 cases r  <;> simp only [Bool.false_eq_true,if_false,if_true]
  <;> unfold lowFourME9C lowerCandidateM96A lowerCoreM96A  <;> ring

theorem second_difference_uniqueME9C (q : ℕ) (f g : ℕ → ℚ)
 (h0 : f 0=g 0) (h1 : 1 ≤ q → f 1=g 1)
 (hs : ∀ j, j+2 ≤ q → f (j+2)-2*f (j+1)+f j=g (j+2)-2*g (j+1)+g j) :
 ∀ j, j ≤ q → f j=g j := by
 intro j
 induction j using Nat.strong_induction_on with
 | h j ih =>
   intro hj
   rcases j with _|_|j
   · exact h0
   · exact h1 hj
   · have ha := ih j (by omega) (by omega)
     have hb := ih (j+1) (by omega) (by omega)
     have hh := hs j hj
     linarith

end
end MathGKM.Markov
