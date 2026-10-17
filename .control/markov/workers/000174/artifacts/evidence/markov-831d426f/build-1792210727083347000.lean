import MarkovBandSumM831
import MarkovBandTransportM139
import MarkovBandSupportM139
/-! Machine-authored 831d426f. Exact source attachments, retaining raw
coefficients and every exponent restriction. The LC budget/margin stay open. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem band_correction_nonnegM831 (q k i : ℕ) (r : Bool)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 0 ≤ (bandCorrectionM139 q k r).coeff i := by
 unfold bandCorrectionM139
 rw [mul_assoc,coeff_X_pow_mul']
 split_ifs
 · rw [coeff_mul]
   apply Finset.sum_nonneg
   intro p hp
   rw [coeff_X_add_one_pow]
   exact mul_nonneg (by positivity) (band_Q_nonnegativeM831 q k p.2 r hn)
 · exact le_rfl

theorem source_band_above_lowerM831 (q k i : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 lowerRawME9C (sourceNME9C q r) i (q+k+1) ≤ threeRawM9E2 q r i (q+k+1) := by
 rw [source_band_coeffM139 q k i r hq hn]
 have := band_correction_nonnegM831 q k i r hn
 omega

theorem source_band_lc_budgetM831 (q k s : ℕ) (r : Bool) (c : ℝ) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hs : s ≤ q+k+1)
 (hc : 0 ≤ c)
 (hbudget : ∀ m, ((bandQM139 q r k).coeff (m+1):ℝ) ≤ c*((q+k+1).choose m:ℝ))
 (hmargin : let B : ℝ := (s+(q+k+1)+3).choose (q+k+1)
   let U := ((bandQM139 q r k).coeff 0:ℝ)*bandExponentM139 q k r/(s+1)+c
   (B+U)^2*kernelScaleMA64 (q+k+1) s ≤
     B^2*kernelScaleMA64 (q+k+1) s+(B+U)^2*topGapMA64 (q+k+1) s) :
 threeRawM9E2 q r (s+3) (q+k+1)*threeRawM9E2 q r (s+5) (q+k+1) ≤
 threeRawM9E2 q r (s+4) (q+k+1)^2 :=
 source_band_lcM139 q k s r c hq hn hs hc
   (fun m => band_Q_nonnegativeM831 q k m r hn) hbudget hmargin

theorem source_boundary_coeffM831 (k i : ℕ) (r : Bool)
 (hq : 2 ≤ 2*k+(if r then 2 else 1)) :
 let q := 2*k+(if r then 2 else 1)
 threeRawM9E2 q r i (q+k+1)=lowerRawME9C (sourceNME9C q r) i (q+k+1)+
   if 2 ≤ i then boundaryBinomialM831 k (i-2) r else 0 := by
 dsimp only
 have hn : 2*((2*k+(if r then 2 else 1))+k+1)+1 ≤
     sourceNME9C (2*k+(if r then 2 else 1)) r := by
   cases r <;> simp [sourceNME9C] <;> omega
 rw [source_band_coeffM139 _ k i r hq hn]
 congr 1
 have he : bandExponentM139 (2*k+(if r then 2 else 1)) k r=0 := by
   cases r <;> simp [band_exponent_falseM139,band_exponent_trueM139]
 simp only [bandCorrectionM139,he,pow_zero,mul_one,coeff_X_pow_mul']
 by_cases hi : 2 ≤ i
 · rw [if_pos hi,if_pos hi]
   have h := band_boundary_positive_formulaM831 k (i-2) r
   simpa only [bandAtM139,Nat.zero_add] using h
 · rw [if_neg hi,if_neg hi]

theorem source_band_path_above_lowerM831 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ k i, 2 ≤ q → 2*(q+k+1)+1 ≤ sourceNME9C q r →
 lowerRawME9C (sourceNME9C q r) i (q+k+1) ≤ coeff (frame path).mid.p i (q+k+1) := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k i hq2 hn
 rw [hp]
 exact source_band_above_lowerM831 q k i r hq2 hn

end
end MathGKM.Markov
