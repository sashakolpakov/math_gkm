import Mathlib
import MathGKM.ResearchSemantics

/- Machine-authored round104. An explicit integer transport from prefix
inequalities. This theorem asserts no actual-family prefix inequality. -/
namespace OrderedCompensationR104
open scoped BigOperators
noncomputable section

def gain (d : ℕ → ℤ) (a : ℕ) : ℤ := max (d a) 0
def loss (d : ℕ → ℤ) (a : ℕ) : ℤ := max (-d a) 0
def G (d : ℕ → ℤ) (k : ℕ) : ℤ := ∑ c ∈ Finset.range k, gain d c
def D (d : ℕ → ℤ) (k : ℕ) : ℤ := ∑ a ∈ Finset.range k, loss d a
def Prefix (K : ℕ) (d : ℕ → ℤ) : Prop :=
  ∀ q, q ≤ K → 0 ≤ ∑ a ∈ Finset.range (q+1), d a

def transport (d : ℕ → ℤ) (a c : ℕ) : ℤ :=
  min (G d (c+1)) (D d (a+1)) - min (G d c) (D d (a+1)) -
    (min (G d (c+1)) (D d a) - min (G d c) (D d a))

def Feasible (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ) : Prop :=
  (∀ a ∈ Finset.range (K+1), ∀ c ∈ Finset.range (K+1), 0 ≤ T a c) ∧
  (∀ a ∈ Finset.range (K+1), ∑ c ∈ Finset.range (K+1), T a c = loss d a) ∧
  (∀ c ∈ Finset.range (K+1), ∑ a ∈ Finset.range (K+1), T a c ≤ gain d c) ∧
  (∀ a ∈ Finset.range (K+1), ∀ c ∈ Finset.range (K+1), a<c → T a c=0)

theorem gain_sub_loss (d : ℕ → ℤ) (a : ℕ) : gain d a-loss d a=d a := by
  unfold gain loss
  omega

theorem G_succ (d : ℕ → ℤ) (k : ℕ) : G d (k+1)=G d k+gain d k := by
  exact Finset.sum_range_succ _ _
theorem D_succ (d : ℕ → ℤ) (k : ℕ) : D d (k+1)=D d k+loss d k := by
  exact Finset.sum_range_succ _ _

theorem G_mono (d : ℕ → ℤ) : Monotone (G d) := by
  intro a b hab
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hab)
    (fun c _ _ => le_max_right _ _)
theorem D_mono (d : ℕ → ℤ) : Monotone (D d) := by
  intro a b hab
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hab)
    (fun c _ _ => le_max_right _ _)

theorem balance (d : ℕ → ℤ) (k : ℕ) :
    G d k-D d k=∑ a ∈ Finset.range k, d a := by
  rw [G,D,← Finset.sum_sub_distrib]
  exact Finset.sum_congr rfl (fun a _ => gain_sub_loss d a)

theorem prefix_capacity (K : ℕ) (d : ℕ → ℤ) (h : Prefix K d)
    (q : ℕ) (hq : q≤K) : D d (q+1)≤G d (q+1) := by
  have := h q hq
  rw [← balance] at this
  omega

theorem telescope (f : ℕ → ℤ) (k : ℕ) :
    (∑ a ∈ Finset.range k, (f (a+1)-f a))=f k-f 0 := by
  induction k with
  | zero => simp
  | succ k ih => rw [Finset.sum_range_succ,ih]; ring

theorem transport_nonneg (d : ℕ → ℤ) (a c : ℕ) : 0≤transport d a c := by
  have hg : G d c≤G d (c+1) := G_mono d (Nat.le_succ c)
  have hd : D d a≤D d (a+1) := D_mono d (Nat.le_succ a)
  unfold transport
  omega

theorem transport_row (K : ℕ) (d : ℕ → ℤ) (h : Prefix K d)
    (a : ℕ) (ha : a≤K) :
    (∑ c ∈ Finset.range (K+1), transport d a c)=loss d a := by
  have ht := prefix_capacity K d h K le_rfl
  have hda := D_mono d (show a+1≤K+1 by omega)
  have hdb := D_mono d (show a≤a+1 by omega)
  have h0 : G d 0=0 := by simp [G]
  have hd0 : 0≤D d a := Finset.sum_nonneg (fun c _ => le_max_right _ _)
  unfold transport
  rw [Finset.sum_sub_distrib,
    telescope (fun c => min (G d c) (D d (a+1))) (K+1),
    telescope (fun c => min (G d c) (D d a)) (K+1),h0]
  have hs := D_succ d a
  omega

