import MarkovTopEquationMB3E
/-! Machine-authored b3eed364. A denominator-only template for an unbounded
upper sector of both numerator-three source families. No LC is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def topDiagonalDeltaMB3E (n t : ℕ) : Polynomial ℤ := topDeltaMB3E n (n+2-t)

def topTemplateMB3E (n : ℕ) : ℕ → Polynomial ℤ
 | 0 => 1
 | 1 => topDiagonalDeltaMB3E n 1+4
 | t+2 => topDiagonalDeltaMB3E n (t+2)+2*(X+1)*topDiagonalDeltaMB3E n (t+1)+
     (X+1)^2*topDiagonalDeltaMB3E n t-
     2*(X-1)*topTemplateMB3E n (t+1)-(X+1)^2*topTemplateMB3E n t

theorem source_top_templateMB3E (q t : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht : t ≤ q+2) :
 rawRowMC3E (threePolyM9E2 q r) (sourceNME9C q r+2-t)=
 topTemplateMB3E (sourceNME9C q r) t := by
 have hn : 3*q+1 ≤ sourceNME9C q r := by cases r <;> simp [sourceNME9C] <;> omega
 induction t using Nat.strong_induction_on with
 | h t ih =>
   rcases t with _|_|t
   · have he := source_top_equationMB3E q (sourceNME9C q r+2) r (by omega)
     rw [source_rows_aboveMB3E q (sourceNME9C q r+2+1) r hq (by omega),
       source_rows_aboveMB3E q (sourceNME9C q r+2+2) r hq (by omega),
       top_delta_aboveMB3E _ (sourceNME9C q r+2+1) (by omega),
       top_delta_aboveMB3E _ (sourceNME9C q r+2+2) (by omega),
       top_delta_topMB3E] at he
     simpa [topTemplateMB3E] using he
   · have h0 := ih 0 (by omega) (by omega)
     simp only [Nat.sub_zero,topTemplateMB3E] at h0
     have he := source_top_equationMB3E q (sourceNME9C q r+1) r (by omega)
     rw [show sourceNME9C q r+1+1=sourceNME9C q r+2 by omega,h0,
       source_rows_aboveMB3E q (sourceNME9C q r+1+2) r hq (by omega),
       top_delta_topMB3E,top_delta_aboveMB3E _ (sourceNME9C q r+1+2) (by omega)] at he
     simp only [topTemplateMB3E,topDiagonalDeltaMB3E,
       show sourceNME9C q r+2-1=sourceNME9C q r+1 by omega]
     linear_combination he
   · have h0 := ih t (by omega) (by omega)
     have h1 := ih (t+1) (by omega) (by omega)
     have he := source_top_equationMB3E q (sourceNME9C q r-t) r (by omega)
     rw [show sourceNME9C q r-t+1=sourceNME9C q r+2-(t+1) by omega,
       show sourceNME9C q r-t+2=sourceNME9C q r+2-t by omega,h0,h1] at he
     rw [show sourceNME9C q r+2-(t+1+1)=sourceNME9C q r-t by omega,
       topTemplateMB3E,topDiagonalDeltaMB3E]
     rw [show sourceNME9C q r+2-(t+2)=sourceNME9C q r-t by omega,
       show sourceNME9C q r+2-(t+1)=sourceNME9C q r+1-t by omega]
     have hx : sourceNME9C q r+2-(t+1)=sourceNME9C q r+1-t := by omega
     rw [hx] at he
     linear_combination he

theorem source_top_coeffMB3E (q t i : ℕ) (r : Bool) (hq : 1 ≤ q)
 (ht : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)=
 (topTemplateMB3E (sourceNME9C q r) t).coeff i := by
 rw [←three_raw_formulaM9E2,←raw_row_coeffMC3E,source_top_templateMB3E q t r hq ht]

theorem source_top_pathMB3E (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ t i, t ≤ q+2 → coeff (frame path).mid.p i ((frame path).mid.b+2-t)=
   (topTemplateMB3E (frame path).mid.b t).coeff i := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hb' : (frame path).mid.b=sourceNME9C q r := hb
 refine ⟨q,r,hq,hb',?_⟩
 intro t i ht
 rw [hb',hp,source_top_coeffMB3E q t i r hq ht]

def TopTemplateLCMB3E : Prop := ∀ n t : ℕ, 4 ≤ n → 3*t ≤ n+5 →
 ∀ i, (topTemplateMB3E n t).coeff i*(topTemplateMB3E n t).coeff (i+2) ≤
   (topTemplateMB3E n t).coeff (i+1)^2

theorem source_top_of_templateMB3E (H : TopTemplateLCMB3E)
 (q t i : ℕ) (r : Bool) (hq : 1 ≤ q) (ht : t ≤ q+2) :
 threeRawM9E2 q r i (sourceNME9C q r+2-t)*
 threeRawM9E2 q r (i+2) (sourceNME9C q r+2-t) ≤
 threeRawM9E2 q r (i+1) (sourceNME9C q r+2-t)^2 := by
 rw [source_top_coeffMB3E q t i r hq ht,source_top_coeffMB3E q t (i+2) r hq ht,
   source_top_coeffMB3E q t (i+1) r hq ht]
 apply H
 · cases r <;> simp [sourceNME9C] <;> omega
 · cases r <;> simp [sourceNME9C] <;> omega

end
end MathGKM.Markov
