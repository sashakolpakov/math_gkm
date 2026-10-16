import MarkovMiddleAllM570
import MarkovNextCoefficientsM570
import MarkovNextTransferM570
import MarkovStripAllMCE8
import MarkovSmallHorizontal2_5M9E1
import MarkovSmallHorizontal3_7M9E1
import MarkovSmallHorizontal3_8M9E1
/-! Machine-authored 5703599b. Raw vertical row-two strip for b>=2a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
theorem next_small_2_5M570 (i : ℕ) (hi : i ≤ 6) :
 coeff (frame [false,true]).mid.p i 2*coeff (frame [false,true]).mid.p i 4 ≤
 coeff (frame [false,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_2_5M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem next_small_3_7M570 (i : ℕ) (hi : i ≤ 9) :
 coeff (frame [false,true,true]).mid.p i 2*coeff (frame [false,true,true]).mid.p i 4 ≤
 coeff (frame [false,true,true]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_3_7M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
theorem next_small_3_8M570 (i : ℕ) (hi : i ≤ 10) :
 coeff (frame [false,true,false]).mid.p i 2*coeff (frame [false,true,false]).mid.p i 4 ≤
 coeff (frame [false,true,false]).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_3_8M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
attribute [local irreducible] frame coeff
theorem source_next_interiorM570 (path : List Bool) (k l : ℕ)
 (ha : 2 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b)
 (hu : (frame path).mid.b ≤ 3*(frame path).mid.a)
 (hbl : (frame path).mid.b=k+l+2) (hl : 3 ≤ l) :
 coeff (frame path).mid.p ((frame path).mid.a+k) 2*
 coeff (frame path).mid.p ((frame path).mid.a+k) 4 ≤
 coeff (frame path).mid.p ((frame path).mid.a+k) 3^2 := by
 obtain ⟨_,h2,h3⟩ := source_strip_scaledMCE8 path k l ha (by omega) hs hbl (by omega)
 have h4 := source_next_four_scaledM570 path k l hb hs hu hbl hl
 have hg := strip_next_gap_nonnegM570 (frame path).mid.a k l
   (3*(frame path).mid.a-(frame path).mid.b) (by omega) hl (by omega)
 have h := strip_next_transferM570 (frame path).mid.a k l
   (3*(frame path).mid.a-(frame path).mid.b:ℕ) ((k+l).choose k)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 2)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 3)
   (coeff (frame path).mid.p ((frame path).mid.a+k) 4)
   (by positivity) (by exact_mod_cast hl) (by exact_mod_cast (show 7 ≤ k+l by omega)) h2 h3 h4 hg
 exact_mod_cast h

theorem source_strip_halfconeM570 (path : List Bool)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases hu : 3*(frame path).mid.a ≤ (frame path).mid.b
 · exact source_strip_thirdconeM570 path hu i
 by_cases ha1 : (frame path).mid.a=1
 · simpa using (source_one_global6 path ha1).2.1 i 2
 have ha : 2 ≤ (frame path).mid.a := by omega
 have hstrict : 2*(frame path).mid.a < (frame path).mid.b := by
   by_contra hn
   have he : (frame path).mid.b=2*(frame path).mid.a := by omega
   have hc := hcop.of_dvd_right (show (frame path).mid.a ∣ (frame path).mid.b by rw [he]; exact dvd_mul_left _ _)
   have : (frame path).mid.a=1 := Nat.coprime_self.mp hc
   omega
 by_cases hb : 9 ≤ (frame path).mid.b
 · by_cases hi : i<(frame path).mid.a
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
   simpa only [he] using source_next_interiorM570 path k l ha hb hs (by omega) hbl hl
 · have hc : ((frame path).mid.a=2 ∧ (frame path).mid.b=5) ∨
     ((frame path).mid.a=3 ∧ (frame path).mid.b=7) ∨
     ((frame path).mid.a=3 ∧ (frame path).mid.b=8) := by omega
   rcases hc with ⟨ea,eb⟩|⟨ea,eb⟩|⟨ea,eb⟩
   · have hp : path=[false,true] := frame_path_injective_098
       (ea.trans (by norm_num [frame,advance,initial])) (eb.trans (by norm_num [frame,advance,initial]))
     by_cases hi : i ≤ 6
     · subst path; exact next_small_2_5M570 i hi
     · have hz := raw_outside_polygon18 path i 2 (by unfold InPolygon; rw [ea,eb]; omega)
       rw [hz,zero_mul]; exact sq_nonneg _
   · have hp : path=[false,true,true] := frame_path_injective_098
       (ea.trans (by norm_num [frame,advance,initial])) (eb.trans (by norm_num [frame,advance,initial]))
     by_cases hi : i ≤ 9
     · subst path; exact next_small_3_7M570 i hi
     · have hz := raw_outside_polygon18 path i 2 (by unfold InPolygon; rw [ea,eb]; omega)
       rw [hz,zero_mul]; exact sq_nonneg _
   · have hp : path=[false,true,false] := frame_path_injective_098
       (ea.trans (by norm_num [frame,advance,initial])) (eb.trans (by norm_num [frame,advance,initial]))
     by_cases hi : i ≤ 10
     · subst path; exact next_small_3_8M570 i hi
     · have hz := raw_outside_polygon18 path i 2 (by unfold InPolygon; rw [ea,eb]; omega)
       rw [hz,zero_mul]; exact sq_nonneg _
end
end MathGKM.Markov
