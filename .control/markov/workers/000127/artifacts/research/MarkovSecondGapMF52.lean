import MarkovSecondGapOneTwoMF52
import MarkovSecondGapOneLargeMF52
import MarkovSecondGapTwoOneMF52
import MarkovSecondGapTwoTwoMF52
import MarkovSecondGapTwoLargeMF52
import MarkovSecondGapLargeOneMF52
import MarkovSecondGapLargeTwoMF52
import MarkovSecondGapLargeLargeMF52
/-! Machine-authored f52ba141. Exact all-index compensation, no source balance. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
theorem second_endpointsMF52 (i j : ℕ) (m : ℝ) (hm : 1 ≤ m) (hs : 1 ≤ i+j) :
 0 ≤ secondGapMF52 (i+1) (j+1) m 0 ∧
 0 ≤ secondGapMF52 (i+1) (j+1) m (2*m) ∧
 0 ≤ secondMixedMF52 (i+1) (j+1) m := by
 have hz : 0 ≤ m-1 := by linarith
 rcases i with _ | (_ | i) <;> rcases j with _ | (_ | j)
 · omega
 · refine ⟨?_,?_,?_⟩
   · have h := second_one_two_zeroMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_one_two_endMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_one_two_mixedMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_one_large_zeroMF52 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_one_large_endMF52 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_one_large_mixedMF52 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_two_one_zeroMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_two_one_endMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_two_one_mixedMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_two_two_zeroMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_two_two_endMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_two_two_mixedMF52 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_two_large_zeroMF52 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_two_large_endMF52 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_two_large_mixedMF52 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_large_one_zeroMF52 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_large_one_endMF52 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_large_one_mixedMF52 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_large_two_zeroMF52 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_large_two_endMF52 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_large_two_mixedMF52 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := second_large_large_zeroMF52 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_large_large_endMF52 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := second_large_large_mixedMF52 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring

theorem second_gap_nonnegMF52 (i j : ℕ) (m t : ℝ)
 (hm : 1 ≤ m) (ht : 0 ≤ t) (htm : t ≤ 2*m) (hs : 1 ≤ i+j) :
 0 ≤ secondGapMF52 (i+1) (j+1) m t := by
 obtain ⟨h0,h2,hb⟩ := second_endpointsMF52 i j m hm hs
 have he := second_bernsteinMF52 (i+1) (j+1) m t
 have hpos : 0 < (2*m)^2 := by positivity
 have hnon : 0 ≤ (2*m-t)^2*secondGapMF52 (i+1) (j+1) m 0+
   t*(2*m-t)*secondMixedMF52 (i+1) (j+1) m+
   t^2*secondGapMF52 (i+1) (j+1) m (2*m) := by
   have hd : 0 ≤ 2*m-t := by linarith
   positivity
 rw [←he] at hnon
 exact (mul_nonneg_iff_of_pos_left hpos).mp hnon
end
end MathGKM.Markov
