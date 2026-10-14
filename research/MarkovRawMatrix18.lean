import MarkovPositive16cb

/-! Machine-authored worker 18ae9bbc. Positive Cohn matrices for the literal
raw numerator, at w=1. This is not a log-concavity assertion. -/
namespace MathGKM.Markov
noncomputable section

def rawA18 : Mat16 BiPoly := ⟨V,1,U*V,U+1⟩
def rawB18 : Mat16 BiPoly := ⟨V*S,U+V,U*V*(S+1),U*S⟩

def RawCorrect18 (f : Frame) (xy : Mat16 BiPoly × Mat16 BiPoly) : Prop :=
  xy.1.b=f.lo.p ∧ (mm16 xy.1 xy.2).b=f.mid.p ∧ xy.2.b=f.hi.p

theorem raw_initial18 : RawCorrect18 initial (rawA18,rawB18) ∧
    MatValid16 U V initial rawA18 rawB18 := by
  constructor
  · constructor
    · rfl
    constructor
    · change V*(U+V)+1*(U*S)=(U+V)^2+U
      unfold S
      ring
    · rfl
  · simp [MatValid16,rawA18,rawB18,initial,det16,tr16,mm16,S] <;> ring_nf <;> simp

theorem raw_step18 {f : Frame} {xy : Mat16 BiPoly × Mat16 BiPoly}
    (h : RawCorrect18 f xy) (hv : MatValid16 U V f xy.1 xy.2) (r : Bool) :
    RawCorrect18 (advance f r) (matPairStep16 xy r) := by
  obtain ⟨hl,hm,hh⟩ := h
  obtain ⟨dl,dh,tl,th,tm⟩ := hv
  have sl : tr16 xy.1=S*xy.1.b := by simpa [S,add_comm,add_left_comm,add_assoc] using tl
  have sh : tr16 xy.2=S*xy.2.b := by simpa [S,add_comm,add_left_comm,add_assoc] using th
  cases r
  · refine ⟨hl,?_,hm⟩
    change (mm16 xy.1 (mm16 xy.1 xy.2)).b = _
    rw [(ch_left16 xy.1 xy.2).1,sl,dl,hl,hm,hh]
    rfl
  · refine ⟨hm,?_,hh⟩
    change (mm16 (mm16 xy.1 xy.2) xy.2).b = _
    rw [(ch_right16 xy.1 xy.2).1,sh,dh,hh,hm,hl]
    rfl

theorem raw_fold18 (path : List Bool) (f : Frame)
    (xy : Mat16 BiPoly × Mat16 BiPoly) (hi : FrameIndices f)
    (hv : MatValid16 U V f xy.1 xy.2) (h : RawCorrect18 f xy) :
    RawCorrect18 (path.foldl advance f) (path.foldl matPairStep16 xy) := by
  induction path generalizing f xy with
  | nil => exact h
  | cons r rs ih =>
    exact ih _ _ (indices_advance hi r)
      (mat_valid_step16 U V hi hv r) (raw_step18 h hv r)

/-- Exact raw numerator identity, for every actual source path. -/
theorem raw_matrix18 (path : List Bool) :
    (frame path).mid.p =
      (mm16 (path.foldl matPairStep16 (rawA18,rawB18)).1
        (path.foldl matPairStep16 (rawA18,rawB18)).2).b := by
  exact (raw_fold18 path initial (rawA18,rawB18) indices_initial
    raw_initial18.2 raw_initial18.1).2.1.symm

theorem raw_generators_nonneg18 : MatNonneg16 rawA18 ∧ MatNonneg16 rawB18 := by
  have hu := poly_U_nonneg16
  have hv := poly_V_nonneg16
  have h1 := poly_one_nonneg16
  have hs : PolyNonneg16 S := poly_add_nonneg16 (poly_add_nonneg16 hu hv) h1
  exact ⟨⟨hv,h1,poly_mul_nonneg16 hu hv,poly_add_nonneg16 hu h1⟩,
    ⟨poly_mul_nonneg16 hv hs,poly_add_nonneg16 hu hv,
      poly_mul_nonneg16 (poly_mul_nonneg16 hu hv) (poly_add_nonneg16 hs h1),
      poly_mul_nonneg16 hu hs⟩⟩

/-- Nonnegativity of every literal raw coefficient, including all zeros and
all lower slices, with no degree or denominator cutoff. -/
theorem raw_coeff_nonneg18 (path : List Bool) (i j : ℕ) :
    0 ≤ coeff (frame path).mid.p i j := by
  rw [raw_matrix18]
  have h := mat_pair_nonneg16 path (rawA18,rawB18)
    raw_generators_nonneg18.1 raw_generators_nonneg18.2
  exact (mat_mul_nonneg16 h.1 h.2).2.1 i j

#print axioms raw_matrix18
#print axioms raw_coeff_nonneg18
end
end MathGKM.Markov
