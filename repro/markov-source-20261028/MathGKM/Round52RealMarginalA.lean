import MathGKM.Markov

/-! Machine-authored round52. Real-valued reconstruction of retained rounds36–37
finite-support marginalization, with coefficient comparisons proved over ℝ. -/
namespace RealMarginalR52
noncomputable section
open scoped BigOperators

def mass (f : ℤ →₀ ℝ) : ℝ := f.sum (fun _ a => a)

def Compatible (f g b : ℤ →₀ ℝ) : Prop :=
  (∀ s, 0 ≤ f s) ∧ (∀ s, 0 ≤ g s) ∧ (∀ s, 0 ≤ b s) ∧
  ∀ s t : ℤ, f s*g t ≤ b ((s+t)/2)*b ((s+t+1)/2)

def Marginalization : Prop := ∀ f g b : ℤ →₀ ℝ,
  Compatible f g b → mass f*mass g ≤ mass b^2

theorem crossed_product (f g b : ℤ →₀ ℝ) (h : Compatible f g b) (z i j : ℤ) :
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

lemma sum_left (a : ℤ → ℝ) (x y : ℤ) (h : x ≤ y) :
    (∑ i ∈ Finset.Icc x y, a i) = a x + ∑ i ∈ Finset.Icc (x+1) y, a i := by
  have he : Finset.Icc x y = insert x (Finset.Icc (x+1) y) := by
    ext i
    simp only [Finset.mem_Icc, Finset.mem_insert]
    omega
  rw [he, Finset.sum_insert (by simp)]

lemma sum_right (a : ℤ → ℝ) (x y : ℤ) (h : x ≤ y) :
    (∑ i ∈ Finset.Icc x y, a i) = a y + ∑ i ∈ Finset.Icc x (y-1), a i := by
  have he : Finset.Icc x y = insert y (Finset.Icc x (y-1)) := by
    ext i
    simp only [Finset.mem_Icc, Finset.mem_insert]
    omega
  rw [he, Finset.sum_insert (by simp)]

lemma sum_ends (a : ℤ → ℝ) (x y : ℤ) (h : x < y) :
    (∑ i ∈ Finset.Icc x y, a i) = a x+a y+∑ i ∈ Finset.Icc (x+1) (y-1), a i := by
  rw [sum_left a x y h.le, sum_right a (x+1) y (by first | omega | linarith)]
  ring

lemma endpoint_choice (a d c e : ℝ) (ha : 0 ≤ a) (hd : 0 ≤ d)
    (hc : 0 ≤ c) (he : 0 ≤ e) (hp : a*d ≤ c*e) :
    a+d ≤ c+e ∨ a ≤ min c e ∨ d ≤ min c e := by
  by_cases hs : a+d ≤ c+e
  · exact Or.inl hs
  right
  by_cases hac : a ≤ min c e
  · exact Or.inl hac
  right
  by_contra hdc
  rcases le_total c e with hce | hec
  · simp only [min_eq_left hce] at hac hdc
    have hpos := mul_pos (show 0 < a-c by first | omega | linarith) (show 0 < d-c by first | omega | linarith)
    have hnn := mul_nonneg hc (show 0 ≤ a+d-c-e by first | omega | linarith)
    nlinarith
  · simp only [min_eq_right hec] at hac hdc
    have hpos := mul_pos (show 0 < a-e by first | omega | linarith) (show 0 < d-e by first | omega | linarith)
    have hnn := mul_nonneg he (show 0 ≤ a+d-c-e by first | omega | linarith)
    nlinarith

/-- Losing one source endpoint loses one of the rounded target endpoints. -/
lemma shrink_one (z x y : ℤ) :
    ((z+x+1-y)/2=(z+x-y)/2+1 ∧ (z+y-x-1)/2=(z+y-x)/2) ∨
    ((z+x+1-y)/2=(z+x-y)/2 ∧ (z+y-x-1)/2=(z+y-x)/2-1) := by first | omega | linarith

