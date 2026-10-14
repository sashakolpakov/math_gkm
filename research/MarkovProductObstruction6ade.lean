import MarkovFibonacciLC6ade

/-! Machine-authored request 6ade2697. A product of source polynomials is
not necessarily a source polynomial. This refutes a proposed closure rule only. -/
namespace MathGKM.Markov
noncomputable section

theorem coeff_linear6 (P : BiPoly) (i j : ℕ) :
    coeff ((U+V)*P) (i+1) (j+1)=coeff P i (j+1)+coeff P (i+1) j := by
  simp [add_mul,coeff,U,V,Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]

theorem fib_product_triple6 :
    coeff (fib6 1*fib6 4) 1 2=2 ∧
    coeff (fib6 1*fib6 4) 1 3=3 ∧
    coeff (fib6 1*fib6 4) 1 4=5 := by
  have h02 := fib_axis6 2 2
  have h03 := fib_axis6 3 1
  have h04 := fib_axis6 4 0
  have h11 := fib_formula6 0 1 2
  have h12 := fib_formula6 0 2 1
  have h13 := fib_formula6 0 3 0
  norm_num at h02 h03 h04 h11 h12 h13
  rw [fib_one6]
  rw [coeff_linear6 (fib6 4) 0 1,coeff_linear6 (fib6 4) 0 2,
    coeff_linear6 (fib6 4) 0 3]
  simp [h02,h03,h04,h11,h12,h13]

theorem fib_product_obstruction6 :
    WeakLC 1 1 (fib6 1) ∧ WeakLC 1 4 (fib6 4) ∧
      ¬GlobalLC18 (fib6 1*fib6 4) := by
  refine ⟨fib_weakLC6 1,fib_weakLC6 4,?_⟩
  intro h
  have hv := h.2.1 1 2
  obtain ⟨h0,h1,h2⟩ := fib_product_triple6
  rw [h0,h1,h2] at hv
  norm_num at hv

#print axioms fib_product_triple6
#print axioms fib_product_obstruction6
end
end MathGKM.Markov
