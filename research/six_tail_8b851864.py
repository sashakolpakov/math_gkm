"""Machine-authored n=6 final-transition certificates; ordinary Lean algebra required."""
from pathlib import Path
from fractions import Fraction
import json,re
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-8b851864'
data=json.loads((R/'evidence/markov-1b02dddc/onset-candidates.json').read_text())
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
head='/-! Machine-authored request 8b851864. Final transition at run length six. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 65536\n'
end='end\nend MathGKM.Markov\n'
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
mods=[]
for x in data:
 ch,k=x['chamber'],x['k'];p={}
 for ks,v in x['gap']:
  assert all(ks[t]==0 for t in [1,4,5,6,7]);v=Fraction(v);assert v.denominator==1
  key=(ks[2],ks[3]);p[key]=p.get(key,0)+v.numerator*(-1)**ks[0]
 p={ks:v for ks,v in p.items() if v};assert all(v>=0 for v in p.values())
 (a,b),(u,v)=bounds[ch:ch+2];cv=f'{b+v}+{b}*C+{v}*R';rv=f'{a+u}+{a}*C+{u}*R'
 val=lambda t:f'onsetValue{ch}_{t}M1B 6 ({cv}) ({rv})'
 g=f'finalSixGap{ch}_{k}M8B8';m=f'MarkovFinalSixGap{ch}_{k}M8B8';mods.append(m)
 s=f'import MarkovOnsetValues{ch}M1B\n'+head+f'\ndef {g} (C R : ℤ) : ℤ := {horner(p,["C","R"])}\n'
 s+=f'\ntheorem finalSix_lc{ch}_{k}M8B8 (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :\n {val(k)}*{val(k+2)}≤({val(k+1)})^2 := by\n apply sub_nonneg.mp\n have he : ({val(k+1)})^2-{val(k)}*{val(k+2)}={g} C R := by\n  unfold '+ ' '.join([f'onsetValue{ch}_{t}M1B' for t in [k,k+1,k+2]]+[f'backShape{ch}M94']+[f'onsetCorrection{ch}_{t}M1B' for t in [k,k+1,k+2]]+[g])+'\n  ring\n rw [he]\n unfold '+g+'\n positivity\n'
 save(m,s+end)
srcs=[]
for ch in range(6):
 old=f'MarkovOnsetSource{ch}M1B';s=(D/f'{old}.lean').read_text();s=s[s.index(f'theorem source_fourth_onset_coeff{ch}_1M1B'):s.rindex('end\nend')]
 s=s.replace('(hn : 7≤n)','(hn : 5≤n)')
 for k in range(1,9):s=s.replace(f'source_fourth_onset_coeff{ch}_{k}M1B',f'source_fourth_onset_coeff{ch}_{k}M8B8')
 m=f'MarkovFinalSmallSource{ch}M8B8';srcs.append(m)
 save(m,f'import {old}\n'+head+'attribute [local irreducible] frame coeff fullH3FA fullH4FA\n'+s+end)
assemblies=[]
for ch in range(6):
 (a,b),(u,v)=bounds[ch:ch+2];cv=f'{b+v}+{b}*x+{v}*y';rv=f'{a+u}+{a}*x+{u}*y'
 m=f'MarkovFinalSixChamber{ch}M8B8';assemblies.append(m)
 s=f'import MarkovFinalSmallSource{ch}M8B8\n'+''.join(f'import MarkovFinalSixGap{ch}_{k}M8B8\n' for k in range(1,7))+head+'attribute [local irreducible] frame coeff\n'
 for k in range(1,7):
  s+=f'''\ntheorem source_finalSix{ch}_{k}M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)
 (hu : {v}*(frame rest).mid.a<{u}*(frame rest).mid.b) (i : ℕ)
 (hs : i+(18+{k})+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+{k}+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+{k})≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+{k}+1)^2 := by
 let x : ℤ := {u}*((frame rest).mid.b:ℤ)-{v}*((frame rest).mid.a:ℤ)-1
 let y : ℤ := {b}*((frame rest).mid.a:ℤ)-{a}*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have ec : {cv}=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have er : {rv}=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := finalSix_lc{ch}_{k}M8B8 x y hx hy
 rw [ec,er] at h
 have h0 := source_fourth_onset_coeff{ch}_{k}M8B8 6 rest (by omega) hc hl hu (i+2) (by omega)
 have h1 := source_fourth_onset_coeff{ch}_{k+1}M8B8 6 rest (by omega) hc hl hu (i+1) (by omega)
 have h2 := source_fourth_onset_coeff{ch}_{k+2}M8B8 6 rest (by omega) hc hl hu i (by omega)
 rw [←h0,←h1,←h2] at h
 norm_num only at h
 nlinarith only [h]
'''
  # Numeral arithmetic in conclusions is definitionally equal.
 s+=f'''\ntheorem source_finalSix_chamber{ch}M8B8 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)
 (hu : {v}*(frame rest).mid.a<{u}*(frame rest).mid.b) (i k : ℕ) (hk : 1≤k) (hku : k≤6)
 (hs : i+(18+k)+2=(frame (List.replicate 6 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 6 true++false::rest)).mid.p i (18+k+2)*
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+2) (18+k)≤
 coeff (frame (List.replicate 6 true++false::rest)).mid.p (i+1) (18+k+1)^2 := by
 interval_cases k
'''
 for k in range(1,7):s+=f' · exact source_finalSix{ch}_{k}M8B8 rest hc hl hu i hs\n'
 save(m,s+end)
(O/'six-tail-pipeline.json').write_text(json.dumps([mods,srcs,assemblies],indent=2)+'\n');print('Generated',len(mods),'scalar inequalities,',len(srcs),'source adapters,',len(assemblies),'chamber assemblies.')
