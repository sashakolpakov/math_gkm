import MathGKM.Markov

namespace MathGKM.Markov

def FrameIndices (f : Frame) : Prop :=
  f.mid.a = f.lo.a+f.hi.a ∧ f.mid.b = f.lo.b+f.hi.b ∧
  f.hi.a*f.lo.b = f.lo.a*f.hi.b+1 ∧
  0 < f.lo.b ∧ 0 < f.hi.b ∧ 0 < f.hi.a ∧
  f.lo.a < f.lo.b ∧ f.hi.a ≤ f.hi.b

theorem indices_initial : FrameIndices initial := by
  norm_num [FrameIndices, initial]

theorem indices_advance {f : Frame} (h : FrameIndices f) (r : Bool) :
    FrameIndices (advance f r) := by
  obtain ⟨hma,hmb,hd,hlb,hrb,hra,hlo,hhi⟩ := h
  cases r <;> simp only [FrameIndices, advance, Bool.false_eq_true, if_false, if_true]
  · refine ⟨trivial,trivial,?_,hlb,?_,?_,hlo,?_⟩
    all_goals simp only [hma,hmb]; first | omega | nlinarith
  · refine ⟨trivial,trivial,?_,?_,hrb,hra,?_,hhi⟩
    all_goals simp only [hma,hmb]; first | omega | nlinarith

theorem indices_fold (path : List Bool) (f : Frame) (h : FrameIndices f) :
    FrameIndices (path.foldl advance f) := by
  induction path generalizing f with
  | nil => exact h
  | cons r rs ih => exact ih (advance f r) (indices_advance h r)

theorem indices_frame (path : List Bool) : FrameIndices (frame path) :=
  indices_fold path initial indices_initial

theorem coprime_of_det {a b c d : ℕ} (h : c*b=a*d+1) : Nat.Coprime a b := by
  apply Nat.coprime_iff_gcd_eq_one.mpr
  apply Nat.dvd_one.mp
  have h1 : Nat.gcd a b ∣ c*b := dvd_mul_of_dvd_right (Nat.gcd_dvd_right a b) c
  have h2 : Nat.gcd a b ∣ a*d := dvd_mul_of_dvd_left (Nat.gcd_dvd_left a b) d
  rw [h] at h1
  exact (Nat.dvd_add_iff_right h2).mpr h1

/-- Every generated interior label really is a reduced fraction in (0,1). -/
theorem frame_reduced (path : List Bool) :
    0 < (frame path).mid.a ∧ (frame path).mid.a < (frame path).mid.b ∧
      Nat.Coprime (frame path).mid.a (frame path).mid.b := by
  obtain ⟨hma,hmb,hd,hlb,hrb,hra,hlo,hhi⟩ := indices_frame path
  refine ⟨by omega,by omega,?_⟩
  apply coprime_of_det (c := (frame path).hi.a) (d := (frame path).hi.b)
  nlinarith

end MathGKM.Markov
