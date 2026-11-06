import MathGKM.Round108CountingA
import MathGKM.Round64ConsumerA
import MathGKM.Round120PacketsA
import Mathlib.Data.Rat.Cast.Order

/- Machine-authored round122. Finite rational mass and its conditional raw
coefficient consumer. Existence and column bounds remain explicit premises. -/
namespace EqualMassR122
open LocalRetilingR76 ColorForgettingR108 MatchingProjectionR64 MathGKM.Markov
open scoped BigOperators
noncomputable section

theorem finite_mass_cardinality {A B : Type} (X : Finset A) (Y : Finset B)
    (w : A → B → ℚ)
    (_hn : ∀ x ∈ X, ∀ y ∈ Y, 0 ≤ w x y)
    (hr : ∀ x ∈ X, ∑ y ∈ Y, w x y = 1)
    (hc : ∀ y ∈ Y, ∑ x ∈ X, w x y ≤ 1) : X.card ≤ Y.card := by
  have h : (X.card : ℚ) ≤ (Y.card : ℚ) := calc
    (X.card : ℚ) = ∑ x ∈ X, (1 : ℚ) := by simp
    _ = ∑ x ∈ X, ∑ y ∈ Y, w x y :=
      Finset.sum_congr rfl (fun x hx => (hr x hx).symm)
    _ = ∑ y ∈ Y, ∑ x ∈ X, w x y := Finset.sum_comm
    _ ≤ ∑ y ∈ Y, (1 : ℚ) := Finset.sum_le_sum hc
    _ = (Y.card : ℚ) := by simp
  exact_mod_cast h

def neighborMass {A B : Type} (Y : Finset B) (R : A → B → Prop) : A → B → ℚ := by
  classical
  exact fun x y => if R x y then ((Y.filter (R x)).card : ℚ)⁻¹ else 0

def NeighborCriterion {A B : Type} (X : Finset A) (Y : Finset B)
    (R : A → B → Prop) : Prop := by
  classical
  exact (∀ x ∈ X, 0 < (Y.filter (R x)).card) ∧
    (∀ y ∈ Y, ∑ x ∈ X, neighborMass Y R x y ≤ 1)

theorem neighbor_mass_nonneg {A B : Type} (Y : Finset B)
    (R : A → B → Prop) (x : A) (y : B) : 0 ≤ neighborMass Y R x y := by
  classical
  unfold neighborMass
  split_ifs <;> positivity

theorem neighbor_mass_row {A B : Type} (Y : Finset B) (R : A → B → Prop)
    (x : A) (h : 0 < (by classical exact (Y.filter (R x)).card)) :
    ∑ y ∈ Y, neighborMass Y R x y = 1 := by
  classical
  unfold neighborMass
  rw [← Finset.sum_filter]
  simp only [Finset.sum_const, nsmul_eq_mul]
  exact mul_inv_cancel₀ (by exact_mod_cast Nat.ne_of_gt h)

theorem neighbor_cardinality {A B : Type} (X : Finset A) (Y : Finset B)
    (R : A → B → Prop) (h : NeighborCriterion X Y R) : X.card ≤ Y.card := by
  classical
  apply finite_mass_cardinality X Y (neighborMass Y R)
  · intro x _ y _; exact neighbor_mass_nonneg Y R x y
  · intro x hx; exact neighbor_mass_row Y R x (h.1 x hx)
  · exact h.2

def Mass (N sigma i t : ℕ) : Prop := ∃ w : Pair → Pair → ℚ,
  (∀ x ∈ rankFiber N sigma t (2*i+2) i,
    ∀ y ∈ rankFiber N sigma t (2*i+2) (i+1), 0 ≤ w x y) ∧
  (∀ x ∈ rankFiber N sigma t (2*i+2) i,
    ∑ y ∈ rankFiber N sigma t (2*i+2) (i+1), w x y = 1) ∧
  (∀ y ∈ rankFiber N sigma t (2*i+2) (i+1),
    ∑ x ∈ rankFiber N sigma t (2*i+2) i, w x y ≤ 1)

def PacketLoad (N sigma i t : ℕ) : Prop :=
  NeighborCriterion (rankFiber N sigma t (2*i+2) i)
    (rankFiber N sigma t (2*i+2) (i+1)) (PacketsR120.packet N)

