"""Machine-authored fixed-run certificates for the last short fourth-slice intervals."""
from pathlib import Path
from fractions import Fraction
import json,re
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-8b851864'
data=json.loads((R/'evidence/markov-1b02dddc/onset-candidates.json').read_text())
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
def horner(p,names):
 if not p:return '0'
 if not names:return str(sum(p.values()))
 groups={}
 for k,v in p.items():groups.setdefault(k[0],{})[k[1:]]=v
 m=max(groups);s=horner(groups[m],names[1:])
 for k in reversed(range(m)):
  t=horner(groups.get(k,{}),names[1:]);s=f'({s}*{names[0]} + {t})' if t!='0' else f'({s}*{names[0]})'
 return s
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
head='/-! Machine-authored request 8b851864. Exact short-run final transition. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 65536\n'
end='end\nend MathGKM.Markov\n';scalars=[];sources=[];chambers=[]
for n,word in [(4,'Four'),(5,'Five')]:
 for row in data:
  ch,k=row['chamber'],row['k']
  if n==4 and k==1:continue
  p={}
  for ks,v in row['gap']:
   v=Fraction(v);assert v.denominator==1;key=(ks[2],ks[3]);p[key]=p.get(key,0)+v.numerator*(n-7)**ks[0]
  p={ks:v for ks,v in p.items() if v};assert all(v>=0 for v in p.values())
  (a,b),(u,v)=bounds[ch:ch+2];cv=f'{b+v}+{b}*C+{v}*R';rv=f'{a+u}+{a}*C+{u}*R'
  val=lambda t:f'onsetValue{ch}_{t}M1B {n} ({cv}) ({rv})'
  g=f'final{word}Gap{ch}_{k}M8B8';m=f'MarkovFinal{word}Gap{ch}_{k}M8B8';scalars.append(m)
  s=f'import MarkovOnsetValues{ch}M1B\n'+head+f'\ndef {g} (C R : ℤ) : ℤ := {horner(p,["C","R"])}\n'
  s+=f'\ntheorem final{word}_lc{ch}_{k}M8B8 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :\n {val(k)}*{val(k+2)}≤({val(k+1)})^2 := by\n apply sub_nonneg.mp\n have he : ({val(k+1)})^2-{val(k)}*{val(k+2)}={g} C R := by\n  unfold '+' '.join([f'onsetValue{ch}_{t}M1B' for t in [k,k+1,k+2]]+[f'backShape{ch}M94']+[f'onsetCorrection{ch}_{t}M1B' for t in [k,k+1,k+2]]+[g])+'\n  ring\n rw [he]\n unfold '+g+'\n positivity\n'
  save(m,s+end)
 for ch in range(6):
  s=(D/f'MarkovFinalSixChamber{ch}M8B8.lean').read_text().replace('FinalSix','Final'+word).replace('finalSix','final'+word)
  s=re.sub(r'\b18\b',str(3*n),s).replace('List.replicate 6','List.replicate '+str(n)).replace('M8B8 6 rest','M8B8 '+str(n)+' rest')
  if n==4:
   s=s.replace(f'import MarkovFinalFourGap{ch}_1M8B8\n','')
   start=s.index(f'theorem source_finalFour{ch}_1M8B8');stop=s.index(f'theorem source_finalFour{ch}_2M8B8');s=s[:start]+s[stop:]
   s=s.replace('(hk : 1≤k)','(hk : 2≤k)').replace(f' · exact source_finalFour{ch}_1M8B8 rest hc hl hu i hs\n','')
   s=s.replace(f'MarkovFinalSmallSource{ch}M8B8',f'MarkovFinalFourSource{ch}M8B8')
   for k in range(2,9):s=s.replace(f'source_fourth_onset_coeff{ch}_{k}M8B8',f'source_fourth_onset_coeff{ch}_{k}FourM8B8')
  m=f'MarkovFinal{word}Chamber{ch}M8B8';chambers.append(m);save(m,s)
for ch in range(6):
 s=(D/f'MarkovFinalSmallSource{ch}M8B8.lean').read_text()
 start=s.index(f'theorem source_fourth_onset_coeff{ch}_1M8B8');stop=s.index(f'theorem source_fourth_onset_coeff{ch}_2M8B8');s=s[:start]+s[stop:]
 s=s.replace('(hn : 5≤n)','(hn : 4≤n)')
 for k in range(2,9):s=s.replace(f'source_fourth_onset_coeff{ch}_{k}M8B8',f'source_fourth_onset_coeff{ch}_{k}FourM8B8')
 m=f'MarkovFinalFourSource{ch}M8B8';sources.append(m);save(m,s)
s='import MarkovFourthSixCompleteM8B8\n'+''.join(f'import {m}\n' for m in chambers)+head+'attribute [local irreducible] frame coeff\n'
for n,word in [(4,'Four'),(5,'Five')]:
 old=(D/'MarkovFourthSixCompleteM8B8.lean').read_text();t=old[old.index('theorem source_finalSixM8B8'):old.index('theorem run_fourth_ge_sixM8B8')]
 t=t.replace('finalSix','final'+word).replace('run_fourth_six','run_fourth_'+word.lower()).replace('List.replicate 6','List.replicate '+str(n)).replace('RunFourthLCM94 6','RunFourthLCM94 '+str(n)).replace('run_fourth_iff_shortM8B8 6','run_fourth_iff_shortM8B8 '+str(n))
 t=re.sub(r'\b18\b',str(3*n),t)
 if n==4:t=t.replace('(hk : 1≤k)','(hk : 2≤k)')
 s+=t
s+='''theorem run_fourth_ge_fourM8B8 (n : ℕ) (rest : List Bool)
 (hn : 4≤n) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 by_cases h : 6≤n
 · exact run_fourth_ge_sixM8B8 n rest h hc
 · have he : n=4 ∨ n=5 := by omega
   rcases he with he | he
   · subst n; exact run_fourth_fourM8B8 rest hc
   · subst n; exact run_fourth_fiveM8B8 rest hc
'''+end
save('MarkovFourthFourCompleteM8B8',s)
(O/'four-five-pipeline.json').write_text(json.dumps([scalars,sources,chambers],indent=2)+'\n');print('Generated',len(scalars),'scalar certificates;',len(sources),'source adapters;',len(chambers),'chamber assemblies.')
