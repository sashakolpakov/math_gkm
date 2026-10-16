"""Machine-authored new exact residual; no inherited file is altered."""
from pathlib import Path
s=Path('research/MarkovResidualM37B.lean').read_text()
d=s[s.index('def InteriorCore63M37B'):s.index('theorem root_iff_interiorM37B')]
d=d.replace('InteriorCore63M37B','InteriorCore63M3A1').replace('   ¬HorizontalSharpM37B m.a m.b i j →','   ¬HorizontalSharpM37B m.a m.b i j →\n   ¬(m.a=2 ∧ i=2 ∧ m.b=2*j+1) →')
out='''import MarkovResidualM37B
import MarkovSourceCentralM3A1
/-! Machine-authored 3a11314d. Exact residual; all other clauses are retained. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
'''+d+'''theorem root_iff_interiorM3A1 : Conjecture63 ↔ InteriorCore63M3A1 := by
 rw [root_iff_interiorM37B]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨fun i j h0 h1 h2 ht hj hm hn hs _ => hh i j h0 h1 h2 ht hj hm hn hs,hv,hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,hv,hd⟩
   intro i j h0 h1 h2 ht hj hm hn hs
   by_cases hc : (frame path).mid.a=2 ∧ i=2 ∧ (frame path).mid.b=2*j+1
   · obtain ⟨ha',rfl,hb⟩ := hc
     exact source_two_centralM3A1 path j ha' hb
   · exact hh i j h0 h1 h2 ht hj hm hn hs hc
end
end MathGKM.Markov
'''
Path('research/MarkovResidualM3A1.lean').write_text(out)
