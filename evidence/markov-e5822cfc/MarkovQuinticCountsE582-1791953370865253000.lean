import MarkovQuinticSourceE582
import MarkovSmallQuartic26dd
/-! Machine-authored request e5822cfc. Lower local-count bounds. -/
namespace MathGKM.Markov
theorem triples_lower_auxE582 (e r : Bool) (w : List Bool) :
 w.length ≤ triples4f8 e r w+3*w.count true+(if e then 1 else 0)+(if r then 2 else 0) := by
 induction w generalizing e r with
 | nil => simp [triples4f8]
 | cons z zs ih =>
   have hi := ih r z
   cases e <;> cases r <;> cases z <;>
     simp [triples4f8,List.count_cons,List.length_cons] at hi ⊢ <;> omega
theorem triples_lowerE582 (d e r : Bool) (w : List Bool) :
 (d::e::r::w).length ≤ triples4f8 d e (r::w)+3*(d::e::r::w).count true+2 := by
 have hi := triples_lower_auxE582 d e (r::w)
 cases d <;> cases e <;> simp [List.count_cons,List.length_cons] at hi ⊢ <;> omega
theorem quadsH_lower_auxE582 (d e r : Bool) (w : List Bool) :
 w.length ≤ quadsHE582 d e r w+4*w.count true+
   (if d then 1 else 0)+(if e then 2 else 0)+(if r then 3 else 0) := by
 induction w generalizing d e r with
 | nil => simp [quadsHE582]
 | cons z zs ih =>
   have hi := ih e r z
   cases d <;> cases e <;> cases r <;> cases z <;>
     simp [quadsHE582,hitHE582,List.count_cons,List.length_cons] at hi ⊢ <;> omega
theorem quadsH_lowerE582 (d e r : Bool) (w : List Bool) :
 (d::e::r::w).length ≤ quadsHE582 d e r w+4*(d::e::r::w).count true+3 := by
 have hi := quadsH_lower_auxE582 d e r w
 cases d <;> cases e <;> cases r <;> simp [List.count_cons,List.length_cons] at hi ⊢ <;> omega
#print axioms quadsH_lowerE582
end MathGKM.Markov
