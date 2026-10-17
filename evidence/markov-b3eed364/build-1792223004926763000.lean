import MarkovTopEdgeGapMB3E
/-! Machine-authored b3eed364. The strict auxiliary certificate is attached
to raw source coefficients; the root remains non-strict with all zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
attribute [local irreducible] topTemplateMB3E threeRawM9E2

theorem top_template_first_strictMB3E (n t : ℕ) (hn : 2*t ≤ n)
 (ht : 3 ≤ t) (hnt : 3*t ≤ n+5) :
 (topTemplateMB3E n t).coeff 1*(topTemplateMB3E n t).coeff 3 <
 (topTemplateMB3E n t).coeff 2^2 := by
 let s : ℚ := t-3
 let d : ℚ := n+5-3*t
 have hs : 0 ≤ s := by
   have h : (3:ℚ) ≤ t := by exact_mod_cast ht
   dsimp [s]; linarith
 have hd : 0 ≤ d := by
   have h : (3:ℚ)*t ≤ n+5 := by exact_mod_cast hnt
   dsimp [d]; linarith
 have hh := top_edge_coeffsMB3E n t hn ht
 have h3 := top_third_coeffMB3E n t hn ht
 have h1Q : ((topTemplateMB3E n t).coeff 1:ℚ)=4*(d+1) := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) hh.2.1
   push_cast at h
   dsimp [d]
   linear_combination h
 have h2Q : ((topTemplateMB3E n t).coeff 2:ℚ)=topEdgeSecondMB3E s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) hh.2.2
   push_cast at h
   rw [choose_poly_natM0D3] at h
   simp only [Nat.cast_add,Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topEdgeSecondMB3E
   have ha : s+d+4=(n:ℚ)-2*t+6 := by dsimp [s,d]; ring
   rw [ha]
   dsimp [s]
   linear_combination h
 have h3Q : ((topTemplateMB3E n t).coeff 3:ℚ)=topEdgeThirdMB3E s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h3
   push_cast at h
   simp only [choose_poly_natM0D3,Nat.cast_add,
     Nat.cast_sub (show t ≤ n+5 by omega),Nat.cast_sub (show t ≤ n by omega),
     Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topEdgeThirdMB3E
   have h0 : 2*s+d+6=(n:ℚ)+5-t := by dsimp [s,d]; ring
   have h1 : 2*s+d+7=(n:ℚ)-t+6 := by dsimp [s,d]; ring
   have h2 : s+d+7=(n:ℚ)-2*t+9 := by dsimp [s,d]; ring
   have h4 : s+d+6=(n:ℚ)-2*t+8 := by dsimp [s,d]; ring
   rw [h0,h1,h2,h4]
   exact h
 have hg := top_edge_gap_positiveMB3E s d hs hd
 rw [←h1Q,←h2Q,←h3Q] at hg
 exact_mod_cast hg

theorem source_top_first_strictMB3E (q t : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht0 : 5 ≤ t) (ht : t ≤ q+2) :
 threeRawM9E2 q r 1 (sourceNME9C q r+2-t)*
 threeRawM9E2 q r 3 (sourceNME9C q r+2-t) <
 threeRawM9E2 q r 2 (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t 1 r hq ht,source_top_coeffMB3E q t 2 r hq ht,
   source_top_coeffMB3E q t 3 r hq ht]
 apply top_template_first_strictMB3E
 · cases r <;> simp [sourceNME9C] <;> omega
 · omega
 · cases r <;> simp [sourceNME9C] <;> omega

theorem source_top_first_pathMB3E (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ t, 5 ≤ t → t ≤ q+2 →
 coeff (frame path).mid.p 1 ((frame path).mid.b+2-t)*
 coeff (frame path).mid.p 3 ((frame path).mid.b+2-t) <
 coeff (frame path).mid.p 2 ((frame path).mid.b+2-t)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hb' : (frame path).mid.b=sourceNME9C q r := hb
 refine ⟨q,r,hq,hb',?_⟩
 intro t ht0 ht
 rw [hb']
 simp only [hp]
 exact source_top_first_strictMB3E q t r hq ht0 ht

end
end MathGKM.Markov
