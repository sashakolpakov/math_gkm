import MarkovStripLCMB9D
import MarkovStripCoefficientsMB9D
import MarkovFibonacciLC6ade
/-! Machine-authored b9d0d341. Universal low-slope raw vertical strip. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem source_strip_scaledMB9D (path : List Bool) (k l : ℕ)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b)
 (hs : 3*(frame path).mid.a ≤ (frame path).mid.b)
 (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 (((k:ℝ)+l)*(coeff (frame path).mid.p ((frame path).mid.a+k) 1:ℝ)=
   ((k+l).choose k:ℝ)*stripTMB9D (frame path).mid.a k l) ∧
 (2*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(coeff (frame path).mid.p ((frame path).mid.a+k) 2:ℝ)=
   ((k+l).choose k:ℝ)*l*stripJMB9D (frame path).mid.a k l) ∧
 (6*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(coeff (frame path).mid.p ((frame path).mid.a+k) 3:ℝ)=
   ((k+l).choose k:ℝ)*l*(l-1)*stripHMB9D (frame path).mid.a k l) := by
 constructor
 · rw [source_first_linear_row77 path (by omega) k,hbl,show k+l+2-3=k+l-1 by omega]
   push_cast
   rw [strip_linear_scaledMB9D k l (by omega)]
   unfold stripTMB9D
   ring
 constructor
 · have hc := strip_two_coeffMB9D path (by omega) (by omega) k
   rw [hbl,show k+l+2-5=k+l-3 by omega] at hc
   push_cast at hc
   have h := strip_quad_scaledMB9D k l hl (by omega) (frame path).mid.a
   rw [←hc] at h
   linear_combination h
 · have hc := strip_three_coeffMB9D path ha hb hs k
   rw [hbl,show k+l+2-7=k+l-5 by omega] at hc
   push_cast at hc
   have h := strip_cubic_scaledMB9D k l hl (by omega) (frame path).mid.a
   rw [←hc] at h
   linear_combination h

theorem source_strip_interiorMB9D (path : List Bool) (k l : ℕ)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b)
 (hs : 3*(frame path).mid.a ≤ (frame path).mid.b)
 (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 coeff (frame path).mid.p ((frame path).mid.a+k) 1*
 coeff (frame path).mid.p ((frame path).mid.a+k) 3 ≤
 coeff (frame path).mid.p ((frame path).mid.a+k) 2^2 := by
 obtain ⟨h1,h2,h3⟩ := source_strip_scaledMB9D path k l ha hb hs hbl hl
 have hg := strip_gap_nonnegMB9D (frame path).mid.a k l (by omega) hl (by omega)
 have h := strip_gap_transferMB9D (frame path).mid.a k l ((k+l).choose k)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 1)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 2)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 3)
   (by positivity) (by exact_mod_cast hl) (by exact_mod_cast (show 5 ≤ k+l by omega)) h1 h2 h3 hg
 exact_mod_cast h

theorem source_strip_lowMB9D (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 7 ≤ (frame path).mid.b) (hs : 3*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 1*coeff (frame path).mid.p i 3 ≤ coeff (frame path).mid.p i 2^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases hi : i<(frame path).mid.a
 · have hz := raw_outside_polygon18 path i 1 (by
     intro hp
     have h := hp.1
     simp only [mul_one] at h
     have hm := Nat.mul_le_mul_left (frame path).mid.b (show i+1 ≤ (frame path).mid.a by omega)
     nlinarith)
   rw [hz,zero_mul]; exact sq_nonneg _
 by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+3
 · have hz := raw_outside_polygon18 path i 3 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 let k := i-(frame path).mid.a
 let l := (frame path).mid.b-2-k
 have he : (frame path).mid.a+k=i := by dsimp [k]; omega
 have hl : 2 ≤ l := by dsimp [l,k]; omega
 have hbl : (frame path).mid.b=k+l+2 := by dsimp [l,k]; omega
 simpa only [he] using source_strip_interiorMB9D path k l ha hb hs hbl hl
theorem source_strip_all_lowMB9D (path : List Bool)
 (hs : 3*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 1*coeff (frame path).mid.p i 3 ≤ coeff (frame path).mid.p i 2^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases ha1 : (frame path).mid.a=1
 · simpa using (source_one_global6 path ha1).2.1 i 1
 have ha : 2 ≤ (frame path).mid.a := by omega
 have hb : 7 ≤ (frame path).mid.b := by
   by_contra hn
   have ea : (frame path).mid.a=2 := by omega
   have eb : (frame path).mid.b=6 := by omega
   rw [ea,eb] at hcop
   norm_num at hcop
 exact source_strip_lowMB9D path ha hb hs i
end
end MathGKM.Markov
