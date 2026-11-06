import MathGKM.Markov

/-! Machine-authored round36. Exact unresolved target; definitions assert no theorem. -/
namespace MidpointMarginalR36
noncomputable section
open scoped BigOperators

def mass (f : ℤ →₀ ℤ) : ℤ := f.sum (fun _ a => a)

def Compatible (f g b : ℤ →₀ ℤ) : Prop :=
  (∀ s, 0 ≤ f s) ∧ (∀ s, 0 ≤ g s) ∧ (∀ s, 0 ≤ b s) ∧
  ∀ s t : ℤ, f s*g t ≤ b ((s+t)/2)*b ((s+t+1)/2)

def Marginalization : Prop := ∀ f g b : ℤ →₀ ℤ,
  Compatible f g b → mass f*mass g ≤ mass b^2

/-- An arithmetic step for an endpoint deletion proof; not marginalization itself. -/
theorem two_point_merge (a b c d : ℤ) (ha : 0 ≤ a) (hb : 0 ≤ b)
    (hc : 0 ≤ c) (hd : 0 ≤ d) (hab : a ≤ b)
    (hprod : a*b ≤ c*d) (hmax : b ≤ max c d) : a+b ≤ c+d := by
  by_cases hac : a ≤ min c d
  · rcases le_total c d with hcd | hdc
    · simp only [max_eq_right hcd,min_eq_left hcd] at *
      omega
    · simp only [max_eq_left hdc,min_eq_right hdc] at *
      omega
  · by_contra hsum
    rcases le_total c d with hcd | hdc
    · have hca : c < a := by simpa only [min_eq_left hcd,not_le] using hac
      have hp := mul_pos (sub_pos.mpr hca) (sub_pos.mpr (lt_of_lt_of_le hca hab))
      have hq := mul_nonneg hc (show 0 ≤ a+b-c-d by omega)
      nlinarith
    · have hda : d < a := by simpa only [min_eq_right hdc,not_le] using hac
      have hp := mul_pos (sub_pos.mpr hda) (sub_pos.mpr (lt_of_lt_of_le hda hab))
      have hq := mul_nonneg hd (show 0 ≤ a+b-c-d by omega)
      nlinarith

theorem crossed_product (f g b : ℤ →₀ ℤ) (h : Compatible f g b) (z i j : ℤ) :
    (f i*g (z-i))*(f j*g (z-j)) ≤
      (b ((z+i-j)/2)*b (z-(z+i-j)/2))*
      (b ((z+j-i)/2)*b (z-(z+j-i)/2)) := by
  have h1 := h.2.2.2 i (z-j)
  have h2 := h.2.2.2 j (z-i)
  have he1 : (i+(z-j)+1)/2=z-(z+j-i)/2 := by omega
  have he2 : (j+(z-i)+1)/2=z-(z+i-j)/2 := by omega
  have hf1 : (i+(z-j))/2=(z+i-j)/2 := by congr 1 <;> ring
  have hf2 : (j+(z-i))/2=(z+j-i)/2 := by congr 1 <;> ring
  rw [he1,hf1] at h1
  rw [he2,hf2] at h2
  have hp := mul_le_mul h1 h2 (mul_nonneg (h.1 j) (h.2.1 (z-i)))
    (mul_nonneg (h.2.2.1 _) (h.2.2.1 _))
  nlinarith only [hp]

theorem rounded_endpoint_distinct (z x y : ℤ) (hxy : x < y) :
    (z+y-x)/2-(z+x-y)/2=y-x ∧ (z+x-y)/2 < (z+y-x)/2 := by omega

end
end MidpointMarginalR36

#print axioms MidpointMarginalR36.two_point_merge
#print axioms MidpointMarginalR36.crossed_product
