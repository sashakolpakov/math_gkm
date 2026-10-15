"""Machine-authored exact source assembly; no assumption of a numerical scan."""
from generate_cycle_charts_cfcbaf30 import *
def generate_assembly(row):
 c,r=row['c'],row['r'];tag=f'{c}{r}MCFC';is2=c==2
 mods=['MarkovTwoGapsMCFC'] if is2 else json.loads((O/f'cycle-modules-{c}{r}.json').read_text())
 s=''.join(f'import {m}\n' for m in mods)+head
 s+='attribute [local irreducible] frame coeff\n'
 v=f'smallValue{tag}'
 def finish(h0,h1,h2,g):
  return f' have h0 := {h0}\n have h1 := {h1}\n have h2 := {h2}\n have hg := {g}\n'
 shape=lambda b:('twoInitialMCFC' if b==0 else 'twoMiddleMCFC') if is2 else f'cycleShape{c}{r}_{b}MCFC'
 point=lambda b,t:(f'two{["Low","Onset","Tail"][b]}{t}MCFC') if is2 else f'cyclePoint{c}{r}_{b}_{t}MCFC'
 for z in row['intervals']:
  b,L,U=z['b'],z['L'],z['U'];shift=L-U;sh=shape(b);th=f'cycle_interval_lc{c}{r}_{b}MCFC'
  s+=f'\ntheorem {th} (n j : ℕ) (hn : 7≤n) (hl : {b}*n+{L}≤j)\n (hu : j≤{b+1}*n{("+"+str(U)) if U>=0 else "-"+str(-U)})'+(' (hub : j+1≤n)' if U<0 else '')+f' :\n {v} n j*{v} n (j+2)≤{v} n (j+1)^2 := by\n'
  s+=f' let x : ℤ := j-({b}*(n:ℤ)+{L})\n let Z : ℤ := ({b+1}*(n:ℤ)+({U}))-j\n have hx : 0≤x := by dsimp [x]; omega\n have hZ : 0≤Z := by dsimp [Z]; omega\n'
  gn=('twoInitial_lcMCFC' if b==0 else 'twoMiddle_lcMCFC') if is2 else f'cycleIntervalGap{c}{r}_{b}MCFC'
  s+=f' have h := {gn} 0 Z x hZ hx\n have en : x+Z+{shift}=(n:ℤ) := by dsimp [x,Z]; ring\n'
  for k in range(3):
   js=(f'x+{5+k}' if b==0 else f'2*x+Z+{10+k}') if is2 else f'{b}*(x+Z+{shift})+{L+k}+x'
   s+=f' have ej{k} : {js}=(j:ℤ)+{k} := by dsimp [x,Z]; ring\n'
  s+=' rw [ej0,ej1,ej2,en] at h\n'
  s+=' simp only [add_zero] at h\n'
  for k in range(3):
   jarg='j' if k==0 else f'(j+{k})'
   args=f'n {jarg} '+('' if is2 else 'hn ')+'(by omega) (by omega)'
   s+=f' have h{k} := {sh}_value {args}\n'
  s+=' push_cast at h0 h1 h2\n'
  s+=f' have hh : (16*{sh} n j)*(16*{sh} n ((j:ℤ)+2))≤(16*{sh} n ((j:ℤ)+1))^2 := by nlinarith only [h]\n rw [←h0,←h1,←h2] at hh\n nlinarith only [hh]\n'
 for z in row['windows']:
  b,lo,hi=z['b'],z['start'],z['end']
  for t in range(lo,hi+1):
   th=f'cycle_window_lc{c}{r}_{b}_{t}MCFC';sh=[point(b,t+k) for k in range(3)]
   gn=f'two{["Low","Onset","Tail"][b]}Gap{t}MCFC' if is2 else f'cycleWindowGap{c}{r}_{b}_{t}MCFC'
   s+=f'\ntheorem {th} (n : ℕ) (hn : 7≤n) :\n {v} n ({b}*n+{t})*{v} n ({b}*n+{t+2})≤{v} n ({b}*n+{t+1})^2 := by\n have h := {gn} ((n:ℤ)-7) 0 0 (by omega)\n rw [sub_add_cancel] at h\n'
   for k in range(3):s+=f' have h{k} := {sh[k]}_value n 0 hn\n'
   s+=' norm_num only [zero_mul,zero_add,one_mul] at h0 h1 h2 ⊢\n'
   s+=f' have hh : (16*{sh[0]} n 0)*(16*{sh[2]} n 0)≤(16*{sh[1]} n 0)^2 := by nlinarith only [h]\n rw [←h0,←h1,←h2] at hh\n nlinarith only [hh]\n'
 s+=f'\ntheorem cycle_value_lc{tag} (n j : ℕ) (hn : 7≤n) (hj : j≤{c}*n+{r+2}) :\n {v} n j*{v} n (j+2)≤{v} n (j+1)^2 := by\n'
 # Exhaustive interval partition in increasing j, then the small windows.
 for z in row['intervals']:
  b,L,U=z['b'],z['L'],z['U'];upper=f'{b+1}*n+{U}' if U>=0 else 'n-1'
  s+=f' by_cases h{b} : {b}*n+{L}≤j ∧ j≤{upper}\n · exact cycle_interval_lc{c}{r}_{b}MCFC n j hn (by omega) (by omega)'+(' (by omega)' if U<0 else '')+'\n'
 # Enumerate the complementary fixed-offset possibilities via omega, avoiding natural subtraction.
 opts=[(z['b'],t) for z in row['windows'] for t in range(z['start'],z['end']+1)]
 s+=' have he : '+' ∨ '.join(f'j={b}*n+{t}' for b,t in opts)+' := by omega\n'
 s+=' rcases he with '+' | '.join('he' for _ in opts)+'\n'
 for b,t in opts:
  s+=f' · subst j\n   simpa only [Nat.add_assoc] using cycle_window_lc{c}{r}_{b}_{t}MCFC n hn\n'
 s+=f'\ntheorem source_cycle_fourth_ge_seven{tag} (n : ℕ) (rest : List Bool)\n (hn : 7≤n) (hc : (frame rest).mid.b={c}) (hr : (frame rest).mid.a={r}) (i j : ℕ)\n (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :\n coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*\n coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤\n coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by\n have ha := (source_run_indicesBF n rest).1\n rw [hc,hr] at ha\n have hj : j≤{c}*n+{r+2} := by omega\n have h := cycle_value_lc{tag} n j hn hj\n rw [←source_small_value{tag} n rest hc hr (i+2) j (by omega),\n  ←source_small_value{tag} n rest hc hr i (j+2) (by omega),\n  ←source_small_value{tag} n rest hc hr (i+1) (j+1) (by omega)] at h\n nlinarith only [h]\n'
 m=f'MarkovCycleAssembly{tag}';(R/f'research/{m}.lean').write_text((s+end).replace("≤"," ≤ "));return m
if __name__=='__main__':
 import sys
 for row in data:
  if len(sys.argv)==1 or (row['c'],row['r'])==(int(sys.argv[1]),int(sys.argv[2])):print(generate_assembly(row))
