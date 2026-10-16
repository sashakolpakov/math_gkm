import MarkovTwoArithmeticM679
import MarkovSourceReduction3af
/-! Machine-authored 6799c386. Exact alternative root reduction. Both remaining
directions and every other numerator are explicit unproved propositions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem two_family_coeffM679 (q i j : ℕ) :
 coeff (twoFamily3af q) i j=(rawTwoM679 q i j:ℤ) := by
 change ((twoPolyMEC6 q).coeff i).coeff j=_
 rw [two_column_formulaM679,raw_two_formulaM679]

theorem two_horizontal_arithmeticM679 (q : ℕ) (hq : 1≤q) (i j : ℕ) :
 rawTwoM679 q i j*rawTwoM679 q (i+2) j ≤ rawTwoM679 q (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := source_two_horizontal_allMEC6 (twoPath3af n) (two_path_labels3af n).1 i j
 rw [two_path_polynomial3af,two_family_coeffM679,two_family_coeffM679,two_family_coeffM679] at h
 exact_mod_cast h

def TwoRemainingM679 : Prop := ∀ q : ℕ, 1≤q →
 (∀ i j, rawTwoM679 q i j*rawTwoM679 q i (j+2) ≤ rawTwoM679 q i (j+1)^2) ∧
 (∀ i j, rawTwoM679 q i (j+2)*rawTwoM679 q (i+2) j ≤ rawTwoM679 q (i+1) (j+1)^2)

def OtherSourcesM679 : Prop :=
 ∀ path : List Bool, 3≤(frame path).mid.a → GlobalLC18 (frame path).mid.p

theorem two_remaining_iffM679 :
 (∀ q : ℕ, 1≤q → GlobalLC18 (twoFamily3af q)) ↔ TwoRemainingM679 := by
 constructor
 · intro h q hq
   obtain ⟨_,hv,hd⟩ := h q hq
   constructor
   · intro i j
     have h := hv i j
     simp only [two_family_coeffM679] at h
     exact_mod_cast h
   · intro i j
     have h := hd i j
     simp only [two_family_coeffM679] at h
     exact_mod_cast h
 · intro h q hq
   obtain ⟨hv,hd⟩ := h q hq
   refine ⟨?_,?_,?_⟩
   · intro i j
     simp only [two_family_coeffM679]
     exact_mod_cast two_horizontal_arithmeticM679 q hq i j
   · intro i j
     simp only [two_family_coeffM679]
     exact_mod_cast hv i j
   · intro i j
     simp only [two_family_coeffM679]
     exact_mod_cast hd i j

theorem root_iff_two_arithmeticM679 :
 Conjecture63 ↔ TwoRemainingM679 ∧ OtherSourcesM679 := by
 rw [root_iff_two_family_and_large3af,two_remaining_iffM679]
 rfl

end
end MathGKM.Markov
