import MathGKM.MarkovLaurent

/-! Machine-authored 2026-10-19. The Laurent mutation construction here is
independent of the polynomial numerator recursion. Its connection to the
publisher topograph remains subject to independent source review. -/
namespace MathGKM.Markov
noncomputable section

structure LaurentTriple (K : Type*) where
  lo : K
  mid : K
  hi : K

def affineLaurentInitial {K : Type*} [Field K] (x y : K) : LaurentTriple K :=
  ⟨x, ((x^2+y^2)^2+x^2)/y, x^2+y^2⟩

def affineLaurentAdvance {K : Type*} [Field K] (x y : K)
    (f : LaurentTriple K) (right : Bool) : LaurentTriple K :=
  if right then ⟨f.mid, ((x^2+y^2+1)/(x*y))*f.hi*f.mid-f.lo, f.hi⟩
  else ⟨f.lo, ((x^2+y^2+1)/(x*y))*f.lo*f.mid-f.hi, f.mid⟩

def affineLaurentFrame {K : Type*} [Field K] (x y : K)
    (path : List Bool) : LaurentTriple K :=
  path.foldl (affineLaurentAdvance x y) (affineLaurentInitial x y)

def AffineMarkovInvariant {K : Type*} [Field K] (x y : K)
    (f : LaurentTriple K) : Prop :=
  f.lo^2+f.mid^2+f.hi^2 = ((x^2+y^2+1)/(x*y))*f.lo*f.mid*f.hi

theorem affineLaurentInitial_invariant {K : Type*} [Field K] (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) :
    AffineMarkovInvariant x y (affineLaurentInitial x y) := by
  unfold AffineMarkovInvariant affineLaurentInitial
  dsimp
  field_simp
  <;> ring

theorem affineLaurentAdvance_invariant {K : Type*} [Field K] (x y : K)
    (f : LaurentTriple K) (h : AffineMarkovInvariant x y f) (r : Bool) :
    AffineMarkovInvariant x y (affineLaurentAdvance x y f r) := by
  unfold AffineMarkovInvariant at *
  cases r <;> simp only [affineLaurentAdvance, Bool.false_eq_true, ↓reduceIte]
  · linear_combination h
  · linear_combination h

