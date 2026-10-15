"""Machine-authored exact all-run small-cycle assembly."""
from generate_small_cfcbaf30 import *
mods=[]
for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
 tag=f'{c}{r}MCFC';m=f'MarkovCycleComplete{tag}';mods.append(m)
 s=f'import MarkovCycleAssembly{tag}\nimport MarkovCycleShort{tag}\n'+head
 s+='attribute [local irreducible] frame coeff\n'
 s+=f'\ntheorem source_cycle_fourth_all{tag} (n : ℕ) (rest : List Bool)\n (hc : (frame rest).mid.b={c}) (hr : (frame rest).mid.a={r}) (i j : ℕ)\n (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :\n coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*\n coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤\n coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by\n by_cases hn : 7≤n\n · exact source_cycle_fourth_ge_seven{tag} n rest hn hc hr i j hs\n have ha := (source_run_indicesBF n rest).1\n rw [hc,hr] at ha\n have hj : j≤{c}*n+{r+2} := by omega\n have h := cycle_short_value_lc{tag} n j (by omega) hj\n rw [←source_small_value{tag} n rest hc hr (i+2) j (by omega),\n  ←source_small_value{tag} n rest hc hr i (j+2) (by omega),\n  ←source_small_value{tag} n rest hc hr (i+1) (j+1) (by omega)] at h\n nlinarith only [h]\n'
 (R/f'research/{m}.lean').write_text(s+end)
(O/'complete-modules.json').write_text(json.dumps(mods)+'\n');print(mods)
