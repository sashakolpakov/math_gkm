import MarkovFibGlobalM6E1
import MarkovCentralBinomialM6E1
/-! Machine-authored 6e1369de. Full central-row coefficient identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

theorem central_pairM6E1 (n l b : ℕ) (hl : 1≤l) (hb : 1≤b) :
 (∑ t ∈ range (n+1), coeff (fib6 (n+1)) l t*coeff (fib6 (n+1)) b (n-t))=
 ((l+b-1).choose l:ℤ)*((l+b-1).choose b:ℤ)*
   ((n+l+b+1).choose (2*(l+b)-1):ℤ) := by
 have he (t : ℕ) (ht : t∈range (n+1)) :
   coeff (fib6 (n+1)) l t*coeff (fib6 (n+1)) b (n-t)=
   ((l+b-1).choose l:ℤ)*((l+b-1).choose b:ℤ)*
    (((t+l).choose (l+b-1):ℤ)*((n-t+b).choose (l+b-1):ℤ)) := by
   have ht' := mem_range.mp ht
   rw [fib_globalM6E1 _ _ _ hl (by omega),fib_globalM6E1 _ _ _ hb (by omega)]
   rw [show n+1-t-1=n-t by omega,show n+1-(n-t)-1=t by omega]
   have h1 := choose_productM6E1 t l (b-1)
   have h2 := choose_productM6E1 (n-t) b (l-1)
   rw [show l+(b-1)=l+b-1 by omega] at h1
   rw [show b+(l-1)=l+b-1 by omega] at h2
   have h1z := congrArg (fun x : ℕ => (x:ℤ)) h1
   have h2z := congrArg (fun x : ℕ => (x:ℤ)) h2
   push_cast at h1z h2z
   calc
    _ = (((t+l).choose l:ℤ)*(t.choose (b-1):ℤ))*
       (((n-t+b).choose b:ℤ)*((n-t).choose (l-1):ℤ)) := by ring
    _ = _ := by rw [h1z,h2z]; ring
 rw [sum_congr rfl he,←mul_sum]
 have hs := shifted_binconvM6E1 n l b (l+b-1) (l+b-1) (by omega) (by omega)
 rw [show l+b-1+(l+b-1)+1=2*(l+b)-1 by omega] at hs
 exact congrArg (fun x : ℤ => ((l+b-1).choose l:ℤ)*((l+b-1).choose b:ℤ)*x)
   (by exact_mod_cast hs)

theorem central_square_formulaM6E1 (n i : ℕ) (hi : 2≤i) :
 coeff (fib6 (n+1)^2) i n=
 ((2*i-2).choose (i-2):ℤ)*((n+i+1).choose (2*i-1):ℤ) := by
 rw [pow_two,bicoeff_mulM3A1,sum_comm]
 have he (l : ℕ) (hl : l∈range (i+1)) :
   (∑ t ∈ range (n+1), coeff (fib6 (n+1)) l t*coeff (fib6 (n+1)) (i-l) (n-t))=
   ((i-1).choose l:ℤ)*((i-1).choose (i-l):ℤ)*((n+i+1).choose (2*i-1):ℤ) := by
   have hl' := mem_range.mp hl
   by_cases h0 : l=0
   · subst l
     simp only [Nat.sub_zero,Nat.choose_eq_zero_of_lt (by omega : i-1<i),Int.natCast_zero,mul_zero,zero_mul]
     apply sum_eq_zero
     intro t ht
     rw [fib_low_zeroM3A1 _ _ (mem_range.mp ht),zero_mul]
   by_cases hi' : l=i
   · subst l
     simp only [Nat.sub_self,Nat.choose_eq_zero_of_lt (by omega : i-1<i),Int.natCast_zero,zero_mul]
     apply sum_eq_zero
     intro t ht
     rw [fib_low_zeroM3A1 _ _ (by omega : n-t<n+1),mul_zero]
   have hh := central_pairM6E1 n l (i-l) (by omega) (by omega)
   simpa [show l+(i-l)=i by omega,show n+l+(i-l)=n+i by omega] using hh
 rw [sum_congr rfl he,←sum_mul]
 have hv := Nat.add_choose_eq (i-1) (i-1) i
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk] at hv
 have hs : i-1+(i-1)=2*i-2 := by omega
 rw [hs] at hv
 have hy : (2*i-2).choose i=(2*i-2).choose (i-2) := by
   rw [←Nat.choose_symm (by omega : i≤2*i-2),show 2*i-2-i=i-2 by omega]
 rw [hy] at hv
 congr 1
 exact_mod_cast hv.symm

end
end MathGKM.Markov