theorem affineLaurentFrame_invariant {K : Type*} [Field K] (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (path : List Bool) :
    AffineMarkovInvariant x y (affineLaurentFrame x y path) := by
  induction path using List.reverseRecOn with
  | nil => exact affineLaurentInitial_invariant x y hx hy
  | append_singleton path r ih =>
    simpa only [affineLaurentFrame, List.foldl_append, List.foldl_cons,
      List.foldl_nil] using affineLaurentAdvance_invariant x y _ ih r

/-- The independently defined affine construction satisfies the polynomial
exchange relation of the source Vieta mutation, in either branch. -/
theorem affineLaurentFrame_exchange {K : Type*} [Field K] (x y : K)
    (hx : x ≠ 0) (hy : y ≠ 0) (path : List Bool) :
    (affineLaurentFrame x y path).hi *
      (affineLaurentFrame x y (path ++ [false])).mid =
      (affineLaurentFrame x y path).lo^2 +
        (affineLaurentFrame x y path).mid^2 ∧
    (affineLaurentFrame x y path).lo *
      (affineLaurentFrame x y (path ++ [true])).mid =
      (affineLaurentFrame x y path).hi^2 +
        (affineLaurentFrame x y path).mid^2 := by
  have h := affineLaurentFrame_invariant x y hx hy path
  unfold AffineMarkovInvariant at h
  simp only [affineLaurentFrame, List.foldl_append, List.foldl_cons,
    List.foldl_nil]
  change (affineLaurentFrame x y path).hi *
      (affineLaurentAdvance x y (affineLaurentFrame x y path) false).mid =
        (affineLaurentFrame x y path).lo^2 + (affineLaurentFrame x y path).mid^2 ∧
    (affineLaurentFrame x y path).lo *
      (affineLaurentAdvance x y (affineLaurentFrame x y path) true).mid =
        (affineLaurentFrame x y path).hi^2 + (affineLaurentFrame x y path).mid^2
  simp only [affineLaurentAdvance, Bool.false_eq_true, ↓reduceIte]
  constructor <;> linear_combination -h

theorem affine_frame_presentation {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2) (path : List Bool) :
    φ (frame path).lo.p = affineDen x y (frame path).lo.a
      (frame path).lo.b * (affineLaurentFrame x y path).lo ∧
    φ (frame path).mid.p = affineDen x y (frame path).mid.a
      (frame path).mid.b * (affineLaurentFrame x y path).mid ∧
    φ (frame path).hi.p = affineDen x y (frame path).hi.a
      (frame path).hi.b * (affineLaurentFrame x y path).hi := by
  have hS : φ S = x^2+y^2+1 := by simp [S, hu, hv]
  induction path using List.reverseRecOn with
  | nil =>
    refine ⟨?_, ?_, ?_⟩
    · simp [frame, initial, affineLaurentFrame, affineLaurentInitial, affineDen, hx]
    · simp [frame, initial, affineLaurentFrame, affineLaurentInitial, affineDen, hu, hv]
      field_simp
    · simp [frame, initial, affineLaurentFrame, affineLaurentInitial, affineDen, hu, hv]
  | append_singleton path r ih =>
    have hf := frame_invariant path
    have hfa := hf.sum_a
    have hfb := hf.sum_b
    rcases ih with ⟨hlo,hmid,hhi⟩
    simp only [frame, affineLaurentFrame, List.foldl_append, List.foldl_cons,
      List.foldl_nil]
    change φ (advance (frame path) r).lo.p =
        affineDen x y (advance (frame path) r).lo.a
          (advance (frame path) r).lo.b *
          (affineLaurentAdvance x y (affineLaurentFrame x y path) r).lo ∧
      φ (advance (frame path) r).mid.p =
        affineDen x y (advance (frame path) r).mid.a
          (advance (frame path) r).mid.b *
          (affineLaurentAdvance x y (affineLaurentFrame x y path) r).mid ∧
      φ (advance (frame path) r).hi.p =
        affineDen x y (advance (frame path) r).hi.a
          (advance (frame path) r).hi.b *
          (affineLaurentAdvance x y (affineLaurentFrame x y path) r).hi
    cases r <;> simp only [advance, affineLaurentAdvance, Bool.false_eq_true, ↓reduceIte]
    · refine ⟨hlo, ?_, hmid⟩
      have ht := affineDen_mutation x y hx hy
        (frame path).hi.a (frame path).hi.b (frame path).lo.a (frame path).lo.b
        (affineLaurentFrame x y path).hi (affineLaurentFrame x y path).lo
        (affineLaurentFrame x y path).mid
      have ha : (frame path).hi.a+2*(frame path).lo.a =
          (frame path).lo.a+(frame path).mid.a := by omega
      have hb : (frame path).hi.b+2*(frame path).lo.b =
          (frame path).lo.b+(frame path).mid.b := by omega
      have ha' : (frame path).hi.a+(frame path).lo.a = (frame path).mid.a := by omega
      have hb' : (frame path).hi.b+(frame path).lo.b = (frame path).mid.b := by omega
      simpa only [map_sub, map_mul, map_pow, hS, hu, hv, hlo, hmid, hhi,
        ha, hb, ha', hb'] using ht.symm
    · refine ⟨hmid, ?_, hhi⟩
      have ht := affineDen_mutation x y hx hy
        (frame path).lo.a (frame path).lo.b (frame path).hi.a (frame path).hi.b
        (affineLaurentFrame x y path).lo (affineLaurentFrame x y path).hi
        (affineLaurentFrame x y path).mid
      have ha : (frame path).lo.a+2*(frame path).hi.a =
          (frame path).mid.a+(frame path).hi.a := by omega
      have hb : (frame path).lo.b+2*(frame path).hi.b =
          (frame path).mid.b+(frame path).hi.b := by omega
      simpa only [map_sub, map_mul, map_pow, hS, hu, hv, hlo, hmid, hhi,
        ha, hb, ← hf.sum_a, ← hf.sum_b] using ht.symm

end
end MathGKM.Markov