theorem packet_load_mass (N sigma i t : ℕ) (h : PacketLoad N sigma i t) :
    Mass N sigma i t := by
  classical
  refine ⟨neighborMass _ (PacketsR120.packet N),?_,?_,h.2⟩
  · intro x _ y _; exact neighbor_mass_nonneg _ _ x y
  · intro x hx; exact neighbor_mass_row _ _ x (h.1 x hx)

theorem unit_inequality (N sigma i t : ℕ) (h : Mass N sigma i t) :
    unit (B N sigma i t)*unit (B N sigma (i+2) t) ≤
      unit (B N sigma (i+1) t)^2 := by
  obtain ⟨w,hn,hr,hc⟩ := h
  have hcard := finite_mass_cardinality _ _ w hn hr hc
  have hz : ((rankFiber N sigma t (2*i+2) i).card : ℤ) ≤
      ((rankFiber N sigma t (2*i+2) (i+1)).card : ℤ) := by exact_mod_cast hcard
  have hm : 0 ≤ unit (defect N sigma i t) := by
    rw [unit_margin]
    exact sub_nonneg.mpr hz
  simpa only [defect,map_sub,map_pow,map_mul,sub_nonneg] using hm

theorem packet_unit_inequality (N sigma i t : ℕ) (h : PacketLoad N sigma i t) :
    unit (B N sigma i t)*unit (B N sigma (i+2) t) ≤
      unit (B N sigma (i+1) t)^2 :=
  unit_inequality N sigma i t (packet_load_mass N sigma i t h)

theorem original_horizontal_vertical (n : ℕ) (hn : 1≤n)
    (hH : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b (i+1) j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b (i+2) j → Mass (2*n) 0 i j)
    (hV : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i (j+1) →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i (j+2) → Mass (2*n) 1 j i) :
    let E := (frame (List.replicate (n-1) true)).mid
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b (i+1) j →
      InPolygon E.a E.b (i+2) j →
      coeff E.p i j*coeff E.p (i+2) j ≤ coeff E.p (i+1) j^2) ∧
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b i (j+1) →
      InPolygon E.a E.b i (j+2) →
      coeff E.p i j*coeff E.p i (j+2) ≤ coeff E.p i (j+1)^2) := by
  dsimp only
  constructor
  · intro i j h0 h1 h2
    have h := unit_inequality (2*n) 0 i j (hH i j h0 h1 h2)
    simpa only [(MatchingConsumerR64.actual_coefficients n hn i j).1,
      (MatchingConsumerR64.actual_coefficients n hn (i+1) j).1,
      (MatchingConsumerR64.actual_coefficients n hn (i+2) j).1] using h
  · intro i j h0 h1 h2
    have h := unit_inequality (2*n) 1 j i (hV i j h0 h1 h2)
    simpa only [(MatchingConsumerR64.actual_coefficients n hn i j).2,
      (MatchingConsumerR64.actual_coefficients n hn i (j+1)).2,
      (MatchingConsumerR64.actual_coefficients n hn i (j+2)).2] using h

theorem packet_original_horizontal_vertical (n : ℕ) (hn : 1≤n)
    (hH : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b (i+1) j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b (i+2) j → PacketLoad (2*n) 0 i j)
    (hV : ∀ i j,
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i j →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i (j+1) →
      InPolygon (frame (List.replicate (n-1) true)).mid.a
        (frame (List.replicate (n-1) true)).mid.b i (j+2) → PacketLoad (2*n) 1 j i) :
    let E := (frame (List.replicate (n-1) true)).mid
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b (i+1) j →
      InPolygon E.a E.b (i+2) j →
      coeff E.p i j*coeff E.p (i+2) j ≤ coeff E.p (i+1) j^2) ∧
    (∀ i j, InPolygon E.a E.b i j → InPolygon E.a E.b i (j+1) →
      InPolygon E.a E.b i (j+2) →
      coeff E.p i j*coeff E.p i (j+2) ≤ coeff E.p i (j+1)^2) := by
  apply original_horizontal_vertical n hn
  · intro i j h0 h1 h2
    exact packet_load_mass _ _ _ _ (hH i j h0 h1 h2)
  · intro i j h0 h1 h2
    exact packet_load_mass _ _ _ _ (hV i j h0 h1 h2)

end
end EqualMassR122
#print axioms EqualMassR122.finite_mass_cardinality
#print axioms EqualMassR122.neighbor_cardinality
#print axioms EqualMassR122.unit_inequality
#print axioms EqualMassR122.packet_unit_inequality
#print axioms EqualMassR122.original_horizontal_vertical
#print axioms EqualMassR122.packet_original_horizontal_vertical
