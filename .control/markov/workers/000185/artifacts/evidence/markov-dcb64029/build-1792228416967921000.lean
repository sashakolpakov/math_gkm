import MarkovTopLikelihoodMDCB
import MarkovUpperDifferenceM4F4
/-! Machine-authored dcb64029. Exact unnormalized beta-binomial factorial
moments in the nonzero range, by an integer binomial convolution. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def betaMomentMDCB (i m u v : ℕ) : ℤ :=
 ∑ k ∈ range (m+1), ((i+k).choose i:ℤ)*((i+(m-k)).choose i:ℤ)*
   (k.descFactorial u:ℤ)*((m-k).descFactorial v:ℤ)

theorem beta_choose_factorialMDCB (i k u : ℕ) :
 ((i+k).choose i:ℤ)*(k.descFactorial u:ℤ)=
 ((i+u).descFactorial u:ℤ)*((i+k).choose (i+u):ℤ) := by
 have h := Nat.choose_mul (n:=i+k) (k:=i+u) (s:=i) (by omega)
 rw [show i+k-i=k by omega,Nat.choose_symm_add] at h
 rw [Nat.descFactorial_eq_factorial_mul_choose,Nat.descFactorial_eq_factorial_mul_choose]
 have hh := congrArg (fun z : ℕ => (z:ℤ)) h
 push_cast at hh ⊢
 linear_combination -(u.factorial:ℤ)*hh

theorem beta_convolutionMDCB (A B N : ℕ) :
 (∑ k ∈ range (N+1), ((A+k).choose A:ℤ)*((B+(N-k)).choose B:ℤ))=
 ((A+B+N+1).choose (A+B+1):ℤ) := by
 have h := rising_convolutionM4F4 (A+1) (B+1) N
 rw [show A+1+(B+1)=(A+B+1)+1 by omega] at h
 simpa only [risingM679,show A+B+1+N=A+B+N+1 by omega] using h

theorem beta_shifted_convolutionMDCB (i u v N : ℕ) :
 (∑ k ∈ range (u+v+N+1), ((i+k).choose (i+u):ℤ)*
   ((i+(u+v+N-k)).choose (i+v):ℤ))=
 ((2*i+u+v+N+1).choose (2*i+u+v+1):ℤ) := by
 let f : ℕ → ℤ := fun k => ((i+k).choose (i+u):ℤ)*((i+(u+v+N-k)).choose (i+v):ℤ)
 change (∑ k ∈ range (u+v+N+1), f k)=_
 rw [show u+v+N+1=u+(N+1+v) by omega,sum_range_add]
 have hz0 : (∑ k ∈ range u, f k)=0 := by
   apply sum_eq_zero
   intro k hk
   dsimp [f]
   rw [Nat.choose_eq_zero_of_lt (by have := mem_range.mp hk; omega),Nat.cast_zero,zero_mul]
 rw [hz0,zero_add,sum_range_add]
 have hz1 : (∑ k ∈ range v, f (u+(N+1+k)))=0 := by
   apply sum_eq_zero
   intro k hk
   dsimp [f]
   rw [Nat.choose_eq_zero_of_lt (show i+(u+v+N-(u+(N+1+k))) < i+v by
     have := mem_range.mp hk; omega),Nat.cast_zero,mul_zero]
 rw [hz1,add_zero]
 have h := beta_convolutionMDCB (i+u) (i+v) N
 rw [show i+u+(i+v)+N+1=2*i+u+v+N+1 by omega,
   show i+u+(i+v)+1=2*i+u+v+1 by omega] at h
 rw [←h]
 apply sum_congr rfl
 intro k hk
 dsimp [f]
 rw [show i+(u+k)=i+u+k by omega,
   show i+(u+v+N-(u+k))=i+v+(N-k) by have := mem_range.mp hk; omega]

theorem beta_moment_explicitMDCB (i u v N : ℕ) :
 betaMomentMDCB i (u+v+N) u v=
 ((i+u).descFactorial u:ℤ)*((i+v).descFactorial v:ℤ)*
 ((2*i+u+v+N+1).choose (2*i+u+v+1):ℤ) := by
 unfold betaMomentMDCB
 have hterm (k : ℕ) :
  ((i+k).choose i:ℤ)*((i+(u+v+N-k)).choose i:ℤ)*
   (k.descFactorial u:ℤ)*((u+v+N-k).descFactorial v:ℤ)=
  ((i+u).descFactorial u:ℤ)*((i+v).descFactorial v:ℤ)*
   (((i+k).choose (i+u):ℤ)*((i+(u+v+N-k)).choose (i+v):ℤ)) := by
   have h0 := beta_choose_factorialMDCB i k u
   have h1 := beta_choose_factorialMDCB i (u+v+N-k) v
   calc
    _ = (((i+k).choose i:ℤ)*(k.descFactorial u:ℤ))*
      (((i+(u+v+N-k)).choose i:ℤ)*((u+v+N-k).descFactorial v:ℤ)) := by ring
    _ = _ := by rw [h0,h1]; ring
 simp_rw [hterm]
 rw [←mul_sum,beta_shifted_convolutionMDCB]

theorem beta_moment_zeroMDCB (i m u v : ℕ) (hm : m<u+v) :
 betaMomentMDCB i m u v=0 := by
 unfold betaMomentMDCB
 apply sum_eq_zero
 intro k hk
 have hk' := mem_range.mp hk
 by_cases hu : k<u
 · rw [Nat.descFactorial_eq_zero_iff_lt.mpr hu,Nat.cast_zero,mul_zero,zero_mul]
 · rw [Nat.descFactorial_eq_zero_iff_lt.mpr (show m-k<v by omega),Nat.cast_zero,mul_zero]

end
end MathGKM.Markov
