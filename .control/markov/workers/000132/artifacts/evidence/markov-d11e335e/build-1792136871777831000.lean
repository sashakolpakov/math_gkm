import MarkovStripLCMD11
import MarkovStripCoefficientsMD11
import MarkovStripAllMB9D
/-! Machine-authored d11e335e. Actual-source vertical row-two strip in b>=4a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem source_strip_four_scaledMD11 (path : List Bool) (k l : ℕ)
 (hb : 9 ≤ (frame path).mid.b) (hs : 4*(frame path).mid.a ≤ (frame path).mid.b)
 (hbl : (frame path).mid.b=k+l+2) (hl : 3 ≤ l) :
 24*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+l-5)*(k+l-6)*
 (coeff (frame path).mid.p ((frame path).mid.a+k) 4:ℝ)=
 ((k+l).choose k:ℝ)*l*(l-1)*(l-2)*stripIMD11 (frame path).mid.a k l := by
 have hc := strip_four_coeffMD11 path hb hs k
 rw [hbl,show k+l+2-9=k+l-7 by omega] at hc
 push_cast at hc
 have h := strip_quartic_scaledMD11 k l hl (by omega) (frame path).mid.a
 rw [←hc] at h
 linear_combination h

theorem source_strip_interiorMD11 (path : List Bool) (k l : ℕ)
 (ha : 2 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b)
 (hs : 4*(frame path).mid.a ≤ (frame path).mid.b)
 (hbl : (frame path).mid.b=k+l+2) (hl : 3 ≤ l) :
 coeff (frame path).mid.p ((frame path).mid.a+k) 2*
 coeff (frame path).mid.p ((frame path).mid.a+k) 4 ≤
 coeff (frame path).mid.p ((frame path).mid.a+k) 3^2 := by
 obtain ⟨_,h2,h3⟩ := source_strip_scaledMB9D path k l ha (by omega) (by omega) hbl (by omega)
 have h4 := source_strip_four_scaledMD11 path k l hb hs hbl hl
 have hg := strip_gap_nonnegMD11 (frame path).mid.a k l (by omega) hl (by omega)
 have h := strip_gap_transferMD11 (frame path).mid.a k l ((k+l).choose k)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 2)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 3)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 4)
   (by exact_mod_cast hl) (by exact_mod_cast (show 7 ≤ k+l by omega)) h2 h3 h4 hg
 exact_mod_cast h

theorem source_strip_allMD11 (path : List Bool)
 (hs : 4*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases ha1 : (frame path).mid.a=1
 · simpa using (source_one_global6 path ha1).2.1 i 2
 have ha : 2 ≤ (frame path).mid.a := by omega
 have hb : 9 ≤ (frame path).mid.b := by
   by_contra hn
   have ea : (frame path).mid.a=2 := by omega
   have eb : (frame path).mid.b=8 := by omega
   rw [ea,eb] at hcop
   norm_num at hcop
 by_cases hi : i<(frame path).mid.a
 · have hz := raw_outside_polygon18 path i 2 (by
     intro hp
     have h := hp.1
     have hm := Nat.mul_le_mul_left (frame path).mid.b (show i+1 ≤ (frame path).mid.a by omega)
     nlinarith)
   rw [hz,zero_mul]; exact sq_nonneg _
 by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+4
 · have hz := raw_outside_polygon18 path i 4 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 let k := i-(frame path).mid.a
 let l := (frame path).mid.b-2-k
 have he : (frame path).mid.a+k=i := by dsimp [k]; omega
 have hl : 3 ≤ l := by dsimp [l,k]; omega
 have hbl : (frame path).mid.b=k+l+2 := by dsimp [l,k]; omega
 simpa only [he] using source_strip_interiorMD11 path k l ha hb hs hbl hl
end
end MathGKM.Markov
