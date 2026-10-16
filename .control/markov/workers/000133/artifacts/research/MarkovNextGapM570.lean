import MarkovNextCert0M570
import MarkovNextCert1M570
import MarkovNextCert2M570
import MarkovNextCert3M570
import MarkovNextCert4M570
import MarkovNextCert5M570
import MarkovNextCert6M570
import MarkovNextExpandM570
import MarkovNextSmallGapM570
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
theorem stripNext_largeM570 (k l t : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (ht : 0 ≤ t) :
 0 ≤ stripNextGapM570 ((k+l+9+t)/3) k (l+7) t := by
 have he := next_expandM570 k l t
 have h0 := next_coefficient_0M570 k l hk hl
 have h1 := next_coefficient_1M570 k l hk hl
 have h2 := next_coefficient_2M570 k l hk hl
 have h3 := next_coefficient_3M570 k l hk hl
 have h4 := next_coefficient_4M570 k l hk hl
 have h5 := next_coefficient_5M570 k l hk hl
 have h6 := next_coefficient_6M570 k l hk hl
 have hn : 0 ≤ 729*stripNextGapM570 ((k+l+9+t)/3) k (l+7) t := by
   rw [he]
   positivity
 linarith only [hn]

theorem strip_next_gap_nonnegM570 (a k l t : ℕ)
 (he : 3*a=k+l+2+t) (hl : 3 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ stripNextGapM570 a k l t := by
 have ha : 1 ≤ a := by omega
 have haR : 0 ≤ (a:ℝ)-1 := by
   have : (1:ℝ) ≤ a := by exact_mod_cast ha
   linarith
 by_cases h7 : 7 ≤ l
 · have heR : (a:ℝ)=((k:ℝ)+((l:ℝ)-7)+9+t)/3 := by
     have : 3*(a:ℝ)=(k:ℝ)+l+2+t := by exact_mod_cast he
     linarith
   have hlR : 0 ≤ (l:ℝ)-7 := by
     have : (7:ℝ) ≤ l := by exact_mod_cast h7
     linarith
   rw [heR]
   simpa only [sub_add_cancel] using stripNext_largeM570 k ((l:ℝ)-7) t (by positivity) hlR (by positivity)
 · have hc : l=3 ∨ l=4 ∨ l=5 ∨ l=6 := by omega
   rcases hc with rfl|rfl|rfl|rfl
   · have hk : 0 ≤ (k:ℝ)-4 := by
       have : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using next_small3M570 ((a:ℝ)-1) ((k:ℝ)-4) t haR hk (by positivity)
   · have hk : 0 ≤ (k:ℝ)-3 := by
       have : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using next_small4M570 ((a:ℝ)-1) ((k:ℝ)-3) t haR hk (by positivity)
   · have hk : 0 ≤ (k:ℝ)-2 := by
       have : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using next_small5M570 ((a:ℝ)-1) ((k:ℝ)-2) t haR hk (by positivity)
   · have hk : 0 ≤ (k:ℝ)-1 := by
       have : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
       linarith
     simpa only [sub_add_cancel,Nat.cast_ofNat] using next_small6M570 ((a:ℝ)-1) ((k:ℝ)-1) t haR hk (by positivity)
end
end MathGKM.Markov
