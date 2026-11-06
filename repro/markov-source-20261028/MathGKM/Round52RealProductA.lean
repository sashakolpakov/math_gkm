import MathGKM.Round52RealMarginalA
import MathGKM.Round52RealConeA

/-! Machine-authored round52. Real-valued finite convolution; actual-family
applicability and polynomial coefficient transport are separate obligations. -/
namespace RealProductR52
noncomputable section
open scoped BigOperators
open RealMarginalR52 RealConeR52

def kernel (a b : ℤ →₀ ℝ) (x : ℤ) : ℤ →₀ ℝ :=
  Finsupp.onFinset a.support (fun s => a s*b (x-s)) (by
    intro s hs
    by_contra hn
    have hz := Finsupp.notMem_support_iff.mp hn
    simp [hz] at hs)

@[simp] theorem kernel_apply (a b : ℤ →₀ ℝ) (x s : ℤ) :
    kernel a b x s = a s*b (x-s) := by simp [kernel]

theorem kernel_mass (a b : ℤ →₀ ℝ) (x : ℤ) :
    mass (kernel a b x) = conv a b x := by
  classical
  unfold mass Finsupp.sum conv
  simp only [kernel_apply]
  apply Finset.sum_subset (show (kernel a b x).support ⊆ a.support from by
    intro s hs
    by_contra hn
    have hz := Finsupp.notMem_support_iff.mp hn
    simp [Finsupp.mem_support_iff,hz] at hs)
  intro s hs hn
  have hz := Finsupp.notMem_support_iff.mp hn
  simpa using hz

theorem convolution_lc (a b : ℤ →₀ ℝ) (ha : Cone a) (hb : Cone b) (x : ℤ) :
    conv a b x*conv a b (x+2) ≤ conv a b (x+1)^2 := by
  have hc : Compatible (kernel a b x) (kernel a b (x+2)) (kernel a b (x+1)) := by
    refine ⟨?_,?_,?_,?_⟩
    · intro s; simp only [kernel_apply]; exact mul_nonneg (ha.1 _) (hb.1 _)
    · intro s; simp only [kernel_apply]; exact mul_nonneg (ha.1 _) (hb.1 _)
    · intro s; simp only [kernel_apply]; exact mul_nonneg (ha.1 _) (hb.1 _)
    · intro s t
      simpa only [kernel_apply] using separable_diagonal a b ha hb x s t
  simpa only [kernel_mass] using marginalization _ _ _ hc

theorem convolution_nonnegative (a b : ℤ →₀ ℝ) (ha : Cone a) (hb : Cone b) (x : ℤ) :
    0 ≤ conv a b x := by
  apply Finset.sum_nonneg
  intro s hs
  exact mul_nonneg (ha.1 _) (hb.1 _)

theorem conv_positive (a b : ℤ →₀ ℝ) (ha : Cone a) (hb : Cone b) (x : ℤ) :
    0 < conv a b x ↔ ∃ s, 0<a s ∧ 0<b (x-s) := by
  classical
  unfold conv
  rw [Finset.sum_pos_iff_of_nonneg (by intro s hs; exact mul_nonneg (ha.1 _) (hb.1 _))]
  constructor
  · rintro ⟨s,hs,hp⟩
    exact ⟨s,(mul_pos_iff.mp hp).resolve_right (by intro h; linarith [ha.1 s])⟩
  · rintro ⟨s,hs,ht⟩
    exact ⟨s,Finsupp.mem_support_iff.mpr (ne_of_gt hs),mul_pos hs ht⟩

