import MarkovMiddleJetSourceM80F
/-! Machine-authored 80fb7777. Unbounded middle-row raw inequality and polygon. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
attribute [local irreducible] threeRawM9E2 topTemplateMB3E

theorem source_middle_second_strictM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 2 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 4 (sourceNME9C q r+2-(q+3+k))<
 threeRawM9E2 q r 3 (sourceNME9C q r+2-(q+3+k))^2 := by
 obtain ⟨h2,h3,h4⟩ := source_middle_jetsM80F q k r hq hk hn
 suffices h : sourceJet2M80F q k r*sourceJet4M80F q k r<sourceJet3M80F q k r^2 by
   rw [←h2,←h3,←h4] at h
   exact_mod_cast h
 cases r
 · have hx : 0 ≤ (q:ℚ)-2*k-4 := by
     have hh : 2*k+4 ≤ q := by simp [sourceNME9C] at hn; omega
     have hhq : (2:ℚ)*k+4 ≤ q := by exact_mod_cast hh
     linarith
   have h := source_gap_falseM80F ((q:ℚ)-2*k-4) k hx (by positivity)
   convert h using 1 <;> congr 2 <;> ring
 · have hx : 0 ≤ (q:ℚ)-2*k-5 := by
     have hh : 2*k+5 ≤ q := by simp [sourceNME9C] at hn; omega
     have hhq : (2:ℚ)*k+5 ≤ q := by exact_mod_cast hh
     linarith
   have h := source_gap_trueM80F ((q:ℚ)-2*k-5) k hx (by positivity)
   convert h using 1 <;> congr 2 <;> ring

theorem source_middle_axesM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 threeRawM9E2 q r 0 (sourceNME9C q r+2-(q+3+k))=0 ∧
 threeRawM9E2 q r 1 (sourceNME9C q r+2-(q+3+k))=0 := by
 have he := source_middle_formulaM99A q k r hq hk
 obtain ⟨h0,h1,_⟩ := top_edge_coeffsMB3E (sourceNME9C q r) (q+3+k) hn (by omega)
 obtain ⟨d0,d1,_⟩ := middle_correction_jetsM80F q k r hq hk
 have a0 := congrArg (fun p : Polynomial ℤ => p.coeff 0) he
 have a1 := congrArg (fun p : Polynomial ℤ => (p.coeff 1:ℚ)) he
 simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add] at a0 a1
 rw [h0,d0,zero_add] at a0
 refine ⟨a0,?_⟩
 rw [Int.cast_add,h1,d1] at a1
 have az : (threeRawM9E2 q r 1 (sourceNME9C q r+2-(q+3+k)):ℚ)=0 := by
   rw [a1]
   cases r <;> simp [sourceNME9C,correctionJet1M80F] <;> ring
 exact_mod_cast az

theorem source_middle_lowM80F (q k c : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) (hc : c ≤ 2) :
 threeRawM9E2 q r c (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r (c+2) (sourceNME9C q r+2-(q+3+k))≤
 threeRawM9E2 q r (c+1) (sourceNME9C q r+2-(q+3+k))^2 := by
 interval_cases c
 · rw [(source_middle_axesM80F q k r hq hk hn).1,zero_mul]; exact sq_nonneg _
 · rw [(source_middle_axesM80F q k r hq hk hn).2,zero_mul]; exact sq_nonneg _
 · exact (source_middle_second_strictM80F q k r hq hk hn).le

theorem source_middle_second_polygonM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hk : k ≤ q) (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 InPolygon 3 (sourceNME9C q r) 2 (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) 3 (sourceNME9C q r+2-(q+3+k)) ∧
 InPolygon 3 (sourceNME9C q r) 4 (sourceNME9C q r+2-(q+3+k)) ∧
 threeRawM9E2 q r 2 (sourceNME9C q r+2-(q+3+k))*
 threeRawM9E2 q r 4 (sourceNME9C q r+2-(q+3+k))<
 threeRawM9E2 q r 3 (sourceNME9C q r+2-(q+3+k))^2 := by
 have hp : InPolygon 3 (sourceNME9C q r) 2 (sourceNME9C q r+2-(q+3+k)) := by
   constructor
   · have hb : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
     have ht : q+3+k ≤ sourceNME9C q r+2 := by omega
     have hj : sourceNME9C q r+2-(q+3+k)+(q+3+k)=sourceNME9C q r+2 := by omega
     nlinarith
   · omega
 exact ⟨hp,middle_polygonM99A q k 3 r hq hk (by omega) (by omega),
   middle_polygonM99A q k 4 r hq hk (by omega) (by omega),
   source_middle_second_strictM80F q k r hq hk hn⟩

end
end MathGKM.Markov
