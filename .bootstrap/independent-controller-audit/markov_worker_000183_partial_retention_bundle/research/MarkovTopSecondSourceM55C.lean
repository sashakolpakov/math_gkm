import MarkovTopSecondGapM55C
/-! Machine-authored 55cf20d2. The columns 2,3,4 certificate applies to
unbounded numerator-three sources, using their literal raw coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem weighted_choose_castM55C (a k m : ℕ) :
 (weightedChooseM55C a k m:ℚ)=weightedChooseQM55C a m k := by
 simp [weightedChooseM55C,weightedChooseQM55C,choose_poly_natM0D3]

theorem top_template_second_strictM55C (n t : ℕ) (hn : 2*t ≤ n)
 (ht : 5 ≤ t) (hnt : 3*t ≤ n+5) :
 (topTemplateMB3E n t).coeff 2*(topTemplateMB3E n t).coeff 4 <
 (topTemplateMB3E n t).coeff 3^2 := by
 let s : ℚ := t-5
 let d : ℚ := n+5-3*t
 have hs : 0 ≤ s := by
   have h : (5:ℚ) ≤ t := by exact_mod_cast ht
   dsimp [s]; linarith
 have hd : 0 ≤ d := by
   have h : (3:ℚ)*t ≤ n+5 := by exact_mod_cast hnt
   dsimp [d]; linarith
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
 have hg := top_second_gap_positiveM55C s d hs hd
 rw [←h2Q,←h3Q,←h4Q] at hg
 exact_mod_cast hg

theorem source_top_second_strictM55C (q t : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 threeRawM9E2 q r 2 (sourceNME9C q r+2-t)*
 threeRawM9E2 q r 4 (sourceNME9C q r+2-t) <
 threeRawM9E2 q r 3 (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t 2 r hq ht,source_top_coeffMB3E q t 3 r hq ht,
   source_top_coeffMB3E q t 4 r hq ht]
 apply top_template_second_strictM55C
 · cases r <;> simp [sourceNME9C] <;> omega
 · exact ht0
 · cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_second_polygonM55C (q t : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 InPolygon 3 (sourceNME9C q r) 2 (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) 3 (sourceNME9C q r+2-t) ∧
 InPolygon 3 (sourceNME9C q r) 4 (sourceNME9C q r+2-t) := by
 cases r <;> simp only [sourceNME9C,Bool.false_eq_true,if_false,if_true,InPolygon] <;> omega

theorem source_top_second_pathM55C (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ t, 5 ≤ t → t ≤ q+2 →
 coeff (frame path).mid.p 2 ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p 4 ((frame path).mid.b+2-t) <
 coeff (frame path).mid.p 3 ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hb' : (frame path).mid.b=sourceNME9C q r := hb
 refine ⟨q,r,hq,hb',?_⟩
 intro t ht0 ht
 rw [hb']
 simp only [hp]
 exact source_top_second_strictM55C q t r hq ht0 ht

end
end MathGKM.Markov
