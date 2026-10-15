"""Machine-authored adapters; generated source must compile before use."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
head='namespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 2000000\n'
end='end\nend MathGKM.Markov\n'
st=''.join(f'import MarkovOnset{tag}{k}M96\n' for k in range(1,5) for tag in 'LABD')
st+=''.join(f'import MarkovOnsetValue{k}M96\n' for k in range(1,7))+head
for k in range(1,5):
 st+=f'''
theorem onset_lc{k}M96 (n c r : ℤ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) :
 onsetValue{k}M96 n c r*onsetValue{k+2}M96 n c r≤onsetValue{k+1}M96 n c r^2 := by
 by_cases hh : 4≤r
 · have h := onsetL{k}M96 (n-4) (c-r-1) (r-4) (by omega) (by omega) (by omega)
   have en : n-4+4=n := by ring
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ec,er] at h
   exact sub_nonneg.mp h
 · have cases : r=3 ∨ r=2 ∨ r=1 := by omega
   rcases cases with h|h|h <;> subst r
'''
 for tag in 'ABD':
  st+=f'''   · have h := onset{tag}{k}M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
'''
st+='''
theorem onset_early_lcM96 (n c r : ℤ) (k : ℕ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) (hk : 1≤k) (hk4 : k≤4) :
 earlyBlockValueM042 n c r k*earlyBlockValueM042 n c r (k+2)≤
 earlyBlockValueM042 n c r (k+1)^2 := by
 interval_cases k
'''
for k in range(1,5):
 st+=f''' · norm_num only [Nat.reduceAdd]
   rw [onset_value{k}M96,onset_value{k+1}M96,onset_value{k+2}M96]
   exact onset_lc{k}M96 n c r hn hc hr hrc
'''
(R/'research/MarkovOnsetM96.lean').write_text(st+end)
st='import MarkovOnsetM96\n'+head+'''
theorem source_fourth_onsetM96 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hn : 4≤n) (i k : ℕ)
 (hk : 1≤k) (hk4 : k≤4)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_early_shapeM042 n rest hc (i+2) k (by omega) (by omega) (by omega)
 have h1 := source_fourth_early_shapeM042 n rest hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_early_shapeM042 n rest hc i (k+2) (by omega) (by omega) (by omega)
 simp only [←Nat.add_assoc] at h0 h1 h2
 have hr := frame_reduced rest
 have hg := onset_early_lcM96 n (frame rest).mid.b (frame rest).mid.a k
   (by exact_mod_cast hn) (by exact_mod_cast hc) (by exact_mod_cast hr.1)
   (by exact_mod_cast hr.2.1) hk hk4
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
'''
(R/'research/MarkovOnsetSourceM96.lean').write_text(st+end)
print('adapters generated, not yet checked')
