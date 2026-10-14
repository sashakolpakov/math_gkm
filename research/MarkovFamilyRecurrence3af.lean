import MarkovSquares3556

/-! Machine-authored request 3af43e69. An exact recurrence in the entire
numerator-two family. It is not an inequality-preservation assertion. -/
namespace MathGKM.Markov
noncomputable section

def twoFamily3af (q : ℕ) : BiPoly := fib6 (q+1)^2+V*fib6 q^2

theorem square_recurrence3af (n : ℕ) :
    fib6 (n+3)^2 = (S^2-V)*fib6 (n+2)^2-
      V*(S^2-V)*fib6 (n+1)^2+V^3*fib6 n^2 := by
  rw [show n+3=(n+1)+2 by omega,fib_rec6 (n+1),fib_rec6 n]
  ring

theorem two_recurrence3af (q : ℕ) :
    twoFamily3af (q+3)=(S^2-V)*twoFamily3af (q+2)-
      V*(S^2-V)*twoFamily3af (q+1)+V^3*twoFamily3af q := by
  unfold twoFamily3af
  have h0 := square_recurrence3af q
  have h1 := square_recurrence3af (q+1)
  convert (show fib6 (q+1+3)^2+V*fib6 (q+3)^2=
    (S^2-V)*(fib6 (q+1+2)^2+V*fib6 (q+2)^2)-
      V*(S^2-V)*(fib6 (q+1+1)^2+V*fib6 (q+1)^2)+
      V^3*(fib6 (q+1)^2+V*fib6 q^2) by
        linear_combination h1+V*h0) using 1 <;> congr 2 <;> omega

theorem source_two_family3af (path : List Bool) (ha : (frame path).mid.a=2) :
    ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
      (frame path).mid.p=twoFamily3af q := source_two_squares3556 path ha

#print axioms two_recurrence3af
#print axioms source_two_family3af
end
end MathGKM.Markov
