"""Machine-authored exact residual assembly. No claim that the residual is proved."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
s=(D/'MarkovResidualAssemblyM5DC.lean').read_text()
core=s[s.index('def InteriorCore63OneM5DC'):s.index('\ntheorem root_iff_core_oneM5DC')]
core=core.replace('InteriorCore63OneM5DC','InteriorCore63M253').replace('¬MiddleFourthOneRegionM5DC path i j →','¬MiddleFourthOneRegionM5DC path i j → ¬SolvedFourthRegionM253 path i j →')
out='''import MarkovOnsetAllM253
/-! Machine-authored request 2532cf40. Exact pinned-root residual, still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def SolvedFourthRegionM253 (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧
  ((frame rest).mid.a=1 ∨ (2*n<j ∧ j≤2*n+5))

'''+core+'''

theorem root_iff_coreM253 : Conjecture63 ↔ InteriorCore63M253 := by
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
   by_cases he : SolvedFourthRegionM253 path i j
   · obtain ⟨n,rest,hpath,hn,hc,hdiag,hcase⟩ := he
     subst path
     rcases hcase with hr | ⟨hj,hju⟩
     · exact run_fourth_oneM253 n rest hn hc hr i j h0 h1 h2 hdiag
     · exact source_fourth_onsetM253 n rest hn hc i j hj hju hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm he
end
end MathGKM.Markov
'''
p=D/'MarkovResidualM253.lean';assert not p.exists();p.write_text(out)
