import MarkovFibonacciBase6ade

/-! Machine-authored request 6ade2697. Source coefficient formula proved
from the actual recurrence, not assumed from the paper. -/
namespace MathGKM.Markov
noncomputable section

theorem fib_formula_aux6 (n : ℕ) : ∀ i j k : ℕ, i+1+j+k=n →
    coeff (fib6 n) (i+1) j=((i+k).choose i : ℤ)*((i+1+j).choose j : ℤ) := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro i j k hn
    subst n
    cases j with
    | zero => simpa using fib_boundary6 i k
    | succ j =>
      cases k with
      | zero =>
        simp only [Nat.add_zero,fib_top6,Nat.choose_self,Int.natCast_one,one_mul]
        exact_mod_cast Nat.choose_symm_add
      | succ k =>
        have hn : i+1+(j+1)+(k+1)=(i+j+k+1)+2 := by omega
        rw [hn,fib_coeff_rec6]
        have h2 := ih (i+j+k+1+1) (by omega) i j (k+1) (by omega)
        have h3 := ih (i+j+k+1+1) (by omega) i (j+1) k (by omega)
        have h4 := ih (i+j+k+1) (by omega) i j k (by omega)
        rw [h2,h3,h4]
        cases i with
        | zero =>
          have he : 0+j+k+1+1=(j+1)+(k+1) := by omega
          rw [he,fib_axis6]
          simp
        | succ i =>
          have h1 := ih (i+1+j+k+1+1) (by omega) i (j+1) (k+1) (by omega)
          rw [h1]
          have hf' : (i+1+(k+1)).choose (i+1)=
              (i+(k+1)).choose i+(i+1+k).choose (i+1) := by
            simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using
              (Nat.choose_succ_succ' (i+k+1) i)
          have hg : (i+1+1+(j+1)).choose (j+1)=
              (i+1+(j+1)).choose (j+1)+(i+1+1+j).choose j := by
            simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using
              (Nat.choose_succ_succ' (i+j+2) j)
          rw [hf',hg]
          push_cast
          ring

theorem fib_formula6 (i j k : ℕ) :
    coeff (fib6 (i+1+j+k)) (i+1) j=
      ((i+k).choose i : ℤ)*((i+1+j).choose j : ℤ) :=
  fib_formula_aux6 _ i j k rfl

theorem source_one_coeff6 (path : List Bool) (ha : (frame path).mid.a=1)
    (i j k : ℕ) (hb : i+1+j+k=(frame path).mid.b) :
    coeff (frame path).mid.p (i+1) j=
      ((i+k).choose i : ℤ)*((i+1+j).choose j : ℤ) := by
  obtain ⟨n,rfl⟩ := source_one_spine274 path ha
  rw [spine_b6] at hb
  rw [source_fib6,← hb,fib_formula6]

#print axioms fib_formula6
#print axioms source_one_coeff6
end
end MathGKM.Markov
