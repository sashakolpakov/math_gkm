import MarkovUpperBinomialM2B3
import MarkovSquareObstructionMAF6
/-! Machine-authored 2b34268b. Upper square coefficients before outer summation. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem upper_pair_termM2B3 (N d l b t : ℕ)
 (hd : 1≤d) (hl : 1≤l) (hb : 1≤b) (ht : t≤N) :
 coeff (fib6 (N+d+1)) l (t+d)*coeff (fib6 (N+d+1)) b (N+d-t)=
 ∑ e∈range (l+1), ∑ f∈range (b+1),
 ((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
 ((l+b-1-e).choose (l-e):ℤ)*((l+b-1-f).choose (b-f):ℤ)*
 ((t+l-e).choose (l+b-1-e):ℤ)*((N-t+b-f).choose (l+b-1-f):ℤ) := by
 rw [fib_globalM6E1 _ _ _ hl (by omega),fib_globalM6E1 _ _ _ hb (by omega)]
 rw [show N+d+1-(t+d)-1=N-t by omega,
   show N+d+1-(N+d-t)-1=t by omega,
   show t+d+l=t+d+l by rfl,
   show N+d-t+b=N-t+d+b by omega,
   rising_vandermondeM2B3 d t l hd,rising_vandermondeM2B3 d (N-t) b hd]
 rw [mul_sum,sum_mul]
 apply sum_congr rfl
 intro e he
 rw [mul_sum,mul_sum]
 apply sum_congr rfl
 intro f hf
 have he' := mem_range.mp he
 have hf' := mem_range.mp hf
 have h1 := choose_productM6E1 t (l-e) (b-1)
 have h2 := choose_productM6E1 (N-t) (b-f) (l-1)
 rw [show l-e+(b-1)=l+b-1-e by omega,
   show t+(l-e)=t+l-e by omega] at h1
 rw [show b-f+(l-1)=l+b-1-f by omega,
   show N-t+(b-f)=N-t+b-f by omega] at h2
 have hz1 := congrArg (fun x : ℕ => (x:ℤ)) h1
 have hz2 := congrArg (fun x : ℕ => (x:ℤ)) h2
 push_cast at hz1 hz2
 calc
  _ = ((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
    (((t+l-e).choose (l-e):ℤ)*(t.choose (b-1):ℤ))*
    (((N-t+b-f).choose (b-f):ℤ)*((N-t).choose (l-1):ℤ)) := by ring
  _ = _ := by rw [hz1,hz2]; ring

theorem upper_pair_shiftedM2B3 (N d l b : ℕ)
 (hd : 1≤d) (hl : 1≤l) (hb : 1≤b) :
 (∑ t∈range (N+1), coeff (fib6 (N+d+1)) l (t+d)*
   coeff (fib6 (N+d+1)) b (N+d-t))=
 ∑ e∈range (l+1), ∑ f∈range (b+1),
 ((d+e-1).choose e:ℤ)*((d+f-1).choose f:ℤ)*
 ((l+b-1-e).choose (l-e):ℤ)*((l+b-1-f).choose (b-f):ℤ)*
 ((N+l+b-e-f+1).choose (2*(l+b)-1-e-f):ℤ) := by
 have he (t : ℕ) (ht : t∈range (N+1)) :=
   upper_pair_termM2B3 N d l b t hd hl hb (by have := mem_range.mp ht; omega)
 rw [sum_congr rfl he,sum_comm]
 apply sum_congr rfl
 intro e he
 rw [sum_comm]
 apply sum_congr rfl
 intro f hf
 have he' := mem_range.mp he
 have hf' := mem_range.mp hf
 have hs := shifted_binconvM6E1 N (l-e) (b-f) (l+b-1-e) (l+b-1-f)
   (by omega) (by omega)
 have hz := congrArg (fun x : ℕ => (x:ℤ)) hs
 push_cast at hz
 rw [show l+b-1-e+(l+b-1-f)+1=2*(l+b)-1-e-f by omega,
   show N+(l-e)+(b-f)+1=N+l+b-e-f+1 by omega] at hz
 simp_rw [show ∀ t, t+(l-e)=t+l-e by intro t; omega,
   show ∀ t, N-t+(b-f)=N-t+b-f by intro t; omega] at hz
 simp_rw [mul_assoc]
 rw [←mul_sum,←mul_sum,←mul_sum,←mul_sum,hz]

end
end MathGKM.Markov
