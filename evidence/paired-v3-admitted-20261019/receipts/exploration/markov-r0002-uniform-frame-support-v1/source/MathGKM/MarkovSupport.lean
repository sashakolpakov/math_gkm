import MathGKM.MarkovCoverage

/-! Machine-authored round-0002. Uniform support bounds for the pinned frames. -/
namespace MathGKM.Markov
noncomputable section

def SupportBound (P : BiPoly) (d : ℕ) : Prop :=
  ∀ i j, d < i+j → coeff P i j = 0

namespace SupportBound
lemma mono {P : BiPoly} {d e : ℕ} (h : SupportBound P d) (he : d ≤ e) :
    SupportBound P e := by
  intro i j hij
  exact h i j (lt_of_le_of_lt he hij)
lemma one : SupportBound 1 0 := by
  intro i j h
  by_cases hi : i = 0 <;> by_cases hj : j = 0 <;>
    simp_all [coeff, Polynomial.coeff_one]
lemma u : SupportBound U 1 := by
  intro i j h
  simp only [coeff, U, Polynomial.coeff_X]
  split_ifs <;> simp_all [Polynomial.coeff_one] <;> omega
lemma v : SupportBound V 1 := by
  intro i j h
  simp only [coeff, V, Polynomial.coeff_C]
  split_ifs <;> simp_all [Polynomial.coeff_X] <;> omega
lemma add {P Q : BiPoly} {d e : ℕ} (hP : SupportBound P d)
    (hQ : SupportBound Q e) : SupportBound (P+Q) (max d e) := by
  intro i j h
  simp only [coeff, Polynomial.coeff_add]
  change coeff P i j + coeff Q i j = 0
  rw [hP i j (by omega), hQ i j (by omega), add_zero]
lemma sub {P Q : BiPoly} {d e : ℕ} (hP : SupportBound P d)
    (hQ : SupportBound Q e) : SupportBound (P-Q) (max d e) := by
  intro i j h
  change ((P-Q).coeff i).coeff j = 0
  simp only [Polynomial.coeff_sub]
  change coeff P i j - coeff Q i j = 0
  rw [hP i j (by omega), hQ i j (by omega), sub_self]
lemma mul {P Q : BiPoly} {d e : ℕ} (hP : SupportBound P d)
    (hQ : SupportBound Q e) : SupportBound (P*Q) (d+e) := by
  intro i j h
  simp only [coeff, Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  have hab' := Finset.HasAntidiagonal.mem_antidiagonal.mp hab
  have hcd' := Finset.HasAntidiagonal.mem_antidiagonal.mp hcd
  change coeff P ab.1 cd.1 * coeff Q ab.2 cd.2 = 0
  by_cases hp : d < ab.1 + cd.1
  · rw [hP ab.1 cd.1 hp, zero_mul]
  · rw [hQ ab.2 cd.2 (by omega), mul_zero]
lemma pow {P : BiPoly} {d : ℕ} (hP : SupportBound P d) (n : ℕ) :
    SupportBound (P^n) (n*d) := by
  induction n with
  | zero => simpa using one
  | succ n ih => simpa [pow_succ, Nat.succ_mul] using ih.mul hP
lemma s : SupportBound S 1 := by
  simpa [S] using (u.add v).add one
end SupportBound

def LabelBound (l : Label) : Prop := SupportBound l.p (l.a+l.b-1)
def FrameBound (f : Frame) : Prop :=
  LabelBound f.lo ∧ LabelBound f.mid ∧ LabelBound f.hi

lemma initial_bound : FrameBound initial := by
  refine ⟨?_, ?_, ?_⟩
  · exact SupportBound.one
  · exact ((SupportBound.u.add SupportBound.v).pow 2).add SupportBound.u
  · exact SupportBound.u.add SupportBound.v

lemma advance_bound (f : Frame) (hi : FrameInvariant f) (hb : FrameBound f) (r : Bool) :
    FrameBound (advance f r) := by
  rcases hb with ⟨hl, hm, hh⟩
  have ha := hi.sum_a
  have hbb := hi.sum_b
  have hp := hi.lo_pos
  have hq := hi.hi_pos
  cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte, FrameBound]
  · refine ⟨hl, ?_, hm⟩
    have h1 := (SupportBound.s.mul hl).mul hm
    have h2 := ((SupportBound.u.pow f.lo.a).mul (SupportBound.v.pow f.lo.b)).mul hh
    apply (h1.sub h2).mono
    simp only [LabelBound] at *
    simp only [Nat.mul_one]
    omega
  · refine ⟨hm, ?_, hh⟩
    have h1 := (SupportBound.s.mul hh).mul hm
    have h2 := ((SupportBound.u.pow f.hi.a).mul (SupportBound.v.pow f.hi.b)).mul hl
    apply (h1.sub h2).mono
    simp only [LabelBound] at *
    simp only [Nat.mul_one]
    omega

theorem frame_support_bound (path : List Bool) : FrameBound (frame path) := by
  induction path using List.reverseRecOn with
  | nil => exact initial_bound
  | append_singleton p r ih =>
      simpa only [frame, List.foldl_append, List.foldl_cons, List.foldl_nil] using
        advance_bound (frame p) (frame_invariant p) ih r

theorem all_frame_coeff_zero (path : List Bool) :
    (∀ i j, (frame path).lo.a + (frame path).lo.b - 1 < i+j →
      coeff (frame path).lo.p i j = 0) ∧
    (∀ i j, (frame path).mid.a + (frame path).mid.b - 1 < i+j →
      coeff (frame path).mid.p i j = 0) ∧
    (∀ i j, (frame path).hi.a + (frame path).hi.b - 1 < i+j →
      coeff (frame path).hi.p i j = 0) := frame_support_bound path
end
end MathGKM.Markov
