import MarkovTemplateStrongMomentM41B
/-! Machine-authored 41b38611. Exact first and second deficit moments for
the triangular binomial weights, retaining support zeros. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000

theorem choose_step_intM41B (s i : ℕ) :
 ((i:ℤ)+1)*(s.choose (i+1):ℤ)=((s:ℤ)-i)*(s.choose i:ℤ) := by
 by_cases hi : i ≤ s
 · have h := congrArg (fun n : ℕ => (n:ℤ)) (Nat.choose_succ_right_eq s i)
   push_cast at h
   rw [Nat.cast_sub hi] at h
   nlinarith
 · rw [Nat.choose_eq_zero_of_lt (by omega : s < i),Nat.choose_eq_zero_of_lt (by omega : s < i+1)]
   simp

theorem choose_deficit_stepM41B (T s i : ℕ) :
 ((T:ℤ)-s)*(s.choose i:ℤ)=
 ((T:ℤ)-i)*(s.choose i:ℤ)-((i:ℤ)+1)*(s.choose (i+1):ℤ) := by
 have h := choose_step_intM41B s i
 nlinarith

theorem choose_deficit_squareM41B (T s i : ℕ) :
 ((T:ℤ)-s)^2*(s.choose i:ℤ)=
 ((T:ℤ)-i)^2*(s.choose i:ℤ)-
 ((i:ℤ)+1)*(2*((T:ℤ)-i)-1)*(s.choose (i+1):ℤ)+
 ((i:ℤ)+1)*((i:ℤ)+2)*(s.choose (i+2):ℤ) := by
 have h0 := choose_deficit_stepM41B T s i
 have h1 := choose_deficit_stepM41B T s (i+1)
 simp only [Nat.cast_add,Nat.cast_one,show i+1+1=i+2 by omega] at h1
 linear_combination ((T:ℤ)-s+((T:ℤ)-i))*h0-((i:ℤ)+1)*h1

def binomialDeficitM41B (T i j : ℕ) : ℤ :=
 ∑ s ∈ range T, ((T:ℤ)-s)^(j+1)*(s.choose i:ℤ)

theorem binomial_deficit_zeroM41B (T i : ℕ) :
 binomialDeficitM41B T i 0=((T+1).choose (i+2):ℤ) := by
 simpa only [binomialDeficitM41B,Nat.zero_add,pow_one] using top_choose_weightM55C T i

theorem binomial_deficit_oneM41B (T i : ℕ) :
 binomialDeficitM41B T i 1=
 ((T:ℤ)-i)*((T+1).choose (i+2):ℤ)-((i:ℤ)+1)*((T+1).choose (i+3):ℤ) := by
 have h := sum_congr (s₁:=range T) rfl (fun s _ =>
   congrArg (fun v : ℤ => ((T:ℤ)-s)*v) (choose_deficit_stepM41B T s i))
 simp only [mul_sub,mul_left_comm _ ((T:ℤ)-i),mul_left_comm _ ((i:ℤ)+1),sum_sub_distrib,←mul_sum] at h
 rw [top_choose_weightM55C,top_choose_weightM55C,show i+1+2=i+3 by omega] at h
 convert h using 1
 unfold binomialDeficitM41B
 apply sum_congr rfl
 intro s hs
 ring

theorem binomial_deficit_twoM41B (T i : ℕ) :
 binomialDeficitM41B T i 2=
 ((T:ℤ)-i)^2*((T+1).choose (i+2):ℤ)-
 ((i:ℤ)+1)*(2*((T:ℤ)-i)-1)*((T+1).choose (i+3):ℤ)+
 ((i:ℤ)+1)*((i:ℤ)+2)*((T+1).choose (i+4):ℤ) := by
 unfold binomialDeficitM41B
 calc
  _ = ∑ s ∈ range T,
    (((T:ℤ)-i)^2*(((T:ℤ)-s)*(s.choose i:ℤ))-
    ((i:ℤ)+1)*(2*((T:ℤ)-i)-1)*(((T:ℤ)-s)*(s.choose (i+1):ℤ))+
    ((i:ℤ)+1)*((i:ℤ)+2)*(((T:ℤ)-s)*(s.choose (i+2):ℤ))) := by
     apply sum_congr rfl
     intro s hs
     have h := choose_deficit_squareM41B T s i
     linear_combination ((T:ℤ)-s)*h
  _ = _ := by
    simp only [sum_add_distrib,sum_sub_distrib,←mul_sum,top_choose_weightM55C,
      show i+1+2=i+3 by omega,show i+2+2=i+4 by omega]


theorem binomial_deficit_first_exactM41B (T i : ℕ) :
 ((i:ℤ)+3)*binomialDeficitM41B T i 1=
 (2*(T:ℤ)-i+1)*binomialDeficitM41B T i 0 := by
 rw [binomial_deficit_oneM41B,binomial_deficit_zeroM41B]
 have h := choose_step_intM41B (T+1) (i+2)
 push_cast at h
 rw [show i+2+1=i+3 by omega] at h
 linear_combination -((i:ℤ)+1)*h

theorem binomial_deficit_second_exactM41B (T i : ℕ) :
 ((i:ℤ)+3)*((i:ℤ)+4)*binomialDeficitM41B T i 2=
 (6*(T:ℤ)^2-6*T*i+(i:ℤ)^2+6*T-5*i)*binomialDeficitM41B T i 0 := by
 rw [binomial_deficit_twoM41B,binomial_deficit_zeroM41B]
 have h0 := choose_step_intM41B (T+1) (i+2)
 have h1 := choose_step_intM41B (T+1) (i+3)
 push_cast at h0 h1
 rw [show i+2+1=i+3 by omega] at h0
 rw [show i+3+1=i+4 by omega] at h1
 linear_combination (((i:ℤ)+1)*((i:ℤ)+2)*((T:ℤ)-i-2)-
   ((i:ℤ)+4)*((i:ℤ)+1)*(2*((T:ℤ)-i)-1))*h0+
   ((i:ℤ)+3)*((i:ℤ)+1)*((i:ℤ)+2)*h1

end
end MathGKM.Markov
