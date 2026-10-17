import MarkovBandShapeM139
import MarkovFactoredRowM964
/-! Machine-authored 139fed75. Exact raw-source transport for the uniform
correction factor. Positivity, budget and margin remain explicit hypotheses. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem source_band_valueM139 (q k s : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 (threeRawM9E2 q r (s+3) (q+k+1):ℝ)=
 factoredValueM964 (bandExponentM139 q k r) (q+k+1) s
   ((bandQM139 q r k).map (Int.castRingHom ℝ)) := by
 rw [source_band_coeffM139 q k (s+3) r hq hn,Int.cast_add]
 have hl := lower_row_liftMAE9 (bandExponentM139 q k r) (q+k+1) s
 have he : 2*(q+k+1)+1+bandExponentM139 q k r=sourceNME9C q r := by
   unfold bandExponentM139; omega
 rw [he,lower_row_formulaMFFD _ (q+k+1) hn (s+3) (q+k+1) le_rfl] at hl
 change lowerRawME9C _ _ _=liftOutputMAE9 _ _ _ at hl
 rw [hl]
 unfold factoredValueM964 bandCorrectionM139
 congr 1
 have hp : (X^2*(X+1)^bandExponentM139 q k r*bandQM139 q r k).map (Int.castRingHom ℝ)=
   X^2*((X+1)^bandExponentM139 q k r*(bandQM139 q r k).map (Int.castRingHom ℝ)) := by
   simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,Polynomial.map_add,Polynomial.map_one]
   ring
 rw [←hp,coeff_map]
 rfl

theorem source_band_lcM139 (q k s : ℕ) (r : Bool) (c : ℝ) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) (hs : s ≤ q+k+1)
 (hc : 0 ≤ c) (hQ : ∀ m, 0 ≤ (bandQM139 q r k).coeff m)
 (hbudget : ∀ m, ((bandQM139 q r k).coeff (m+1):ℝ) ≤ c*((q+k+1).choose m:ℝ))
 (hmargin : let B : ℝ := (s+(q+k+1)+3).choose (q+k+1)
   let U := ((bandQM139 q r k).coeff 0:ℝ)*bandExponentM139 q k r/(s+1)+c
   (B+U)^2*kernelScaleMA64 (q+k+1) s ≤
     B^2*kernelScaleMA64 (q+k+1) s+(B+U)^2*topGapMA64 (q+k+1) s) :
 threeRawM9E2 q r (s+3) (q+k+1)*threeRawM9E2 q r (s+5) (q+k+1) ≤
 threeRawM9E2 q r (s+4) (q+k+1)^2 := by
 have h := factored_value_lcM964 (bandExponentM139 q k r) (q+k+1) s
   ((bandQM139 q r k).map (Int.castRingHom ℝ)) c hs hc
   (fun m => by simp only [coeff_map,Int.coe_castRingHom]; exact_mod_cast hQ m)
   (by simpa only [coeff_map,Int.coe_castRingHom] using hbudget)
   (by simpa only [coeff_map,Int.coe_castRingHom] using hmargin)
 rw [←source_band_valueM139 q k s r hq hn,
   ←source_band_valueM139 q k (s+2) r hq hn,
   ←source_band_valueM139 q k (s+1) r hq hn] at h
 norm_num only [show s+2+3=s+5 by omega,show s+1+3=s+4 by omega] at h
 exact_mod_cast h

theorem source_band_pathM139 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
   ∀ k i, 2 ≤ q → 2*(q+k+1)+1 ≤ sourceNME9C q r →
   coeff (frame path).mid.p i (q+k+1)=lowerRawME9C (sourceNME9C q r) i (q+k+1)+
     (bandCorrectionM139 q k r).coeff i := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro k i hq2 hn
 rw [hp,source_band_coeffM139 q k i r hq2 hn]

end
end MathGKM.Markov
