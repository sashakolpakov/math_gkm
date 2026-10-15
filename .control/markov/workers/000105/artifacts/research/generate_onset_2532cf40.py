"""Machine-authored exact certificate generator. Lean checks identities independently."""
from pathlib import Path
import json
from fractions import Fraction
R=Path('/Users/sasha/math_gkm'); D=R/'research';O=R/'evidence/markov-2532cf40'
data=json.loads((R/'evidence/markov-5dc9c88d/onset-candidates.json').read_text())
head='/-! Machine-authored request 2532cf40. Raw onset certificates, no root closure. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 32768\n'
end='end\nend MathGKM.Markov\n'
def expr(rows):
 terms=[]
 for ks,v in rows:
  v=Fraction(v); assert v.denominator==1
  factors=[str(v.numerator)]+[f'{x}^{e}' if e!=1 else x for x,e in zip(['N','Z','C','R','Q','T','U','X'],ks) if e]
  terms.append('*'.join(factors))
 return ' + '.join(terms) or '0'
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
mods=[]
for ci in [1]:
 chart=data['charts'][ci];prefix='One'
 m=f'MarkovOnset{prefix}ValuesM253';mods.append(m)
 s='import MarkovSecondOnsetSourceM5DC\n'+head
 for k,v in enumerate(chart['values'],1):
  s+=f'\ndef onset{prefix}V{k}M253 (N C : ℤ) : ℤ :=\n {expr(v)}\n'
  corr=f'h2Corr{k}M5DC (N+7) (C+5) 1 0' if k<=5 else '0'
  s+=f'\ntheorem onset{prefix}_value{k}M253 (N C : ℤ) :\n middleShape0M722 (N+7) (C+5) 1 (2*(N+7)+{k}) + {corr}=onset{prefix}V{k}M253 N C := by\n simp only [middleShape0M722, onset{prefix}V{k}M253'+(f', h2Corr{k}M5DC' if k<=5 else '')+']\n ring\n'
 save(m,s+end)
 for k,g in enumerate(chart['gaps'],1):
  m=f'MarkovOnset{prefix}Gap{k}M253';mods.append(m)
  s=f'import MarkovOnset{prefix}ValuesM253\n'+head
  s+=f'\ndef onset{prefix}G{k}M253 (N C : ℤ) : ℤ :=\n {expr(g)}\n'
  s+=f'\ntheorem onset{prefix}_gap{k}M253 (N C : ℤ) :\n (onset{prefix}V{k+1}M253 N C)^2-onset{prefix}V{k}M253 N C*onset{prefix}V{k+2}M253 N C=onset{prefix}G{k}M253 N C := by\n unfold onset{prefix}V{k}M253 onset{prefix}V{k+1}M253 onset{prefix}V{k+2}M253 onset{prefix}G{k}M253\n ring\n'
  s+=f'\ntheorem onset{prefix}_lc{k}M253 (N C : ℤ) (hN : 0≤N) (hC : 0≤C) :\n onset{prefix}V{k}M253 N C*onset{prefix}V{k+2}M253 N C ≤ (onset{prefix}V{k+1}M253 N C)^2 := by\n apply sub_nonneg.mp\n rw [onset{prefix}_gap{k}M253]\n unfold onset{prefix}G{k}M253\n positivity\n'
  save(m,s+end)
(O/'onset-inventory.json').write_text(json.dumps(mods,indent=2)+'\n')
print(mods)
