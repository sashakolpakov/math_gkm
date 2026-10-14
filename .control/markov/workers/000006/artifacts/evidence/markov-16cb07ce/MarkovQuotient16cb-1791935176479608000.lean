import MarkovBlowupDe6

/-! Machine-authored worker 16cb07ce. Explicit integral blowup quotient.
No sign or coefficient inequality is assumed. -/
namespace MathGKM.Markov
noncomputable section

abbrev QTriple16 (R : Type*) := R × R × R
def qAdvance16 {R : Type*} [CommRing R] (u v t : R)
    (f : Frame) (q : QTriple16 R) (r : Bool) : QTriple16 R :=
  if r then
    (q.2.1, (1+(u+v)*t)*q.2.2*q.2.1-
      u^f.hi.a*v^f.hi.b*t^(f.hi.a+f.hi.b)*q.1, q.2.2)
  else
    (q.1, (1+(u+v)*t)*q.1*q.2.1-
      u^f.lo.a*v^f.lo.b*t^(f.lo.a+f.lo.b)*q.2.2, q.2.1)

def qPairStep16 {R : Type*} [CommRing R] (u v t : R)
    (fq : Frame × QTriple16 R) (r : Bool) : Frame × QTriple16 R :=
  (advance fq.1 r, qAdvance16 u v t fq.1 fq.2 r)

def qTree16 {R : Type*} [CommRing R] (u v t : R) (path : List Bool) :
    QTriple16 R :=
  (path.foldl (qPairStep16 u v t) (initial, (1, 1+u*t, 1))).2

def QCorrect16 {R : Type*} [CommRing R] (u v t : R)
    (f : Frame) (q : QTriple16 R) : Prop :=
  evalTriDe6 u v ((u+v)^2*t) (numerator4b5 f.lo) = (u+v)^(f.lo.a+f.lo.b-1)*q.1 ∧
  evalTriDe6 u v ((u+v)^2*t) (numerator4b5 f.mid) = (u+v)^(f.mid.a+f.mid.b-1)*q.2.1 ∧
  evalTriDe6 u v ((u+v)^2*t) (numerator4b5 f.hi) = (u+v)^(f.hi.a+f.hi.b-1)*q.2.2

theorem quotient_step_exact16 {R : Type*} [CommRing R]
    (u v t qx qy qz : R) (a b dx dy dz : ℕ)
    (hx : a+b=dx+1) (hy : dy=dx+dz+1) :
    (u+v+(u+v)^2*t)*((u+v)^dx*qx)*((u+v)^dy*qy)-
      u^a*v^b*((u+v)^2*t)^(a+b)*((u+v)^dz*qz) =
    (u+v)^(dx+dy+1)*((1+(u+v)*t)*qx*qy-u^a*v^b*t^(a+b)*qz) := by
  rw [hx, hy]
  simp only [pow_add, pow_succ, mul_pow]
  ring

theorem q_initial16 {R : Type*} [CommRing R] (u v t : R) :
    QCorrect16 u v t initial (1, 1+u*t, 1) := by
  simp only [QCorrect16, source_seed_lo_4b5, source_seed_mid_4b5,
    source_seed_hi_4b5, map_one, map_add, map_mul, map_pow,
    evalTri_U_de6, evalTri_V_de6, evalTri_W_de6]
  change 1=(u+v)^0*1 ∧ (u+v)^2+u*((u+v)^2*t)=(u+v)^2*(1+u*t) ∧
    u+v=(u+v)^1*1
  constructor
  · ring
  constructor <;> ring

theorem q_advance16 {R : Type*} [CommRing R] (u v t : R)
    {f : Frame} {q : QTriple16 R} (hi : FrameIndices f)
    (hd : FrameDegree21a f) (hq : QCorrect16 u v t f q) (r : Bool) :
    QCorrect16 u v t (advance f r) (qAdvance16 u v t f q r) := by
  obtain ⟨hl,hm,hr⟩ := hq
  have hma := hi.1
  have hmb := hi.2.1
  have hlb := hi.2.2.2.1
  have hrb := hi.2.2.2.2.1
  cases r
  · refine ⟨hl, ?_, hm⟩
    change evalTriDe6 u v ((u+v)^2*t) (numerator4b5 (advance f false).mid) = _
    rw [source_step_left_4b5 hi hd]
    simp only [map_sub, map_add, map_mul, map_pow,
      evalTri_U_de6, evalTri_V_de6, evalTri_W_de6, hl, hm, hr]
    have hh := quotient_step_exact16 u v t q.1 q.2.1 q.2.2 f.lo.a f.lo.b
      (f.lo.a+f.lo.b-1) (f.mid.a+f.mid.b-1) (f.hi.a+f.hi.b-1)
      (by omega) (by omega)
    convert hh using 1
    simp only [advance, qAdvance16, Bool.false_eq_true, if_false]
    congr 2
    omega
  · refine ⟨hm, ?_, hr⟩
    change evalTriDe6 u v ((u+v)^2*t) (numerator4b5 (advance f true).mid) = _
    rw [source_step_right_4b5 hi hd]
    simp only [map_sub, map_add, map_mul, map_pow,
      evalTri_U_de6, evalTri_V_de6, evalTri_W_de6, hl, hm, hr]
    have hh := quotient_step_exact16 u v t q.2.2 q.2.1 q.1 f.hi.a f.hi.b
      (f.hi.a+f.hi.b-1) (f.mid.a+f.mid.b-1) (f.lo.a+f.lo.b-1)
      (by omega) (by omega)
    convert hh using 1
    simp only [advance, qAdvance16, if_true]
    congr 2
    omega

theorem q_fold16 {R : Type*} [CommRing R] (u v t : R)
    (path : List Bool) (f : Frame) (q : QTriple16 R)
    (hi : FrameIndices f) (hd : FrameDegree21a f) (hq : QCorrect16 u v t f q) :
    let fq := path.foldl (qPairStep16 u v t) (f,q)
    fq.1 = path.foldl advance f ∧ QCorrect16 u v t fq.1 fq.2 := by
  induction path generalizing f q with
  | nil => exact ⟨rfl,hq⟩
  | cons r rs ih =>
    exact ih _ _ (indices_advance hi r) (degree_advance_21a hi hd r)
      (q_advance16 u v t hi hd hq r)

/-- Exact quotient identity for every source path, over every commutative ring. -/
theorem source_quotient16 {R : Type*} [CommRing R] (u v t : R) (path : List Bool) :
    evalTriDe6 u v ((u+v)^2*t) (numerator4b5 (frame path).mid) =
      (u+v)^((frame path).mid.a+(frame path).mid.b-1)*(qTree16 u v t path).2.1 := by
  have h := q_fold16 u v t path initial (1,1+u*t,1)
    indices_initial degree_initial_21a (q_initial16 u v t)
  dsimp only at h
  rw [h.1] at h
  exact h.2.2.1

#print axioms quotient_step_exact16
#print axioms source_quotient16
end
end MathGKM.Markov