/-- A universal fixed-sum deletion lemma on two explicit equal-length intervals. -/
theorem interval_domination (a c : ℤ → ℝ) (z : ℤ)
    (ha : ∀ i, 0 ≤ a i) (hc : ∀ i, 0 ≤ c i)
    (hpoint : ∀ i, a i ≤ c (z/2))
    (hcross : ∀ x y : ℤ, x < y → a x*a y ≤ c ((z+x-y)/2)*c ((z+y-x)/2))
    (n : ℕ) : ∀ x y : ℤ, y-x=n →
    (∑ i ∈ Finset.Icc x y, a i) ≤
      ∑ i ∈ Finset.Icc ((z+x-y)/2) ((z+y-x)/2), c i := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro x y hlen
    by_cases hn : n=0
    · have hxy : y=x := by first | omega | linarith
      subst y
      simpa using hpoint x
    have hxy : x < y := by first | omega | linarith
    let u := (z+x-y)/2
    let v := (z+y-x)/2
    have huv : u < v := (rounded_endpoint_distinct z x y hxy).2
    have hdel : ((z+x+1-y)/2=u+1 ∧ (z+y-x-1)/2=v) ∨
        ((z+x+1-y)/2=u ∧ (z+y-x-1)/2=v-1) := shrink_one z x y
    have hone (k : ℤ) (hk : a k ≤ min (c u) (c v))
        (hrest : (∑ i ∈ Finset.Icc x y, a i) = a k+
          ∑ i ∈ Finset.Icc (x+1) y, a i) :
        (∑ i ∈ Finset.Icc x y, a i) ≤ ∑ i ∈ Finset.Icc u v, c i := by
      have hh := ih (n-1) (by first | omega | linarith) (x+1) y (by push_cast; omega)
      have he1 : (z+(x+1)-y)/2=(z+x+1-y)/2 := by congr 1 <;> ring
      have he2 : (z+y-(x+1))/2=(z+y-x-1)/2 := by congr 1 <;> ring
      rw [he1,he2] at hh
      rcases hdel with h | h
      · rw [h.1,h.2] at hh
        rw [hrest,sum_left c u v huv.le]
        exact add_le_add (hk.trans (min_le_left _ _)) hh
      · rw [h.1,h.2] at hh
        rw [hrest,sum_right c u v huv.le]
        exact add_le_add (hk.trans (min_le_right _ _)) hh
    rcases endpoint_choice (a x) (a y) (c u) (c v) (ha x) (ha y) (hc u) (hc v)
      (hcross x y hxy) with he | he | he
    · have hinter : (∑ i ∈ Finset.Icc (x+1) (y-1), a i) ≤
          ∑ i ∈ Finset.Icc (u+1) (v-1), c i := by
        by_cases hn1 : n=1
        · have h1 : Finset.Icc (x+1) (y-1) = ∅ := Finset.Icc_eq_empty (by first | omega | linarith)
          have h2 : Finset.Icc (u+1) (v-1) = ∅ := Finset.Icc_eq_empty (by dsimp [u,v]; omega)
          simp [h1,h2]
        · have hh := ih (n-2) (by first | omega | linarith) (x+1) (y-1) (by push_cast; omega)
          have hu : (z+(x+1)-(y-1))/2=u+1 := by dsimp [u]; omega
          have hv : (z+(y-1)-(x+1))/2=v-1 := by dsimp [v]; omega
          simpa only [hu,hv] using hh
      rw [sum_ends a x y hxy,sum_ends c u v huv]
      exact add_le_add he hinter
    · exact hone x he (sum_left a x y hxy.le)
    · have hh := ih (n-1) (by first | omega | linarith) x (y-1) (by push_cast; omega)
      have he1 : (z+x-(y-1))/2=(z+x+1-y)/2 := by congr 1 <;> ring
      have he2 : (z+(y-1)-x)/2=(z+y-x-1)/2 := by congr 1 <;> ring
      rw [he1,he2] at hh
      rcases hdel with h | h
      · rw [h.1,h.2] at hh
        rw [sum_right a x y hxy.le,sum_left c u v huv.le]
        exact add_le_add (he.trans (min_le_left _ _)) hh
      · rw [h.1,h.2] at hh
        rw [sum_right a x y hxy.le,sum_right c u v huv.le]
        exact add_le_add (he.trans (min_le_right _ _)) hh

