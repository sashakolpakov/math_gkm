import MarkovNumeratorTwo6ade

/-! Machine-authored request 3556cd95. Cassini and an exact positive
sum-of-squares source identity. No log-concavity conclusion is presumed. -/
namespace MathGKM.Markov
noncomputable section

theorem fib_cassini3556 (q : ℕ) :
    fib6 q * fib6 (q+2) - fib6 (q+1)^2 = U*V^q := by
  induction q with
  | zero => rw [fib_zero6,fib_one6,fib_two6]; ring
  | succ q ih =>
    rw [show q+1+2=(q+1)+2 by omega, fib_rec6 (q+1)]
    have hr := fib_rec6 q
    rw [pow_succ]
    linear_combination V*ih - fib6 (q+2)*hr

theorem fib_square_product3556 (q : ℕ) :
    S*fib6 q*fib6 (q+1)-U*V^q = fib6 (q+1)^2+V*fib6 q^2 := by
  have hc := fib_cassini3556 q
  rw [fib_rec6 q] at hc
  linear_combination hc

theorem source_two_squares3556 (path : List Bool) (ha : (frame path).mid.a=2) :
    ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
      (frame path).mid.p=fib6 (q+1)^2+V*fib6 q^2 := by
  obtain ⟨q,hq,hb,hp⟩ := source_two_product6 path ha
  exact ⟨q,hq,hb,hp.trans (fib_square_product3556 q)⟩

#print axioms fib_cassini3556
#print axioms fib_square_product3556
#print axioms source_two_squares3556
end
end MathGKM.Markov