theorem positive_between (a : ℤ → ℝ) (ha : Cone a) (l r y : ℤ)
    (hl : 0<a l) (hr : 0<a r) (hly : l≤y) (hyr : y≤r) : 0<a y := by
  by_cases he : l=y
  · simpa [← he] using hl
  by_cases he' : y=r
  · simpa [he'] using hr
  exact ha.2.2 l y r (by omega) (by omega) hl hr

theorem convolution_interval (a b : ℤ →₀ ℝ) (ha : Cone a) (hb : Cone b) :
    ∀ x y z : ℤ, x<y → y<z → 0<conv a b x → 0<conv a b z → 0<conv a b y := by
  intro x y z hxy hyz hx hz
  obtain ⟨s,hs,hbs⟩ := (conv_positive a b ha hb x).mp hx
  obtain ⟨t,ht,hbt⟩ := (conv_positive a b ha hb z).mp hz
  apply (conv_positive a b ha hb y).mpr
  by_cases horder : t ≤ s
  · exact ⟨s,hs,positive_between b hb (x-s) (z-t) (y-s) hbs hbt (by omega) (by omega)⟩
  by_cases hdist : t-s≤y-x
  · exact ⟨t,ht,positive_between b hb (x-s) (z-t) (y-t) hbs hbt (by omega) (by omega)⟩
  · refine ⟨s+(y-x),positive_between a ha s t (s+(y-x)) hs ht (by omega) (by omega),?_⟩
    simpa only [show y-(s+(y-x))=x-s by omega] using hbs

theorem convolution_cone (a b : ℤ →₀ ℝ) (ha : Cone a) (hb : Cone b) :
    Cone (conv a b) :=
  ⟨convolution_nonnegative a b ha hb,convolution_lc a b ha hb,convolution_interval a b ha hb⟩

def elementary (a b c : ℝ) (z : ℤ) : ℝ :=
  if z=0 then a else if z=1 then b else if z=2 then c else 0

theorem elementary_cone (a b c : ℝ) (ha : 0≤a) (hb : 0≤b) (hc : 0≤c)
    (hbound : a*c≤b^2) : Cone (elementary a b c) := by
  have hmid : 0<a → 0<c → 0<b := by
    intro hp hq
    have hprod := mul_pos hp hq
    nlinarith
  refine ⟨?_,?_,?_⟩
  · intro z; dsimp [elementary]; split_ifs <;> positivity
  · intro z
    by_cases hz : z < -2 ∨ 2<z
    · have h0 : z≠0 := by omega
      have h1 : z≠1 := by omega
      have h2 : z≠2 := by omega
      simp only [elementary,if_neg h0,if_neg h1,if_neg h2,zero_mul]
      positivity
    · have hh : -2≤z ∧ z≤2 := by omega
      obtain ⟨hlo,hhi⟩ := hh
      interval_cases z <;> norm_num [elementary] <;> nlinarith
  · intro x y z hxy hyz hx hz
    have hx' : x=0 ∨ x=1 ∨ x=2 := by
      by_contra h; push_neg at h; simp [elementary,h.1,h.2.1,h.2.2] at hx
    have hz' : z=0 ∨ z=1 ∨ z=2 := by
      by_contra h; push_neg at h; simp [elementary,h.1,h.2.1,h.2.2] at hz
    have ex : x=0 := by omega
    have ey : y=1 := by omega
    have ez : z=2 := by omega
    simp only [ex,ey,ez,elementary] at hx hz ⊢
    norm_num at hx hz ⊢
    exact hmid hx hz

theorem quadratic_cone (β γ : ℝ) (hb : 0≤β) (hg : 0≤γ) (h : γ≤β^2) :
    Cone (elementary γ β 1) := elementary_cone γ β 1 hg hb (by norm_num) (by simpa using h)

theorem linear_cone (ρ : ℝ) (h : 0≤ρ) : Cone (elementary ρ 1 0) :=
  elementary_cone ρ 1 0 h (by norm_num) (by norm_num) (by norm_num)

theorem equality_and_failed_bound :
    Cone (elementary 1 1 1) ∧ ¬Cone (elementary 1 0 1) := by
  refine ⟨quadratic_cone 1 1 (by norm_num) (by norm_num) (by norm_num),?_⟩
  intro h
  have hh := h.2.1 0
  norm_num [elementary] at hh

end
end RealProductR52
#print axioms RealProductR52.convolution_cone
#print axioms RealProductR52.quadratic_cone
