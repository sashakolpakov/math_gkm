"""Machine-authored coefficient-wise gap proofs; avoids expanding three variables at once."""
from pathlib import Path
from fractions import Fraction
import json
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-2532cf40'
data=json.loads((R/'evidence/markov-5dc9c88d/onset-candidates.json').read_text())
head='/-! Machine-authored request 2532cf40. Coefficient-wise onset gap proof. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 32000000\nset_option maxRecDepth 65536\n'
end='end\nend MathGKM.Markov\n'
pairs=lambda d:[(a,b) for a in range(d+1) for b in range(d+1-a)]
def uni(rows,a,b):
 cs={ks[0]:Fraction(v) for ks,v in rows if ks[2]==a and ks[3]==b}
 if not cs:return '0'
 m=max(cs);s=str(int(cs.get(m,0)))
 for n in reversed(range(m)):s=f'({s}*N + {int(cs.get(n,0))})'
 return s
def balance(ss):
 if not ss:return '0'
 if len(ss)==1:return ss[0]
 m=len(ss)//2;return '('+balance(ss[:m])+' + '+balance(ss[m:])+')'
for ci,prefix in [(0,'Low'),(2,'High')]:
 chart=data['charts'][ci]
 cv=lambda k,a,b:f'onset{prefix}C{k}_{a}_{b}M253'
 decomp=lambda k:balance([f'{cv(k,a,b)} N*C^{a}*R^{b}' for a,b in pairs(4)])
 s=f'import MarkovOnset{prefix}DefsM253\n'+head
 for k,v in enumerate(chart['values'],1):
  for a,b in pairs(4):s+=f'\ndef {cv(k,a,b)} (N : ℤ) : ℤ := {uni(v,a,b)}\n'
  s+=f'\ntheorem onset{prefix}_decomp{k}M253 (N C R : ℤ) : onset{prefix}V{k}M253 N C R={decomp(k)} := by\n unfold onset{prefix}V{k}M253 '+' '.join(cv(k,a,b) for a,b in pairs(4))+'\n ring\n'
 p=D/f'MarkovOnset{prefix}SplitDefsM253.lean';assert not p.exists();p.write_text(s+end)
 for k,g in enumerate(chart['gaps'],1):
  cg=lambda a,b:f'onset{prefix}GC{k}_{a}_{b}M253'
  gd=balance([f'{cg(a,b)} N*C^{a}*R^{b}' for a,b in pairs(8)])
  s=f'import MarkovOnset{prefix}SplitDefsM253\n'+head
  for a,b in pairs(8):
   s+=f'\ndef {cg(a,b)} (N : ℤ) : ℤ := {uni(g,a,b)}\n'
   terms=[];names=set()
   for x,y in pairs(4):
    xx,yy=a-x,b-y
    if xx<0 or yy<0 or xx+yy>4:continue
    terms.append(f'({cv(k+1,x,y)} N*{cv(k+1,xx,yy)} N-{cv(k,x,y)} N*{cv(k+2,xx,yy)} N)')
    names.update([cv(k+1,x,y),cv(k+1,xx,yy),cv(k,x,y),cv(k+2,xx,yy)])
   s+=f'\ntheorem {cg(a,b)}_eq (N : ℤ) : {balance(terms)}={cg(a,b)} N := by\n unfold '+ ' '.join(sorted(names))+f' {cg(a,b)}\n ring\n'
   s+=f'\ntheorem {cg(a,b)}_nonneg (N : ℤ) (hN : 0≤N) : 0≤{cg(a,b)} N := by\n unfold {cg(a,b)}\n positivity\n'
  s+='\nattribute [local irreducible] '+' '.join(cv(kk,a,b) for kk in [k,k+1,k+2] for a,b in pairs(4))+'\n'
  s+=f'\ntheorem onset{prefix}_lc{k}M253 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :\n onset{prefix}V{k}M253 N C R*onset{prefix}V{k+2}M253 N C R ≤ (onset{prefix}V{k+1}M253 N C R)^2 := by\n apply sub_nonneg.mp\n rw ['+','.join(f'onset{prefix}_decomp{kk}M253' for kk in [k,k+1,k+2])+']\n'
  s+=f' have he : {decomp(k+1)}^2-{decomp(k)}*{decomp(k+2)}={gd} := by\n  rw ['+','.join(f'←{cg(a,b)}_eq' for a,b in pairs(8))+']\n  ring\n rw [he]\n'
  for a,b in pairs(8):s+=f' have h{a}_{b} := {cg(a,b)}_nonneg N hN\n'
  s+=' positivity\n'+end
  (D/f'MarkovOnset{prefix}Gap{k}M253.lean').write_text(s)
print('Generated two split bases and ten replacement unaccepted gap candidates.')
