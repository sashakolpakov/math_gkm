"""Machine-authored assembly of exact chart identities and inequalities."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
head='/-! Machine-authored request 2532cf40. Exact onset chart assembly. -/\nnamespace MathGKM.Markov\nnoncomputable section\nattribute [local irreducible] middleShape0M722 middleShape3M722\n'
for prefix,params,cv,rv,qv,side in [('Low','N C R','2*R+C+5','R+2','0','Low'),('High','N C R','2*C+R+5','C+R+3','R+1','High'),('Top','N R','R+5','R+4','R+3','High')]:
 m=f'MarkovOnset{prefix}ChartM253'
 s='import MarkovOnsetScalarM253\n'+''.join(f'import MarkovOnset{prefix}Value{k}M253\n' for k in range(1,8))+''.join(f'import MarkovOnset{prefix}Gap{k}M253\n' for k in range(1,6))+head
 s+=f'\ndef onset{prefix}ValueM253 ({params} : ℤ) (k : ℕ) : ℤ :=\n match k with\n'+''.join(f' | {k} => onset{prefix}V{k}M253 {params}\n' for k in range(1,8))+' | _ => 0\n'
 v=lambda k:f'onsetScalar{side}M253 (N+7) ({cv}) ({rv}) ({qv}) {k}'
 s+=f'\ntheorem onset{prefix}_valueM253 ({params} : ℤ) (k : ℕ) (hk : 1≤k) (hku : k≤7) :\n {v("k")}=onset{prefix}ValueM253 {params} k := by\n interval_cases k\n'
 for k in range(1,8):s+=f' · exact onset{prefix}_value{k}M253 {params}\n'
 hs=' '.join(f'(h{x} : 0≤{x})' for x in params.split())
 s+=f'\ntheorem onset{prefix}_chartM253 ({params} : ℤ) {hs} (k : ℕ) (hk : 1≤k) (hku : k≤5) :\n {v("k")}*{v("(k+2)")} ≤ ({v("(k+1)")})^2 := by\n rw [onset{prefix}_valueM253 {params} k hk (by omega),onset{prefix}_valueM253 {params} (k+2) (by omega) (by omega),onset{prefix}_valueM253 {params} (k+1) (by omega) (by omega)]\n interval_cases k\n'
 for k in range(1,6):s+=f' · exact onset{prefix}_lc{k}M253 {params} '+ ' '.join('h'+x for x in params.split())+'\n'
 s+='end\nend MathGKM.Markov\n';p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
