import MathGKM.MarkovIndices

/-! Machine-authored worker 2d1cb040. Exact exchange identities for the pinned
recurrence. These do not assert coefficient positivity or log-concavity. -/
namespace MathGKM.Markov
noncomputable section

def weight2d1 (l : Label) : BiPoly := U ^ l.a * V ^ l.b

def ExchangeInvariant2d1 (f : Frame) : Prop :=
  f.mid.p ^ 2 + weight2d1 f.hi * f.lo.p ^ 2 +
    weight2d1 f.lo * f.hi.p ^ 2 = S * f.lo.p * f.mid.p * f.hi.p

theorem weight_mid_2d1 {f : Frame} (h : FrameIndices f) :
    weight2d1 f.mid = weight2d1 f.lo * weight2d1 f.hi := by
  unfold weight2d1
  rw [h.1, h.2.1, pow_add, pow_add]
  ring

theorem exchange_initial_2d1 : ExchangeInvariant2d1 initial := by
  unfold ExchangeInvariant2d1 weight2d1 initial S
  simp only [pow_zero, pow_one, one_mul]
  ring

theorem exchange_advance_2d1 {f : Frame} (hi : FrameIndices f)
    (h : ExchangeInvariant2d1 f) (r : Bool) :
    ExchangeInvariant2d1 (advance f r) := by
  have hw := weight_mid_2d1 hi
  unfold ExchangeInvariant2d1 at h ⊢
  cases r <;> simp only [advance, Bool.false_eq_true, if_false, if_true]
  · change (S * f.lo.p * f.mid.p - weight2d1 f.lo * f.hi.p)^2 +
      weight2d1 f.mid * f.lo.p^2 + weight2d1 f.lo * f.mid.p^2 = _
    rw [hw]
    simp only [weight2d1] at h ⊢
    linear_combination (U ^ f.lo.a * V ^ f.lo.b) * h
  · change (S * f.hi.p * f.mid.p - weight2d1 f.hi * f.lo.p)^2 +
      weight2d1 f.hi * f.mid.p^2 + weight2d1 f.mid * f.hi.p^2 = _
    rw [hw]
    simp only [weight2d1] at h ⊢
    linear_combination (U ^ f.hi.a * V ^ f.hi.b) * h

theorem exchange_fold_2d1 (path : List Bool) (f : Frame)
    (hi : FrameIndices f) (h : ExchangeInvariant2d1 f) :
    ExchangeInvariant2d1 (path.foldl advance f) := by
  induction path generalizing f with
  | nil => exact h
  | cons r rs ih =>
    exact ih (advance f r) (indices_advance hi r) (exchange_advance_2d1 hi h r)

theorem exchange_frame_2d1 (path : List Bool) :
    ExchangeInvariant2d1 (frame path) :=
  exchange_fold_2d1 path initial indices_initial exchange_initial_2d1

theorem exchange_right_2d1 (path : List Bool) :
    let f := frame path
    f.lo.p * (advance f true).mid.p =
      f.mid.p ^ 2 + weight2d1 f.lo * f.hi.p ^ 2 := by
  dsimp only
  have h := exchange_frame_2d1 path
  unfold ExchangeInvariant2d1 at h
  simp only [advance, if_true]
  change (frame path).lo.p *
    (S * (frame path).hi.p * (frame path).mid.p -
      weight2d1 (frame path).hi * (frame path).lo.p) = _
  linear_combination -h

theorem exchange_left_2d1 (path : List Bool) :
    let f := frame path
    f.hi.p * (advance f false).mid.p =
      f.mid.p ^ 2 + weight2d1 f.hi * f.lo.p ^ 2 := by
  dsimp only
  have h := exchange_frame_2d1 path
  unfold ExchangeInvariant2d1 at h
  simp only [advance, Bool.false_eq_true, if_false]
  change (frame path).hi.p *
    (S * (frame path).lo.p * (frame path).mid.p -
      weight2d1 (frame path).lo * (frame path).hi.p) = _
  linear_combination -h

#print axioms weight_mid_2d1
#print axioms exchange_initial_2d1
#print axioms exchange_advance_2d1
#print axioms exchange_fold_2d1
#print axioms exchange_frame_2d1
#print axioms exchange_right_2d1
#print axioms exchange_left_2d1
end
end MathGKM.Markov
