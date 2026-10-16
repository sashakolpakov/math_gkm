import MarkovStripCoefficientsMB9D
/-! Machine-authored d11e335e. Quartic binomial identities, with zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem choose_fourMD11 (n : ℕ) :
 24*(n.choose 4 : ℝ)=(n:ℝ)*(n-1)*(n-2)*(n-3) := by
 by_cases hn : 3 ≤ n
 · have h := Nat.descFactorial_eq_factorial_mul_choose n 4
   simp only [Nat.descFactorial_succ,Nat.descFactorial_zero] at h
   norm_num [Nat.factorial] at h
   have hc := congrArg (fun z : ℕ => (z:ℝ)) h
   push_cast [Nat.cast_sub hn,Nat.cast_sub (show 2 ≤ n by omega),
     Nat.cast_sub (show 1 ≤ n by omega)] at hc
   linear_combination -hc
 · interval_cases n <;> norm_num [Nat.choose]

theorem coeff_fourMD11 (i j : ℕ) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*(i+j-3)*
 ((1+(X:ℝ[X]))^(i+j-4)*X^4).coeff i=
 (i:ℝ)*(i-1)*(i-2)*(i-3)*((i+j).choose i:ℝ) := by
 rw [Polynomial.coeff_mul_X_pow']
 split_ifs with hi
 · rw [Polynomial.coeff_one_add_X_pow]
   have h : ((i+j).choose i:ℝ)*(i.choose 4:ℝ)=
     ((i+j).choose 4:ℝ)*((i+j-4).choose (i-4):ℝ) := by
     exact_mod_cast Nat.choose_mul hi
   have h1 := choose_fourMD11 (i+j)
   have h2 := choose_fourMD11 i
   push_cast at h1
   linear_combination -24*h+((i+j).choose i:ℝ)*h2-
     ((i+j-4).choose (i-4):ℝ)*h1
 · interval_cases i <;> norm_num

theorem quartic_fallingMD11 (i j : ℕ) (hj : 1 ≤ j) (hd : 4 ≤ i+j)
 (A B C D E : ℝ) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*(i+j-3)*
 (((1+(X:ℝ[X]))^(i+j-4)*(Polynomial.C A+Polynomial.C B*X+
   Polynomial.C C*X^2+Polynomial.C D*X^3+Polynomial.C E*X^4)).coeff i)=
 ((i+j).choose i:ℝ)*(A*j*(j-1)*(j-2)*(j-3)+B*i*j*(j-1)*(j-2)+
   C*i*(i-1)*j*(j-1)+D*i*(i-1)*(i-2)*j+E*i*(i-1)*(i-2)*(i-3)) := by
 have h := cubic_falling_coeff340 i (j-1) (by omega) A B C D
 rw [show i+(j-1)=i+j-1 by omega,show i+j-1-3=i+j-4 by omega] at h
 push_cast [Nat.cast_sub hj] at h
 have hb := strip_choose_downMB9D i j (by omega)
 have he := coeff_fourMD11 i j
 have hp : (1+(X:ℝ[X]))^(i+j-4)*(Polynomial.C A+Polynomial.C B*X+
   Polynomial.C C*X^2+Polynomial.C D*X^3+Polynomial.C E*X^4)=
   (1+X)^(i+j-4)*CubicPoly5a7 A B C D+
   Polynomial.C E*((1+X)^(i+j-4)*X^4) := by unfold CubicPoly5a7; ring
 rw [hp,Polynomial.coeff_add,Polynomial.coeff_C_mul]
 linear_combination ((i:ℝ)+j)*h+
   (A*(j-1)*(j-2)*(j-3)+B*i*(j-1)*(j-2)+C*i*(i-1)*(j-1)+D*i*(i-1)*(i-2))*hb+E*he

theorem quartic_allMD11 (i j : ℕ) (hd : 4 ≤ i+j)
 (A B C D E : ℝ) :
 ((i:ℝ)+j)*(i+j-1)*(i+j-2)*(i+j-3)*
 (((1+(X:ℝ[X]))^(i+j-4)*(Polynomial.C A+Polynomial.C B*X+
   Polynomial.C C*X^2+Polynomial.C D*X^3+Polynomial.C E*X^4)).coeff i)=
 ((i+j).choose i:ℝ)*(A*j*(j-1)*(j-2)*(j-3)+B*i*j*(j-1)*(j-2)+
   C*i*(i-1)*j*(j-1)+D*i*(i-1)*(i-2)*j+E*i*(i-1)*(i-2)*(i-3)) := by
 by_cases hj : 1 ≤ j
 · exact quartic_fallingMD11 i j hj hd A B C D E
 have hz : j=0 := by omega
 subst j
 have h0 : ((1+(X:ℝ[X]))^(i-4)).coeff i=0 := by
   rw [Polynomial.coeff_one_add_X_pow,Nat.choose_eq_zero_of_lt (by omega)]
   simp
 have h1 : ((1+(X:ℝ[X]))^(i-4)*X).coeff i=0 := by
   rw [←pow_one (X:ℝ[X]),Polynomial.coeff_mul_X_pow',if_pos (by omega),
     Polynomial.coeff_one_add_X_pow,Nat.choose_eq_zero_of_lt (by omega)]
   simp
 have h2 : ((1+(X:ℝ[X]))^(i-4)*X^2).coeff i=0 := by
   rw [Polynomial.coeff_mul_X_pow',if_pos (by omega),
     Polynomial.coeff_one_add_X_pow,Nat.choose_eq_zero_of_lt (by omega)]
   simp
 have h3 : ((1+(X:ℝ[X]))^(i-4)*X^3).coeff i=0 := by
   rw [Polynomial.coeff_mul_X_pow',if_pos (by omega),
     Polynomial.coeff_one_add_X_pow,Nat.choose_eq_zero_of_lt (by omega)]
   simp
 have hp : (1+(X:ℝ[X]))^(i-4)*(Polynomial.C A+Polynomial.C B*X+
   Polynomial.C C*X^2+Polynomial.C D*X^3+Polynomial.C E*X^4)=
   Polynomial.C A*(1+X)^(i-4)+Polynomial.C B*((1+X)^(i-4)*X)+
   Polynomial.C C*((1+X)^(i-4)*X^2)+Polynomial.C D*((1+X)^(i-4)*X^3)+
   Polynomial.C E*((1+X)^(i-4)*X^4) := by ring
 simp only [Nat.add_zero] at ⊢
 rw [hp]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,h0,h1,h2,h3,
   mul_zero,zero_add,Nat.cast_zero,Nat.choose_self,Nat.cast_one,one_mul,add_zero]
 have he := coeff_fourMD11 i 0
 simp only [Nat.add_zero,Nat.cast_zero,add_zero,Nat.choose_self,Nat.cast_one,mul_one] at he
 linear_combination E*he

end
end MathGKM.Markov
