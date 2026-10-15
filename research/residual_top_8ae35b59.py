"""Machine-authored exact-root residual candidate for the c-1 predecessor subfamily."""
from pathlib import Path
D=Path('/Users/sasha/math_gkm/research')
s=(D/'MarkovResidualM253.lean').read_text()
s=s.replace('import MarkovOnsetAllM253','import MarkovFourthTopM8AE\nimport MarkovResidualM253')
s=s.replace('request 2532cf40','request 8ae35b59')
start=s.index('def SolvedFourthRegionM253');end=s.index('\ndef InteriorCore63M253',start)
s=s[:start]+'''def TopFourthRegionM8AE (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧
  (frame rest).mid.a+1=(frame rest).mid.b
'''+s[end:]
s=s.replace('InteriorCore63M253','InteriorCore63TopM8AE').replace('theorem root_iff_coreM253','theorem root_iff_coreTopM8AE')
s=s.replace('¬SolvedFourthRegionM253 path i j →','¬SolvedFourthRegionM253 path i j → ¬TopFourthRegionM8AE path i j →')
s=s[:s.index('\ntheorem root_iff_coreTopM8AE')]+'''
theorem root_iff_coreTopM8AE : Conjecture63 ↔ InteriorCore63TopM8AE := by
 rw [root_iff_coreM253]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon
   by_cases he : TopFourthRegionM8AE path i j
   · obtain ⟨n,rest,hpath,hn,hc,hdiag,hr⟩ := he
     subst path
     exact run_fourth_topM8AE n rest hn hc hr i j h0 h1 h2 hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon he
end
end MathGKM.Markov
'''
p=D/'MarkovResidualTopM8AE.lean';assert not p.exists();p.write_text(s)
print('Created exact top-predecessor residual candidate.')
