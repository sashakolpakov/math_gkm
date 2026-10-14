import MarkovVertices18

/-! Machine-authored worker 18ae9bbc. Exact full-root reduction to raw
positive matrix products. The reduced universal inequalities are unproved. -/
namespace MathGKM.Markov
noncomputable section

def GlobalLC18 (P : BiPoly) : Prop :=
  (∀ i j, coeff P i j * coeff P (i+2) j ≤ coeff P (i+1) j^2) ∧
  (∀ i j, coeff P i j * coeff P i (j+2) ≤ coeff P i (j+1)^2) ∧
  (∀ i j, coeff P i (j+2) * coeff P (i+2) j ≤ coeff P (i+1) (j+1)^2)

theorem polygon_mid18 (a b i j : ℕ) :
    (InPolygon a b i j → InPolygon a b (i+2) j → InPolygon a b (i+1) j) ∧
    (InPolygon a b i j → InPolygon a b i (j+2) → InPolygon a b i (j+1)) ∧
    (InPolygon a b i (j+2) → InPolygon a b (i+2) j → InPolygon a b (i+1) (j+1)) := by
  unfold InPolygon
  constructor
  · rintro ⟨h0,h1⟩ ⟨h2,h3⟩; constructor <;> nlinarith
  constructor
  · rintro ⟨h0,h1⟩ ⟨h2,h3⟩; constructor <;> nlinarith
  · rintro ⟨h0,h1⟩ ⟨h2,h3⟩; constructor <;> nlinarith

theorem global_iff_weak18 {a b : ℕ} {P : BiPoly}
    (hz : ∀ i j, ¬ InPolygon a b i j → coeff P i j=0) :
    GlobalLC18 P ↔ WeakLC a b P := by
  constructor
  · rintro ⟨hh,hv,hd⟩
    exact ⟨fun i j _ _ _ => hh i j,fun i j _ _ _ => hv i j,
      fun i j _ _ _ => hd i j⟩
  · rintro ⟨hh,hv,hd⟩
    constructor
    · intro i j
      by_cases h0 : InPolygon a b i j
      · by_cases h2 : InPolygon a b (i+2) j
        · exact hh i j h0 ((polygon_mid18 a b i j).1 h0 h2) h2
        · rw [hz _ _ h2,mul_zero]; exact sq_nonneg _
      · rw [hz _ _ h0,zero_mul]; exact sq_nonneg _
    constructor
    · intro i j
      by_cases h0 : InPolygon a b i j
      · by_cases h2 : InPolygon a b i (j+2)
        · exact hv i j h0 ((polygon_mid18 a b i j).2.1 h0 h2) h2
        · rw [hz _ _ h2,mul_zero]; exact sq_nonneg _
      · rw [hz _ _ h0,zero_mul]; exact sq_nonneg _
    · intro i j
      by_cases h0 : InPolygon a b i (j+2)
      · by_cases h2 : InPolygon a b (i+2) j
        · exact hd i j h0 ((polygon_mid18 a b i j).2.2 h0 h2) h2
        · rw [hz _ _ h2,mul_zero]; exact sq_nonneg _
      · rw [hz _ _ h0,zero_mul]; exact sq_nonneg _

def RawMatrixGoal18 : Prop := ∀ path : List Bool,
  GlobalLC18 (mm16 (path.foldl matPairStep16 (rawA18,rawB18)).1
    (path.foldl matPairStep16 (rawA18,rawB18)).2).b

/-- Both directions, all paths, all raw indices and all three directions.
This equivalence proves neither side; no matrix LC invariant is assumed. -/
theorem root_iff_raw_matrix18 : Conjecture63 ↔ RawMatrixGoal18 := by
  constructor
  · intro h path
    rw [← raw_matrix18]
    exact (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
  · intro h
    refine ⟨?_,?_,?_⟩
    · constructor
      · intro i j h0 h1 h2; unfold InPolygon at *; omega
      constructor
      · intro i j h0 h1 h2; unfold InPolygon at *; omega
      · intro i j h0 h1 h2; unfold InPolygon at *; omega
    · constructor
      · intro i j h0 h1 h2; unfold InPolygon at *; omega
      constructor
      · intro i j h0 h1 h2; unfold InPolygon at *; omega
      · intro i j h0 h1 h2; unfold InPolygon at *; omega
    · intro path
      apply (global_iff_weak18 (raw_outside_polygon18 path)).mp
      rw [raw_matrix18]
      exact h path

#print axioms global_iff_weak18
#print axioms root_iff_raw_matrix18
end
end MathGKM.Markov
