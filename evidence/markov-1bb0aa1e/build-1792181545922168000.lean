import MarkovTailCorrectionM1BB
/-! Machine-authored 1bb0aa1e. Complete first correction row, all columns.
The exceptional 3/4 source has an alternating auxiliary correction tail. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
attribute [local irreducible] lowerRawME9C lowerForceME9C threeRawM9E2 firstDiffM1BB

theorem first_diff_zeroM1BB (q : ℕ) (r : Bool) : firstDiffM1BB q r 0=0 := by
 have h := first_diff_equationM1BB q 0 r
 simpa [first_gain_zeroM1BB] using h

theorem first_diff_oneM1BB (q : ℕ) (r : Bool) (hq : 1 ≤ q) : firstDiffM1BB q r 1=0 := by
 have h := first_diff_equationM1BB q 1 r
 simpa [first_diff_zeroM1BB,first_gain_oneM1BB q r hq] using h

theorem first_diff_stepM1BB (q i : ℕ) (r : Bool) (hq : 1 ≤ q) :
 firstDiffM1BB q r (i+2)+2*firstDiffM1BB q r (i+1)+firstDiffM1BB q r i=
 if r then 8*(q.choose i:ℤ) else 4*((q+1).choose i:ℤ) := by
 have h := first_diff_equationM1BB q (i+2) r
 simpa [show 1 ≤ i+2 by omega,show 2 ≤ i+2 by omega,
   show i+2-1=i+1 by omega,first_gain_binomialM1BB q i r hq] using h

theorem binomial_second_solveM1BB (n : ℕ) (c : ℤ) (f : ℕ → ℤ)
 (h0 : f 0=0) (h1 : f 1=0)
 (hs : ∀ i, f (i+2)+2*f (i+1)+f i=c*((n+2).choose i:ℤ)) :
 ∀ i, f (i+2)=c*(n.choose i:ℤ) := by
 intro i
 induction i using Nat.strong_induction_on with
 | h i ih =>
   rcases i with _|_|i
   · have hh := hs 0
     simp only [h0,h1,Nat.choose_zero_right,Nat.cast_one,mul_one,mul_zero,add_zero] at hh ⊢
     exact hh
   · have ha := ih 0 (by omega)
     have hh := hs 1
     simp only [Nat.choose_zero_right,Nat.choose_one_right,Nat.cast_one,mul_one] at ha hh ⊢
     rw [ha,h1] at hh
     push_cast at hh
     norm_num only [Nat.reduceAdd,Nat.choose_one_right]
     linear_combination hh
   · have ha := ih i (by omega)
     have hb := ih (i+1) (by omega)
     have hh := hs (i+2)
     rw [ha,show i+2+1=(i+1)+2 by omega,hb] at hh
     have he : ((n+2).choose (i+2):ℤ)=(n.choose (i+2):ℤ)+
       2*(n.choose (i+1):ℤ)+(n.choose i:ℤ) := by
       simp only [Nat.choose_succ_succ,Nat.cast_add]
       ring
     rw [he] at hh
     linear_combination hh

theorem first_diff_trueM1BB (t i : ℕ) :
 firstDiffM1BB (t+2) true (i+2)=8*(t.choose i:ℤ) := by
 apply binomial_second_solveM1BB t 8 (firstDiffM1BB (t+2) true)
 · exact first_diff_zeroM1BB _ _
 · exact first_diff_oneM1BB _ _ (by omega)
 · intro j
   simpa using first_diff_stepM1BB (t+2) j true (by omega)

theorem first_diff_falseM1BB (t i : ℕ) :
 firstDiffM1BB (t+1) false (i+2)=4*(t.choose i:ℤ) := by
 apply binomial_second_solveM1BB t 4 (firstDiffM1BB (t+1) false)
 · exact first_diff_zeroM1BB _ _
 · exact first_diff_oneM1BB _ _ (by omega)
 · intro j
   simpa [Nat.add_assoc] using first_diff_stepM1BB (t+1) j false (by omega)

theorem first_diff_exceptionalM1BB (i : ℕ) :
 firstDiffM1BB 1 true (i+2)=8*(-1:ℤ)^i := by
 induction i using Nat.strong_induction_on with
 | h i ih =>
   rcases i with _|_|i
   · have hh := first_diff_stepM1BB 1 0 true (by omega)
     simpa [first_diff_zeroM1BB,first_diff_oneM1BB 1 true (by omega)] using hh
   · have ha := ih 0 (by omega)
     have hh := first_diff_stepM1BB 1 1 true (by omega)
     norm_num only [if_true,Nat.choose_one_right,Nat.cast_one,mul_one,pow_zero] at ha hh ⊢
     rw [ha,first_diff_oneM1BB 1 true (by omega)] at hh
     norm_num
     linarith
   · have ha := ih i (by omega)
     have hb := ih (i+1) (by omega)
     have hh := first_diff_stepM1BB 1 (i+2) true (by omega)
     rw [if_true,Nat.choose_eq_zero_of_lt (by omega : 1 < i+2)] at hh
     rw [ha,show i+2+1=(i+1)+2 by omega,hb] at hh
     simp only [pow_succ] at hh ⊢
     linear_combination hh

end
end MathGKM.Markov
