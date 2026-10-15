"""Machine-authored run-six source assembly and exact residual candidate."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
s=(D/'MarkovOnsetAllM722.lean').read_text();s=s[s.index('theorem source_fourth_onsetM722'):s.rindex('end\nend')]
s=s.replace('source_fourth_onsetM722 (n k : ℕ) (rest : List Bool)\n (hn : 7≤n)','source_finalSixM8B8 (k : ℕ) (rest : List Bool)')
s=s.replace('3*n','18').replace('List.replicate n','List.replicate 6')
for ch in range(6):
 import re
 s=re.sub(rf'source_fourth_onset_chamber{ch}\w+ n k rest hn hc',f'source_finalSix_chamber{ch}M8B8 rest hc',s)
 s=s.replace(f'chamber{ch}M8B8 rest hc (by omega) (by omega) i hk hkn hs',f'chamber{ch}M8B8 rest hc (by omega) (by omega) i k hk hkn hs')
head='/-! Machine-authored request 8b851864. Whole fourth lower slice for n>=6, c>=5. -/\nnamespace MathGKM.Markov\nnoncomputable section\nattribute [local irreducible] frame coeff\n'
s=''.join(f'import MarkovFinalSixChamber{ch}M8B8\n' for ch in range(6))+'import MarkovFourthShortResidualM8B8\n'+head+s
s+='''
theorem run_fourth_sixM8B8 (rest : List Bool) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 6 rest := by
 apply (run_fourth_iff_shortM8B8 6 rest (by omega) hc).mpr
 intro i j h0 h1 h2 hs hj hm hju
 have h := source_finalSixM8B8 (j-18) rest hc i (by omega) (by omega) (by omega)
 simpa only [show 18+(j-18)=j by omega] using h

theorem run_fourth_ge_sixM8B8 (n : ℕ) (rest : List Bool)
 (hn : 6≤n) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 by_cases h : 7≤n
 · exact run_fourth_allM8B8 n rest h hc
 · have he : n=6 := by omega
   subst n
   exact run_fourth_sixM8B8 rest hc
end
end MathGKM.Markov
'''
p=D/'MarkovFourthSixCompleteM8B8.lean';assert not p.exists();p.write_text(s)
print(p.name)
