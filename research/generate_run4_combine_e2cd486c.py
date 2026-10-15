"""Machine-authored run-four proof composition."""
from pathlib import Path
out='\n'.join('import MarkovRun4'+s+'E2' for s in ['LowOne','LowLarge','HighOne','HighLarge'])+'\nimport MarkovCrossCoefficientsE2\nnamespace MathGKM.Markov\nnoncomputable section\n'
for k in range(4):
 out+=f'''theorem run4_cross_gap{k}E2 (c r : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (q : ℤ) (hq : q=max (2*r-c) 0) :
 crossTail{k+1}53D 4 c r q*crossTail{k+3}53D 4 c r q ≤ (crossTail{k+2}53D 4 c r q)^2 := by
 by_cases hch : 2*r ≤ c
 · have hq' : q=0 := by omega
   rw [hq']
   by_cases h1 : r=1
   · subst r
     have hh := run4_LowOne_{k}E2 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_LowLarge_{k}E2 (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · have hq' : q=2*r-c := by omega
   rw [hq']
   by_cases h1 : c-r=1
   · have hh := run4_HighOne_{k}E2 (c-4) 0 (by omega) (by omega)
     have he : r=c-1 := by omega
     rw [he]
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := run4_HighLarge_{k}E2 (2*r-c) (c-r-2) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
'''
out+='''theorem run4_cross_lcE2 (c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r) (hrc : r+1 ≤ c)
 (hj : 9 ≤ j) (hj' : j ≤ 12) :
 (thirdRunPolyADB2 4 c r).coeff j*(thirdRunPolyADB2 4 c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 4 c r).coeff (j+1))^2 := by
 have hq : ((2*r-c:ℕ):ℤ)=max (2*(r:ℤ)-c) 0 := by omega
 interval_cases j
'''
for k in range(4):
 out+=f''' · have h := run4_cross_gap{k}E2 c r (by omega) (by omega) (by omega) _ hq
   rw [cross_tail_coeff{k+1}E2 4 c r (by omega) (by omega),
     cross_tail_coeff{k+2}E2 4 c r (by omega) (by omega),
     cross_tail_coeff{k+3}E2 4 c r (by omega) (by omega)] at h
   norm_num only [Nat.reduceAdd,Nat.reduceMul] at h ⊢
   nlinarith only [h]
'''
out+='end\nend MathGKM.Markov\n';Path('research/MarkovRun4CombineE2.lean').write_text(out)
