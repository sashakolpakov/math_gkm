import MarkovColumnMonotone3af

/-! Machine-authored request 3af43e69. Exact source-path adapters and a
full-root equivalence. Neither side of the equivalence is proved. -/
namespace MathGKM.Markov
noncomputable section

def twoPath3af (n : ℕ) : List Bool := List.replicate n false++[true]

theorem two_path_labels3af (n : ℕ) :
    (frame (twoPath3af n)).mid.a=2 ∧
    (frame (twoPath3af n)).mid.b=2*(n+1)+1 := by
  rw [twoPath3af,frame_append18,spine_frame6]
  simp [advance]
  omega

theorem two_path_polynomial3af (n : ℕ) :
    (frame (twoPath3af n)).mid.p=twoFamily3af (n+1) := by
  rw [twoPath3af,frame_append18,spine_frame6]
  change S*fib6 (n+1)*fib6 (n+2)-U*V^(n+1)=_
  exact fib_square_product3556 (n+1)

theorem source_two_coefficient_monotone3af (path : List Bool)
    (ha : (frame path).mid.a=2) :
    ∃ next : List Bool, (frame next).mid.a=2 ∧
      (frame next).mid.b=(frame path).mid.b+2 ∧
      ∀ i j, coeff (frame path).mid.p (i+2) j ≤ coeff (frame next).mid.p (i+2) j := by
  obtain ⟨q,hq,hb,hp⟩ := source_two_family3af path ha
  refine ⟨twoPath3af q,(two_path_labels3af q).1,?_,?_⟩
  · rw [(two_path_labels3af q).2,hb]; omega
  · intro i j
    rw [hp,two_path_polynomial3af]
    exact two_column_monotone3af q i j

theorem root_iff_two_family_and_large3af : Conjecture63 ↔
    (∀ q : ℕ, 1≤q → GlobalLC18 (twoFamily3af q)) ∧
    (∀ path : List Bool, 3≤(frame path).mid.a → GlobalLC18 (frame path).mid.p) := by
  rw [root_iff_numerator_ge_two6]
  constructor
  · intro h
    constructor
    · intro q hq
      obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
      rw [← two_path_polynomial3af]
      exact h _ (by rw [(two_path_labels3af n).1])
    · intro path ha; exact h path (by omega)
  · rintro ⟨h2,h3⟩ path ha
    by_cases he : (frame path).mid.a=2
    · obtain ⟨q,hq,_,hp⟩ := source_two_family3af path he
      rw [hp]; exact h2 q hq
    · exact h3 path (by omega)

#print axioms source_two_coefficient_monotone3af
#print axioms root_iff_two_family_and_large3af
end
end MathGKM.Markov
