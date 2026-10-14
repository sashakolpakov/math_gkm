import MarkovPellHorizontalSum9a72
import MarkovPellLowerFormula26ca
/-! Machine-authored request 0c12f51d. A uniform obstruction to termwise
midpoint balancing. This does not refute the raw coefficient conjecture. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem choose_four_rat0c12 (n : ℕ) :
 (n.choose 4 : ℚ)=(n:ℚ)*(n-1)*(n-2)*(n-3)/24 := by
 induction n with
 | zero => norm_num
 | succ n ih =>
   rw [Nat.choose_succ_succ]
   push_cast
   rw [ih,choose_three_rat26ca]
   push_cast
   ring

theorem midpoint_values0c12 (m : ℕ) :
 horizontalTerm9a72 (m+7) (m+10) (m+4) 2 = (m+6).choose 2 ∧
 horizontalTerm9a72 (m+7) (m+10) (m+1) 4 = 60*((m+5).choose 4 : ℤ) ∧
 horizontalTerm9a72 (m+7) (m+10) (m+2) 3 = 5*((m+5).choose 3 : ℤ) ∧
 horizontalTerm9a72 (m+7) (m+10) (m+3) 3 = 8*((m+6).choose 3 : ℤ) := by
 have h2 : (m+6).choose (m+4)=(m+6).choose 2 := by
   rw [← Nat.choose_symm (show m+4 ≤ m+6 by omega)]
   congr 1 <;> omega
 have h4 : (m+5).choose (m+1)=(m+5).choose 4 := by
   rw [← Nat.choose_symm (show m+1 ≤ m+5 by omega)]
   congr 1 <;> omega
 have h31 : (m+5).choose (m+2)=(m+5).choose 3 := by
   rw [← Nat.choose_symm (show m+2 ≤ m+5 by omega)]
   congr 1 <;> omega
 have h32 : (m+6).choose (m+3)=(m+6).choose 3 := by
   rw [← Nat.choose_symm (show m+3 ≤ m+6 by omega)]
   congr 1 <;> omega
 norm_num [horizontalTerm9a72,show m+4 ≤ m+10 by omega,
   show m+1 ≤ m+10 by omega,show m+2 ≤ m+10 by omega,
   show m+3 ≤ m+10 by omega,show 2+(m+4)=m+6 by omega,
   show 4+(m+1)=m+5 by omega,show 3+(m+2)=m+5 by omega,
   show 3+(m+3)=m+6 by omega,h2,h4,h31,h32,
   show m+7-(m+4)=3 by omega,show m+7-(m+1)=6 by omega,
   show m+7-(m+2)=5 by omega,show m+7-(m+3)=4 by omega,
   show m+10-(m+4)=6 by omega,show m+10-(m+1)=9 by omega,
   show m+10-(m+2)=8 by omega,show m+10-(m+3)=7 by omega]
   <;> norm_num [show Nat.choose 6 5=6 by decide,show Nat.choose 10 9=10 by decide,
     show Nat.choose 5 4=5 by decide,show Nat.choose 8 7=8 by decide]
   <;> first | trivial | ring

def midpointEnd0c12 (m : ℕ) : ℤ :=
 horizontalTerm9a72 (m+7) (m+10) (m+4) 2 *
 horizontalTerm9a72 (m+7) (m+10) (m+1) 4
def midpointMiddle0c12 (m : ℕ) : ℤ :=
 horizontalTerm9a72 (m+7) (m+10) (m+2) 3 *
 horizontalTerm9a72 (m+7) (m+10) (m+3) 3

theorem midpoint_gap0c12 (m : ℕ) :
 36*((midpointEnd0c12 m : ℚ)-midpointMiddle0c12 m)=
 5*(m+6)*((m:ℚ)+5)^2*(m+4)*(m+3)*(m-14) := by
 obtain ⟨h0,h1,h2,h3⟩ := midpoint_values0c12 m
 simp only [midpointEnd0c12,midpointMiddle0c12,h0,h1,h2,h3]
 push_cast
 rw [choose_two_rat26ca,choose_three_rat26ca,choose_three_rat26ca,choose_four_rat0c12]
 push_cast
 ring

theorem midpoint_fails_uniform0c12 (m : ℕ) (hm : 15 ≤ m) :
 midpointMiddle0c12 m < midpointEnd0c12 m := by
 have h := midpoint_gap0c12 m
 have hp : (0:ℚ)<5*(m+6)*((m:ℚ)+5)^2*(m+4)*(m+3)*(m-14) := by
   have hm' : (15:ℚ) ≤ m := by exact_mod_cast hm
   have : (0:ℚ) < m-14 := by linarith
   positivity
 have ht : (midpointMiddle0c12 m : ℚ) < midpointEnd0c12 m := by linarith
 exact_mod_cast ht

theorem aggregate_gap0c12 (m : ℕ) :
 36*(2*(midpointMiddle0c12 m : ℚ)-midpointEnd0c12 m)=
 5*(m+6)*((m:ℚ)+5)^2*(m+4)*(m+3)*(7*m+46) := by
 obtain ⟨h0,h1,h2,h3⟩ := midpoint_values0c12 m
 simp only [midpointEnd0c12,midpointMiddle0c12,h0,h1,h2,h3]
 push_cast
 rw [choose_two_rat26ca,choose_three_rat26ca,choose_three_rat26ca,choose_four_rat0c12]
 push_cast
 ring

theorem aggregate_positive0c12 (m : ℕ) :
 midpointEnd0c12 m < 2*midpointMiddle0c12 m := by
 have h := aggregate_gap0c12 m
 have hp : (0:ℚ)<5*(m+6)*((m:ℚ)+5)^2*(m+4)*(m+3)*(7*m+46) := by positivity
 have ht : (midpointEnd0c12 m : ℚ)<2*midpointMiddle0c12 m := by linarith
 exact_mod_cast ht

#print axioms midpoint_values0c12
#print axioms midpoint_fails_uniform0c12
#print axioms aggregate_positive0c12
end
end MathGKM.Markov
