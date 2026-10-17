import MarkovMiddleTemplateM99A
import MarkovMiddleLocalityM99A
import MarkovMiddleSecondM99A
/-! Machine-authored 99a0f3b8. Exact source and polygon attachment.
All conclusions use the original raw integer coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 9000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem middle_gain_topM99A (q : ℕ) (r : Bool) :
 middleGainM99A q 0 r=if r then 2 else 1 := by
 cases r <;> simp [middleGainM99A,gainRowsMC3E,rowSMFFD,rowShiftMFFD,
   fib_rows_aboveMB3E,fib_rows_topMB3E,show q < q+1 by omega,show q < q+2 by omega,
   show q+1 < q+2 by omega,show 1 ≤ q+1 by omega,show 1 ≤ q+2 by omega] <;> norm_num

theorem source_middle_first_axesM99A (q : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hn : 2*(q+3) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 0 (sourceNME9C q r+2-(q+3))=0 ∧
 threeRawM9E2 q r 1 (sourceNME9C q r+2-(q+3))=0 := by
 have h := source_middle_formulaM99A q 0 r hq (by omega)
 simp only [Nat.add_zero,middleCorrectionM99A,middle_gain_topM99A] at h
 have h0 := congrArg (fun p : Polynomial ℤ => p.coeff 0) h
 have h1 := congrArg (fun p : Polynomial ℤ => p.coeff 1) h
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add] at h0 h1
 have he := top_edge_coeffsMB3E (sourceNME9C q r) (q+3) hn (by omega)
 rw [he.1] at h0
 rw [he.2.1] at h1
 cases r <;> simp [sourceNME9C] at h0 h1 ⊢ <;> push_cast at h1
   <;> constructor <;> linarith

theorem source_middle_firstM99A (q c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hn : 2*(q+3) ≤ sourceNME9C q r) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3))^2 := by
 have hh : 5 ≤ q+3 := by cases r <;> simp [sourceNME9C] at hn <;> omega
 rcases c with _|_|_|c
 · rw [(source_middle_first_axesM99A q r hq hn).1,zero_mul]
   exact sq_nonneg _
 · rw [(source_middle_first_axesM99A q r hq hn).2,zero_mul]
   exact sq_nonneg _
 · have he (i : ℕ) (hi : 2 ≤ i) := source_middle_high_coeffM99A q 0 i r hq (by omega) (by omega)
   simp only [Nat.add_zero] at he
   rw [he 2 (by omega),he 4 (by omega),he 3 (by omega)]
   exact (middle_template_second_strictM99A _ _ hn hh).le
 · have he (i : ℕ) (hi : 2 ≤ i) := source_middle_high_coeffM99A q 0 i r hq (by omega) (by omega)
   simp only [Nat.add_zero] at he
   rw [he _ (by omega),he _ (by omega),he _ (by omega)]
   apply middle_template_highM99A _ _ _ (by omega) hn (by omega)
   left; cases r <;> simp [sourceNME9C] <;> omega

theorem source_middle_wideM99A (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 9 ≤ c)
 (hlocal : k+1 < c) (hwide : 12*(q+3+k)+2 ≤ 4*sourceNME9C q r+3*c) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) ≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 rw [source_middle_high_coeffM99A q k c r hq hk hlocal,
   source_middle_high_coeffM99A q k (c+2) r hq hk (by omega),
   source_middle_high_coeffM99A q k (c+1) r hq hk (by omega)]
 exact middle_template_highM99A _ _ _ (by omega) hn (by omega) (Or.inr ⟨hc,hwide⟩)

theorem source_middle_wide_strictM99A (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 9 ≤ c)
 (hlocal : k+1 < c) (hwide : 12*(q+3+k)+2 ≤ 4*sourceNME9C q r+3*c)
 (hct : c+2 ≤ q+3+k) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k)) <
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 rw [source_middle_high_coeffM99A q k c r hq hk hlocal,
   source_middle_high_coeffM99A q k (c+2) r hq hk (by omega),
   source_middle_high_coeffM99A q k (c+1) r hq hk (by omega)]
 exact middle_template_high_strictM99A _ _ _ (by omega) hn (by omega) hct (Or.inr ⟨hc,hwide⟩)

theorem middle_polygonM99A (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hc : 3 ≤ c) (hct : c ≤ q+3+k) :
 InPolygon 3 (sourceNME9C q r) c (sourceNME9C q r+2-(q+3+k)) := by
 have hn : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
 constructor
 · have h := Nat.mul_le_mul_left (sourceNME9C q r) hc
   nlinarith
 · omega

end
end MathGKM.Markov
