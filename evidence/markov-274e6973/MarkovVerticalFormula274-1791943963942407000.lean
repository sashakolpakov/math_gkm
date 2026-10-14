import MarkovBlockCounts274

/-! Machine-authored request 274e6973. Actual source first-vertical formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem left_spine_a274 (n : ℕ) : (frame (List.replicate n false)).mid.a=1 := by
  have hv := wordPair_fold_valid774 (List.replicate n false) initial
    ([false],runBlock025 0) indices_initial wordPair_initial774
  rw [false_fold025] at hv
  have hi := (indices_frame (List.replicate n false)).1
  obtain ⟨_,_,ha,hb,_,_⟩ := hv
  simp [runBlock025,List.count_replicate] at ha hb
  change 0=(frame (List.replicate n false)).lo.a at ha
  change 1=(frame (List.replicate n false)).hi.a at hb
  omega

theorem source_a_zero274 (path : List Bool) :
    (sourceMatrix025 path).a.coeff 0=
      X^(frame path).mid.b*(X+1)^(frame path).mid.a := by
  rw [(sourceMatrix_shape025 path).1,
    show (sourceMatrix025 path).b=(frame path).mid.p from (raw_matrix18 path).symm,
    vertical_boundary_formula46]
  have ha := (frame_reduced path).1
  conv_rhs => rw [show (frame path).mid.a=(frame path).mid.a-1+1 by omega,pow_succ]
  ring

theorem source_cleared274 (path : List Bool) (ha : 2≤(frame path).mid.a) :
    ∃ q r : ℕ, 1≤q ∧ r<(frame path).mid.a ∧
      (frame path).mid.b=(frame path).mid.a*q+r ∧
      X^q*(X+1)^3*((frame path).mid.p).coeff 1=
        X^(frame path).mid.b*(X+1)^(frame path).mid.a*
          (blockH274 (frame path).mid.a r q-X^q*(X+1)) := by
  rcases source_block_counts274 path with ⟨n,he⟩ | ⟨n,z,ht,hf,hm,hza,hzb⟩
  · subst path
    rw [left_spine_a274] at ha
    omega
  · have hr : z.count true<z.length := List.count_lt_length_iff.mpr ⟨false,hf,by decide⟩
    refine ⟨n+1,z.count true,by omega,by omega,?_,?_⟩
    · simpa [hza] using hzb.symm
    · have hs := blocks_scaled274 n z
      rw [← hm,hza,source_a_zero274] at hs
      have hj := source_vertical_jet025 path ha
      rw [source_a_zero274] at hj
      linear_combination hs+X^(n+1)*(X+1)*hj

theorem source_formula274 (path : List Bool) (ha : 3≤(frame path).mid.a) :
    ∃ q r : ℕ, 1≤q ∧ r<(frame path).mid.a ∧
      (frame path).mid.b=(frame path).mid.a*q+r ∧
      ((frame path).mid.p).coeff 1=
        X^((frame path).mid.b-q)*(X+1)^((frame path).mid.a-3)*
          (blockH274 (frame path).mid.a r q-X^q*(X+1)) := by
  obtain ⟨q,r,hq,hr,hb,he⟩ := source_cleared274 path (by omega)
  refine ⟨q,r,hq,hr,hb,?_⟩
  have hqb : q≤(frame path).mid.b := by nlinarith
  have hne : (X^q*(X+1)^3 : Polynomial ℤ)≠0 :=
    mul_ne_zero (pow_ne_zero _ X_ne_zero)
      (pow_ne_zero _ (by simpa using X_add_C_ne_zero (1:ℤ)))
  apply mul_left_cancel₀ hne
  rw [he]
  have hbpow : (X : Polynomial ℤ)^(frame path).mid.b=X^q*X^((frame path).mid.b-q) := by
    rw [← pow_add,Nat.add_sub_of_le hqb]
  have hapow : (X+1 : Polynomial ℤ)^(frame path).mid.a=
      (X+1)^3*(X+1)^((frame path).mid.a-3) := by
    rw [← pow_add,Nat.add_sub_of_le ha]
  rw [hbpow,hapow]
  ring

#print axioms source_cleared274
#print axioms source_formula274
end
end MathGKM.Markov
