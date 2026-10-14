import MarkovQuotient16cb

/-! Machine-authored worker 16cb07ce. Positive two-matrix quotient model. -/
namespace MathGKM.Markov
noncomputable section

@[ext] structure Mat16 (R : Type*) where
  a : R
  b : R
  c : R
  d : R

def mm16 {R : Type*} [CommRing R] (x y : Mat16 R) : Mat16 R :=
  ⟨x.a*y.a+x.b*y.c, x.a*y.b+x.b*y.d,
   x.c*y.a+x.d*y.c, x.c*y.b+x.d*y.d⟩
def tr16 {R : Type*} [CommRing R] (x : Mat16 R) := x.a+x.d
def det16 {R : Type*} [CommRing R] (x : Mat16 R) := x.a*x.d-x.b*x.c

theorem mm_assoc16 {R : Type*} [CommRing R] (x y z : Mat16 R) :
    mm16 (mm16 x y) z = mm16 x (mm16 y z) := by
  ext <;> simp [mm16] <;> ring
theorem det_mul16 {R : Type*} [CommRing R] (x y : Mat16 R) :
    det16 (mm16 x y) = det16 x * det16 y := by simp [det16,mm16]; ring
theorem ch_left16 {R : Type*} [CommRing R] (x y : Mat16 R) :
    (mm16 x (mm16 x y)).b = tr16 x*(mm16 x y).b-det16 x*y.b ∧
    tr16 (mm16 x (mm16 x y)) = tr16 x*tr16 (mm16 x y)-det16 x*tr16 y := by
  constructor <;> simp [mm16,tr16,det16] <;> ring
theorem ch_right16 {R : Type*} [CommRing R] (x y : Mat16 R) :
    (mm16 (mm16 x y) y).b = tr16 y*(mm16 x y).b-det16 y*x.b ∧
    tr16 (mm16 (mm16 x y) y) = tr16 y*tr16 (mm16 x y)-det16 y*tr16 x := by
  constructor <;> simp [mm16,tr16,det16] <;> ring

def matA16 {R : Type*} [CommRing R] (u v : R) : Mat16 R := ⟨1,1,u,u+v⟩
def matB16 {R : Type*} [CommRing R] (u v : R) : Mat16 R := ⟨1+v,1,u,u⟩
def matPairStep16 {R : Type*} [CommRing R] (xy : Mat16 R × Mat16 R)
    (r : Bool) : Mat16 R × Mat16 R :=
  if r then (mm16 xy.1 xy.2,xy.2) else (xy.1,mm16 xy.1 xy.2)
def matTops16 {R : Type*} [CommRing R] (xy : Mat16 R × Mat16 R) : QTriple16 R :=
  (xy.1.b,(mm16 xy.1 xy.2).b,xy.2.b)
def MatValid16 {R : Type*} [CommRing R] (u v : R) (f : Frame)
    (x y : Mat16 R) : Prop :=
  det16 x=u^f.lo.a*v^f.lo.b ∧ det16 y=u^f.hi.a*v^f.hi.b ∧
  tr16 x=(1+u+v)*x.b ∧ tr16 y=(1+u+v)*y.b ∧
  tr16 (mm16 x y)=(1+u+v)*(mm16 x y).b

theorem mat_initial16 {R : Type*} [CommRing R] (u v : R) :
    MatValid16 u v initial (matA16 u v) (matB16 u v) := by
  simp [MatValid16,initial,matA16,matB16,det16,tr16,mm16]
  constructor <;> ring

theorem mat_valid_step16 {R : Type*} [CommRing R] (u v : R)
    {f : Frame} {x y : Mat16 R} (hi : FrameIndices f)
    (h : MatValid16 u v f x y) (r : Bool) :
    MatValid16 u v (advance f r)
      (matPairStep16 (x,y) r).1 (matPairStep16 (x,y) r).2 := by
  obtain ⟨dx,dy,tx,ty,tm⟩ := h
  have dm : det16 (mm16 x y) = u^f.mid.a*v^f.mid.b := by
    rw [det_mul16,dx,dy,hi.1,hi.2.1,pow_add,pow_add]
    ring
  cases r
  · refine ⟨dx,dm,tx,tm,?_⟩
    change tr16 (mm16 x (mm16 x y)) = _
    rw [(ch_left16 x y).2, (ch_left16 x y).1, tx,ty,tm]
    ring
  · refine ⟨dm,dy,tm,ty,?_⟩
    change tr16 (mm16 (mm16 x y) y) = _
    rw [(ch_right16 x y).2, (ch_right16 x y).1, tx,ty,tm]
    ring

theorem mat_tops_step16 {R : Type*} [CommRing R] (u v : R)
    {f : Frame} {x y : Mat16 R} (h : MatValid16 u v f x y) (r : Bool) :
    qAdvance16 u v 1 f (matTops16 (x,y)) r =
      matTops16 (matPairStep16 (x,y) r) := by
  obtain ⟨dx,dy,tx,ty,tm⟩ := h
  cases r <;> simp only [qAdvance16,matTops16,matPairStep16,
    Bool.false_eq_true,if_false,if_true,one_pow,mul_one]
  · rw [(ch_left16 x y).1,tx,dx]
    congr 2 <;> ring
  · rw [(ch_right16 x y).1,ty,dy]
    congr 2 <;> ring

theorem mat_fold16 {R : Type*} [CommRing R] (u v : R) (path : List Bool)
    (f : Frame) (xy : Mat16 R × Mat16 R) (hi : FrameIndices f)
    (h : MatValid16 u v f xy.1 xy.2) :
    (path.foldl (qPairStep16 u v 1) (f,matTops16 xy)).2 =
      matTops16 (path.foldl matPairStep16 xy) := by
  induction path generalizing f xy with
  | nil => rfl
  | cons r rs ih =>
    simp only [List.foldl_cons,qPairStep16]
    rw [mat_tops_step16 u v h r]
    exact ih _ _ (indices_advance hi r) (mat_valid_step16 u v hi h r)

/-- Universal source-restricted product formula for the quotient at t=1. -/
theorem quotient_matrix16 {R : Type*} [CommRing R] (u v : R) (path : List Bool) :
    qTree16 u v 1 path =
      matTops16 (path.foldl matPairStep16 (matA16 u v,matB16 u v)) := by
  have h := mat_fold16 u v path initial (matA16 u v,matB16 u v)
    indices_initial (mat_initial16 u v)
  simpa [qTree16,matTops16,matA16,matB16,mm16] using h

#print axioms quotient_matrix16
end
end MathGKM.Markov