theorem transport_column (K : ℕ) (d : ℕ → ℤ) (c : ℕ) :
    (∑ a ∈ Finset.range (K+1), transport d a c)≤gain d c := by
  have he : (∑ a ∈ Finset.range (K+1), transport d a c) =
      min (G d (c+1)) (D d (K+1))-min (G d c) (D d (K+1)) := by
    calc
      _ = ∑ a ∈ Finset.range (K+1),
          ((min (G d (c+1)) (D d (a+1))-min (G d c) (D d (a+1))) -
          (min (G d (c+1)) (D d a)-min (G d c) (D d a))) := rfl
      _ = _ := by
        rw [telescope (fun a => min (G d (c+1)) (D d a)-min (G d c) (D d a)) (K+1)]
        have h0 : D d 0=0 := by simp [D]
        have hg : 0≤G d c := Finset.sum_nonneg (fun a _ => le_max_right _ _)
        have hg' : 0≤G d (c+1) := Finset.sum_nonneg (fun a _ => le_max_right _ _)
        rw [h0]
        omega
  rw [he]
  have hs := G_succ d c
  have hg : G d c≤G d (c+1) := G_mono d (Nat.le_succ c)
  omega

theorem transport_ordered (K : ℕ) (d : ℕ → ℤ) (h : Prefix K d)
    (a c : ℕ) (ha : a≤K) (hac : a<c) : transport d a c=0 := by
  have hp := prefix_capacity K d h a ha
  have hg := G_mono d (show a+1≤c by omega)
  have hg' : G d c≤G d (c+1) := G_mono d (Nat.le_succ c)
  have hd : D d a≤D d (a+1) := D_mono d (Nat.le_succ a)
  unfold transport
  omega

theorem prefix_to_transport (K : ℕ) (d : ℕ → ℤ) (h : Prefix K d) :
    Feasible K d (transport d) := by
  refine ⟨fun a _ c _ => transport_nonneg d a c, ?_,
    fun c _ => transport_column K d c, ?_⟩
  · intro a ha
    exact transport_row K d h a (by simpa using Finset.mem_range.mp ha)
  · intro a ha c _ hac
    exact transport_ordered K d h a c (by simpa using Finset.mem_range.mp ha) hac

theorem feasible_total (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ)
    (h : Feasible K d T) : 0≤∑ a ∈ Finset.range (K+1), d a := by
  have hr : (∑ a ∈ Finset.range (K+1), loss d a) =
      ∑ c ∈ Finset.range (K+1), ∑ a ∈ Finset.range (K+1), T a c := by
    rw [Finset.sum_comm]
    exact Finset.sum_congr rfl (fun a ha => (h.2.1 a ha).symm)
  have hc := Finset.sum_le_sum h.2.2.1
  rw [← hr] at hc
  rw [← balance]
  exact sub_nonneg.mpr hc

theorem transport_to_prefix (K : ℕ) (d : ℕ → ℤ) (T : ℕ → ℕ → ℤ)
    (h : Feasible K d T) : Prefix K d := by
  intro q hq
  have hsub : Finset.range (q+1) ⊆ Finset.range (K+1) :=
    Finset.range_mono (by omega)
  have hr : (∑ a ∈ Finset.range (q+1), loss d a) =
      ∑ c ∈ Finset.range (q+1), ∑ a ∈ Finset.range (q+1), T a c := by
    calc
      _ = ∑ a ∈ Finset.range (q+1), ∑ c ∈ Finset.range (K+1), T a c :=
        Finset.sum_congr rfl (fun a ha => (h.2.1 a (hsub ha)).symm)
      _ = ∑ a ∈ Finset.range (q+1), ∑ c ∈ Finset.range (q+1), T a c := by
        apply Finset.sum_congr rfl
        intro a ha
        symm
        apply Finset.sum_subset hsub
        intro c hc hnc
        apply h.2.2.2 a (hsub ha) c hc
        have ha' := Finset.mem_range.mp ha
        have hc' : ¬c<q+1 := by simpa using hnc
        omega
      _ = _ := Finset.sum_comm
  have hb : (∑ a ∈ Finset.range (q+1), loss d a) ≤
      ∑ c ∈ Finset.range (q+1), gain d c := by
    rw [hr]
    apply Finset.sum_le_sum
    intro c hc
    calc
      _ ≤ ∑ a ∈ Finset.range (K+1), T a c :=
        Finset.sum_le_sum_of_subset_of_nonneg hsub
          (fun a ha _ => h.1 a ha c (hsub hc))
      _ ≤ _ := h.2.2.1 c (hsub hc)
  rw [← balance]
  exact sub_nonneg.mpr hb

theorem prefix_iff_transport (K : ℕ) (d : ℕ → ℤ) :
    Prefix K d ↔ ∃ T, Feasible K d T := by
  constructor
  · intro h
    exact ⟨transport d,prefix_to_transport K d h⟩
  · rintro ⟨T,h⟩
    exact transport_to_prefix K d T h

end
end OrderedCompensationR104
#print axioms OrderedCompensationR104.prefix_to_transport
#print axioms OrderedCompensationR104.feasible_total
#print axioms OrderedCompensationR104.prefix_iff_transport
