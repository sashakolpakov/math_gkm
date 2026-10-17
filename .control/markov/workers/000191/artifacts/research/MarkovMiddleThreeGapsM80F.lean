import MarkovMiddleHighSourceM80F
import MarkovMiddleGap3FM80F
import MarkovMiddleGap3TM80F
import MarkovMiddleGap4FM80F
import MarkovMiddleGap4TM80F
/-! Machine-authored 80fb7777. Total middle inequalities at starting columns 3 and 4. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
attribute [local irreducible] threeRawM9E2

theorem source_middle_3_strictM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 3 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 5 (sourceNME9C q r+2-(q+3+k))<
 threeRawM9E2 q r 4 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨h2,h3,h4⟩ := source_middle_jetsM80F q k r hq hk hn
 obtain ⟨h5,h6⟩ := source_middle_high_jetsM80F q k r hq hk hn
 suffices h : sourceJet3M80F q k r*sourceJet5M80F q k r<sourceJet4M80F q k r^2 by
   rw [←h3,←h4,←h5] at h
   exact_mod_cast h
 cases r
 · have hx : 0 ≤ (q:ℚ)-2*k-4 := by
     have hh : 2*k+4 ≤ q := by simp [sourceNME9C] at hn; omega
     have hhq : (2:ℚ)*k+4 ≤ q := by exact_mod_cast hh
     linarith
   have h := source_gap_3_falseM80F ((q:ℚ)-2*k-4) k hx (by positivity)
   convert h using 1 <;> congr 2 <;> ring
 · have hx : 0 ≤ (q:ℚ)-2*k-5 := by
     have hh : 2*k+5 ≤ q := by simp [sourceNME9C] at hn; omega
     have hhq : (2:ℚ)*k+5 ≤ q := by exact_mod_cast hh
     linarith
   have h := source_gap_3_trueM80F ((q:ℚ)-2*k-5) k hx (by positivity)
   convert h using 1 <;> congr 2 <;> ring

theorem source_middle_4_strictM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 4 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 6 (sourceNME9C q r+2-(q+3+k))<
 threeRawM9E2 q r 5 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨h2,h3,h4⟩ := source_middle_jetsM80F q k r hq hk hn
 obtain ⟨h5,h6⟩ := source_middle_high_jetsM80F q k r hq hk hn
 suffices h : sourceJet4M80F q k r*sourceJet6M80F q k r<sourceJet5M80F q k r^2 by
   rw [←h4,←h5,←h6] at h
   exact_mod_cast h
 cases r
 · have hx : 0 ≤ (q:ℚ)-2*k-4 := by
     have hh : 2*k+4 ≤ q := by simp [sourceNME9C] at hn; omega
     have hhq : (2:ℚ)*k+4 ≤ q := by exact_mod_cast hh
     linarith
   have h := source_gap_4_falseM80F ((q:ℚ)-2*k-4) k hx (by positivity)
   convert h using 1 <;> congr 2 <;> ring
 · have hx : 0 ≤ (q:ℚ)-2*k-5 := by
     have hh : 2*k+5 ≤ q := by simp [sourceNME9C] at hn; omega
     have hhq : (2:ℚ)*k+5 ≤ q := by exact_mod_cast hh
     linarith
   have h := source_gap_4_trueM80F ((q:ℚ)-2*k-5) k hx (by positivity)
   convert h using 1 <;> congr 2 <;> ring

theorem source_middle_jets_strictM80F (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : 2 ≤ c) (hc4 : c ≤ 4) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k))<
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 interval_cases c
 · exact source_middle_second_strictM80F q k r hq hk hn
 · exact source_middle_3_strictM80F q k r hq hk hn
 · exact source_middle_4_strictM80F q k r hq hk hn

end
end MathGKM.Markov
