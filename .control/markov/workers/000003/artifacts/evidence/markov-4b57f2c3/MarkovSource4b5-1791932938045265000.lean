import MarkovHomogeneous21a

/-! Machine-authored worker 4b57f2c3. Literal homogeneous numerator recurrence.
No positivity or log-concavity is assumed or concluded. -/
namespace MathGKM.Markov
noncomputable section

def HU4b5 : TriPoly21a := Polynomial.X
def HV4b5 : TriPoly21a := Polynomial.C Polynomial.X
def HW4b5 : TriPoly21a := Polynomial.C (Polynomial.C Polynomial.X)

theorem homogeneous_add_4b5 {d : ℕ} {P Q : TriPoly21a}
    (hp : IsHomogeneous21a d P) (hq : IsHomogeneous21a d Q) :
    IsHomogeneous21a d (P+Q) := by
  intro i j k h
  simp only [Polynomial.coeff_add] at h
  by_cases hpi : ((P.coeff i).coeff j).coeff k = 0
  · rw [hpi, zero_add] at h
    exact hq i j k h
  · exact hp i j k hpi

theorem homogeneous_sub_4b5 {d : ℕ} {P Q : TriPoly21a}
    (hp : IsHomogeneous21a d P) (hq : IsHomogeneous21a d Q) :
    IsHomogeneous21a d (P-Q) := by
  intro i j k h
  simp only [Polynomial.coeff_sub] at h
  by_cases hpi : ((P.coeff i).coeff j).coeff k = 0
  · have hqi : ((Q.coeff i).coeff j).coeff k ≠ 0 := by
      intro hz; simp [hpi, hz] at h
    exact hq i j k hqi
  · exact hp i j k hpi

