import MarkovQuinticJetE582
import MarkovQuarticSource4f8

/-! Machine-authored request e5822cfc. Exact quintic source identification. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 8000
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

theorem quadsH_boundE582 (d e r : Bool) (w : List Bool) :
 quadsHE582 d e r w ≤ (e::r::w).count false := by
 induction w generalizing d e r with
 | nil => simp [quadsHE582]
 | cons z zs ih =>
   have hi := ih e r z
   cases d <;> cases e <;> cases r <;> cases z <;>
     simp [quadsHE582,hitHE582,List.count_cons] at hi ⊢ <;> omega

theorem quadsK_boundE582 (d e r : Bool) (w : List Bool) :
 quadsKE582 d e r w ≤ (e::r::w).count false+(r::w).count false := by
 induction w generalizing d e r with
 | nil => simp [quadsKE582]
 | cons z zs ih =>
   have hi := ih e r z
   cases d <;> cases e <;> cases r <;> cases z <;>
     simp [quadsKE582,hitKE582,List.count_cons] at hi ⊢ <;> omega

theorem quintic_source_formulaE582 (path : List Bool) (ha : 10 ≤ (frame path).mid.a) :
 ∃ n m s t h k e f : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧
 9 ≤ m ∧ m ≤ n ∧ s ≤ 2*(n-m) ∧ t ≤ n-m ∧ h ≤ n-m ∧ k ≤ 2*(n-m) ∧
 e ≤ 2 ∧ f ≤ 2 ∧
 120*quotientSlice774 path 5=quinticExprE582 (X : Polynomial ℤ) n m s t h k e f := by
 obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
 have hlen : 3 ≤ w.length := by
   have : w.count true ≤ w.length := List.count_le_length
   omega
 cases w with
 | nil => simp at hlen
 | cons d w => cases w with
   | nil => simp at hlen
   | cons e w => cases w with
     | nil => simp at hlen
     | cons r w =>
       let last := endTripleE582 d e r w
       refine ⟨(d::e::r::w).length,(d::e::r::w).count true,
         switchesFrom5a7 d (e::r::w),triples4f8 d e (r::w),
         quadsHE582 d e r w,quadsKE582 d e r w,
         (if d then 0 else 1)+(if last.2.2 then 0 else 1),
         (if hitFE582 d e r then 1 else 0)+(if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0),
         hl,hc,by omega,List.count_le_length,switches_core_bound5a7 d (e::r::w),?_,?_,?_,?_,?_,?_⟩
       · have ht := triples_bound4f8 d e (r::w)
         have hb := bool_counts5a7 (d::e::r::w)
         cases d <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
       · have ht := quadsH_boundE582 d e r w
         have hb := bool_counts5a7 (d::e::r::w)
         cases d <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
       · have ht := quadsK_boundE582 d e r w
         have hb := bool_counts5a7 (d::e::r::w)
         cases d <;> cases e <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
       · split_ifs <;> omega
       · split_ifs <;> omega
       · unfold quotientSlice774
         rw [he]
         have hw := word_quinticE582 (X : Polynomial ℤ) d e r w
         dsimp only at hw
         convert hw using 1 <;> simp only [Nat.cast_add]
         all_goals congr 1 <;> split_ifs <;> norm_num

#print axioms quintic_source_formulaE582
end
end MathGKM.Markov
