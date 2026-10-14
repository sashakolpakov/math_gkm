import MarkovExchange2d1

/-! Machine-authored worker 2d1cb040. Normalization at z=1 in an arbitrary
field. This is a mutation bridge, not a homogeneity or coefficient theorem. -/
namespace MathGKM.Markov
noncomputable section

def denom2d1 {K : Type*} [Field K] (x y : K) (l : Label) : K :=
  x ^ l.a * y ^ l.b

def laurent2d1 {K : Type*} [Field K] (φ : BiPoly →+* K)
    (x y : K) (l : Label) : K := x * y * φ l.p / denom2d1 x y l

theorem denom_ne_zero_2d1 {K : Type*} [Field K] {x y : K}
    (hx : x ≠ 0) (hy : y ≠ 0) (l : Label) : denom2d1 x y l ≠ 0 :=
  mul_ne_zero (pow_ne_zero _ hx) (pow_ne_zero _ hy)

theorem denom_mid_2d1 {K : Type*} [Field K] (x y : K)
    {f : Frame} (h : FrameIndices f) :
    denom2d1 x y f.mid = denom2d1 x y f.lo * denom2d1 x y f.hi := by
  unfold denom2d1
  rw [h.1, h.2.1, pow_add, pow_add]
  ring

theorem map_weight_2d1 {K : Type*} [Field K] (φ : BiPoly →+* K)
    (x y : K) (hu : φ U = x^2) (hv : φ V = y^2) (l : Label) :
    φ (weight2d1 l) = (denom2d1 x y l)^2 := by
  simp only [weight2d1, denom2d1, map_mul, map_pow, hu, hv, mul_pow]
  rw [← pow_mul, ← pow_mul, Nat.mul_comm 2 l.a, Nat.mul_comm 2 l.b,
      pow_mul, pow_mul]

theorem normalized_step_2d1 {K : Type*} [Field K]
    (s c A B L M H : K) (hc : c ≠ 0) (hA : A ≠ 0) (hB : B ≠ 0) :
    c * (s * H * M - B^2 * L) / (A * B^2) =
      (s/c) * (c*H/B) * (c*M/(A*B)) - c*L/A := by
  field_simp
  <;> ring

theorem laurent_advance_right_2d1 {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2)
    {f : Frame} (hi : FrameIndices f) :
    laurent2d1 φ x y (advance f true).mid =
      ((x^2+y^2+1)/(x*y)) * laurent2d1 φ x y f.hi *
        laurent2d1 φ x y f.mid - laurent2d1 φ x y f.lo := by
  have hd := denom_mid_2d1 x y hi
  have hn : denom2d1 x y (advance f true).mid =
      denom2d1 x y f.lo * (denom2d1 x y f.hi)^2 := by
    simp only [denom2d1, advance, if_true, pow_add]
    have h := hd
    unfold denom2d1 at h
    calc
      _ = (x ^ f.mid.a * y ^ f.mid.b) * (x ^ f.hi.a * y ^ f.hi.b) := by ring
      _ = _ := by rw [h]; ring
  have hp : φ (advance f true).mid.p =
      (x^2+y^2+1) * φ f.hi.p * φ f.mid.p -
        (denom2d1 x y f.hi)^2 * φ f.lo.p := by
    change φ (S * f.hi.p * f.mid.p - weight2d1 f.hi * f.lo.p) = _
    simp only [map_sub, map_mul, S, map_add, map_one, hu, hv,
      map_weight_2d1 φ x y hu hv]
  unfold laurent2d1
  rw [hp, hn, hd]
  exact normalized_step_2d1 _ _ _ _ _ _ _ (mul_ne_zero hx hy)
    (denom_ne_zero_2d1 hx hy _) (denom_ne_zero_2d1 hx hy _)

theorem laurent_advance_left_2d1 {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2)
    {f : Frame} (hi : FrameIndices f) :
    laurent2d1 φ x y (advance f false).mid =
      ((x^2+y^2+1)/(x*y)) * laurent2d1 φ x y f.lo *
        laurent2d1 φ x y f.mid - laurent2d1 φ x y f.hi := by
  have hd : denom2d1 x y f.mid = denom2d1 x y f.hi * denom2d1 x y f.lo := by
    rw [denom_mid_2d1 x y hi, mul_comm]
  have hn : denom2d1 x y (advance f false).mid =
      denom2d1 x y f.hi * (denom2d1 x y f.lo)^2 := by
    simp only [denom2d1, advance, Bool.false_eq_true, if_false, pow_add]
    have h := hd
    unfold denom2d1 at h
    calc
      _ = (x ^ f.mid.a * y ^ f.mid.b) * (x ^ f.lo.a * y ^ f.lo.b) := by ring
      _ = _ := by rw [h]; ring
  have hp : φ (advance f false).mid.p =
      (x^2+y^2+1) * φ f.lo.p * φ f.mid.p -
        (denom2d1 x y f.lo)^2 * φ f.hi.p := by
    change φ (S * f.lo.p * f.mid.p - weight2d1 f.lo * f.hi.p) = _
    simp only [map_sub, map_mul, S, map_add, map_one, hu, hv,
      map_weight_2d1 φ x y hu hv]
  unfold laurent2d1
  rw [hp, hn, hd]
  exact normalized_step_2d1 _ _ _ _ _ _ _ (mul_ne_zero hx hy)
    (denom_ne_zero_2d1 hx hy _) (denom_ne_zero_2d1 hx hy _)

