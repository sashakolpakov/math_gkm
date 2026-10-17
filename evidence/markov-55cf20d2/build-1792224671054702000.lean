import MarkovTopParameterPolyM55C
/-! Machine-authored 55cf20d2. Universal strict log-concavity of the top
parameter coefficients. These are auxiliary coefficients, not raw ones. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def topLeadingNumerM55C (T i : ℕ) : ℚ := (T.choose i:ℚ)+4*((T+1).choose (i+2):ℚ)

theorem top_leading_numer_nonnegM55C (T i : ℕ) : 0 ≤ topLeadingNumerM55C T i := by
 unfold topLeadingNumerM55C
 positivity

theorem top_leading_numer_positiveM55C (T i : ℕ) (hi : i ≤ T) : 0 < topLeadingNumerM55C T i := by
 unfold topLeadingNumerM55C
 exact add_pos_of_pos_of_nonneg (by exact_mod_cast Nat.choose_pos hi) (by positivity)

theorem top_leading_numer_lcM55C (T i : ℕ) :
 topLeadingNumerM55C T i*topLeadingNumerM55C T (i+2) ≤ topLeadingNumerM55C T (i+1)^2 := by
 have hp : (1+X:Polynomial ℝ)^T*Quadratic 4 4 1=
   4*(1+X)^(T+1)+(1+X)^T*X^2 := by
   simp only [Quadratic,pow_succ,map_ofNat,map_one]
   ring
 have he (j : ℕ) : CoeffSeq ((1+X:Polynomial ℝ)^T*Quadratic 4 4 1) (j+2)=
   (T.choose j:ℝ)+4*((T+1).choose (j+2):ℝ) := by
   rw [hp]
   simp [CoeffSeq,show ¬(j:ℤ)+2 < 0 by omega,show ((j:ℤ)+2).toNat=j+2 by omega,
     coeff_add,coeff_ofNat_mul,coeff_one_add_X_pow,coeff_mul_X_pow',add_comm]
 have h := quadratic_binomial_logConcave (by norm_num : (0:ℝ) ≤ 4)
   (by norm_num : (0:ℝ) ≤ 4) (by norm_num : (0:ℝ) ≤ 1) (by norm_num : (4:ℝ)*1 ≤ 4^2) T (i+3)
 dsimp only at h
 rw [show (i:ℤ)+3-1=i+2 by omega,show (i:ℤ)+3+1=(i+2:ℕ)+2 by omega,
   show (i:ℤ)+3=(i+1:ℕ)+2 by omega,he,he,he] at h
 unfold topLeadingNumerM55C
 exact_mod_cast h

theorem top_leading_strictM55C (T i : ℕ) (hi : i+1 ≤ T) :
 topLeadingM55C T i*topLeadingM55C T (i+2) < topLeadingM55C T (i+1)^2 := by
 have h := top_leading_numer_lcM55C T i
 have hpos := top_leading_numer_positiveM55C T (i+1) hi
 let a : ℚ := (i+3).factorial
 let b : ℚ := (i+4).factorial
 let c : ℚ := (i+5).factorial
 have ha : 0 < a := by dsimp [a]; positivity
 have hb : 0 < b := by dsimp [b]; positivity
 have hc : 0 < c := by dsimp [c]; positivity
 have hb' : b=((i:ℚ)+4)*a := by dsimp [a,b]; rw [show i+4=(i+3)+1 by omega,Nat.factorial_succ]; push_cast; ring
 have hc' : c=((i:ℚ)+5)*b := by dsimp [b,c]; rw [show i+5=(i+4)+1 by omega,Nat.factorial_succ]; push_cast; ring
 have hden : b^2 < a*c := by rw [hb',hc',hb']; nlinarith [sq_pos_of_pos ha,Nat.cast_nonneg (α:=ℚ) i]
 have hh : topLeadingNumerM55C T i*topLeadingNumerM55C T (i+2)/(a*c) <
   topLeadingNumerM55C T (i+1)^2/b^2 := by
   calc
    _ ≤ topLeadingNumerM55C T (i+1)^2/(a*c) := div_le_div_of_nonneg_right h (mul_pos ha hc).le
    _ < _ := div_lt_div_of_pos_left (sq_pos_of_pos hpos) (sq_pos_of_pos hb) hden
 simpa only [topLeadingM55C,topLeadingNumerM55C,a,b,c,
   show i+2+3=i+5 by omega,show i+1+3=i+4 by omega,div_mul_div_comm,div_pow] using hh

end
end MathGKM.Markov
