import MarkovLowSourceME9C
/-! Machine-authored e9cdd527. Unconditional lower fourth-column source LC.
The remainder of the column, all other unresolved directions and numerators
are not asserted here. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_low_four_candidateME9C (q j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hj : j ≤ q) :
 (threeRawM9E2 q r 4 j:ℚ)=lowerCandidateM96A q j (if r then 0 else 1) := by
 rw [source_low_fourME9C q r hq j hj]
 have he : (sourceNME9C q r:ℚ)=3*(q:ℚ)+(if r then 1 else 2) := by
   cases r <;> simp [sourceNME9C]
 rw [he,low_four_candidateME9C]

theorem lower_candidate_strictME9C (q x c : ℚ)
 (hx : 0 ≤ x) (hq : x+2 ≤ q) (hc : 0 ≤ c) :
 lowerCandidateM96A q x c*lowerCandidateM96A q (x+2) c <
 lowerCandidateM96A q (x+1) c^2 := by
 have hd : 0 ≤ q-x-2 := by linarith
 have hg : 0 < lowerGapM96A x (q-x-2) c := by
   unfold lowerGapM96A; positivity
 have hi := lower_gap_identityM96A x (q-x-2) c
 have he : x+(q-x-2)+2=q := by ring
 rw [he] at hi
 have hf : 0 < (x+2)*(x+3)^2*(x+4)^2*(x+5) := by positivity
 have hmul := mul_pos hf hg
 rw [←hi] at hmul
 unfold lowerCandidateM96A
 nlinarith only [hmul]

theorem three_low_four_strictME9C (q j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r 4 j*threeRawM9E2 q r 4 (j+2) < threeRawM9E2 q r 4 (j+1)^2 := by
 have hq : 1 ≤ q := by omega
 have h := lower_candidate_strictME9C (q:ℚ) (j:ℚ) (if r then 0 else 1)
   (by positivity) (by exact_mod_cast hj) (by cases r <;> norm_num)
 have h0 := source_low_four_candidateME9C q j r hq (by omega)
 have h1 := source_low_four_candidateME9C q (j+1) r hq (by omega)
 have h2 := source_low_four_candidateME9C q (j+2) r hq hj
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 rw [←h0,←h1,←h2] at h
 exact_mod_cast h

theorem source_low_four_verticalME9C (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
   (∀ j, j ≤ q → (coeff (frame path).mid.p 4 j:ℚ)=
     lowerCandidateM96A q j (if r then 0 else 1)) ∧
   (∀ j, j+2 ≤ q → coeff (frame path).mid.p 4 j*coeff (frame path).mid.p 4 (j+2) <
     coeff (frame path).mid.p 4 (j+1)^2) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_,?_⟩
 · intro j hj
   rw [hp]
   exact source_low_four_candidateME9C q j r hq hj
 · intro j hj
   simp only [hp]
   exact three_low_four_strictME9C q j r hj

end
end MathGKM.Markov
