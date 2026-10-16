"""Machine-authored generation of a fresh residual; inherited source is read only."""
from pathlib import Path
s=Path('research/MarkovResidualM3A1.lean').read_text()
body=s[s.index('def InteriorCore63M3A1'):s.index('theorem root_iff_interiorM3A1')]
body=body.replace('InteriorCore63M3A1','InteriorCore63M6E1').replace('m.a=2 ∧ i=2 ∧ m.b=2*j+1','m.a=2 ∧ m.b=2*j+1')
head='''import MarkovResidualM3A1
import MarkovSourceRowM6E1
/-! Machine-authored 6e1369de. Full central horizontal row removed from
the residual. All other guards, directions and reverse-factor ranges remain. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
'''
proof='''theorem root_iff_interiorM6E1 : Conjecture63 ↔ InteriorCore63M6E1 := by
 rw [root_iff_interiorM3A1]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,hv,hd⟩
   intro i j h0 h1 h2 ht hj hm hn hs hc
   exact hh i j h0 h1 h2 ht hj hm hn hs (fun h => hc ⟨h.1,h.2.2⟩)
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,hv,hd⟩
   intro i j h0 h1 h2 ht hj hm hn hs hcOld
   by_cases hc : (frame path).mid.a=2 ∧ (frame path).mid.b=2*j+1
   · exact source_two_rowM6E1 path j i hc.1 hc.2
   · exact hh i j h0 h1 h2 ht hj hm hn hs hc
end
end MathGKM.Markov
'''
Path('research/MarkovResidualM6E1.lean').write_text(head+body+proof)
print('Fresh residual written; equivalence awaits compilation.')
