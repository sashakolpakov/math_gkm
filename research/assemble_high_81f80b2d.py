"""Machine-authored cone covering candidates, keeping all zero cases."""
from pathlib import Path
head='''namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
'''
for c in range(3):
 src='\n'.join(f'import MarkovHighCone{c}Cert{r}M81F' for r in range(7))+f'\nimport MarkovHighCone{c}ExpandM81F\n'+head
 for r in range(7):
  src+=f'''theorem high_coefficient{c}_{r}M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c{c}g{r}M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high{c}_{r}_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (by exact_mod_cast (show (9:ℕ) ≤ l from h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · exact high{c}_{r}_z7M81F 0 0 (by norm_num) (by norm_num)
   · exact high{c}_{r}_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high{c}_{r}_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (by exact_mod_cast hk1) (by exact_mod_cast h9)
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
'''
  for l in range(2,9):
   shift=max(7-l,1)
   src+=f''' · have hks : ({shift}:ℝ) ≤ k := by exact_mod_cast (show {shift} ≤ k by omega)
   have h := high{c}_{r}_s{l}M81F ((k:ℝ)-{shift}) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
'''
 src+=f'''theorem high_cone{c}_nonnegM81F (k l : ℕ) (q : ℝ)
 (hl : 2 ≤ l) (hN : 7 ≤ k+l) (hq : 0 ≤ q) : 0 ≤ highCone{c}M81F k l q := by
'''
 for r in range(7):src+=f' have h{r} := high_coefficient{c}_{r}M81F k l hl hN\n'
 src+=f''' have hh : 0 ≤ {([2,3,4][c])**6}*highCone{c}M81F k l q := by
  rw [high_expand{c}M81F]
  positivity
 linarith
end
end MathGKM.Markov
'''
 # Cast inequalities must be subtraction-normalized before exact_mod_cast.
 src=src.replace('(by exact_mod_cast (show (9:ℕ) ≤ l from h9))','(by have hh : (9:ℝ) ≤ l := by exact_mod_cast h9; linarith)')
 src=src.replace('(by exact_mod_cast hk1) (by exact_mod_cast h9)','(by have hh : (1:ℝ) ≤ k := by exact_mod_cast hk1; linarith) (by have hh : (9:ℝ) ≤ l := by exact_mod_cast h9; linarith)')
 Path(f'research/MarkovHighCone{c}GapM81F.lean').write_text(src)
print('Generated cone coverage assemblies')
