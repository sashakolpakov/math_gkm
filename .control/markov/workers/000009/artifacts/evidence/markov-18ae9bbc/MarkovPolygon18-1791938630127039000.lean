import MarkovWeighted18
import MathGKM.MarkovBoundary

/-! Machine-authored worker 18ae9bbc. Weighted lower-support bounds from
the positive exchange identity. No saturation or log-concavity assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem frame_nonneg18 (path : List Bool) :
    PolyNonneg16 (frame path).lo.p ∧ PolyNonneg16 (frame path).mid.p ∧
      PolyNonneg16 (frame path).hi.p := by
  have hc := raw_fold18 path initial (rawA18,rawB18) indices_initial
    raw_initial18.2 raw_initial18.1
  have hn := mat_pair_nonneg16 path (rawA18,rawB18)
    raw_generators_nonneg18.1 raw_generators_nonneg18.2
  change RawCorrect18 (frame path) _ at hc
  exact ⟨hc.1 ▸ hn.1.2.1,hc.2.1 ▸ (mat_mul_nonneg16 hn.1 hn.2).2.1,
    hc.2.2 ▸ hn.2.2.1⟩

theorem edge_nonzero18 {l : Label} (h : EdgeFormula l) : l.p≠0 := by
  intro hz
  have he := h.2
  rw [hz,map_zero] at he
  have hx : (X+1 : Polynomial ℝ) ≠ 0 := by simpa using X_add_C_ne_zero (1 : ℝ)
  exact mul_ne_zero (pow_ne_zero _ X_ne_zero) (pow_ne_zero _ hx) he.symm

theorem frame_nonzero18 (path : List Bool) :
    (frame path).lo.p≠0 ∧ (frame path).mid.p≠0 ∧ (frame path).hi.p≠0 := by
  have h := edge_fold path initial edge_initial
  exact ⟨edge_nonzero18 h.1,edge_nonzero18 h.2.1,edge_nonzero18 h.2.2⟩

theorem uni_mul18 {p q : Polynomial ℤ} (hp : UniNonneg18 p) (hq : UniNonneg18 q) :
    UniNonneg18 (p*q) := by
  intro k
  rw [coeff_mul]
  exact Finset.sum_nonneg (fun ij hij => mul_nonneg (hp _) (hq _))

theorem uni_Xpow18 (k : ℕ) : UniNonneg18 (X^k) := by
  intro j
  simp only [coeff_X_pow]
  split_ifs <;> norm_num

theorem order_exchange18 {p q r t : Polynomial ℤ} (k : ℕ)
    (hq : UniNonneg18 q) (hr : UniNonneg18 r)
    (hp0 : p≠0) (hq0 : q≠0) (hr0 : r≠0) (ht0 : t≠0)
    (he : p*t=q^2+X^k*r^2) :
    p.natTrailingDegree+t.natTrailingDegree =
      min (2*q.natTrailingDegree) (k+2*r.natTrailingDegree) := by
  have h := congrArg Polynomial.natTrailingDegree he
  have hq2 : q^2≠0 := pow_ne_zero _ hq0
  have hr2 : r^2≠0 := pow_ne_zero _ hr0
  rw [natTrailingDegree_mul hp0 ht0,
    order_add18 (by simpa [pow_two] using uni_mul18 hq hq)
      (uni_mul18 (uni_Xpow18 k) (by simpa [pow_two] using uni_mul18 hr hr))
      hq2 (mul_ne_zero (pow_ne_zero _ X_ne_zero) hr2),
    natTrailingDegree_mul (pow_ne_zero _ X_ne_zero) hr2,natTrailingDegree_X_pow,
    pow_two,pow_two,natTrailingDegree_mul hq0 hq0,natTrailingDegree_mul hr0 hr0] at h
  simpa [two_mul] using h

def FrameOrder18 (m n : ℕ) (f : Frame) : Prop :=
  (weighted18 m n f.lo.p).natTrailingDegree=min (f.lo.a*m) (f.lo.b*n) ∧
  (weighted18 m n f.mid.p).natTrailingDegree=min (f.mid.a*m) (f.mid.b*n) ∧
  (weighted18 m n f.hi.p).natTrailingDegree=min (f.hi.a*m) (f.hi.b*n)

theorem order_initial18 (m n : ℕ) : FrameOrder18 m n initial := by
  have hx := uni_Xpow18 m
  have hy := uni_Xpow18 n
  have hsum := order_add18 hx hy (pow_ne_zero _ X_ne_zero) (pow_ne_zero _ X_ne_zero)
  have hsum0 : (X^m+X^n : Polynomial ℤ) ≠0 := by
    intro h
    have hc := congrArg (fun p : Polynomial ℤ => p.eval 1) h
    norm_num at hc
  have hsumN : UniNonneg18 (X^m+X^n) := fun k => by
    rw [coeff_add]; exact add_nonneg (hx k) (hy k)
  refine ⟨?_,?_,?_⟩
  · simp [FrameOrder18,initial]
  · change (weighted18 m n ((U+V)^2+U)).natTrailingDegree = min (1*m) (2*n)
    simp only [map_add,map_pow,weighted_U18,weighted_V18]
    rw [order_add18 (by simpa [pow_two] using uni_mul18 hsumN hsumN) hx
      (pow_ne_zero _ hsum0) (pow_ne_zero _ X_ne_zero),pow_two,
      natTrailingDegree_mul hsum0 hsum0,hsum,natTrailingDegree_X_pow]
    omega
  · simpa [initial] using hsum

def WeightedGood18 (m n : ℕ) (l : Label) : Prop :=
  UniNonneg18 (weighted18 m n l.p) ∧ weighted18 m n l.p≠0

