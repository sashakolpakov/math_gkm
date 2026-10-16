import MarkovCross774
/-! Machine-authored 1152282d. Explicit support bridge for a two-term prefix. -/
namespace MathGKM.Markov
noncomputable section

theorem crossLC_two_prefixM115 (f : ℤ → ℝ) (N : ℤ) (hN : 3≤N)
 (hz : ∀ k, k<1 ∨ N<k → f k=0)
 (hn : ∀ k, 0≤f k)
 (hp : ∀ k, 3≤k → k≤N → 0<f k)
 (ha : ∀ k, f (k-1)*f (k+1)≤f k^2) : CrossLC f := by
 apply crossLC_of_adjacent_interval774 f hn ha
 intro i k j hik hkj hi hj
 have hi1 : 1≤i := by
   by_contra h
   rw [hz i (Or.inl (by omega))] at hi
   linarith
 have hjN : j≤N := by
   by_contra h
   rw [hz j (Or.inr (by omega))] at hj
   linarith
 by_cases hk3 : 3≤k
 · exact hp k hk3 (by omega)
 have hk : k=1 ∨ k=2 := by omega
 rcases hk with rfl|rfl
 · have h : i=1 := by omega
   simpa [h] using hi
 · have hh : i=1 ∨ i=2 := by omega
   rcases hh with rfl|rfl
   · have h := ha 2
     have h3 := hp 3 (by omega) hN
     have h2 := hn 2
     norm_num only at h
     nlinarith [mul_pos hi h3]
   · exact hi
end MathGKM.Markov
