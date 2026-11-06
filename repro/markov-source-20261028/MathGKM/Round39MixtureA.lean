import MathGKM.Acceptedf107d9b57f02a2f6eada5076

/-! Machine-authored round39. Conditional finite-family mixture; no actual
coefficient compatibility is asserted. -/
namespace ShiftedR39
open scoped BigOperators
open StateCrossR38
noncomputable section

def triple (a : ℤ → ℤ) (x : ℤ) : ℤ →₀ ℤ :=
  Finsupp.single 0 (a x) + Finsupp.single 1 (a (x+1)) + Finsupp.single 2 (a (x+2))

theorem binary (a b : ℤ → ℤ) (α β : ℕ)
    (hna : ∀ x, 0 ≤ a x) (hnb : ∀ x, 0 ≤ b x)
    (ha : LC a) (hb : LC b) (hc : Cross a b) :
    LC (fun x => (α : ℤ)*a x+(β : ℤ)*b x) := by
  intro x
  let A := triple a x
  let B := triple b x
  have nn (c : ℤ → ℤ) (hn : ∀ z, 0 ≤ c z) : ∀ z, 0 ≤ triple c x z := by
    intro z
    simp only [triple,Finsupp.add_apply,Finsupp.single_apply]
    have h0 := hn x
    have h1 := hn (x+1)
    have h2 := hn (x+2)
    split_ifs <;> omega
  have ends (c e : ℤ → ℤ) (z : ℤ) (h : z ≠ 0) :
      triple c x z * triple e x (z+2)=0 := by
    by_cases h1 : z=1
    · subst z; simp [triple]
    by_cases h2 : z=2
    · subst z; simp [triple]
    simp [triple,Ne.symm h,Ne.symm h1,Ne.symm h2]
  have lc (c : ℤ → ℤ) (hl : LC c) : LC (triple c x) := by
    intro z
    by_cases h : z=0
    · subst z; simpa [triple] using hl x
    · rw [ends c c z h]; exact sq_nonneg _
  have cr : Cross A B := by
    intro z
    by_cases h : z=0
    · subst z; simpa [A,B,triple] using hc x
    · dsimp [A,B]
      rw [ends a b z h,ends b a z h]
      exact ⟨mul_nonneg (nn a hna _) (nn b hnb _),mul_nonneg (nn a hna _) (nn b hnb _)⟩
  have h := Acceptedf107d9b57f02a2f6eada5076.obligation A B α β
    (nn a hna) (nn b hnb) (lc a ha) (lc b hb) cr 0
  simpa [A,B,triple] using h

theorem family {ι : Type*} (s : Finset ι) (f : ι → ℤ → ℤ) (w : ι → ℕ)
    (hn : ∀ r ∈ s, ∀ x, 0 ≤ f r x)
    (hl : ∀ r ∈ s, LC (f r))
    (hc : ∀ r ∈ s, ∀ q ∈ s, r ≠ q → Cross (f r) (f q)) :
    LC (fun x => ∑ r ∈ s, (w r : ℤ)*f r x) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp [LC]
  | @insert a s has ih =>
    have hs : LC (fun x => ∑ r ∈ s, (w r : ℤ)*f r x) :=
      ih (fun r hr => hn r (Finset.mem_insert_of_mem hr))
        (fun r hr => hl r (Finset.mem_insert_of_mem hr))
        (fun r hr q hq => hc r (Finset.mem_insert_of_mem hr) q (Finset.mem_insert_of_mem hq))
    have ns : ∀ x, 0 ≤ ∑ r ∈ s, (w r : ℤ)*f r x := by
      intro x
      exact Finset.sum_nonneg (fun r hr => mul_nonneg (Nat.cast_nonneg _) (hn r (Finset.mem_insert_of_mem hr) x))
    have cs : Cross (f a) (fun x => ∑ r ∈ s, (w r : ℤ)*f r x) := by
      intro x
      constructor
      · rw [Finset.mul_sum,Finset.mul_sum]
        apply Finset.sum_le_sum
        intro r hr
        have h := (hc a (Finset.mem_insert_self _ _) r (Finset.mem_insert_of_mem hr)
          (by intro he; subst r; exact has hr) x).1
        have hh := mul_le_mul_of_nonneg_left h (Nat.cast_nonneg (w r) : (0:ℤ) ≤ w r)
        nlinarith only [hh]
      · rw [Finset.sum_mul,Finset.mul_sum]
        apply Finset.sum_le_sum
        intro r hr
        have h := (hc a (Finset.mem_insert_self _ _) r (Finset.mem_insert_of_mem hr)
          (by intro he; subst r; exact has hr) x).2
        have hh := mul_le_mul_of_nonneg_left h (Nat.cast_nonneg (w r) : (0:ℤ) ≤ w r)
        nlinarith only [hh]
    have h := binary (f a) (fun x => ∑ r ∈ s, (w r : ℤ)*f r x) (w a) 1
      (hn a (Finset.mem_insert_self _ _)) ns (hl a (Finset.mem_insert_self _ _)) hs cs
    simpa only [Finset.sum_insert has,Nat.cast_one,one_mul] using h

theorem finite_family {ι : Type*} (s : Finset ι) (f : ι → ℤ →₀ ℤ) (w : ι → ℕ)
    (hn : ∀ r ∈ s, ∀ x, 0 ≤ f r x)
    (hl : ∀ r ∈ s, LC (f r))
    (hc : ∀ r ∈ s, ∀ q ∈ s, r ≠ q → Cross (f r) (f q)) :
    LC (fun x => ∑ r ∈ s, (w r : ℤ)*f r x) :=
  family s (fun r => f r) w hn hl hc

end
end ShiftedR39
