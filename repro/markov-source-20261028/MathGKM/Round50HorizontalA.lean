import MathGKM.Round50RowA

/-! Machine-authored round50: unconditional row-one inequalities. -/
namespace HorizontalRowR50
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem prefix_zero (n i : ℕ) (hn : 1≤n) (hi : i<n) :
    coeff (frame (List.replicate (n-1) true)).mid.p i 1=0 := by
  rw [Acceptedb6d2ec5febf447178088c884.obligation n hn i 1]
  apply Finset.sum_eq_zero
  intro s hs
  by_cases he : i+1=n
  · rw [Acceptede724855dc630697365540fae.obligation.1 n i 1 s hn he]
    simp
  · exact Acceptede724855dc630697365540fae.obligation.2.2.1 n i 1 s (Or.inl (by omega))

theorem weighted_choose_lc (n r : ℕ) (hn : 1≤n) :
    ((3*(n:ℤ)-r-1)*((n-1).choose r:ℤ))*
      ((3*(n:ℤ)-(r+2)-1)*((n-1).choose (r+2):ℤ)) ≤
      ((3*(n:ℤ)-(r+1)-1)*((n-1).choose (r+1):ℤ))^2 := by
  by_cases hr : r+2≤n-1
  · apply EndpointR29.product_lc
    · omega
    · omega
    · positivity
    · positivity
    · nlinarith
    · exact EndpointR29.choose_lc (n-1) r
  · rw [Nat.choose_eq_zero_of_lt (by omega : n-1<r+2)]
    simp only [Nat.cast_zero,mul_zero]
    positivity

theorem horizontal_raw (n i : ℕ) (hn : 1≤n) :
    let P := (frame (List.replicate (n-1) true)).mid.p
    coeff P i 1*coeff P (i+2) 1≤coeff P (i+1) 1^2 := by
  dsimp only
  by_cases hi : i<n
  · rw [prefix_zero n i hn hi]
    simp only [zero_mul]
    positivity
  · obtain ⟨r, rfl⟩ : ∃ r, i=n+r := ⟨i-n, by omega⟩
    rw [show n+r+2=n+(r+2) by omega, show n+r+1=n+(r+1) by omega]
    rw [coefficient_formula n r hn, coefficient_formula n (r+2) hn,
      coefficient_formula n (r+1) hn]
    push_cast
    exact weighted_choose_lc n r hn

theorem original_horizontal (n : ℕ) (hn : 1≤n) :
    let E := (frame (List.replicate (n-1) true)).mid
    ∀ i : ℕ, InPolygon E.a E.b i 1 → InPolygon E.a E.b (i+1) 1 →
      InPolygon E.a E.b (i+2) 1 →
      coeff E.p i 1*coeff E.p (i+2) 1≤coeff E.p (i+1) 1^2 := by
  intro E i h0 h1 h2
  exact horizontal_raw n i hn

end
end HorizontalRowR50
#print axioms HorizontalRowR50.original_horizontal