theorem weighted_frame_good18 (m n : ℕ) (path : List Bool) :
    WeightedGood18 m n (frame path).lo ∧ WeightedGood18 m n (frame path).mid ∧
      WeightedGood18 m n (frame path).hi := by
  have hn := frame_nonneg18 path
  have hz := frame_nonzero18 path
  exact ⟨⟨weighted_nonneg18 m n hn.1,weighted_nonzero18 m n hn.1 hz.1⟩,
    ⟨weighted_nonneg18 m n hn.2.1,weighted_nonzero18 m n hn.2.1 hz.2.1⟩,
    ⟨weighted_nonneg18 m n hn.2.2,weighted_nonzero18 m n hn.2.2 hz.2.2⟩⟩

theorem frame_append18 (path : List Bool) (r : Bool) :
    frame (path++[r])=advance (frame path) r := by simp [frame,List.foldl_append]

@[simp] theorem weighted_weight18 (m n : ℕ) (l : Label) :
    weighted18 m n (weight2d1 l)=X^(l.a*m+l.b*n) := by
  simp [weight2d1,← pow_mul,← pow_add,Nat.mul_comm]

theorem order_step18 (m n : ℕ) (path : List Bool)
    (h : FrameOrder18 m n (frame path)) (r : Bool) :
    FrameOrder18 m n (advance (frame path) r) := by
  have hg := weighted_frame_good18 m n path
  have hnew := (weighted_frame_good18 m n (path++[r])).2.1
  rw [frame_append18] at hnew
  have hi := indices_frame path
  obtain ⟨hl,hm,hh⟩ := h
  cases r
  · refine ⟨hl,?_,hm⟩
    have he := congrArg (weighted18 m n) (exchange_left_2d1 path)
    dsimp only at he
    simp only [map_mul,map_add,map_pow,weighted_weight18] at he
    have ho := order_exchange18 ((frame path).hi.a*m+(frame path).hi.b*n)
      hg.2.1.1 hg.1.1 hg.2.2.2 hg.2.1.2 hg.1.2 hnew.2 he
    rw [hl,hm,hh,hi.1,hi.2.1] at ho
    have ht := tropical_exchange18 ((frame path).lo.a*m) ((frame path).lo.b*n)
      ((frame path).hi.a*m) ((frame path).hi.b*n)
    simp only [Nat.add_mul] at ho
    change (weighted18 m n (advance (frame path) false).mid.p).natTrailingDegree = _
    simp only [advance,Bool.false_eq_true,if_false]
    simp only [advance,Bool.false_eq_true,if_false] at ho
    rw [hi.1,hi.2.1]
    simp only [Nat.add_mul]
    omega
  · refine ⟨hm,?_,hh⟩
    have he := congrArg (weighted18 m n) (exchange_right_2d1 path)
    dsimp only at he
    simp only [map_mul,map_add,map_pow,weighted_weight18] at he
    have ho := order_exchange18 ((frame path).lo.a*m+(frame path).lo.b*n)
      hg.2.1.1 hg.2.2.1 hg.1.2 hg.2.1.2 hg.2.2.2 hnew.2 he
    rw [hl,hm,hh,hi.1,hi.2.1] at ho
    have ht := tropical_exchange18 ((frame path).hi.a*m) ((frame path).hi.b*n)
      ((frame path).lo.a*m) ((frame path).lo.b*n)
    simp only [Nat.add_mul] at ho
    change (weighted18 m n (advance (frame path) true).mid.p).natTrailingDegree = _
    simp only [advance,if_true]
    simp only [advance,if_true] at ho
    rw [hi.1,hi.2.1]
    simp only [Nat.add_mul]
    omega

theorem weighted_orders18 (m n : ℕ) (path : List Bool) :
    FrameOrder18 m n (frame path) := by
  induction path using List.reverseRecOn with
  | nil => exact order_initial18 m n
  | append_singleton r path ih =>
    rw [frame_append18]
    exact order_step18 m n path ih r

/-- All nonzero raw coefficients lie on or above the source oblique edge. -/
theorem raw_lower_support18 (path : List Bool) (i j : ℕ)
    (hc : coeff (frame path).mid.p i j≠0) :
    (frame path).mid.a*(frame path).mid.b ≤
      (frame path).mid.b*i+(frame path).mid.a*j := by
  let a := (frame path).mid.a
  let b := (frame path).mid.b
  have hn := raw_coeff_nonneg18 path i j
  have hp : 0 < coeff (frame path).mid.p i j := lt_of_le_of_ne hn (Ne.symm hc)
  have he := weighted_coeff_le18 b a i j (raw_coeff_nonneg18 path)
  have hc' : (weighted18 b a (frame path).mid.p).coeff (b*i+a*j)≠0 := by omega
  have ho := (weighted_orders18 b a path).2.1
  have hb := natTrailingDegree_le_of_ne_zero hc'
  rw [ho] at hb
  simpa [a,b,Nat.mul_comm] using hb

/-- Exact zero outside the pinned polygon; this is containment, not saturation. -/
theorem raw_outside_polygon18 (path : List Bool) (i j : ℕ)
    (h : ¬ InPolygon (frame path).mid.a (frame path).mid.b i j) :
    coeff (frame path).mid.p i j=0 := by
  by_contra hc
  have hl := raw_lower_support18 path i j hc
  have hd := (degree_frame_21a path).2.1
  apply h
  refine ⟨hl,?_⟩
  by_contra hu
  exact hc (hd i j (by omega))

#print axioms frame_nonneg18
#print axioms frame_nonzero18
#print axioms order_exchange18
#print axioms order_initial18
#print axioms weighted_orders18
#print axioms raw_lower_support18
#print axioms raw_outside_polygon18
end
end MathGKM.Markov
