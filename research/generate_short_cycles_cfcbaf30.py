"""Machine-authored bounded run complements, ordinary Lean arithmetic only."""
from generate_small_cfcbaf30 import *
def generate(c,r):
 tag=f'{c}{r}MCFC';terms=grouped(numerator(c,r));m=f'MarkovCycleShort{tag}'
 s=f'import MarkovSmallNumerator{tag}\n'+head
 defs=[f'smallValue{tag}','chooseShiftSevenK0B']+[f'smallTerm{c}{r}_{b}_{k}MCFC' for b,k in sorted(terms)]
 for n in range(7):
  s+=f'\ntheorem cycle_short_{c}{r}_{n}MCFC (j : ℕ) (hj : j≤{c*n+r+2}) :\n smallValue{tag} {n} j*smallValue{tag} {n} (j+2) ≤ smallValue{tag} {n} (j+1)^2 := by\n interval_cases j <;> norm_num ['+','.join(defs+['Nat.choose_eq_factorial_div_factorial','Nat.factorial'])+']\n'
 s+=f'\ntheorem cycle_short_value_lc{tag} (n j : ℕ) (hn : n<7) (hj : j≤{c}*n+{r+2}) :\n smallValue{tag} n j*smallValue{tag} n (j+2) ≤ smallValue{tag} n (j+1)^2 := by\n interval_cases n\n'
 for n in range(7):s+=f' · exact cycle_short_{c}{r}_{n}MCFC j (by omega)\n'
 (R/f'research/{m}.lean').write_text(s+end);return m
if __name__=='__main__':
 import sys
 print(generate(int(sys.argv[1]),int(sys.argv[2])))
