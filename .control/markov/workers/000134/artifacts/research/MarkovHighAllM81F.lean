import MarkovHighCoefficientsM81F
import MarkovHighGapM81F
import MarkovHighTransferM81F
import MarkovHighSmallM81F
import MarkovNextAllM570
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 18000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
theorem source_high_interiorM81F (path : List Bool) (k l : ℕ)
 (ha : 3 ≤ (frame path).mid.a) (hb : 9 ≤ (frame path).mid.b) (hs : (frame path).mid.b ≤ 2*(frame path).mid.a)
 (hbl : (frame path).mid.b=k+l+2) (hl : 2 ≤ l) :
 coeff (frame path).mid.p ((frame path).mid.a-1+k) 2*coeff (frame path).mid.p ((frame path).mid.a-1+k) 4 ≤
 coeff (frame path).mid.p ((frame path).mid.a-1+k) 3^2 := by
 have h2 := source_high2_scaledM81F path k l ha hb hbl hl
 have h3 := source_high3_scaledM81F path k l ha hb hbl hl
 have h4 := source_high4_scaledM81F path k l ha hb hbl hl
 have hg := high_source_gapM81F (frame path).mid.a (frame path).mid.b k l
   (Nat.le_of_lt (frame_reduced path).2.1) hs hbl hl (by omega)
 have h := high_transferM81F (frame path).mid.a k l (2*(frame path).mid.a-(frame path).mid.b:ℕ) (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ) (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) (h4vM511 (frame path).mid.a (frame path).mid.b) (h4wM511 (frame path).mid.a (frame path).mid.b) (h4zM511 (frame path).mid.a (frame path).mid.b) ((k+l).choose k)
   (coeff (frame path).mid.p ((frame path).mid.a-1+k) 2)
   (coeff (frame path).mid.p ((frame path).mid.a-1+k) 3)
   (coeff (frame path).mid.p ((frame path).mid.a-1+k) 4)
   (by positivity) (by exact_mod_cast hl) (by exact_mod_cast (show 7 ≤ k+l by omega)) h2 h3 h4 hg
 exact_mod_cast h

theorem source_strip_fullM81F (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases hs : 2*(frame path).mid.a ≤ (frame path).mid.b
 · exact source_strip_halfconeM570 path hs i
 have ha2 : 2 ≤ (frame path).mid.a := by omega
 by_cases hi : i<(frame path).mid.a-1
 · have hz := raw_outside_polygon18 path i 2 (by
     intro hp
     have h := hp.1
     have hm := Nat.mul_le_mul_left (frame path).mid.b (show i+2 ≤ (frame path).mid.a by omega)
     nlinarith)
   rw [hz,zero_mul]; exact sq_nonneg _
 by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+4
 · have hz := raw_outside_polygon18 path i 4 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 by_cases hb : 9 ≤ (frame path).mid.b
 · let k := i-((frame path).mid.a-1)
   let l := (frame path).mid.b-2-k
   have he : (frame path).mid.a-1+k=i := by dsimp [k]; omega
   have hl : 2 ≤ l := by dsimp [l,k]; omega
   have hbl : (frame path).mid.b=k+l+2 := by dsimp [l,k]; omega
   simpa only [he] using source_high_interiorM81F path k l (by omega) hb (by omega) hbl hl
 · exact source_high_smallM81F path ha2 (by omega) (by omega) i (by omega)
end
end MathGKM.Markov
