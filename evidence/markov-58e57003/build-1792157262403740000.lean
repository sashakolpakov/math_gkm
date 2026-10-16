import MarkovFibGlobalM6E1
import MarkovCentralBinomialM6E1
/-! Machine-authored 58e57003. Exact finite lower-row square convolution.
No log-concavity conclusion is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem choose_add_sumM58E (n d k : ℕ) :
 ((n+d).choose k:ℤ)=∑ e∈range (k+1), (d.choose e:ℤ)*(n.choose (k-e):ℤ) := by
 have h := Nat.add_choose_eq d n k
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at h
 rw [Nat.add_comm] at h
 exact_mod_cast h

theorem offset_pair_termM58E (j d l b t : ℕ)
 (hl : 1≤l) (hb : 1≤b) (ht : t≤j) :
 coeff (fib6 (j+d+1)) l t*coeff (fib6 (j+d+1)) b (j-t)=
 ∑ e∈range l, ∑ f∈range b,
  (d.choose e:ℤ)*(d.choose f:ℤ)*
  ((l+b-1-f).choose l:ℤ)*((l+b-1-e).choose b:ℤ)*
  ((t+l).choose (l+b-1-f):ℤ)*((j-t+b).choose (l+b-1-e):ℤ) := by
 rw [fib_globalM6E1 _ _ _ hl (by omega),fib_globalM6E1 _ _ _ hb (by omega)]
 rw [show j+d+1-t-1=j-t+d by omega,
   show j+d+1-(j-t)-1=t+d by omega,
   choose_add_sumM58E (j-t) d (l-1),choose_add_sumM58E t d (b-1)]
 rw [show l-1+1=l by omega,show b-1+1=b by omega]
 rw [sum_mul,sum_mul]
 apply sum_congr rfl
 intro e he
 rw [mul_sum,mul_sum]
 apply sum_congr rfl
 intro f hf
 have he' := mem_range.mp he
 have hf' := mem_range.mp hf
 have h1 := choose_productM6E1 t l (b-1-f)
 have h2 := choose_productM6E1 (j-t) b (l-1-e)
 rw [show l+(b-1-f)=l+b-1-f by omega] at h1
 rw [show b+(l-1-e)=l+b-1-e by omega] at h2
 have hz1 := congrArg (fun x : ℕ => (x:ℤ)) h1
 have hz2 := congrArg (fun x : ℕ => (x:ℤ)) h2
 push_cast at hz1 hz2
 calc
  _ = (d.choose e:ℤ)*(d.choose f:ℤ)*
      (((t+l).choose l:ℤ)*(t.choose (b-1-f):ℤ))*
      (((j-t+b).choose b:ℤ)*((j-t).choose (l-1-e):ℤ)) := by ring
  _ = _ := by rw [hz1,hz2]; ring

theorem offset_pairM58E (j d l b : ℕ) (hl : 1≤l) (hb : 1≤b) :
 (∑ t∈range (j+1), coeff (fib6 (j+d+1)) l t*coeff (fib6 (j+d+1)) b (j-t))=
 ∑ e∈range l, ∑ f∈range b,
  (d.choose e:ℤ)*(d.choose f:ℤ)*
  ((l+b-1-f).choose l:ℤ)*((l+b-1-e).choose b:ℤ)*
  ((j+l+b+1).choose (2*(l+b)-1-e-f):ℤ) := by
 have he (t : ℕ) (ht : t∈range (j+1)) :=
  offset_pair_termM58E j d l b t hl hb (by have := mem_range.mp ht; omega)
 rw [sum_congr rfl he,sum_comm]
 apply sum_congr rfl
 intro e he
 rw [sum_comm]
 apply sum_congr rfl
 intro f hf
 have he' := mem_range.mp he
 have hf' := mem_range.mp hf
 have hs := shifted_binconvM6E1 j l b (l+b-1-f) (l+b-1-e) (by omega) (by omega)
 have hz := congrArg (fun x : ℕ => (x:ℤ)) hs
 push_cast at hz
 rw [show l+b-1-f+(l+b-1-e)+1=2*(l+b)-1-e-f by omega] at hz
 simp_rw [mul_assoc]
 rw [←mul_sum,←mul_sum,←mul_sum,←mul_sum,hz]

end
end MathGKM.Markov
