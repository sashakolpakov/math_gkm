"""Machine-authored source generator. Every emitted equivalence needs Lean checking."""
from pathlib import Path
s=Path('research/MarkovResidualM0D3.lean').read_text()
d=s[s.index('def InteriorCore63M0D3'):s.index('\ntheorem root_iff_interiorM0D3')]
d=d.replace('InteriorCore63M0D3','OtherVerticalCoreM0D3').replace('¬(m.a=2 ∧ i=4)','m.a≠2')
text='''import MarkovResidualM0D3
import MarkovVerticalEquivalenceM0D3
/-! Machine-authored 0d346fa7. Exact factorization of the pinned root into
the remaining uniform numerator-two vertical sign question and every other
unresolved clause. Neither factor is proved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def UniformVerticalRemainingM0D3 : Prop := ∀ i : ℕ, 5 ≤ i → VerticalRegionsM0D3 i
'''+d+'''
theorem root_iff_uniform_verticalM0D3 :
 Conjecture63 ↔ UniformVerticalRemainingM0D3 ∧ OtherVerticalCoreM0D3 := by
 constructor
 · intro h
   constructor
   · intro i hi
     apply vertical_regions_of_sourceM0D3 i (by omega)
     intro path ha j
     have hg := (global_iff_weak18 (raw_outside_polygon18 path)).mpr (h.2.2 path)
     exact hg.2.1 i j
   · intro path
     dsimp only
     intro ha
     obtain ⟨hh,hv,hd⟩ := root_iff_interiorM0D3.mp h path ha
     refine ⟨hh,?_,hd⟩
     intro i j h0 h1 h2 ht hi hj hm hn hs hc
     exact hv i j h0 h1 h2 ht hi hj hm hn hs (fun he => hc he.1)
 · rintro ⟨hu,ho⟩
   apply root_iff_interiorM0D3.mpr
   intro path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := ho path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi hj hm hn hs hc
   by_cases he : (frame path).mid.a=2
   · have hi5 : 5 ≤ i := by
       by_contra hn
       apply hc
       exact ⟨he,by omega⟩
     exact source_two_vertical_regionsM0D3 i (by omega) (hu i hi5) path he j
   · exact hv i j h0 h1 h2 ht hi hj hm hn hs he

end
end MathGKM.Markov
'''
Path('research/MarkovUniformVerticalM0D3.lean').write_text(text)
