import MarkovCorrectionJetsM80F
import MarkovMiddleGapM80F
/-! Machine-authored 80fb7777. Raw source attachment of the exact middle jets. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 9000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_template_jetsM80F (n t : ℕ) (hn : 2*t ≤ n) (ht : 3 ≤ t) :
 ((topTemplateMB3E n t).coeff 2:ℚ)=topSecondQM55C ((t:ℚ)-5) (n+5-3*t) ∧
 ((topTemplateMB3E n t).coeff 3:ℚ)=topThirdQM55C ((t:ℚ)-5) (n+5-3*t) ∧
 ((topTemplateMB3E n t).coeff 4:ℚ)=topFourthQM55C ((t:ℚ)-5) (n+5-3*t) := by
 let s : ℚ := t-5
 let d : ℚ := n+5-3*t
 have h2 := (top_edge_coeffsMB3E n t hn (by omega)).2.2
 have h3 := top_third_coeffMB3E n t hn (by omega)
 have h4 := top_fourth_coeffM55C n t hn (by omega)
 have h2Q : ((topTemplateMB3E n t).coeff 2:ℚ)=topSecondQM55C s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h2
   push_cast at h
   rw [choose_poly_natM0D3] at h
   simp only [Nat.cast_add,Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topSecondQM55C
   have ha : s+d+6=(n:ℚ)-2*t+6 := by dsimp [s,d]; ring
   rw [ha]
   dsimp [s]
   linear_combination h
 have h3Q : ((topTemplateMB3E n t).coeff 3:ℚ)=topThirdQM55C s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h3
   push_cast at h
   simp only [choose_poly_natM0D3,Nat.cast_add,
     Nat.cast_sub (show t ≤ n+5 by omega),Nat.cast_sub (show t ≤ n by omega),
     Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topThirdQM55C weightedChooseQM55C
   have h0 : 2*s+d+10=(n:ℚ)+5-t := by dsimp [s,d]; ring
   have h1 : s+d+8+(s+2)+1=(n:ℚ)-t+6 := by dsimp [s,d]; ring
   have h2 : s+d+8+1=(n:ℚ)-2*t+9 := by dsimp [s,d]; ring
   have h3 : s+d+8=(n:ℚ)-2*t+8 := by dsimp [s,d]; ring
   have hm : s+2=(t:ℚ)-3 := by dsimp [s]; ring
   rw [h0,h1,h2,h3,hm]
   exact h
 have h4Q : ((topTemplateMB3E n t).coeff 4:ℚ)=topFourthQM55C s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h4
   push_cast at h
   simp only [weighted_choose_castM55C,choose_poly_natM0D3,Nat.cast_add,
     Nat.cast_sub (show t ≤ n+6 by omega),Nat.cast_sub (show 3 ≤ t by omega),
     Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topFourthQM55C
   have h0 : 2*s+d+11=(n:ℚ)+6-t := by dsimp [s,d]; ring
   have h1 : s+d+9=(n:ℚ)-2*t+9 := by dsimp [s,d]; ring
   have hm : s+2=(t:ℚ)-3 := by dsimp [s]; ring
   have hc : -s-d-5=4-((n:ℚ)-2*t+9) := by dsimp [s,d]; ring
   rw [h0,h1,hm,hc]
   exact h
 exact ⟨h2Q,h3Q,h4Q⟩

theorem source_middle_jetsM80F (q k : ℕ) (r : Bool) (hq : 1 ≤ q) (hk : k ≤ q)
 (hn : 2*(q+3+k) ≤ sourceNME9C q r) :
 (threeRawM9E2 q r 2 (sourceNME9C q r+2-(q+3+k)):ℚ)=sourceJet2M80F q k r ∧
 (threeRawM9E2 q r 3 (sourceNME9C q r+2-(q+3+k)):ℚ)=sourceJet3M80F q k r ∧
 (threeRawM9E2 q r 4 (sourceNME9C q r+2-(q+3+k)):ℚ)=sourceJet4M80F q k r := by
 have he := source_middle_formulaM99A q k r hq hk
 obtain ⟨h2,h3,h4⟩ := top_template_jetsM80F (sourceNME9C q r) (q+3+k) hn (by omega)
 obtain ⟨_,_,d2,d3,d4⟩ := middle_correction_jetsM80F q k r hq hk
 refine ⟨?_,?_,?_⟩
 · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 2:ℚ)) he
   simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at h
   rw [h2,d2] at h
   rw [h]
   unfold sourceJet2M80F
   congr 2 <;> cases r <;> simp [sourceNME9C] <;> ring
 · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 3:ℚ)) he
   simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at h
   rw [h3,d3] at h
   rw [h]
   unfold sourceJet3M80F
   congr 2 <;> cases r <;> simp [sourceNME9C] <;> ring
 · have h := congrArg (fun p : Polynomial ℤ => (p.coeff 4:ℚ)) he
   simp only [raw_row_coeffMC3E,three_raw_formulaM9E2,coeff_add,Int.cast_add] at h
   rw [h4,d4] at h
   rw [h]
   unfold sourceJet4M80F
   congr 2 <;> cases r <;> simp [sourceNME9C] <;> ring

end
end MathGKM.Markov
