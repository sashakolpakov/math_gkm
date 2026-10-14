import MarkovSource4b5

/-! Machine-authored worker de6ce8a9. Integral substitution certificate.
This file proves divisibility, not positivity or log-concavity. -/
namespace MathGKM.Markov
noncomputable section

def evalTriDe6 {R : Type*} [CommRing R] (u v w : R) : TriPoly21a →+* R :=
  Polynomial.eval₂RingHom
    (Polynomial.eval₂RingHom (Polynomial.eval₂RingHom (Int.castRingHom R) w) v) u

@[simp] theorem evalTri_U_de6 {R : Type*} [CommRing R] (u v w : R) :
    evalTriDe6 u v w HU4b5 = u := by simp [evalTriDe6, HU4b5]
@[simp] theorem evalTri_V_de6 {R : Type*} [CommRing R] (u v w : R) :
    evalTriDe6 u v w HV4b5 = v := by simp [evalTriDe6, HV4b5]
@[simp] theorem evalTri_W_de6 {R : Type*} [CommRing R] (u v w : R) :
    evalTriDe6 u v w HW4b5 = w := by simp [evalTriDe6, HW4b5]

theorem blowup_step_de6 {R : Type*} [CommRing R]
    (u s t px py pz : R) (a b dx dy dz : ℕ)
    (hx : a+b=dx+1) (hy : dy=dx+dz+1)
    (hpx : s^dx ∣ px) (hpy : s^dy ∣ py) (hpz : s^dz ∣ pz) :
    s^(dx+dy+1) ∣
      (u+(s-u)+s^2*t)*px*py-u^a*(s-u)^b*(s^2*t)^(a+b)*pz := by
  obtain ⟨qx,rfl⟩ := hpx
  obtain ⟨qy,rfl⟩ := hpy
  obtain ⟨qz,rfl⟩ := hpz
  refine ⟨(1+s*t)*qx*qy-u^a*(s-u)^b*t^(a+b)*qz, ?_⟩
  rw [hx, hy]
  simp only [pow_add, pow_succ, mul_pow]
  ring

def BlowupLabelDe6 {R : Type*} [CommRing R] (u s t : R) (l : Label) : Prop :=
  s^(l.a+l.b-1) ∣ evalTriDe6 u (s-u) (s^2*t) (numerator4b5 l)
def BlowupFrameDe6 {R : Type*} [CommRing R] (u s t : R) (f : Frame) : Prop :=
  BlowupLabelDe6 u s t f.lo ∧ BlowupLabelDe6 u s t f.mid ∧
    BlowupLabelDe6 u s t f.hi

theorem blowup_initial_de6 {R : Type*} [CommRing R] (u s t : R) :
    BlowupFrameDe6 u s t initial := by
  simp only [BlowupFrameDe6, BlowupLabelDe6, source_seed_lo_4b5,
    source_seed_mid_4b5, source_seed_hi_4b5]
  simp only [map_one, map_add, map_mul, map_pow, evalTri_U_de6,
    evalTri_V_de6, evalTri_W_de6]
  change s^0 ∣ 1 ∧ s^2 ∣ (u+(s-u))^2+u*(s^2*t) ∧ s^1 ∣ u+(s-u)
  refine ⟨by simp, ⟨1+u*t, by ring⟩, ?_⟩
  simp

theorem blowup_advance_de6 {R : Type*} [CommRing R] (u s t : R)
    {f : Frame} (hi : FrameIndices f) (hd : FrameDegree21a f)
    (hb : BlowupFrameDe6 u s t f) (r : Bool) :
    BlowupFrameDe6 u s t (advance f r) := by
  obtain ⟨hl,hm,hr⟩ := hb
  have hma := hi.1
  have hmb := hi.2.1
  have hlb := hi.2.2.2.1
  have hrb := hi.2.2.2.2.1
  cases r
  · refine ⟨hl, ?_, hm⟩
    unfold BlowupLabelDe6 at hl hm hr ⊢
    rw [source_step_left_4b5 hi hd]
    simp only [map_sub, map_add, map_mul, map_pow, evalTri_U_de6,
      evalTri_V_de6, evalTri_W_de6]
    have hh := blowup_step_de6 u s t _ _ _ f.lo.a f.lo.b
      (f.lo.a+f.lo.b-1) (f.mid.a+f.mid.b-1) (f.hi.a+f.hi.b-1)
      (by omega) (by omega) hl hm hr
    convert hh using 1 <;> simp only [advance, Bool.false_eq_true, if_false] <;> omega
  · refine ⟨hm, ?_, hr⟩
    unfold BlowupLabelDe6 at hl hm hr ⊢
    rw [source_step_right_4b5 hi hd]
    simp only [map_sub, map_add, map_mul, map_pow, evalTri_U_de6,
      evalTri_V_de6, evalTri_W_de6]
    have hh := blowup_step_de6 u s t _ _ _ f.hi.a f.hi.b
      (f.hi.a+f.hi.b-1) (f.mid.a+f.mid.b-1) (f.lo.a+f.lo.b-1)
      (by omega) (by omega) hr hm hl
    convert hh using 1 <;> simp only [advance, if_true] <;> omega

theorem blowup_fold_de6 {R : Type*} [CommRing R] (u s t : R)
    (path : List Bool) (f : Frame) (hi : FrameIndices f)
    (hd : FrameDegree21a f) (hb : BlowupFrameDe6 u s t f) :
    BlowupFrameDe6 u s t (path.foldl advance f) := by
  induction path generalizing f with
  | nil => exact hb
  | cons r rs ih => exact ih _ (indices_advance hi r) (degree_advance_21a hi hd r)
      (blowup_advance_de6 u s t hi hd hb r)

/-- Universal integral factor certificate; no finite path bound or division. -/
theorem blowup_divisibility_de6 {R : Type*} [CommRing R] (u s t : R)
    (path : List Bool) :
    s^((frame path).mid.a+(frame path).mid.b-1) ∣
      evalTriDe6 u (s-u) (s^2*t) (numerator4b5 (frame path).mid) :=
  (blowup_fold_de6 u s t path initial indices_initial degree_initial_21a
    (blowup_initial_de6 u s t)).2.1

#print axioms blowup_step_de6
#print axioms blowup_divisibility_de6
end
end MathGKM.Markov
