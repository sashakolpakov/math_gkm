"""Machine-authored decomposition of the general onset chart into univariate certificates."""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-96dea62b'
head='namespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 16384\n'
end='end\nend MathGKM.Markov\n'
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def expr(p):return bal(['*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','J','E','U','x'],ks) if k]) for ks,v in sorted(p.items())])
def save(m,s):
 p=R/'research'/f'{m}.lean';assert not p.exists();p.write_text(s)
d=json.loads((O/'onset-certificates.json').read_text());vv={int(k):subst(load(v),[N+4,Z,Rr+C+5,Rr+4,Q,T,U,X]) for k,v in d['values'].items()}
degs=[(a,b) for a in range(5) for b in range(5-a)];gdegs=[(a,b) for a in range(9) for b in range(9-a)]
parts={};nm=lambda k,a,b:f'onsetP{k}_{a}_{b}M96';gn=lambda k,a,b:f'onsetG{k}_{a}_{b}M96'
st='import MarkovOnsetDefsM96\n'+head
for k,p in vv.items():
 for a,b in degs:
  z=P({tuple(0 if i in [2,3] else e for i,e in enumerate(ks)):v for ks,v in p.items() if ks[3]==a and ks[2]==b});parts[k,a,b]=z
  st+=f'\ndef {nm(k,a,b)} (N : ℤ) : ℤ := {expr(z)}\n'
save('MarkovOnsetPartsM96',st+end)
def dec(k):return bal([f'{nm(k,a,b)} N*R^{a}*C^{b}' for a,b in degs])
value_modules=[];gap_modules=[];chart_modules=[]
for k in range(1,7):
 m=f'MarkovOnsetExpand{k}M96';value_modules.append(m)
 st='import MarkovOnsetPartsM96\n'+head+f'\ntheorem onset_expand{k}M96 (N C R : ℤ) :\n onsetValue{k}M96 (N+4) (R+C+5) (R+4)={dec(k)} := by\n unfold onsetValue{k}M96 '+' '.join(nm(k,a,b) for a,b in degs)+'\n ring\n';save(m,st+end)
for k in range(1,5):
 gm=[]
 for group in range(3):
  m=f'MarkovOnsetGap{k}{group}M96';gm.append(m);gap_modules.append(m)
  st='import MarkovOnsetPartsM96\n'+head
  for a,b in gdegs:
   if a//3!=group:continue
   pairs=[(x,y,u,v) for x,y in degs for u,v in degs if x+u==a and y+v==b]
   p=coerce(0)
   for x,y,u,v in pairs:p+=parts[k+1,x,y]*parts[k+1,u,v]-parts[k,x,y]*parts[k+2,u,v]
   assert all(v>=0 for v in p.values())
   lhs=bal([f'({nm(k+1,x,y)} N*{nm(k+1,u,v)} N-{nm(k,x,y)} N*{nm(k+2,u,v)} N)' for x,y,u,v in pairs])
   st+=f'\ndef {gn(k,a,b)} (N : ℤ) : ℤ := {lhs}\n'
   st+=f'\ntheorem {gn(k,a,b)}_nonneg (N : ℤ) (hN : 0≤N) :\n 0≤{gn(k,a,b)} N := by\n have he : {gn(k,a,b)} N={expr(p)} := by\n  unfold {gn(k,a,b)} '+' '.join(sorted({nm(i,x,y) for x,y,u,v in pairs for i in range(k,k+3)}|{nm(i,u,v) for x,y,u,v in pairs for i in range(k,k+3)}))+'\n  ring\n rw [he]\n positivity\n'
  save(m,st+end)
 m=f'MarkovOnsetLChecked{k}M96';chart_modules.append(m)
 st=''.join(f'import MarkovOnsetExpand{i}M96\n' for i in range(k,k+3))+''.join(f'import {m}\n' for m in gm)+head
 lhs=f'onsetValue{k+1}M96 (N+4) (R+C+5) (R+4)^2-onsetValue{k}M96 (N+4) (R+C+5) (R+4)*onsetValue{k+2}M96 (N+4) (R+C+5) (R+4)'
 st+=f'\ntheorem onsetL{k}M96 (N C R : ℤ) (hN : 0≤N) (hC : 0≤C) (hR : 0≤R) :\n 0≤{lhs} := by\n rw [onset_expand{k}M96,onset_expand{k+1}M96,onset_expand{k+2}M96]\n have he : {dec(k+1)}^2-{dec(k)}*{dec(k+2)}=\n '+bal([f'{gn(k,a,b)} N*R^{a}*C^{b}' for a,b in gdegs])+' := by\n  unfold '+' '.join(gn(k,a,b) for a,b in gdegs)+'\n  ring\n rw [he]\n'
 for a,b in gdegs:st+=f' have hp{a}{b} := {gn(k,a,b)}_nonneg N hN\n'
 st+=' positivity\n';save(m,st+end)
(O/'split-inventory.json').write_text(json.dumps(dict(defs='MarkovOnsetPartsM96',values=value_modules,gaps=gap_modules,charts=chart_modules),indent=2)+'\n')
p=R/'research/MarkovOnsetM96.lean';s=p.read_text()
for k in range(1,5):s=s.replace(f'import MarkovOnsetL{k}M96',f'import MarkovOnsetLChecked{k}M96')
p.write_text(s)
print('general chart split generated')
