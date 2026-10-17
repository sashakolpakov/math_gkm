import MarkovUpperLowCertificateM9F23
/-! Machine-authored 9f234835. The exceptional parameter-zero upper diagonal
is handled by a complete polynomial identity, not the false parameter minor. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem lower_zero_upper_diagonalM9F23 (j k : ℕ) (hj : k+3 ≤ j) :
 lowerDiagMF88 0 (j+2) k*lowerDiagMF88 2 j k ≤ lowerDiagMF88 1 (j+1) k^2 := by
 let h := j-k-3
 have he : j=k+h+3 := by dsimp [h]; omega
 have hs := upper_low_mass_lcM9F23 h k
 have hh : (topMassME10 (h+4) k 0:ℝ)*(topMassME10 h (k+2) 2:ℝ) ≤
   (topMassME10 (h+2) (k+1) 1:ℝ)^2 := by exact_mod_cast hs
 rw [top_mass_diagonalM9F23 (h+4) k 0 (by omega),
   top_mass_diagonalM9F23 h (k+2) 2 (by omega),
   top_mass_diagonalM9F23 (h+2) (k+1) 1 (by omega)] at hh
 convert hh using 1 <;> congr 2 <;> omega

theorem source_upper_diagonal_threeM9F23 (q j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : sourceNME9C q r ≤ j+q) :
 threeRawM9E2 q r 3 (j+2)*threeRawM9E2 q r 5 j ≤
 threeRawM9E2 q r 4 (j+1)^2 := by
 have hn : 3*q+1 ≤ sourceNME9C q r := by
   cases r <;> simp [sourceNME9C] <;> omega
 by_cases hd : 3+j ≤ sourceNME9C q r
 · have h := lower_zero_upper_diagonalM9F23 j (sourceNME9C q r-3-j) (by omega)
   have h0 := source_upper_diagonal_modelM9F23 q 3 (j+2) r hq (by omega) (by omega) (by omega)
   have h1 := source_upper_diagonal_modelM9F23 q 4 (j+1) r hq (by omega) (by omega) (by omega)
   have h2 := source_upper_diagonal_modelM9F23 q 5 j r hq (by omega) hj (by omega)
   rw [show sourceNME9C q r+2-3-(j+2)=sourceNME9C q r-3-j by omega] at h0
   rw [show sourceNME9C q r+2-4-(j+1)=sourceNME9C q r-3-j by omega] at h1
   rw [show sourceNME9C q r+2-5-j=sourceNME9C q r-3-j by omega] at h2
   norm_num only [Nat.reduceSub] at h0 h1 h2
   rw [←h0,←h1,←h2] at h
   exact_mod_cast h
 · rw [three_raw_degreeME9C q 3 (j+2) r hq (by omega),zero_mul]
   exact sq_nonneg _

theorem source_upper_diagonal_ge_threeM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : 3 ≤ i) (hj : sourceNME9C q r ≤ j+q) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases h : i=3
 · subst i; exact source_upper_diagonal_threeM9F23 q j r hq hj
 · exact source_upper_diagonalM9F23 q i j r hq (by omega) hj

theorem path_upper_diagonal_ge_threeM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hi : 3 ≤ i) (hj : 2*(frame path).mid.b+2 ≤ 3*j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : sourceNME9C q r ≤ j+q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 simp only [hp]
 exact source_upper_diagonal_ge_threeM9F23 q i j r hq hi hjq

def ThreeMiddleLowTransverseM9F23 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, q < j+2 → (j+q < sourceNME9C q r ∨ i ≤ 2) →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem middle_low_transverse_iffM9F23 :
 ThreeMiddleTransverseM9F23 ↔ ThreeMiddleLowTransverseM9F23 := by
 constructor
 · intro h q hq r
   exact ⟨(h q hq r).1,fun i j hj he => (h q hq r).2 i j hj (by omega)⟩
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hj he
   by_cases ht : sourceNME9C q r ≤ j+q ∧ 3 ≤ i
   · exact source_upper_diagonal_ge_threeM9F23 q i j r hq ht.2 ht.1
   · exact (h q hq r).2 i j hj (by omega)

theorem root_iff_middle_low_transverseM9F23 :
 Conjecture63 ↔ ThreeMiddleLowTransverseM9F23 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_transverseM9F23,middle_low_transverse_iffM9F23]

end
end MathGKM.Markov
