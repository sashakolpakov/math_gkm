import MathGKM.Round36KernelA

/-! Machine-authored round41: support bookkeeping for the committed literal weights.
These lemmas assert no grouped sign. -/
namespace GroupedSignsR41
open MathGKM.Markov
noncomputable section

theorem mc_positive (n h s : ℕ) (hh : 0 < h) :
    0 < RenewalR28.mc n h s ↔ h + s ≤ n := by
  have hz : h ≠ 0 := by omega
  by_cases hs : h + s ≤ n
  · simp only [RenewalR28.mc, hz, if_false, hs, if_true]
    have hp : 0 < (h + s).choose h := Nat.choose_pos (by omega)
    have hq : 0 < (n-s-1).choose (h-1) := Nat.choose_pos (by omega)
    exact iff_of_true (mul_pos (by exact_mod_cast hp) (by exact_mod_cast hq)) True.intro
  · simp [RenewalR28.mc, hz, hs]

theorem W_corner (n i j s : ℕ) (hn : 1 ≤ n) (hij : i + j = n) :
    MidpointR36.W n i j s = if i = n ∧ j = 0 ∧ s = n then 1 else 0 := by
  have hg : n ≤ i + j ∧ i + j ≤ 2*n := by omega
  by_cases hs : s ≤ i
  · simp only [MidpointR36.W, hg.1, hg.2, hs, and_self, if_true,
      hij, Nat.sub_self, RenewalR28.mc]
    by_cases he : s = n
    · have hi : i = n := by omega
      have hj : j = 0 := by omega
      simp [he, hi, hj, show n ≤ 2*n by omega]
    · simp [he]
  · have he : ¬(i = n ∧ j = 0 ∧ s = n) := by omega
    simp [MidpointR36.W, hs, he]

theorem W_positive_layer (n i j s h : ℕ) (hh : 0 < h) (hhn : h ≤ n)
    (hij : i + j = n + h) :
    0 < MidpointR36.W n i j s ↔ s ≤ i ∧ h + s ≤ n ∧ i ≤ s + 2*h := by
  have hg : n ≤ i + j ∧ i + j ≤ 2*n := by omega
  have hd : i + j-n = h := by omega
  by_cases hs : s ≤ i
  · simp only [MidpointR36.W, hg.1, hg.2, hs, and_self, if_true, hd]
    have hc : (0 : ℤ) < ((2*h).choose (i-s) : ℤ) ↔ i ≤ s + 2*h := by
      constructor
      · intro hp
        have hz : (2*h).choose (i-s) ≠ 0 := by exact_mod_cast (ne_of_gt hp)
        have hb : i-s ≤ 2*h := by
          by_contra hnot
          exact hz (Nat.choose_eq_zero_of_lt (by omega))
        omega
      · intro hb
        exact_mod_cast (Nat.choose_pos (show i-s ≤ 2*h by omega))
    have hm : 0 ≤ RenewalR28.mc n h s := by
      unfold RenewalR28.mc
      split_ifs <;> positivity
    have hb : (0 : ℤ) ≤ ((2*h).choose (i-s) : ℤ) := by positivity
    rw [mul_pos_iff]
    have hmiff := mc_positive n h s hh
    constructor
    · intro hp
      rcases hp with hp | hp
      · exact ⟨True.intro, hmiff.mp hp.1, hc.mp hp.2⟩
      · omega
    · rintro ⟨_, hm', hc'⟩
      exact Or.inl ⟨hmiff.mpr hm', hc.mpr hc'⟩
  · simp [MidpointR36.W, hs]

theorem W_outside (n i j s : ℕ) (hout : i + j < n ∨ 2*n < i + j) :
    MidpointR36.W n i j s = 0 := by
  have hg : ¬(n ≤ i + j ∧ i + j ≤ 2*n ∧ s ≤ i) := by omega
  simp [MidpointR36.W, hg]

theorem shifted_support (n i j s h r dx dy : ℕ)
    (hd : (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1))
    (hh : 0 < h+r) (hhn : h+r ≤ n) (hij : i+j=n+h) :
    (0 < MidpointR36.W n (i+r*dx) (j+r*dy) s) ↔
      (i+r*dx)-2*(h+r) ≤ s ∧ s ≤ min (i+r*dx) (n-(h+r)) := by
  have he : (i+r*dx)+(j+r*dy)=n+(h+r) := by
    rcases hd with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ <;> simp <;> omega
  rw [W_positive_layer n (i+r*dx) (j+r*dy) s (h+r) hh hhn he]
  simp only [le_min_iff]
  omega

end
end GroupedSignsR41

#print axioms GroupedSignsR41.W_corner
#print axioms GroupedSignsR41.W_positive_layer
