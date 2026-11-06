import MathGKM.Round62EvenA
import MathGKM.Accepted1d5e0f982ec2b18c67931c82

/- Machine-authored round62. Uniform matching sum directly identified with
the extended actual polynomial sequence; no determinant or inequality used. -/
namespace MatchingIdentificationR62
open FiniteMatchingR61 MathGKM.Markov
noncomputable section

def edge (e : ℕ) : BiPoly := if e % 2 = 0 then U else V

theorem edge_even (k : ℕ) : edge (2*k)=U := by
  simp [edge,Nat.mul_mod]

theorem edge_odd (k : ℕ) : edge (2*k+1)=V := by
  simp [edge,Nat.add_mod,Nat.mul_mod]

theorem uniform_eq : ∀ n : ℕ,
    finiteSum (U+V) edge (2*n)=HorizontalR53.R n := by
  intro n
  have bounds := Accepted92c7f4249bfd5f9e6fac325b.obligation.2.2 BiPoly (U+V) edge
  have initial := Accepted1d5e0f982ec2b18c67931c82.obligation.1
  refine Nat.twoStepInduction ?_ ?_ ?_ n
  · simpa only [Nat.mul_zero] using bounds.1.trans initial.1.symm
  · change finiteSum (U+V) edge (0+2)=HorizontalR53.R 1
    rw [finiteSum_step,bounds.1,bounds.2,initial.2]
    simp [edge,pow_two]
  · intro k h₀ h₁
    rw [even_step,h₀,h₁]
    have ec : edge (2*k+2)=U := by
      simpa only [Nat.mul_add,Nat.mul_one] using edge_even (k+1)
    rw [ec,edge_odd,edge_even,
      Accepted1d5e0f982ec2b18c67931c82.obligation.2.2 k]
    dsimp [HorizontalR53.A,RightR30.T]
    ring

theorem uniform_actual :
    (∀ n : ℕ, finiteSum (U+V) edge (2*n)=HorizontalR53.R n) ∧
    (∀ n : ℕ, 1≤n → finiteSum (U+V) edge (2*n)=
      (frame (List.replicate (n-1) true)).mid.p) := by
  refine ⟨uniform_eq,?_⟩
  intro n hn
  exact (uniform_eq n).trans
    (Accepted1d5e0f982ec2b18c67931c82.obligation.2.1 n hn)
end
end MatchingIdentificationR62
