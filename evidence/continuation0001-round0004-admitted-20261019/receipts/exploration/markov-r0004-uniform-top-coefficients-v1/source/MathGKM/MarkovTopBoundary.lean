import MathGKM.MarkovSupport

/-! Machine-authored round-0004. Strict total-degree remainders. -/
namespace MathGKM.Markov
noncomputable section

def Below (P : BiPoly) (d : ℕ) : Prop :=
  ∀ i j, d ≤ i+j → coeff P i j = 0

namespace Below
lemma mono {P : BiPoly} {d e : ℕ} (h : Below P d) (he : d ≤ e) : Below P e :=
  fun i j hij => h i j (he.trans hij)
lemma add {P Q : BiPoly} {d : ℕ} (hp : Below P d) (hq : Below Q d) :
    Below (P+Q) d := by
  intro i j h
  simp only [coeff, Polynomial.coeff_add]
  change coeff P i j + coeff Q i j = 0
  rw [hp i j h, hq i j h, add_zero]
lemma mul {P Q : BiPoly} {d e : ℕ} (hp : Below P d) (hq : SupportBound Q e) :
    Below (P*Q) (d+e) := by
  intro i j h
  simp only [coeff, Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  have ha := Finset.HasAntidiagonal.mem_antidiagonal.mp hab
  have hc := Finset.HasAntidiagonal.mem_antidiagonal.mp hcd
  change coeff P ab.1 cd.1 * coeff Q ab.2 cd.2 = 0
  by_cases hd : d ≤ ab.1 + cd.1
  · rw [hp _ _ hd, zero_mul]
  · rw [hq _ _ (by omega), mul_zero]
lemma of_bound {P : BiPoly} {d e : ℕ} (hp : SupportBound P e) (h : e < d) :
    Below P d := fun i j hij => hp i j (by omega)
end Below

def TopForm (P : BiPoly) (d : ℕ) : Prop := Below (P-(U+V)^d) d

lemma topForm_mul {P Q : BiPoly} {d e : ℕ}
    (hp : TopForm P d) (hq : TopForm Q e) (hb : SupportBound Q e) :
    TopForm (P*Q) (d+e) := by
  have ht : SupportBound ((U+V)^d) d := by
    simpa using (SupportBound.u.add SupportBound.v).pow d
  have h1 := hp.mul hb
  have h2 := hq.mul ht
  rw [mul_comm, Nat.add_comm] at h2
  have he : P*Q-(U+V)^(d+e) = (P-(U+V)^d)*Q + (U+V)^d*(Q-(U+V)^e) := by
    rw [pow_add]; ring
  unfold TopForm
  rw [he]
  exact h1.add h2

lemma topForm_sub {P Q : BiPoly} {d : ℕ} (hp : TopForm P d) (hq : Below Q d) :
    TopForm (P-Q) d := by
  intro i j h
  have he : P-Q-(U+V)^d = (P-(U+V)^d)-Q := by ring
  rw [he]
  simp only [coeff, Polynomial.coeff_sub]
  have hh := hp i j h
  change ((P-(U+V)^d).coeff i).coeff j = 0 at hh
  simp only [Polynomial.coeff_sub] at hh
  change coeff P i j - coeff ((U+V)^d) i j - coeff Q i j = 0
  change coeff P i j - coeff ((U+V)^d) i j = 0 at hh
  rw [hh, hq i j h, sub_zero]

lemma topForm_s : TopForm S 1 := by
  have he : S-(U+V)^1 = 1 := by simp [S]
  unfold TopForm
  rw [he]
  exact Below.of_bound SupportBound.one (by omega)

def LabelTop (l : Label) : Prop := TopForm l.p (l.a+l.b-1)
def FrameTop (f : Frame) : Prop := LabelTop f.lo ∧ LabelTop f.mid ∧ LabelTop f.hi

lemma initial_top : FrameTop initial := by
  refine ⟨?_, ?_, ?_⟩
  · intro i j h
    simp [initial, coeff]
  · change Below (((U+V)^2+U)-(U+V)^2) 2
    rw [add_sub_cancel_left]
    exact Below.of_bound SupportBound.u (by omega)
  · intro i j h
    simp [initial, coeff]

lemma advance_top (f : Frame) (hi : FrameInvariant f) (hb : FrameBound f)
    (ht : FrameTop f) (r : Bool) : FrameTop (advance f r) := by
  rcases hb with ⟨bl, bm, bh⟩
  rcases ht with ⟨tl, tm, th⟩
  have ha := hi.sum_a
  have hbb := hi.sum_b
  have hp := hi.lo_pos
  have hq := hi.hi_pos
  cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte, FrameTop]
  · refine ⟨tl, ?_, tm⟩
    have h1 := topForm_mul (topForm_mul topForm_s tl bl) tm bm
    have h2 := ((SupportBound.u.pow f.lo.a).mul (SupportBound.v.pow f.lo.b)).mul bh
    change TopForm _ _
    apply topForm_sub
    · convert h1 using 1 <;> simp only [LabelTop] at * <;> congr 1 <;> omega
    · apply Below.of_bound h2
      simp only [LabelBound, Nat.mul_one] at *
      omega
  · refine ⟨tm, ?_, th⟩
    have h1 := topForm_mul (topForm_mul topForm_s th bh) tm bm
    have h2 := ((SupportBound.u.pow f.hi.a).mul (SupportBound.v.pow f.hi.b)).mul bl
    change TopForm _ _
    apply topForm_sub
    · convert h1 using 1 <;> simp only [LabelTop] at * <;> congr 1 <;> omega
    · apply Below.of_bound h2
      simp only [LabelBound, Nat.mul_one] at *
      omega

