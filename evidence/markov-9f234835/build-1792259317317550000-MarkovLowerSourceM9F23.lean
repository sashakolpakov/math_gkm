import MarkovLowerParameterM9F23
import MarkovUpperVerticalResidualMF88
/-! Machine-authored 9f234835. Exact all-column lower diagonal source transport,
including small columns and degree-zero tails. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
attribute [local irreducible] threeRawM9E2

theorem source_lower_diagonalM9F23 (q i j : ℕ) (r : Bool) (hj : j+2 ≤ q) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 have hq : 1 ≤ q := by omega
 by_cases hi : i ≤ 2
 · rw [source_three_low_zeroME9C q i (j+2) r hq hi hj,zero_mul]
   exact sq_nonneg _
 by_cases hi3 : i=3
 · subst i
   exact (source_first_diagonalM468 q j r hj).le
 by_cases hn : i+j ≤ sourceNME9C q r
 · let k := sourceNME9C q r-i-j
   have he : i+j+k=sourceNME9C q r := by dsimp [k]; omega
   have hbound : 3*j+7 ≤ sourceNME9C q r := by
     cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true] <;> omega
   rw [source_lower_kernelME9C q i (j+2) k r hj (by omega),
     source_lower_kernelME9C q (i+2) j k r (by omega) (by omega),
     source_lower_kernelME9C q (i+1) (j+1) k r (by omega) (by omega)]
   exact lower_kernel_diagonal_lcM9F23 i j k (by omega) (by omega)
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),zero_mul]
   exact sq_nonneg _

theorem path_lower_diagonalM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 3*(j+2) ≤ (frame path).mid.b) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : j+2 ≤ q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] at hj <;> omega
 simp only [hp]
 exact source_lower_diagonalM9F23 q i j r hjq

theorem path_lower_diagonal_polygonM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 3*(j+2) ≤ (frame path).mid.b)
 (_h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (_h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (_h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 :=
 path_lower_diagonalM9F23 path ha i j hj

def ThreeUpperTransverseM9F23 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → ¬(i=4 ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, q < j+2 →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem upper_transverse_iffM9F23 :
 ThreeUpperVerticalDiagonalMF88 ↔ ThreeUpperTransverseM9F23 := by
 constructor
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hj
   exact (h q hq r).2 i j (by omega)
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j _
   by_cases hj : j+2 ≤ q
   · exact source_lower_diagonalM9F23 q i j r hj
   · exact (h q hq r).2 i j (by omega)

theorem root_iff_upper_transverseM9F23 :
 Conjecture63 ↔ ThreeUpperTransverseM9F23 ∧ OtherFourM9E2 := by
 rw [root_iff_upper_vertical_diagonalMF88,upper_transverse_iffM9F23]

end
end MathGKM.Markov
