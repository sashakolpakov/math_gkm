import MathGKM.Accepted65ed3447f553d2b625153a1a

/-! Machine-authored round-0003. Exact transport over the pinned InPolygon
predicate. No identification with the actual source Newton polygon is asserted. -/
namespace MathGKM.Markov
noncomputable section

def latticeIndex (d i j : ℕ) : Fin 3 → ℤ := ![(d:ℤ)-i-j, i, j]

theorem latticeIndex_natural (d i j : ℕ) (h : i+j≤d) :
    latticeIndex d i j = ![((d-i-j:ℕ):ℤ), i, j] := by
  funext c
  fin_cases c <;> simp [latticeIndex] <;> omega

theorem latticeIndex_steps (d i j : ℕ) :
    latticeIndex d (i+1) j = latticeIndex d i j + ![-1,1,0] ∧
    latticeIndex d i (j+1) = latticeIndex d i j + ![-1,0,1] ∧
    latticeIndex d (i+1) j = latticeIndex d i (j+1) + ![0,1,-1] := by
  constructor
  · funext c; fin_cases c <;> simp [latticeIndex] <;> omega
  constructor
  · funext c; fin_cases c <;> simp [latticeIndex] <;> omega
  · funext c; fin_cases c <;> simp [latticeIndex] <;> omega

def TriWeakLC (a b : ℕ) (F : TriPoly) : Prop :=
  (∀ k i j, k+2+i+j=a+b-1 →
    InPolygon a b i j → InPolygon a b (i+1) j → InPolygon a b (i+2) j →
    triCoeff F (k+2) i j * triCoeff F k (i+2) j ≤ triCoeff F (k+1) (i+1) j ^ 2) ∧
  (∀ k i j, k+2+i+j=a+b-1 →
    InPolygon a b i j → InPolygon a b i (j+1) → InPolygon a b i (j+2) →
    triCoeff F (k+2) i j * triCoeff F k i (j+2) ≤ triCoeff F (k+1) i (j+1) ^ 2) ∧
  (∀ k i j, k+i+j+2=a+b-1 →
    InPolygon a b i (j+2) → InPolygon a b (i+1) (j+1) → InPolygon a b (i+2) j →
    triCoeff F k i (j+2) * triCoeff F k (i+2) j ≤ triCoeff F k (i+1) (j+1) ^ 2)

theorem coefficient_triple_transport (a b : ℕ) (P : BiPoly)
    (hb : SupportBound P (a+b-1)) :
    WeakLC a b P ↔ TriWeakLC a b (homogeneousLift P (a+b-1)) := by
  have hc := (Accepted65ed3447f553d2b625153a1a.obligation P (a+b-1) hb).2.2.1
  constructor
  · rintro ⟨hh,hv,hd⟩
    refine ⟨?_,?_,?_⟩
    · intro k i j he h0 h1 h2
      simpa only [hc, if_pos (show k+2+i+j=a+b-1 from he),
        if_pos (show k+(i+2)+j=a+b-1 by omega),
        if_pos (show k+1+(i+1)+j=a+b-1 by omega)] using hh i j h0 h1 h2
    · intro k i j he h0 h1 h2
      simpa only [hc, if_pos (show k+2+i+j=a+b-1 from he),
        if_pos (show k+i+(j+2)=a+b-1 by omega),
        if_pos (show k+1+i+(j+1)=a+b-1 by omega)] using hv i j h0 h1 h2
    · intro k i j he h0 h1 h2
      simpa only [hc, if_pos (show k+i+(j+2)=a+b-1 by omega),
        if_pos (show k+(i+2)+j=a+b-1 by omega),
        if_pos (show k+(i+1)+(j+1)=a+b-1 by omega)] using hd i j h0 h1 h2
  · rintro ⟨hh,hv,hd⟩
    refine ⟨?_,?_,?_⟩
    · intro i j h0 h1 h2
      have he : (a+b-1-(i+2)-j)+2+i+j=a+b-1 := by have := h2.2; omega
      have ht := hh (a+b-1-(i+2)-j) i j he h0 h1 h2
      simpa only [hc, if_pos he,
        if_pos (show (a+b-1-(i+2)-j)+(i+2)+j=a+b-1 by omega),
        if_pos (show (a+b-1-(i+2)-j)+1+(i+1)+j=a+b-1 by omega)] using ht
    · intro i j h0 h1 h2
      have he : (a+b-1-i-(j+2))+2+i+j=a+b-1 := by have := h2.2; omega
      have ht := hv (a+b-1-i-(j+2)) i j he h0 h1 h2
      simpa only [hc, if_pos he,
        if_pos (show (a+b-1-i-(j+2))+i+(j+2)=a+b-1 by omega),
        if_pos (show (a+b-1-i-(j+2))+1+i+(j+1)=a+b-1 by omega)] using ht
    · intro i j h0 h1 h2
      have he : (a+b-1-i-(j+2))+i+j+2=a+b-1 := by have := h0.2; omega
      have ht := hd (a+b-1-i-(j+2)) i j he h0 h1 h2
      simpa only [hc,
        if_pos (show (a+b-1-i-(j+2))+i+(j+2)=a+b-1 by omega),
        if_pos (show (a+b-1-i-(j+2))+(i+2)+j=a+b-1 by omega),
        if_pos (show (a+b-1-i-(j+2))+(i+1)+(j+1)=a+b-1 by omega)] using ht

theorem endpoint_polygons :
    (∀ i j, InPolygon 0 1 i j ↔ i=0 ∧ j=0) ∧
    (∀ i j, InPolygon 1 1 i j ↔ i+j=1) := by
  constructor <;> intro i j <;> simp only [InPolygon, zero_mul, one_mul] <;> omega

theorem low_degree_weakLC (a b : ℕ) (P : BiPoly) (h : a+b-1<2) : WeakLC a b P := by
  refine ⟨?_,?_,?_⟩
  · intro i j h0 h1 h2
    have := h2.2
    omega
  · intro i j h0 h1 h2
    have := h2.2
    omega
  · intro i j h0 h1 h2
    have := h0.2
    omega

theorem triple_transport_bundle :
    (∀ d i j, i+j≤d → latticeIndex d i j = ![((d-i-j:ℕ):ℤ),i,j]) ∧
    (∀ d i j,
      latticeIndex d (i+1) j = latticeIndex d i j + ![-1,1,0] ∧
      latticeIndex d i (j+1) = latticeIndex d i j + ![-1,0,1] ∧
      latticeIndex d (i+1) j = latticeIndex d i (j+1) + ![0,1,-1]) ∧
    (∀ a b P, SupportBound P (a+b-1) →
      (WeakLC a b P ↔ TriWeakLC a b (homogeneousLift P (a+b-1)))) ∧
    (∀ i j, InPolygon 0 1 i j ↔ i=0 ∧ j=0) ∧
    (∀ i j, InPolygon 1 1 i j ↔ i+j=1) ∧
    WeakLC 0 1 1 ∧ WeakLC 1 1 (U+V) := by
  exact ⟨latticeIndex_natural,latticeIndex_steps,coefficient_triple_transport,
    endpoint_polygons.1,endpoint_polygons.2,
    low_degree_weakLC 0 1 1 (by decide), low_degree_weakLC 1 1 (U+V) (by decide)⟩

end
end MathGKM.Markov
