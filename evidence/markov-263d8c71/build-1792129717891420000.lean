import MarkovTerminalGap0OneTwoM263
import MarkovTerminalGap0OneLargeM263
import MarkovTerminalGap0TwoOneM263
import MarkovTerminalGap0TwoTwoM263
import MarkovTerminalGap0TwoLargeM263
import MarkovTerminalGap0LargeOneM263
import MarkovTerminalGap0LargeTwoM263
import MarkovTerminalGap0LargeLargeM263
import MarkovTerminalGap1OneTwoM263
import MarkovTerminalGap1OneLargeM263
import MarkovTerminalGap1TwoOneM263
import MarkovTerminalGap1TwoTwoM263
import MarkovTerminalGap1TwoLargeM263
import MarkovTerminalGap1LargeOneM263
import MarkovTerminalGap1LargeTwoM263
import MarkovTerminalGap1LargeLargeM263
/-! Machine-authored 263d8c71. Terminal-A raw compensation certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768

theorem terminal_endpoints0M263 (i j : ℕ) (m : ℝ) (hm : 1 ≤ m) (hs : 1 ≤ i+j) :
 0 ≤ terminalGapM263 (i+1) (j+1) m 0 0 ∧
 0 ≤ terminalGapM263 (i+1) (j+1) m (2*m-0) 0 ∧
 0 ≤ terminalMixedM263 (i+1) (j+1) m 0 := by
 have hz : 0 ≤ m-1 := by linarith
 rcases i with _ | (_ | i) <;> rcases j with _ | (_ | j)
 · omega
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_one_two_zeroM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_one_two_endM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_one_two_mixedM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_one_large_zeroM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_one_large_endM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_one_large_mixedM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_two_one_zeroM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_two_one_endM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_two_one_mixedM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_two_two_zeroM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_two_two_endM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_two_two_mixedM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_two_large_zeroM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_two_large_endM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_two_large_mixedM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_large_one_zeroM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_large_one_endM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_large_one_mixedM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_large_two_zeroM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_large_two_endM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_large_two_mixedM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_0_large_large_zeroM263 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_large_large_endM263 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_0_large_large_mixedM263 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring

theorem terminal_endpoints1M263 (i j : ℕ) (m : ℝ) (hm : 1 ≤ m) (hs : 1 ≤ i+j) :
 0 ≤ terminalGapM263 (i+1) (j+1) m 0 1 ∧
 0 ≤ terminalGapM263 (i+1) (j+1) m (2*m-1) 1 ∧
 0 ≤ terminalMixedM263 (i+1) (j+1) m 1 := by
 have hz : 0 ≤ m-1 := by linarith
 rcases i with _ | (_ | i) <;> rcases j with _ | (_ | j)
 · omega
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_one_two_zeroM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_one_two_endM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_one_two_mixedM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_one_large_zeroM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_one_large_endM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_one_large_mixedM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_two_one_zeroM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_two_one_endM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_two_one_mixedM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_two_two_zeroM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_two_two_endM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_two_two_mixedM263 0 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_two_large_zeroM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_two_large_endM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_two_large_mixedM263 0 j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_large_one_zeroM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_large_one_endM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_large_one_mixedM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_large_two_zeroM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_large_two_endM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_large_two_mixedM263 i 0 (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
 · refine ⟨?_,?_,?_⟩
   · have h := terminal_1_large_large_zeroM263 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_large_large_endM263 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring
   · have h := terminal_1_large_large_mixedM263 i j (m-1) (by positivity) (by positivity) hz
     convert h using 1 <;> push_cast <;> congr 1 <;> ring

theorem terminal_gap_nonnegM263 (i j : ℕ) (m t r : ℝ)
 (hm : 1 ≤ m) (ht : 0 ≤ t) (htm : t+r ≤ 2*m) (hr : r=0 ∨ r=1)
 (hs : 1 ≤ i+j) : 0 ≤ terminalGapM263 (i+1) (j+1) m t r := by
 have hs' : 0 ≤ terminalGapM263 (i+1) (j+1) m 0 r ∧
   0 ≤ terminalGapM263 (i+1) (j+1) m (2*m-r) r ∧
   0 ≤ terminalMixedM263 (i+1) (j+1) m r := by
   rcases hr with rfl | rfl
   · simpa using terminal_endpoints0M263 i j m hm hs
   · exact terminal_endpoints1M263 i j m hm hs
 obtain ⟨h0,h2,hb⟩ := hs'
 have he := terminal_bernsteinM263 (i+1) (j+1) m t r
 have hr1 : r ≤ 1 := by rcases hr with rfl | rfl <;> norm_num
 have hpos : 0 < (2*m-r)^2 := sq_pos_of_pos (by linarith)
 have hd : 0 ≤ 2*m-r-t := by linarith
 have hnon : 0 ≤ (2*m-r-t)^2*terminalGapM263 (i+1) (j+1) m 0 r+
   t*(2*m-r-t)*terminalMixedM263 (i+1) (j+1) m r+
   t^2*terminalGapM263 (i+1) (j+1) m (2*m-r) r := by positivity
 rw [←he] at hnon
 exact (mul_nonneg_iff_of_pos_left hpos).mp hnon
end
end MathGKM.Markov