def values2d1 {K : Type*} [Field K] (φ : BiPoly →+* K) (x y : K)
    (f : Frame) : K × K × K :=
  (laurent2d1 φ x y f.lo, laurent2d1 φ x y f.mid, laurent2d1 φ x y f.hi)

def vieta2d1 {K : Type*} [Field K] (k : K) (t : K × K × K) (r : Bool) :
    K × K × K :=
  if r then (t.2.1, k*t.2.2*t.2.1-t.1, t.2.2)
  else (t.1, k*t.1*t.2.1-t.2.2, t.2.1)

theorem values_advance_2d1 {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2) {f : Frame} (hi : FrameIndices f)
    (r : Bool) :
    values2d1 φ x y (advance f r) =
      vieta2d1 ((x^2+y^2+1)/(x*y)) (values2d1 φ x y f) r := by
  cases r
  · exact congrArg (fun m => (laurent2d1 φ x y f.lo, m, laurent2d1 φ x y f.mid))
      (laurent_advance_left_2d1 φ x y hx hy hu hv hi)
  · exact congrArg (fun m => (laurent2d1 φ x y f.mid, m, laurent2d1 φ x y f.hi))
      (laurent_advance_right_2d1 φ x y hx hy hu hv hi)

theorem values_fold_2d1 {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2) (path : List Bool)
    (f : Frame) (hi : FrameIndices f) :
    values2d1 φ x y (path.foldl advance f) =
      path.foldl (vieta2d1 ((x^2+y^2+1)/(x*y))) (values2d1 φ x y f) := by
  induction path generalizing f with
  | nil => rfl
  | cons r rs ih =>
    simp only [List.foldl_cons]
    rw [ih (advance f r) (indices_advance hi r),
      values_advance_2d1 φ x y hx hy hu hv hi r]

theorem values_initial_2d1 {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2) :
    values2d1 φ x y initial =
      (x, ((x^2+y^2)^2+x^2)/y, x^2+y^2) := by
  simp only [values2d1, laurent2d1, denom2d1, initial, map_one, map_add,
    map_pow, hu, hv, pow_zero, pow_one, one_mul]
  apply Prod.ext
  · field_simp
  · apply Prod.ext <;> field_simp <;> ring

theorem values_frame_2d1 {K : Type*} [Field K]
    (φ : BiPoly →+* K) (x y : K) (hx : x ≠ 0) (hy : y ≠ 0)
    (hu : φ U = x^2) (hv : φ V = y^2) (path : List Bool) :
    values2d1 φ x y (frame path) =
      path.foldl (vieta2d1 ((x^2+y^2+1)/(x*y)))
        (x, ((x^2+y^2)^2+x^2)/y, x^2+y^2) := by
  rw [frame, values_fold_2d1 φ x y hx hy hu hv path initial indices_initial,
    values_initial_2d1 φ x y hx hy hu hv]

def squaredEval2d1 {K : Type*} [Field K] (x y : K) : BiPoly →+* K :=
  Polynomial.eval₂RingHom
    (Polynomial.eval₂RingHom (Int.castRingHom K) (y^2)) (x^2)

theorem squaredEval_U_2d1 {K : Type*} [Field K] (x y : K) :
    squaredEval2d1 x y U = x^2 := by
  simp [squaredEval2d1, U]

theorem squaredEval_V_2d1 {K : Type*} [Field K] (x y : K) :
    squaredEval2d1 x y V = y^2 := by
  simp [squaredEval2d1, V]

theorem source_specialization_2d1 {K : Type*} [Field K]
    (x y : K) (hx : x ≠ 0) (hy : y ≠ 0) (path : List Bool) :
    values2d1 (squaredEval2d1 x y) x y (frame path) =
      path.foldl (vieta2d1 ((x^2+y^2+1)/(x*y)))
        (x, ((x^2+y^2)^2+x^2)/y, x^2+y^2) :=
  values_frame_2d1 _ x y hx hy (squaredEval_U_2d1 x y)
    (squaredEval_V_2d1 x y) path

#print axioms denom_ne_zero_2d1
#print axioms denom_mid_2d1
#print axioms map_weight_2d1
#print axioms normalized_step_2d1
#print axioms laurent_advance_right_2d1
#print axioms laurent_advance_left_2d1
#print axioms values_advance_2d1
#print axioms values_fold_2d1
#print axioms values_initial_2d1
#print axioms values_frame_2d1
#print axioms squaredEval_U_2d1
#print axioms squaredEval_V_2d1
#print axioms source_specialization_2d1
end
end MathGKM.Markov