theorem homogeneous_mul_4b5 {d e : ℕ} {P Q : TriPoly21a}
    (hp : IsHomogeneous21a d P) (hq : IsHomogeneous21a e Q) :
    IsHomogeneous21a (d+e) (P*Q) := by
  intro i j k h
  by_contra hn
  apply h
  simp only [Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  apply Finset.sum_eq_zero
  intro ef hef
  have hab' : ab.1+ab.2=i := by simpa using hab
  have hcd' : cd.1+cd.2=j := by simpa using hcd
  have hef' : ef.1+ef.2=k := by simpa using hef
  by_cases hz : ((P.coeff ab.1).coeff cd.1).coeff ef.1 = 0
  · rw [hz, zero_mul]
  · have hd := hp _ _ _ hz
    have hzero : ((Q.coeff ab.2).coeff cd.2).coeff ef.2 = 0 := by
      by_contra hh
      have he := hq _ _ _ hh
      omega
    rw [hzero, mul_zero]

theorem homogeneous_one_4b5 : IsHomogeneous21a 0 (1 : TriPoly21a) := by
  intro i j k h
  by_cases hi : i = 0 <;> by_cases hj : j = 0 <;> by_cases hk : k = 0 <;>
    simp_all [Polynomial.coeff_one]

theorem homogeneous_U_4b5 : IsHomogeneous21a 1 HU4b5 := by
  intro i j k h
  by_cases hi : i = 1 <;> by_cases hj : j = 0 <;> by_cases hk : k = 0 <;>
    simp_all [HU4b5, Polynomial.coeff_X, Polynomial.coeff_one]

theorem homogeneous_V_4b5 : IsHomogeneous21a 1 HV4b5 := by
  intro i j k h
  by_cases hi : i = 0 <;> by_cases hj : j = 1 <;> by_cases hk : k = 0 <;>
    simp_all [HV4b5, Polynomial.coeff_C, Polynomial.coeff_X, Polynomial.coeff_one]

theorem homogeneous_W_4b5 : IsHomogeneous21a 1 HW4b5 := by
  intro i j k h
  by_cases hi : i = 0 <;> by_cases hj : j = 0 <;> by_cases hk : k = 1 <;>
    simp_all [HW4b5, Polynomial.coeff_C, Polynomial.coeff_X]

theorem homogeneous_pow_4b5 {d : ℕ} {P : TriPoly21a}
    (h : IsHomogeneous21a d P) (n : ℕ) : IsHomogeneous21a (d*n) (P^n) := by
  induction n with
  | zero => simpa using homogeneous_one_4b5
  | succ n ih => simpa [pow_succ, Nat.mul_succ] using homogeneous_mul_4b5 ih h

@[simp] theorem dehom_U_4b5 : dehomogenize21a HU4b5 = U := by
  simp [dehomogenize21a, HU4b5, U]
@[simp] theorem dehom_V_4b5 : dehomogenize21a HV4b5 = V := by
  simp [dehomogenize21a, HV4b5, V]
@[simp] theorem dehom_W_4b5 : dehomogenize21a HW4b5 = 1 := by
  simp [dehomogenize21a, HW4b5]

def numerator4b5 (l : Label) : TriPoly21a := homogenize21a (l.a+l.b-1) l.p

theorem numerator_homogeneous_4b5 {l : Label} (h : LabelDegree21a l) :
    IsHomogeneous21a (l.a+l.b-1) (numerator4b5 l) :=
  homogeneous_support_21a h

@[simp] theorem dehom_numerator_4b5 (l : Label) :
    dehomogenize21a (numerator4b5 l) = l.p := dehomogenize_homogenize_21a _ _

theorem source_step_right_4b5 {f : Frame} (hi : FrameIndices f)
    (hd : FrameDegree21a f) :
    numerator4b5 (advance f true).mid =
      (HU4b5+HV4b5+HW4b5) * numerator4b5 f.hi * numerator4b5 f.mid -
      HU4b5^f.hi.a * HV4b5^f.hi.b * HW4b5^(f.hi.a+f.hi.b) * numerator4b5 f.lo := by
  apply homogeneous_specialization_injective_21a
    (numerator_homogeneous_4b5 (degree_advance_21a hi hd true).2.1)
  · apply homogeneous_sub_4b5
    · have hh := homogeneous_mul_4b5 (homogeneous_mul_4b5
        (homogeneous_add_4b5 (homogeneous_add_4b5 homogeneous_U_4b5 homogeneous_V_4b5)
          homogeneous_W_4b5) (numerator_homogeneous_4b5 hd.2.2))
        (numerator_homogeneous_4b5 hd.2.1)
      convert hh using 1 <;> simp only [advance, if_true]
      obtain ⟨hma,hmb,_,hlb,hrb,_,_,_⟩ := hi
      omega
    · have hh := homogeneous_mul_4b5 (homogeneous_mul_4b5
        (homogeneous_mul_4b5 (homogeneous_pow_4b5 homogeneous_U_4b5 f.hi.a)
          (homogeneous_pow_4b5 homogeneous_V_4b5 f.hi.b))
        (homogeneous_pow_4b5 homogeneous_W_4b5 (f.hi.a+f.hi.b)))
        (numerator_homogeneous_4b5 hd.1)
      convert hh using 1 <;> simp only [advance, if_true]
      obtain ⟨hma,hmb,_,hlb,hrb,_,_,_⟩ := hi
      omega
  · simp only [map_sub, map_mul, map_add, map_pow, dehom_U_4b5, dehom_V_4b5, dehom_W_4b5, dehom_numerator_4b5, one_pow, mul_one]
    simp [advance, S]

theorem source_step_left_4b5 {f : Frame} (hi : FrameIndices f)
    (hd : FrameDegree21a f) :
    numerator4b5 (advance f false).mid =
      (HU4b5+HV4b5+HW4b5) * numerator4b5 f.lo * numerator4b5 f.mid -
      HU4b5^f.lo.a * HV4b5^f.lo.b * HW4b5^(f.lo.a+f.lo.b) * numerator4b5 f.hi := by
  apply homogeneous_specialization_injective_21a
    (numerator_homogeneous_4b5 (degree_advance_21a hi hd false).2.1)
  · apply homogeneous_sub_4b5
    · have hh := homogeneous_mul_4b5 (homogeneous_mul_4b5
        (homogeneous_add_4b5 (homogeneous_add_4b5 homogeneous_U_4b5 homogeneous_V_4b5)
          homogeneous_W_4b5) (numerator_homogeneous_4b5 hd.1))
        (numerator_homogeneous_4b5 hd.2.1)
      convert hh using 1 <;> simp only [advance, Bool.false_eq_true, if_false]
      obtain ⟨hma,hmb,_,hlb,hrb,_,_,_⟩ := hi
      omega
    · have hh := homogeneous_mul_4b5 (homogeneous_mul_4b5
        (homogeneous_mul_4b5 (homogeneous_pow_4b5 homogeneous_U_4b5 f.lo.a)
          (homogeneous_pow_4b5 homogeneous_V_4b5 f.lo.b))
        (homogeneous_pow_4b5 homogeneous_W_4b5 (f.lo.a+f.lo.b)))
        (numerator_homogeneous_4b5 hd.2.2)
      convert hh using 1 <;> simp only [advance, Bool.false_eq_true, if_false]
      obtain ⟨hma,hmb,_,hlb,hrb,_,_,_⟩ := hi
      omega
  · simp only [map_sub, map_mul, map_add, map_pow, dehom_U_4b5, dehom_V_4b5, dehom_W_4b5, dehom_numerator_4b5, one_pow, mul_one]
    simp [advance, S]

theorem source_seed_lo_4b5 : numerator4b5 initial.lo = 1 := by
  apply homogeneous_specialization_injective_21a
    (numerator_homogeneous_4b5 degree_initial_21a.1) homogeneous_one_4b5
  simp [initial]

theorem source_seed_hi_4b5 : numerator4b5 initial.hi = HU4b5+HV4b5 := by
  apply homogeneous_specialization_injective_21a
    (numerator_homogeneous_4b5 degree_initial_21a.2.2)
    (homogeneous_add_4b5 homogeneous_U_4b5 homogeneous_V_4b5)
  simp [initial]

theorem source_seed_mid_4b5 : numerator4b5 initial.mid =
    (HU4b5+HV4b5)^2 + HU4b5*HW4b5 := by
  apply homogeneous_specialization_injective_21a
    (numerator_homogeneous_4b5 degree_initial_21a.2.1)
    (homogeneous_add_4b5
      (homogeneous_pow_4b5 (homogeneous_add_4b5 homogeneous_U_4b5 homogeneous_V_4b5) 2)
      (homogeneous_mul_4b5 homogeneous_U_4b5 homogeneous_W_4b5))
  simp [initial]

abbrev SourceTriple4b5 := TriPoly21a × TriPoly21a × TriPoly21a
def liftFrame4b5 (f : Frame) : SourceTriple4b5 :=
  (numerator4b5 f.lo, numerator4b5 f.mid, numerator4b5 f.hi)
def sourceAdvance4b5 (f : Frame) (t : SourceTriple4b5) (r : Bool) : SourceTriple4b5 :=
  if r then
    (t.2.1, (HU4b5+HV4b5+HW4b5)*t.2.2*t.2.1 -
      HU4b5^f.hi.a*HV4b5^f.hi.b*HW4b5^(f.hi.a+f.hi.b)*t.1, t.2.2)
  else
    (t.1, (HU4b5+HV4b5+HW4b5)*t.1*t.2.1 -
      HU4b5^f.lo.a*HV4b5^f.lo.b*HW4b5^(f.lo.a+f.lo.b)*t.2.2, t.2.1)

theorem lift_advance_4b5 {f : Frame} (hi : FrameIndices f)
    (hd : FrameDegree21a f) (r : Bool) :
    liftFrame4b5 (advance f r) = sourceAdvance4b5 f (liftFrame4b5 f) r := by
  cases r
  · exact congrArg (fun m => (numerator4b5 f.lo, m, numerator4b5 f.mid))
      (source_step_left_4b5 hi hd)
  · exact congrArg (fun m => (numerator4b5 f.mid, m, numerator4b5 f.hi))
      (source_step_right_4b5 hi hd)

def sourcePairStep4b5 (s : Frame × SourceTriple4b5) (r : Bool) : Frame × SourceTriple4b5 :=
  (advance s.1 r, sourceAdvance4b5 s.1 s.2 r)

theorem source_fold_4b5 (path : List Bool) (f : Frame)
    (hi : FrameIndices f) (hd : FrameDegree21a f) :
    path.foldl sourcePairStep4b5 (f, liftFrame4b5 f) =
      (path.foldl advance f, liftFrame4b5 (path.foldl advance f)) := by
  induction path generalizing f with
  | nil => rfl
  | cons r rs ih =>
    simp only [List.foldl_cons, sourcePairStep4b5]
    rw [← lift_advance_4b5 hi hd r]
    exact ih _ (indices_advance hi r) (degree_advance_21a hi hd r)

def sourceSeed4b5 : SourceTriple4b5 :=
  (1, (HU4b5+HV4b5)^2+HU4b5*HW4b5, HU4b5+HV4b5)
def sourceTree4b5 (path : List Bool) : SourceTriple4b5 :=
  (path.foldl sourcePairStep4b5 (initial, sourceSeed4b5)).2

theorem source_tree_eq_4b5 (path : List Bool) :
    sourceTree4b5 path = liftFrame4b5 (frame path) := by
  have hs : sourceSeed4b5 = liftFrame4b5 initial := by
    simp [sourceSeed4b5, liftFrame4b5, source_seed_lo_4b5,
      source_seed_mid_4b5, source_seed_hi_4b5]
  unfold sourceTree4b5
  rw [hs, source_fold_4b5 path initial indices_initial degree_initial_21a]
  rfl

theorem source_raw_coeff_4b5 (path : List Bool) (i j : ℕ) :
    ((((sourceTree4b5 path).2.1).coeff i).coeff j).coeff
      ((frame path).mid.a+(frame path).mid.b-1-i-j) =
        coeff (frame path).mid.p i j := by
  rw [source_tree_eq_4b5]
  exact raw_coeff_recovered_21a _ _ _ _

#print axioms homogeneous_mul_4b5
#print axioms source_step_right_4b5
#print axioms source_step_left_4b5
#print axioms source_seed_lo_4b5
#print axioms source_seed_hi_4b5
#print axioms source_seed_mid_4b5
#print axioms source_tree_eq_4b5
#print axioms source_raw_coeff_4b5
end
end MathGKM.Markov
