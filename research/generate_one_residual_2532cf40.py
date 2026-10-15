"""Machine-authored exact root reduction using only the completed numerator-one result."""
from pathlib import Path
D=Path('/Users/sasha/math_gkm/research')
s=(D/'MarkovResidualAssemblyM5DC.lean').read_text()
core=s[s.index('def InteriorCore63OneM5DC'):s.index('\ntheorem root_iff_core_oneM5DC')]
core=core.replace('InteriorCore63OneM5DC','InteriorCore63FullOneM253').replace('¬MiddleFourthOneRegionM5DC path i j →','¬MiddleFourthOneRegionM5DC path i j → ¬FullFourthOneRegionM253 path i j →')
out='''import MarkovOnsetOneAssemblyM253
/-! Machine-authored request 2532cf40. Exact root residual, not a proof of that residual. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def FullFourthOneRegionM253 (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ (frame rest).mid.a=1 ∧ i+j+2=(frame path).mid.a+4

'''+core+'''

theorem root_iff_core_full_oneM253 : Conjecture63 ↔ InteriorCore63FullOneM253 := by
 rw [root_iff_core_oneM5DC]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm
   by_cases he : FullFourthOneRegionM253 path i j
   · obtain ⟨n,rest,hpath,hn,hc,hr,hdiag⟩ := he
     subst path
     exact run_fourth_oneM253 n rest hn hc hr i j h0 h1 h2 hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm he
end
end MathGKM.Markov
'''
p=D/'MarkovResidualOneM253.lean';assert not p.exists();p.write_text(out)
