"""Machine-authored new residual file; preserves all inherited clauses."""
from pathlib import Path
p=Path('research/MarkovResidualMAC3.lean').read_text()
p=p.replace('import MarkovResidualMF1E\nimport MarkovSourceVarianceMAC3','import MarkovResidualMAC3\nimport MarkovSourceSharpM37B')
p=p.replace('Machine-authored ac3d4ab9','Machine-authored 37bf1d20')
p=p[:p.index('theorem root_iff_interiorMAC3')]
p=p.replace('def InteriorCore63MAC3','def InteriorCore63M37B')
for d in ['Horizontal','Vertical','Diagonal']:
 needle=f'¬({d}RegionMAC3 m.a m.b i j ∨ {d}VarianceMAC3 m.a m.b i j) →'
 p=p.replace(needle,needle+f'\n   ¬{d}SharpM37B m.a m.b i j →')
p+='''theorem root_iff_interiorM37B : Conjecture63 ↔ InteriorCore63M37B := by
 rw [root_iff_interiorMAC3]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨fun i j h0 h1 h2 ht hj hm hn _ => hh i j h0 h1 h2 ht hj hm hn,
     fun i j h0 h1 h2 ht hi hj hm hn _ => hv i j h0 h1 h2 ht hi hj hm hn,
     fun i j h0 h1 h2 ht hs hb hm hn _ => hd i j h0 h1 h2 ht hs hb hm hn⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨?_,?_,?_⟩
   · intro i j h0 h1 h2 ht hj hm hn
     by_cases hs : HorizontalSharpM37B (frame path).mid.a (frame path).mid.b i j
     · exact source_horizontal_sharpM37B path i j hs
     · exact hh i j h0 h1 h2 ht hj hm hn hs
   · intro i j h0 h1 h2 ht hi hj hm hn
     by_cases hs : VerticalSharpM37B (frame path).mid.a (frame path).mid.b i j
     · exact source_vertical_sharpM37B path i j hs
     · exact hv i j h0 h1 h2 ht hi hj hm hn hs
   · intro i j h0 h1 h2 ht hs hb hm hn
     by_cases hd' : DiagonalSharpM37B (frame path).mid.a (frame path).mid.b i j
     · exact source_diagonal_sharpM37B path i j hd'
     · exact hd i j h0 h1 h2 ht hs hb hm hn hd'
end
end MathGKM.Markov
'''
q=Path('research/MarkovResidualM37B.lean');assert not q.exists();q.write_text(p)
