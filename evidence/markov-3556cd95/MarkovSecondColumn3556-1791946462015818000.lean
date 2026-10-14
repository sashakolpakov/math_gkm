import MarkovFibJets3556
import MarkovSecondJet8934

/-! Machine-authored request 3556cd95. Exact numerator-two second column. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def twoSquare3556 (q : ℕ) : BiPoly := fib6 (q+1)^2+V*fib6 q^2

def columnTail3556 (q : ℕ) : Polynomial ℤ :=
  C ((2*(q:ℤ)+3)*((q:ℤ)+1))+
  C (-2*(q:ℤ)^2+5*(q:ℤ)+14)*X+
  C (-2*(q:ℤ)^2-13*(q:ℤ)-4)*X^2+
  C ((q:ℤ)+1)*C (2*(q:ℤ)+1)*X^3

theorem second_column_cleared3556 (q : ℕ) :
    (1-X)^4*(twoSquare3556 q).coeff 2=
      (1+X)-8*X^(q+1)*(1+X)+X^(2*q+1)*columnTail3556 q := by
  have h (n : ℕ) : (fib6 n^2).coeff 2=
      2*X^n*(fib6 n).coeff 2+(fib6 n).coeff 1^2 := by
    rw [pow_two,coeff_mul_two8934,fib_zero_jet3556]
    ring
  have he : 2*((1-X)^4*(twoSquare3556 q).coeff 2)=
      2*((1-X)^2*(fib6 (q+1)).coeff 1)^2+
      2*X*((1-X)^2*(fib6 q).coeff 1)^2+
      2*X^(q+1)*(2*(1-X)^4*(fib6 (q+1)).coeff 2)+
      2*X^(q+1)*(2*(1-X)^4*(fib6 q).coeff 2) := by
    simp only [twoSquare3556,Polynomial.coeff_add,V,Polynomial.coeff_C_mul,h,pow_succ]
    ring
  rw [fib_first_cleared3556,fib_first_cleared3556,
    fib_second_cleared3556,fib_second_cleared3556] at he
  have ht : 2*((1+X)-8*X^(q+1)*(1+X)+X^(2*q+1)*columnTail3556 q)=
      2*((1-X)^4*(twoSquare3556 q).coeff 2) := by
    rw [he]
    unfold columnTail3556
    push_cast
    simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_one,map_ofNat,
      pow_add,pow_mul,pow_one]
    ring
  exact (mul_left_cancel₀ (by norm_num : (2:Polynomial ℤ)≠0) ht).symm

#print axioms second_column_cleared3556
end
end MathGKM.Markov