theorem fixed_sum_interval (f g b : ℤ →₀ ℝ) (h : Compatible f g b)
    (z x y : ℤ) (hxy : x ≤ y) :
    (∑ i ∈ Finset.Icc x y, f i*g (z-i)) ≤
      ∑ r ∈ Finset.Icc ((z+x-y)/2) ((z+y-x)/2), b r*b (z-r) := by
  apply interval_domination (fun i => f i*g (z-i)) (fun r => b r*b (z-r)) z
    (fun i => mul_nonneg (h.1 _) (h.2.1 _))
    (fun r => mul_nonneg (h.2.2.1 _) (h.2.2.1 _))
    (fun i => ?_) (fun i j hij => crossed_product f g b h z i j) (y-x).toNat x y
    (by first | omega | linarith)
  have hh := h.2.2.2 i (z-i)
  have he : (i+(z-i))/2=z/2 := by congr 1 <;> ring
  have he' : (i+(z-i)+1)/2=z-z/2 := by first | omega | linarith
  simpa only [he,he'] using hh

def conv (f g : ℤ →₀ ℝ) (z : ℤ) : ℝ :=
  ∑ i ∈ f.support, f i*g (z-i)

lemma sum_on (f : ℤ →₀ ℝ) (S : Finset ℤ) (hS : f.support ⊆ S) (w : ℤ → ℝ) :
    (∑ i ∈ S, f i*w i) = ∑ i ∈ f.support, f i*w i := by
  classical
  exact (Finset.sum_subset hS (by
    intro i hi hn
    have hz : f i=0 := Finsupp.notMem_support_iff.mp hn
    simp [hz])).symm

theorem convolution_domination (f g b : ℤ →₀ ℝ) (h : Compatible f g b) (z : ℤ) :
    conv f g z ≤ conv b b z := by
  classical
  let S := insert 0 f.support
  have hS : S.Nonempty := ⟨0,Finset.mem_insert_self _ _⟩
  let x := S.min' hS
  let y := S.max' hS
  have hxy : x ≤ y := Finset.min'_le_max' S hS
  have hcover : f.support ⊆ Finset.Icc x y := by
    intro i hi
    exact Finset.mem_Icc.mpr ⟨S.min'_le i (Finset.mem_insert_of_mem hi),
      S.le_max' i (Finset.mem_insert_of_mem hi)⟩
  have hint := fixed_sum_interval f g b h z x y hxy
  rw [sum_on f _ hcover] at hint
  apply hint.trans
  let I := Finset.Icc ((z+x-y)/2) ((z+y-x)/2)
  calc
    (∑ r ∈ I, b r*b (z-r)) ≤ ∑ r ∈ I ∪ b.support, b r*b (z-r) := by
      apply Finset.sum_le_sum_of_subset_of_nonneg Finset.subset_union_left
      intro i hi hn
      exact mul_nonneg (h.2.2.1 _) (h.2.2.1 _)
    _ = conv b b z := sum_on b _ Finset.subset_union_right _

/-- Reindex a finite sum of convolutions by the original source pairs.
The explicit outer support condition accounts for every nonzero pair. -/
lemma conv_total (f g : ℤ →₀ ℝ) (Z : Finset ℤ)
    (hZ : ∀ i ∈ f.support, ∀ j ∈ g.support, i+j ∈ Z) :
    (∑ z ∈ Z, conv f g z) = mass f*mass g := by
  classical
  unfold conv
  rw [Finset.sum_comm]
  have hrow (i : ℤ) (hi : i ∈ f.support) : (∑ z ∈ Z, g (z-i))=mass g := by
    let T := g.support.image (fun j => i+j)
    have hTZ : T ⊆ Z := by
      intro z hz
      obtain ⟨j,hj,rfl⟩ := Finset.mem_image.mp hz
      exact hZ i hi j hj
    calc
      (∑ z ∈ Z, g (z-i)) = ∑ z ∈ T, g (z-i) := by
        symm
        apply Finset.sum_subset hTZ
        intro z hz hn
        have hnot : z-i ∉ g.support := by
          intro hh
          apply hn
          exact Finset.mem_image.mpr ⟨z-i,hh,by first | omega | linarith⟩
        exact Finsupp.notMem_support_iff.mp hnot
      _ = mass g := by
        rw [Finset.sum_image (by intro a ha b hb hab; exact add_left_cancel hab)]
        simp only [add_sub_cancel_left]
        rfl
  calc
    (∑ i ∈ f.support, ∑ z ∈ Z, f i*g (z-i)) =
        ∑ i ∈ f.support, f i*mass g := by
      apply Finset.sum_congr rfl
      intro i hi
      rw [← Finset.mul_sum,hrow i hi]
    _ = mass f*mass g := by rw [← Finset.sum_mul]; rfl

/-- The full generic finite-support midpoint marginalization target. -/
theorem marginalization : RealMarginalR52.Marginalization := by
  classical
  intro f g b h
  let Z := ((f.support ×ˢ g.support).image (fun p : ℤ × ℤ => p.1+p.2)) ∪
    ((b.support ×ˢ b.support).image (fun p : ℤ × ℤ => p.1+p.2))
  have hfg : ∀ i ∈ f.support, ∀ j ∈ g.support, i+j ∈ Z := by
    intro i hi j hj
    apply Finset.mem_union_left
    exact Finset.mem_image.mpr ⟨(i,j),Finset.mem_product.mpr ⟨hi,hj⟩,rfl⟩
  have hbb : ∀ i ∈ b.support, ∀ j ∈ b.support, i+j ∈ Z := by
    intro i hi j hj
    apply Finset.mem_union_right
    exact Finset.mem_image.mpr ⟨(i,j),Finset.mem_product.mpr ⟨hi,hj⟩,rfl⟩
  have hh : (∑ z ∈ Z, conv f g z) ≤ ∑ z ∈ Z, conv b b z :=
    Finset.sum_le_sum (fun z hz => convolution_domination f g b h z)
  rw [conv_total f g Z hfg,conv_total b b Z hbb] at hh
  simpa only [pow_two] using hh

end
end RealMarginalR52
#print axioms RealMarginalR52.marginalization
