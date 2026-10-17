import MarkovKroneckerM7A3
/-! Machine-authored 7a344181. The actual four-variable radix weights,
including an explicit collision obstruction outside the bounded box. -/
namespace MathGKM.Markov
noncomputable section

def encodeFourM7A3 (e : Fin 4 →₀ ℕ) : ℕ :=
 e 0 + 23*e 1 + 460*e 2 + 5980*e 3
def boxFourM7A3 : Set (Fin 4 →₀ ℕ) :=
 {e | e 0 < 23 ∧ e 1 < 20 ∧ e 2 < 13}
def weightFourM7A3 : Fin 4 → ℕ := ![1,23,460,5980]

theorem encode_four_injectiveM7A3 : Set.InjOn encodeFourM7A3 boxFourM7A3 := by
 intro e he f hf h
 simp only [boxFourM7A3, Set.mem_setOf_eq] at he hf
 simp only [encodeFourM7A3] at h
 have h0 : e 0=f 0 := by omega
 have h1 : e 1=f 1 := by omega
 have h2 : e 2=f 2 := by omega
 have h3 : e 3=f 3 := by omega
 ext i
 fin_cases i <;> assumption

theorem packed_four_evalM7A3 (P : MvPolynomial (Fin 4) ℕ) (B : ℕ) :
 MvPolynomial.eval (fun i => B^weightFourM7A3 i) P =
 (AddMonoidAlgebra.coeff P).sum (fun e c => c*B^(encodeFourM7A3 e)) := by
 rw [MvPolynomial.eval, MvPolynomial.eval₂_eq']
 change (∑ e ∈ P.support, P.coeff e * ∏ i, (B^weightFourM7A3 i)^(e i)) = _
 change (∑ e ∈ P.support, P.coeff e * ∏ i, (B^weightFourM7A3 i)^(e i)) =
   ∑ e ∈ P.support, P.coeff e * B^(encodeFourM7A3 e)
 apply Finset.sum_congr rfl
 intro e he
 congr 1
 simp [Fin.prod_univ_succ, weightFourM7A3, encodeFourM7A3, pow_add, pow_mul,
   mul_assoc]

theorem packed_four_soundM7A3 (B : ℕ) (hB : 1<B)
 (P Q : MvPolynomial (Fin 4) ℕ)
 (hP : (P.support : Set (Fin 4 →₀ ℕ)) ⊆ boxFourM7A3)
 (hQ : (Q.support : Set (Fin 4 →₀ ℕ)) ⊆ boxFourM7A3)
 (hmP : MvPolynomial.eval (fun _ => 1) P < B)
 (hmQ : MvPolynomial.eval (fun _ => 1) Q < B)
 (hpack : MvPolynomial.eval (fun i => B^weightFourM7A3 i) P =
          MvPolynomial.eval (fun i => B^weightFourM7A3 i) Q) : P=Q := by
 apply multivariate_packed_injectiveM7A3 encodeFourM7A3 boxFourM7A3
   encode_four_injectiveM7A3 B hB P Q hP hQ hmP hmQ
 simpa only [packed_four_evalM7A3] using hpack

theorem packed_four_overflowM7A3 :
 encodeFourM7A3 (Finsupp.single 0 23) = encodeFourM7A3 (Finsupp.single 1 1) ∧
 (Finsupp.single 0 23 : Fin 4 →₀ ℕ) ≠ Finsupp.single 1 1 := by
 constructor
 · norm_num [encodeFourM7A3, Finsupp.single_apply]
 · intro h
   have hh := congrArg (fun e : Fin 4 →₀ ℕ => e 0) h
   norm_num [Finsupp.single_apply] at hh

end
end MathGKM.Markov
