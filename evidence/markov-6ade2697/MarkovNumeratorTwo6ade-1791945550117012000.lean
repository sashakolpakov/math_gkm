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
  | append_singleton r path _ =>
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
    congr 2
    · omega
    · exact (fib_rec6 (n+1)).symm

theorem source_two_product6 (path : List Bool) (ha : (frame path).mid.a=2) :
    ∃ q : ℕ, 1≤q ∧ (frame path).mid.b=2*q+1 ∧
      (frame path).mid.p=S*fib6 q*fib6 (q+1)-U*V^q := by
  obtain ⟨n,rfl⟩ := source_two_path6 path ha
  refine ⟨n+1,by omega,?_,?_⟩ <;> rw [frame_append18,spine_frame6]
  · simp [advance]; omega
  · simp [advance]

#print axioms source_two_path6
#print axioms source_two_product6
end
end MathGKM.Markov
