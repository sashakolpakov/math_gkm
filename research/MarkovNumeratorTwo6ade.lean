import MarkovRemaining6ade

/-! Machine-authored request 6ade2697. Exact numerator-two classification
and product representation. No new LC assertion for numerator two. -/
namespace MathGKM.Markov
noncomputable section

theorem indices_lo_positive6 {f : Frame} (h : FrameIndices f) (ha : 2≤f.mid.a) :
    0 < f.lo.a := by
  obtain ⟨hm,_,hd,hlb,_,_,_,_⟩ := h
  by_contra hz
  have he : f.lo.a=0 := by omega
  rw [he] at hm hd
  simp only [zero_add,zero_mul] at hm hd
  have hhi : 2≤f.hi.a := by omega
  nlinarith

theorem source_two_path6 (path : List Bool) (ha : (frame path).mid.a=2) :
    ∃ n, path=List.replicate n false++[true] := by
  induction path using List.reverseRecOn with
  | nil => simp [frame,initial] at ha
  | append_singleton path r _ =>
    rw [frame_append18] at ha
    have hi := indices_frame path
    have hp := (frame_reduced path).1
    have hm : (frame path).mid.a=1 := by
      by_contra h
      have hl := indices_lo_positive6 hi (by omega)
      have hh := hi.2.2.2.2.2.1
      cases r <;> simp only [advance,Bool.false_eq_true,if_false,if_true] at ha <;> omega
    have hh := hi.2.2.2.2.2.1
    have hl : (frame path).lo.a=0 := by have := hi.1; omega
    cases r
    · simp [advance,hm,hl] at ha
    · obtain ⟨n,hn⟩ := source_one_spine274 path hm
      exact ⟨n,by rw [hn]⟩

theorem spine_frame6 (n : ℕ) : frame (List.replicate n false)=
    ⟨⟨0,1,1⟩,⟨1,n+2,fib6 (n+2)⟩,⟨1,n+1,fib6 (n+1)⟩⟩ := by
  induction n with
  | zero => simp [frame,initial,fib_one6,fib_two6]
  | succ n ih =>
    rw [List.replicate_succ',frame_append18,ih]
    simp only [advance,Bool.false_eq_true,if_false,Nat.zero_add,pow_zero,pow_one,
      mul_one,one_mul]
    rw [show 1+(n+2)=n+1+2 by omega,show n+2=n+1+1 by omega,
      ← fib_rec6 (n+1)]

theorem source_two_product6 (path : List Bool) (ha : (frame path).mid.a=2) :
    ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
      (frame path).mid.p=S*fib6 q*fib6 (q+1)-U*V^q := by
  obtain ⟨n,rfl⟩ := source_two_path6 path ha
  refine ⟨n+1,by omega,?_,?_⟩ <;> rw [frame_append18,spine_frame6]
  · simp [advance]; omega
  · simp [advance]

theorem two_removed_outside6 (q i j : ℕ) (hp : InPolygon 2 (2*q+1) i j) :
    coeff (U*V^q) i j=0 := by
  by_cases hi : i=1
  · subst i
    have hj : j≠q := by
      intro he; subst j
      have := hp.1
      nlinarith
    simp [coeff,U,V,← map_pow,Polynomial.coeff_mul_C,Polynomial.coeff_X,hj]
  · simp [coeff,U,V,← map_pow,Polynomial.coeff_mul_C,Polynomial.coeff_X,hi,Ne.symm hi]

/-- A sufficient exact next-subfamily target. Its product hypothesis is
unproved and cannot be replaced by arbitrary-product log-concavity. -/
theorem source_two_of_product6
    (h : ∀ q : ℕ, 1≤q → GlobalLC18 (S*fib6 q*fib6 (q+1)))
    (path : List Bool) (ha : (frame path).mid.a=2) :
    WeakLC (frame path).mid.a (frame path).mid.b (frame path).mid.p := by
  obtain ⟨q,hq,hb,he⟩ := source_two_product6 path ha
  rw [ha,hb,he]
  have hc (i j : ℕ) (hp : InPolygon 2 (2*q+1) i j) :
      coeff (S*fib6 q*fib6 (q+1)-U*V^q) i j=coeff (S*fib6 q*fib6 (q+1)) i j := by
    change ((S*fib6 q*fib6 (q+1)-U*V^q).coeff i).coeff j=_
    rw [Polynomial.coeff_sub,Polynomial.coeff_sub]
    change coeff (S*fib6 q*fib6 (q+1)) i j-coeff (U*V^q) i j=_
    rw [two_removed_outside6 q i j hp,sub_zero]
  obtain ⟨hh,hv,hd⟩ := h q hq
  constructor
  · intro i j h0 h1 h2; rw [hc _ _ h0,hc _ _ h1,hc _ _ h2]; exact hh i j
  constructor
  · intro i j h0 h1 h2; rw [hc _ _ h0,hc _ _ h1,hc _ _ h2]; exact hv i j
  · intro i j h0 h1 h2; rw [hc _ _ h0,hc _ _ h1,hc _ _ h2]; exact hd i j

#print axioms source_two_path6
#print axioms source_two_product6
#print axioms source_two_of_product6
end
end MathGKM.Markov
