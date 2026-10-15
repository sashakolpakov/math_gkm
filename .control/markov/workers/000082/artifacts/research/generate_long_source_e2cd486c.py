"""Machine-authored exact source composition extending the run cutoff."""
from pathlib import Path
out='''import MarkovRun4CombineE2
import MarkovTerminalSourceE2
namespace MathGKM.Markov
noncomputable section
theorem third_three_bandsE2 (n c r j : ℕ) (hn : 4 ≤ n) (hc : 4 ≤ c)
 (hr : 1 ≤ r) (hrc : r+1 ≤ c) (hj : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h : 5 ≤ n
 · exact third_three_bands_lc53D n c r j h hc hr hrc hj
 · have he : n=4 := by omega
   subst n
   by_cases h1 : j ≤ 8
   · exact third_two_bands_lc07F1 4 c r j hr hrc (by omega) (by omega)
   · by_cases h2 : j ≤ 12
     · exact run4_cross_lcE2 c r j hc hr hrc (by omega) h2
     · exact third_tail_lc53D 4 c r j hc hr hrc (by omega) hj
theorem source_third_three_bandsE2 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hn : 4 ≤ n) (hc : 4 ≤ (frame rest).mid.b) (hj : j ≤ 3*n+1)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 have h := third_three_bandsE2 n (frame rest).mid.b (frame rest).mid.a j
   hn hc (by omega) (by omega) hj
 rw [←source_third_run_rawADB2 n rest hc i (j+2) (by omega),
   ←source_third_run_rawADB2 n rest hc (i+2) j (by omega),
   ←source_third_run_rawADB2 n rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]
'''
s=Path('research/MarkovTerminalSourceE2.lean').read_text();s=s[s.index('theorem source_third_long_largeE2'):s.index('\n#print axioms')]
s=s.replace('source_third_long_largeE2','source_third_ge_fourE2').replace('5 ≤ n','4 ≤ n').replace('source_third_three_bands53D','source_third_three_bandsE2')
out+=s+'\n#print axioms source_third_ge_fourE2\nend\nend MathGKM.Markov\n';Path('research/MarkovLongSourceE2.lean').write_text(out)
