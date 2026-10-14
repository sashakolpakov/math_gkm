import MarkovRunKernelsE273
/-! Machine-authored e27336bc. Exact arbitrary-run second-slice kernel.
The fourth-difference numerator and its coefficient inversion retain zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def secondKernelE273 (N c r q x z : ℤ[X]) : ℤ[X] :=
 let d := 1-x
 let h := hKernelE273 N x z
 let h' := hKernelE273 (N+1) x (z*x)
 let k := kKernelE273 N x z
 let k' := kKernelE273 (N+1) x (z*x)
 let b := 2*(x-z)
 let e := 2*z*d
 (c-r)*k+r*k'+((c-r)*h+r*h')^2-((c-r)*h^2+r*h'^2)+
 2*((x-1)*d^3*(c*b+r*e)+x*d^2*(c*b^2+2*r*b*e+q*e^2))-
 2*(1+x)*d^2*((c-r)*h+r*h'-(1+x)*d^2)

theorem secondKernel_clearE273 (n c r : ℕ) :
 (1-X)^4*secondCompressed446 n c r=
 secondKernelE273 n c r (2*r-c:ℕ) X (X^(n+1))+
 if c=2 then 2*X^(2*n+3)*(1-X)^4 else 0 := by
 have hb : 2*(X-X^(n+1))=(1-X)*runB446 n := by
   dsimp [runB446]
   linear_combination -2*runSum_clear487 n
 have hn : ((n:ℤ[X])+1)=((n+1:ℕ):ℤ[X]) := by push_cast; rfl
 have hp : (X : ℤ[X])^(n+1)*X=X^(n+1+1) := (pow_succ _ _).symm
 unfold secondKernelE273
 dsimp only
 rw [hn,hp,← hKernel_clearE273 n,← hKernel_clearE273 (n+1),
   ← kKernel_clearE273 n,← kKernel_clearE273 (n+1),hb]
 unfold secondCompressed446 runD446
 dsimp only
 split_ifs <;> ring

def secondNumeratorE273 (n c r : ℕ) : ℤ[X] :=
 secondKernelE273 n c r (2*r-c:ℕ) X (X^(n+1))+
 if c=2 then 2*X^(2*n+3)*(1-X)^4 else 0

/-- Invert the cleared fourth difference without any analytic convergence
assumption. The binomial weight comes from a formal power-series identity. -/
theorem coeff_of_fourth_differenceE273 (p q : ℤ[X])
 (h : (1-X)^4*p=q) (j : ℕ) :
 p.coeff j=∑ kl ∈ Finset.antidiagonal j,
   (Nat.choose (3+kl.1) 3:ℤ)*q.coeff kl.2 := by
 let s : PowerSeries ℤ := PowerSeries.mk (fun n => (Nat.choose (3+n) 3:ℤ))
 have hi : s*(1-PowerSeries.X)^4=1 :=
   PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one 3
 have hh : ((1-PowerSeries.X)^4 : PowerSeries ℤ)*(p:PowerSeries ℤ)=q := by
   exact_mod_cast h
 have he : (p:PowerSeries ℤ)=s*(q:PowerSeries ℤ) := by
   rw [← hh,← mul_assoc,hi,one_mul]
 have hc := congrArg (PowerSeries.coeff j) he
 simpa [s,PowerSeries.coeff_mul] using hc

theorem secondCompressed_coeffE273 (n c r j : ℕ) :
 (secondCompressed446 n c r).coeff j=∑ kl ∈ Finset.antidiagonal j,
   (Nat.choose (3+kl.1) 3:ℤ)*(secondNumeratorE273 n c r).coeff kl.2 := by
 exact coeff_of_fourth_differenceE273 _ _ (secondKernel_clearE273 n c r) j

theorem source_second_binomialE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2) :
 2*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ kl ∈ Finset.antidiagonal j, (Nat.choose (3+kl.1) 3:ℤ)*
   (secondNumeratorE273 n (frame rest).mid.b (frame rest).mid.a).coeff kl.2 := by
 rw [source_second_raw_compressed446 n rest i j hij,secondCompressed_coeffE273]

#print axioms secondKernel_clearE273
#print axioms coeff_of_fourth_differenceE273
#print axioms source_second_binomialE273
end
end MathGKM.Markov
