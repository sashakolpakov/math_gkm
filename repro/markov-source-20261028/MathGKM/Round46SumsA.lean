import MathGKM.Round46ReverseA
import MathGKM.Acceptedb5fd6422dc71fa8c46c1a2ba

/-! Machine-authored round46. Complete sums with additive index guards. -/
namespace HorizontalR46
open MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem truncate (n a : ℕ) (f : ℕ → ℤ) (ha : a ≤ n)
    (hz : ∀ s, a < s → f s=0) :
    (∑ s ∈ Finset.range (n+1), f s) = ∑ s ∈ Finset.range (a+1), f s := by
  symm
  apply Finset.sum_subset (Finset.range_mono (by omega))
  intro s hs hsa
  apply hz
  have := Finset.mem_range.mp hs
  have hsa2 : ¬s < a+1 := by simpa only [Finset.mem_range] using hsa
  omega

theorem reverse_product (n a b l : ℕ) (f g : ℕ → ℤ)
    (ha : a ≤ n) (hb : b ≤ n)
    (hf : ∀ s, a < s → f s=0) (hg : ∀ t, b < t → g t=0) :
    (∑ s ∈ Finset.range (n+1), ∑ t ∈ Finset.range (n+1),
      if s+t=l then f s*g t else 0) =
    ∑ q ∈ Finset.range (a+1), ∑ v ∈ Finset.range (b+1),
      if q+v+l=a+b then f (a-q)*g (b-v) else 0 := by
  classical
  rw [truncate n a _ ha (by intro s hs; simp [hf s hs])]
  have ht (s : ℕ) :
      (∑ t ∈ Finset.range (n+1), if s+t=l then f s*g t else 0) =
      ∑ t ∈ Finset.range (b+1), if s+t=l then f s*g t else 0 :=
    truncate n b _ hb (by intro t ht; simp [hg t ht])
  simp_rw [ht]
  rw [← Finset.sum_range_reflect (fun s => ∑ t ∈ Finset.range (b+1),
    if s+t=l then f s*g t else 0) (a+1)]
  apply Finset.sum_congr rfl
  intro q hq
  rw [← Finset.sum_range_reflect (fun t =>
    if (a+1-1-q)+t=l then f (a+1-1-q)*g t else 0) (b+1)]
  apply Finset.sum_congr rfl
  intro v hv
  have hqa : q ≤ a := by have := Finset.mem_range.mp hq; omega
  have hvb : v ≤ b := by have := Finset.mem_range.mp hv; omega
  have he : a+1-1-q+(b+1-1-v)=l ↔ q+v+l=a+b := by omega
  simp only [Nat.add_sub_cancel] at he ⊢
  simp only [he]

def complete (n h j l : ℕ) : ℤ :=
  (∑ q ∈ Finset.range (n-(h+1)+1), ∑ v ∈ Finset.range (n-(h+1)+1),
    if q+v+l=2*(n-h)-2 then F n (h+1) j q*F n (h+1) j v else 0) -
  (∑ q ∈ Finset.range (n-h+1), ∑ v ∈ Finset.range (n-(h+2)+1),
    if q+v+l=2*(n-h)-2 then F n h j q*F n (h+2) j v else 0)

theorem complete_group (n h i j l : ℕ) (hn : h+2 ≤ n)
    (hij : i+j=n+h) : GroupedR40.group n i j 1 0 l=complete n h j l := by
  classical
  have he1 : (i+1)+j=n+(h+1) := by omega
  have he2 : (i+2)+j=n+(h+2) := by omega
  have hb := reverse_product n (n-(h+1)) (n-(h+1)) l
    (MidpointR36.W n (i+1) j) (MidpointR36.W n (i+1) j)
    (by omega) (by omega)
    (fun s hs => weight_tail_all n (h+1) (i+1) j s (by omega) (by omega) he1 hs)
    (fun s hs => weight_tail_all n (h+1) (i+1) j s (by omega) (by omega) he1 hs)
  have hc := reverse_product n (n-h) (n-(h+2)) l
    (MidpointR36.W n i j) (MidpointR36.W n (i+2) j)
    (by omega) (by omega)
    (fun s hs => weight_tail_all n h i j s (by omega) (by omega) hij hs)
    (fun s hs => weight_tail_all n (h+2) (i+2) j s (by omega) (by omega) he2 hs)
  have split_difference (p : Prop) [Decidable p] (a b : ℤ) :
      (if p then a-b else 0)=(if p then a else 0)-(if p then b else 0) := by
    split_ifs <;> ring
  unfold GroupedR40.group
  simp only [mul_one, mul_zero, Nat.add_zero]
  simp_rw [split_difference, Finset.sum_sub_distrib]
  rw [hb,hc]
  have he : n-(h+1)+(n-(h+1))=2*(n-h)-2 := by omega
  have he' : n-h+(n-(h+2))=2*(n-h)-2 := by omega
  rw [he,he']
  unfold complete
  congr 1
  · apply Finset.sum_congr rfl
    intro q hq
    apply Finset.sum_congr rfl
    intro v hv
    have hq' : q ≤ n-(h+1) := by have := Finset.mem_range.mp hq; omega
    have hv' : v ≤ n-(h+1) := by have := Finset.mem_range.mp hv; omega
    rw [reverse_weight_all n (h+1) (i+1) j q (by omega) (by omega) he1 hq',
      reverse_weight_all n (h+1) (i+1) j v (by omega) (by omega) he1 hv']
  · apply Finset.sum_congr rfl
    intro q hq
    apply Finset.sum_congr rfl
    intro v hv
    have hq' : q ≤ n-h := by have := Finset.mem_range.mp hq; omega
    have hv' : v ≤ n-(h+2) := by have := Finset.mem_range.mp hv; omega
    rw [reverse_weight_all n h i j q (by omega) (by omega) hij hq',
      reverse_weight_all n (h+2) (i+2) j v (by omega) (by omega) he2 hv']

theorem polygon_complete_group (n i j l : ℕ) (hn : 1 ≤ n)
    (h0 : InPolygon n (n+1) i j)
    (_h1 : InPolygon n (n+1) (i+1) j)
    (h2 : InPolygon n (n+1) (i+2) j) :
    GroupedR40.group n i j 1 0 l=complete n (i+j-n) j l := by
  have hlo : n ≤ i+j := by
    by_contra hh
    have hsum : i+j ≤ n-1 := by omega
    have hi : i ≤ n-1 := by omega
    have := h0.1
    nlinarith
  have hhi : i+j+2 ≤ 2*n := by
    have := h2.2
    omega
  exact complete_group n (i+j-n) i j l (by omega) (by omega)

end
end HorizontalR46
#print axioms HorizontalR46.complete_group
