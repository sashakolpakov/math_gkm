import MathGKM.MarkovIndices
/-! Machine-authored 9fc35bc5. Reduced-label coverage for future remaining high cones.
This is an arithmetic reduction only, not a coefficient inequality. -/
namespace MathGKM.Markov

theorem third_count_boundary_neM9FC (a b : ℕ) (hb : 7 ≤ b)
 (hc : Nat.Coprime a b) : 3*a ≠ 2*b := by
 intro he
 have hdiv : b ∣ 3*a := by rw [he]; exact ⟨2, by omega⟩
 have hd : b ∣ 3 := hc.symm.dvd_mul_right.mp hdiv
 have hn := Nat.le_of_dvd (by decide : 0<3) hd
 omega

theorem third_high_chart_coverM9FC (a b : ℕ) (hb : 7 ≤ b)
 (hab : a<b) (hc : Nat.Coprime a b) (hh : 2*b ≤ 3*a) :
 let x := b-a
 let y := 3*a-2*b
 b=3*x+y ∧ a=2*x+y ∧
 ((1≤x ∧ 4≤y) ∨ (2≤x ∧ 1≤y)) := by
 have he := third_count_boundary_neM9FC a b hb hc
 dsimp only
 omega

end MathGKM.Markov
