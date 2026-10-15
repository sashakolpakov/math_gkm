"""Machine-authored generalization of the checked degree-separation proof."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm/research')
s=(R/'MarkovTailExtractM06.lean').read_text().replace('M06','M94').replace('06b5b1f9','94b1de05')
s=s.replace('hd : L.natDegree ≤ m+7','hd : L.natDegree ≤ m+k+7').replace('(hn : 7≤n)','(hn : 7≤n+k)')
(R/'MarkovTailExtractM94.lean').write_text(s)
s=(R/'MarkovFullTailSourceM06.lean').read_text().replace('import MarkovTailExtractM06','import MarkovTailExtractM94').replace('source_fourth_tail_of_splitM06','source_fourth_tail_of_splitM94').replace('tail_coeff_four_blocksM06','tail_coeff_four_blocksM94').replace('06b5b1f9','94b1de05')
s=s.replace('(n : ℕ) (rest : List Bool)','(n k : ℕ) (rest : List Bool)').replace('(hn : 7≤n)','(hn : 7≤n+k)').replace('(i k : ℕ)','(i : ℕ)')
(R/'MarkovFullTailSourceM94.lean').write_text(s)
for c in range(6):
 s=(R/f'MarkovTailSource{c}M06.lean').read_text()
 s='import MarkovTailSource'+str(c)+'M06\nimport MarkovFullTailSourceM94\n/-! Machine-authored 94b1de05: weakened stable-tail threshold. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 4000000\nset_option maxRecDepth 16384\nset_option linter.unusedSimpArgs false\n'+s[s.index('attribute [local irreducible] tailPoly'):]
 s=s.replace(f'source_fourth_tail_coeff{c}M06',f'source_fourth_tail_coeff{c}M94').replace(f'source_fourth_tail_chamber{c}M06',f'source_fourth_tail_chamber{c}M94').replace('source_fourth_tail_of_splitM06','source_fourth_tail_of_splitM94')
 s=s.replace('(n : ℕ) (rest : List Bool)','(n k : ℕ) (rest : List Bool)').replace('(hn : 7≤n)','(hn : 7≤n+k)').replace('(i k : ℕ)','(i : ℕ)')
 s=s.replace('source_fourth_tail_of_splitM94 n rest hn','source_fourth_tail_of_splitM94 n k rest hn').replace(' _ _) i k hs',' _ _) i hs')
 for offset,ind in [('k','(i+2)'),('(k+2)','i'),('(k+1)','(i+1)')]:
  s=s.replace(f'source_fourth_tail_coeff{c}M94 n rest hn hc hl hu {ind} {offset}',f'source_fourth_tail_coeff{c}M94 n {offset} rest (by omega) hc hl hu {ind}')
 (R/f'MarkovTailSource{c}M94.lean').write_text(s)
s=(R/'MarkovTailAllM06.lean').read_text().replace('M06','M94').replace('06b5b1f9','94b1de05').replace('(n : ℕ) (rest : List Bool)','(n k : ℕ) (rest : List Bool)').replace('(hn : 7≤n)','(hn : 7≤n+k)').replace('(i k : ℕ)','(i : ℕ)')
for c in range(6):
 s=s.replace(f'source_fourth_tail_chamber{c}M94 n rest hn',f'source_fourth_tail_chamber{c}M94 n k rest hn').replace('i k hk hs','i hk hs')
(R/'MarkovTailAllM94.lean').write_text(s)