theorem frame_top (path : List Bool) : FrameTop (frame path) := by
  induction path using List.reverseRecOn with
  | nil => exact initial_top
  | append_singleton p r ih =>
      simpa only [frame, List.foldl_append, List.foldl_cons, List.foldl_nil] using
        advance_top (frame p) (frame_invariant p) (frame_support_bound p) ih r

lemma binomial_boundary (d i j : ℕ) (h : i+j=d) :
    coeff ((U+V)^d) i j = (Nat.choose d i : ℤ) := by
  unfold coeff U V
  rw [Polynomial.coeff_X_add_C_pow]
  have hj : d-i=j := by omega
  rw [← Polynomial.C_eq_natCast, Polynomial.coeff_mul_C]
  simp [hj]

lemma TopForm.coefficient {P : BiPoly} {d : ℕ} (ht : TopForm P d)
    (i j : ℕ) (h : i+j=d) : coeff P i j = (Nat.choose d i : ℤ) := by
  have he := ht i j (by omega)
  change ((P-(U+V)^d).coeff i).coeff j = 0 at he
  simp only [Polynomial.coeff_sub] at he
  exact (sub_eq_zero.mp he).trans (binomial_boundary d i j h)

theorem all_frame_top_coeff (path : List Bool) :
    (∀ i j, i+j=(frame path).lo.a+(frame path).lo.b-1 →
      coeff (frame path).lo.p i j = (Nat.choose ((frame path).lo.a+(frame path).lo.b-1) i : ℤ)) ∧
    (∀ i j, i+j=(frame path).mid.a+(frame path).mid.b-1 →
      coeff (frame path).mid.p i j = (Nat.choose ((frame path).mid.a+(frame path).mid.b-1) i : ℤ)) ∧
    (∀ i j, i+j=(frame path).hi.a+(frame path).hi.b-1 →
      coeff (frame path).hi.p i j = (Nat.choose ((frame path).hi.a+(frame path).hi.b-1) i : ℤ)) := by
  have ht := frame_top path
  exact ⟨ht.1.coefficient, ht.2.1.coefficient, ht.2.2.coefficient⟩

end
end MathGKM.Markov
