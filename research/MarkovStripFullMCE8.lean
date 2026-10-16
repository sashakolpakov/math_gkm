import MarkovStripGeneralLCMCE8
import MarkovStripGeneralCoefficientsMCE8
import MarkovStripSmallMCE8
import MarkovStripAllMCE8
/-! Machine-authored ce882be3. Universal raw vertical strip starting at row one. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 7000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff

theorem source_strip_general_scaledMCE8 (path : List Bool) (k l : ℕ)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b)
 (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 (((k:ℝ)+l)*(coeff (frame path).mid.p ((frame path).mid.a+k) 1:ℝ)=
   ((k+l).choose k:ℝ)*stripTMB9D (frame path).mid.a k l) ∧
 (2*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+1)*(coeff (frame path).mid.p ((frame path).mid.a+k) 2:ℝ)=
   ((k+l).choose k:ℝ)*l*stripGeneralJMCE8 (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ)) ∧
 (6*((k:ℝ)+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*(k+2)*(coeff (frame path).mid.p ((frame path).mid.a+k) 3:ℝ)=
   ((k+l).choose k:ℝ)*l*(l-1)*stripGeneralHMCE8 (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)) := by
 constructor
 · rw [source_first_linear_row77 path (by omega) k,hbl,show k+l+2-3=k+l-1 by omega]
   push_cast
   rw [strip_linear_scaledMB9D k l (by omega)]
   unfold stripTMB9D
   ring
 constructor
 · have hc := strip_second_general_coeffMCE8 path (by omega) k
   rw [hbl,show k+l+2-5=k+l-3 by omega] at hc
   push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
   have h := strip_second_scaledMCE8 k l hl (by omega) (frame path).mid.a (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   rw [hbl] at h
   rw [←hc] at h
   rw [hbl]
   linear_combination h
 · have hc := strip_third_general_coeffMCE8 path ha hb k
   rw [hbl,show k+l+2-7=k+l-5 by omega] at hc
   push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
   have h := strip_third_scaledMCE8 k l hl (by omega) (frame path).mid.a (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)
   rw [hbl] at h
   rw [←hc] at h
   rw [hbl]
   linear_combination h

theorem source_strip_high_interiorMCE8 (path : List Bool) (k l : ℕ)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b)
 (hs : (frame path).mid.b ≤ 2*(frame path).mid.a)
 (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 coeff (frame path).mid.p ((frame path).mid.a+k) 1*
 coeff (frame path).mid.p ((frame path).mid.a+k) 3 ≤
 coeff (frame path).mid.p ((frame path).mid.a+k) 2^2 := by
 obtain ⟨h1,h2,h3⟩ := source_strip_general_scaledMCE8 path k l ha hb hbl hl
 have hg := strip_general_gap_nonnegMCE8 (frame path).mid.a (frame path).mid.b k l
   (Nat.le_of_lt (frame_reduced path).2.1) hs hbl hl (by omega)
 have h := strip_general_transferMCE8 (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) ((k+l).choose k)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 1)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 2)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 3)
   (by positivity) (by exact_mod_cast hl) (by exact_mod_cast (show 5 ≤ k+l by omega)) h1 h2 h3 hg
 exact_mod_cast h

theorem source_strip_fullMCE8 (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 1*coeff (frame path).mid.p i 3 ≤ coeff (frame path).mid.p i 2^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases hs : 2*(frame path).mid.a ≤ (frame path).mid.b
 · exact source_strip_all_lowMCE8 path hs i
 have ha : 2 ≤ (frame path).mid.a := by omega
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
 by_cases hb : 7 ≤ (frame path).mid.b
 · let k := i-(frame path).mid.a
   let l := (frame path).mid.b-2-k
   have he : (frame path).mid.a+k=i := by dsimp [k]; omega
   have hl : 2 ≤ l := by dsimp [l,k]; omega
   have hbl : (frame path).mid.b=k+l+2 := by dsimp [l,k]; omega
   simpa only [he] using source_strip_high_interiorMCE8 path k l ha hb (by omega) hbl hl
 · exact source_strip_smallMCE8 path ha (by omega) i (by omega)
end
end MathGKM.Markov
