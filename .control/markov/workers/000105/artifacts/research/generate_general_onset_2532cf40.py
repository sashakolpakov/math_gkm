"""Machine-authored remaining onset charts; generated identities require Lean validation."""
from pathlib import Path
import json,re
from fractions import Fraction
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-2532cf40'
data=json.loads((R/'evidence/markov-5dc9c88d/onset-candidates.json').read_text())
head='/-! Machine-authored request 2532cf40. Exact onset chart certificates. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 32000000\nset_option maxRecDepth 65536\n'
end='end\nend MathGKM.Markov\n'
def expr(rows):
 terms=[]
 for ks,v in rows:
  v=Fraction(v);assert v.denominator==1
  terms.append('*'.join([str(v.numerator)]+[f'{x}^{e}' if e!=1 else x for x,e in zip(['N','Z','C','R','Q','T','U','X'],ks) if e]))
 def bal(ts):
  if not ts:return '0'
  if len(ts)==1:return ts[0]
  m=len(ts)//2;return '('+bal(ts[:m])+' + '+bal(ts[m:])+')'
 return bal(terms)
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
inventory={}
for ci,prefix,cv,rv,qv,sh in [(0,'Low','2*R+C+5','R+2','0',0),(2,'High','2*C+R+5','C+R+3','R+1',3),(3,'Top','R+5','R+4','R+3',3)]:
 chart=data['charts'][ci];mods=[]
 params='N R' if ci==3 else 'N C R'
 defs=f'MarkovOnset{prefix}DefsM253';mods.append(defs)
 s='import MarkovSecondOnsetSourceM5DC\n'+head
 for k,v in enumerate(chart['values'],1):s+=f'\ndef onset{prefix}V{k}M253 ({params} : ℤ) : ℤ :=\n {expr(v)}\n'
 save(defs,s+end)
 parts=re.findall(r'^def (middleShapePart'+str(sh)+r'\w+)',(D/'MarkovMiddleShapesM722.lean').read_text(),re.M)
 for k in range(1,8):
  m=f'MarkovOnset{prefix}Value{k}M253';mods.append(m)
  corr=f'h2Corr{k}M5DC (N+7) ({cv}) ({rv}) ({qv})' if k<=5 else '0'
  s=f'import {defs}\n'+head
  s+=f'\ntheorem onset{prefix}_value{k}M253 ({params} : ℤ) :\n middleShape{sh}M722 (N+7) ({cv}) ({rv}) (2*(N+7)+{k}) + {corr}=onset{prefix}V{k}M253 {params} := by\n simp only ['+','.join([f'middleShape{sh}M722',f'onset{prefix}V{k}M253']+parts+([f'h2Corr{k}M5DC'] if k<=5 else []))+']\n ring\n'
  save(m,s+end)
 for k,g in enumerate(chart['gaps'],1):
  m=f'MarkovOnset{prefix}Gap{k}M253';mods.append(m)
  s=f'import {defs}\n'+head
  s+=f'\ndef onset{prefix}G{k}M253 ({params} : ℤ) : ℤ :=\n {expr(g)}\n'
  s+=f'\ntheorem onset{prefix}_gap{k}M253 ({params} : ℤ) :\n (onset{prefix}V{k+1}M253 {params})^2-onset{prefix}V{k}M253 {params}*onset{prefix}V{k+2}M253 {params}=onset{prefix}G{k}M253 {params} := by\n unfold onset{prefix}V{k}M253 onset{prefix}V{k+1}M253 onset{prefix}V{k+2}M253 onset{prefix}G{k}M253\n ring\n'
  hypotheses=' '.join(f'(h{x} : 0≤{x})' for x in params.split())
  s+=f'\ntheorem onset{prefix}_lc{k}M253 ({params} : ℤ) {hypotheses} :\n onset{prefix}V{k}M253 {params}*onset{prefix}V{k+2}M253 {params} ≤ (onset{prefix}V{k+1}M253 {params})^2 := by\n apply sub_nonneg.mp\n rw [onset{prefix}_gap{k}M253]\n unfold onset{prefix}G{k}M253\n positivity\n'
  save(m,s+end)
 inventory[prefix]=mods
(O/'general-onset-inventory.json').write_text(json.dumps(inventory,indent=2)+'\n')
print({k:len(v) for k,v in inventory.items()})
