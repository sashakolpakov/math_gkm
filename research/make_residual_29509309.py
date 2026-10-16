"""Machine-authored exact residual adapter; every previous guard is preserved."""
from pathlib import Path
s=Path('research/MarkovResidualM0D3.lean').read_text()
definition=s[s.index('def InteriorCore63M0D3'):s.index('\ntheorem root_iff_interiorM0D3')]
definition=definition.replace('InteriorCore63M0D3','InteriorCore63M295')
definition=definition.replace('¬(m.a=2 ∧ i=4) →','¬(m.a=2 ∧ i=4) → ¬(m.a=2 ∧ i=8) →')
head='''import MarkovResidualM0D3
import MarkovEightVerticalM295
/-! Machine-authored 29509309. All previous residual clauses are preserved;
only the newly proved eighth vertical column of numerator-two sources is removed. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
'''
proof='''
theorem root_iff_interiorM295 : Conjecture63 ↔ InteriorCore63M295 := by
 rw [root_iff_interiorM0D3]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi hj hm hn hs hc _ =>
     hv i j h0 h1 h2 ht hi hj hm hn hs hc,hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi hj hm hn hs hc
   by_cases he : (frame path).mid.a=2 ∧ i=8
   · rcases he with ⟨he,rfl⟩
     exact source_two_vertical_eightM295 path he j
   · exact hv i j h0 h1 h2 ht hi hj hm hn hs hc he
end
end MathGKM.Markov
'''
Path('research/MarkovResidualM295.lean').write_text(head+definition+proof)
