import MathGKM.Accepted54255e349b93aabd9e655107

/-! Machine-authored 2026-10-19, round 1. Support and coefficient transport only. -/
namespace MathGKM.Markov
noncomputable section

def DegreeBound (P : BiPoly) (d : ℕ) : Prop :=
  ∀ i j, coeff P i j ≠ 0 → i + j ≤ d

theorem bound_mono {P : BiPoly} {d e : ℕ} (h : DegreeBound P d) (he : d ≤ e) :
    DegreeBound P e := fun i j hij => (h i j hij).trans he

theorem bound_add {P Q : BiPoly} {d : ℕ} (hP : DegreeBound P d)
    (hQ : DegreeBound Q d) : DegreeBound (P + Q) d := by
  intro i j hij
  by_contra h
  have hp : coeff P i j = 0 := by contrapose! h; exact hP i j h
  have hq : coeff Q i j = 0 := by contrapose! h; exact hQ i j h
  have hz : coeff P i j + coeff Q i j = 0 := by rw [hp, hq]; rfl
  exact hij (by simpa only [coeff, Polynomial.coeff_add] using hz)

theorem bound_sub {P Q : BiPoly} {d : ℕ} (hP : DegreeBound P d)
    (hQ : DegreeBound Q d) : DegreeBound (P - Q) d := by
  intro i j hij
  by_contra h
  have hp : coeff P i j = 0 := by contrapose! h; exact hP i j h
  have hq : coeff Q i j = 0 := by contrapose! h; exact hQ i j h
  exact hij (by simpa [coeff] using sub_eq_zero.mpr (hp.trans hq.symm))

theorem bound_mul {P Q : BiPoly} {d e : ℕ} (hP : DegreeBound P d)
    (hQ : DegreeBound Q e) : DegreeBound (P * Q) (d + e) := by
  classical
  intro i j hij
  by_contra h
  apply hij
  simp only [coeff, Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  have hab' := Finset.HasAntidiagonal.mem_antidiagonal.mp hab
  have hcd' := Finset.HasAntidiagonal.mem_antidiagonal.mp hcd
  by_cases hp : coeff P ab.1 cd.1 = 0
  · simp [coeff] at hp
    simp [hp]
  · by_cases hq : coeff Q ab.2 cd.2 = 0
    · simp [coeff] at hq
      simp [hq]
    · have := hP ab.1 cd.1 hp
      have := hQ ab.2 cd.2 hq
      omega

theorem bound_one : DegreeBound 1 0 := by
  intro i j h
  by_cases hi : i = 0 <;> by_cases hj : j = 0 <;>
    simp_all [coeff, Polynomial.coeff_one, eq_comm]

theorem bound_U : DegreeBound U 1 := by
  intro i j h
  by_cases hi : i = 1 <;> by_cases hj : j = 0 <;>
    simp_all [coeff, U, Polynomial.coeff_X, Polynomial.coeff_one, eq_comm]

theorem bound_V : DegreeBound V 1 := by
  intro i j h
  by_cases hi : i = 0 <;> by_cases hj : j = 1 <;>
    simp_all [coeff, V, Polynomial.coeff_X, Polynomial.coeff_C, eq_comm]

theorem bound_pow {P : BiPoly} {d : ℕ} (h : DegreeBound P d) (n : ℕ) :
    DegreeBound (P ^ n) (n*d) := by
  induction n with
  | zero => simpa using bound_one
  | succ n ih => simpa [pow_succ, Nat.succ_mul] using bound_mul ih h

theorem bound_S : DegreeBound S 1 :=
  bound_add (bound_add bound_U bound_V) (bound_mono bound_one (by omega))

def LabelBound (L : Label) : Prop := DegreeBound L.p (L.a + L.b - 1)
def FrameBound (f : Frame) : Prop := LabelBound f.lo ∧ LabelBound f.mid ∧ LabelBound f.hi

theorem initial_bound : FrameBound initial := by
  refine ⟨bound_one, ?_, bound_add bound_U bound_V⟩
  exact bound_add (bound_pow (bound_add bound_U bound_V) 2)
    (bound_mono bound_U (by decide))

theorem advance_bound (f : Frame) (hf : FareyFrame f) (hp : FrameBound f) (r : Bool) :
    FrameBound (advance f r) := by
  rcases hf with ⟨⟨ha, hb⟩, hd, hl, hh, hla, hha⟩
  rcases hp with ⟨hlo, hmid, hhi⟩
  cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte, FrameBound, LabelBound]
  · refine ⟨hlo, bound_sub ?_ ?_, hmid⟩
    · apply bound_mono (bound_mul (bound_mul bound_S hlo) hmid)
      omega
    · apply bound_mono (bound_mul (bound_mul (bound_pow bound_U f.lo.a)
        (bound_pow bound_V f.lo.b)) hhi)
      omega
  · refine ⟨hmid, bound_sub ?_ ?_, hhi⟩
    · apply bound_mono (bound_mul (bound_mul bound_S hhi) hmid)
      omega
    · apply bound_mono (bound_mul (bound_mul (bound_pow bound_U f.hi.a)
        (bound_pow bound_V f.hi.b)) hlo)
      omega

theorem frame_bound (p : List Bool) : FrameBound (frame p) := by
  induction p using List.reverseRecOn with
  | nil => exact initial_bound
  | append_singleton p r ih =>
    simpa [frame_append] using advance_bound (frame p)
      (Accepted54255e349b93aabd9e655107.obligation p).1 ih r

#print axioms frame_bound

theorem frame_support (p : List Bool) :
    ∀ L ∈ [(frame p).lo, (frame p).mid, (frame p).hi],
      ∀ i j, coeff L.p i j ≠ 0 → i+j ≤ L.a+L.b-1 := by
  intro L hL
  have hb := frame_bound p
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hL
  rcases hL with rfl | rfl | rfl
  · exact hb.1
  · exact hb.2.1
  · exact hb.2.2

#print axioms frame_support
end
end MathGKM.Markov
