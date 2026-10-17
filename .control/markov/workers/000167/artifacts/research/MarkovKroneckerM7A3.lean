import MarkovPackedPolynomialM7A3
/-! Machine-authored 7a344181. Multivariate flattening, with explicit
collision-free support. The finite support condition must be proved for every
concrete use; radix overflow is not ignored. -/
namespace MathGKM.Markov
noncomputable section

def flattenM7A3 {σ : Type*} (encode : (σ →₀ ℕ) → ℕ)
 (P : MvPolynomial σ ℕ) : Polynomial ℕ :=
 Polynomial.ofFinsupp (AddMonoidAlgebra.mapDomain encode P)

theorem flatten_evalM7A3 {σ : Type*} (encode : (σ →₀ ℕ) → ℕ)
 (P : MvPolynomial σ ℕ) (B : ℕ) :
 (flattenM7A3 encode P).eval B =
   (AddMonoidAlgebra.coeff P).sum (fun e c => c * B^(encode e)) := by
 rw [Polynomial.eval_eq_sum]
 change (Finsupp.mapDomain encode (AddMonoidAlgebra.coeff P)).sum (fun e c => c * B^e) = _
 exact Finsupp.sum_mapDomain_index (fun _ => by simp) (fun _ _ _ => by simp [add_mul])

theorem flatten_massM7A3 {σ : Type*} (encode : (σ →₀ ℕ) → ℕ)
 (P : MvPolynomial σ ℕ) :
 (flattenM7A3 encode P).eval 1 = MvPolynomial.eval (fun _ => 1) P := by
 rw [flatten_evalM7A3]
 simp [MvPolynomial.eval, MvPolynomial.eval₂]

theorem flatten_injectiveM7A3 {σ : Type*} (encode : (σ →₀ ℕ) → ℕ)
 (S : Set (σ →₀ ℕ)) (hS : Set.InjOn encode S)
 (P Q : MvPolynomial σ ℕ)
 (hP : (P.support : Set (σ →₀ ℕ)) ⊆ S)
 (hQ : (Q.support : Set (σ →₀ ℕ)) ⊆ S)
 (h : flattenM7A3 encode P = flattenM7A3 encode Q) : P=Q := by
 apply AddMonoidAlgebra.coeff_injective
 apply Finsupp.mapDomain_injOn S hS (by exact hP) (by exact hQ)
 exact congrArg (fun p : Polynomial ℕ => p.toFinsupp.coeff) h

theorem multivariate_packed_injectiveM7A3 {σ : Type*}
 (encode : (σ →₀ ℕ) → ℕ) (S : Set (σ →₀ ℕ)) (hS : Set.InjOn encode S)
 (B : ℕ) (hB : 1 < B) (P Q : MvPolynomial σ ℕ)
 (hP : (P.support : Set (σ →₀ ℕ)) ⊆ S)
 (hQ : (Q.support : Set (σ →₀ ℕ)) ⊆ S)
 (hmP : MvPolynomial.eval (fun _ => 1) P < B)
 (hmQ : MvPolynomial.eval (fun _ => 1) Q < B)
 (h : (AddMonoidAlgebra.coeff P).sum (fun e c => c*B^(encode e)) =
      (AddMonoidAlgebra.coeff Q).sum (fun e c => c*B^(encode e))) : P=Q := by
 apply flatten_injectiveM7A3 encode S hS P Q hP hQ
 apply polynomial_packed_injectiveM7A3 B hB
 · rwa [flatten_massM7A3]
 · rwa [flatten_massM7A3]
 · simpa only [flatten_evalM7A3] using h

end
end MathGKM.Markov
