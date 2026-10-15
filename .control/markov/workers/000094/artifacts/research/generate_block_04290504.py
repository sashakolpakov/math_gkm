"""Machine-authored split coefficient certificates, ordinary ring/positivity proofs."""
from pathlib import Path
import json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-04290504'
head='''/-! Machine-authored live request 04290504. Exact coefficient certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
'''
end='end\nend MathGKM.Markov\n'
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2
 return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def expr(p):
 return bal(['*'.join([str(v.numerator)]+[s if k==1 else s+'^'+str(k) for s,k in zip(['N','Z','C','R','J','E','U','x'],ks) if k]) for ks,v in sorted(p.items())])
def save(m,s): (R/'research'/f'{m}.lean').write_text(s)
s=load(json.loads((R/'evidence/markov-0b212317/compact-low-candidates.json').read_text())['shape'])
l=load(json.loads((R/'evidence/markov-cc599cf1/linear-factor.json').read_text())['shape'])
vals=[subst(s,[N,Z,C,N*C+Rr,N+Q+t,T,U,X])+subst(l,[N,Z,C,Rr,Q+t,T,U,X]) for t in range(3)]
inventory={}
for tag,rv,cv,rlean,clean in [('L',Rr+4,Rr+C+5,'(R+4)','(R+C+5)'),('A',coerce(3),C+5,'3','(C+5)'),('B',coerce(2),C+5,'2','(C+5)'),('D',coerce(1),C+5,'1','(C+5)')]:
 vv=[subst(p,[Q+T+5,Z,cv,rv,Q+5,T,U,X]) for p in vals]
 degs=[(a,b) for a in range(5 if tag=='L' else 1) for b in range(5-a)]
 gdeg=[(a,b) for a in range(9 if tag=='L' else 1) for b in range(9-a)]
 parts={}
 nm=lambda i,a,b:f'block{tag}P{i}{a}{b}M042'
 gn=lambda a,b:f'block{tag}G{a}{b}M042'
 ds='import MarkovShiftShapeCC\n'+head
 for i,p in enumerate(vv):
  for a,b in degs:
   z=P({tuple(0 if j in [2,3] else e for j,e in enumerate(k)):v for k,v in p.items() if k[3]==a and k[2]==b})
   parts[i,a,b]=z
   ds+=f'\ndef {nm(i,a,b)} (J E : ℤ) : ℤ :=\n {expr(z)}\n'
 dm=f'MarkovBlock{tag}DefsM042';save(dm,ds+end)
 def full(i):return f'(fourthShapeK0B {clean} ((J+E+5)*{clean}+{rlean}) (2*J+E+{10+i})+shiftShapeCC (J+E+5) {clean} {rlean} (J+{5+i}))'
 def decomposition(i):return bal([f'{nm(i,a,b)} J E*R^{a}*C^{b}' for a,b in degs])
 decmods=[]
 for i in range(3):
  m=f'MarkovBlock{tag}Value{i}M042';decmods.append(m)
  st=f'import {dm}\n'+head+f'\ntheorem block{tag}Value{i}M042 (C R J E : ℤ) :\n {full(i)}={decomposition(i)} := by\n unfold fourthShapeK0B shiftShapeCC '+' '.join(nm(i,a,b) for a,b in degs)+'\n ring\n'
  save(m,st+end)
 gapmods=[]; gaps={}
 for a in range(9 if tag=='L' else 1):
  m=f'MarkovBlock{tag}Gap{a}M042';gapmods.append(m);st=f'import {dm}\n'+head
  for aa,b in gdeg:
   if aa!=a:continue
   pairs=[(x,y,u,v) for x,y in degs for u,v in degs if x+u==a and y+v==b]
   pol=coerce(0)
   for x,y,u,v in pairs:pol+=parts[1,x,y]*parts[1,u,v]-parts[0,x,y]*parts[2,u,v]
   assert all(v>=0 for v in pol.values()),(tag,a,b)
   gaps[a,b]=pol
   lhs=bal([f'({nm(1,x,y)} J E*{nm(1,u,v)} J E-{nm(0,x,y)} J E*{nm(2,u,v)} J E)' for x,y,u,v in pairs])
   st+=f'\ndef {gn(a,b)} (J E : ℤ) : ℤ :=\n {lhs}\n'
   st+=f'\ntheorem {gn(a,b)}_nonneg (J E : ℤ) (hJ : 0≤J) (hE : 0≤E) :\n 0≤{gn(a,b)} J E := by\n have he : {gn(a,b)} J E={expr(pol)} := by\n  unfold {gn(a,b)} '+' '.join(sorted({nm(i,x,y) for x,y,u,v in pairs for i in range(3)}|{nm(i,u,v) for x,y,u,v in pairs for i in range(3)}))+'\n  ring\n rw [he]\n positivity\n'
  save(m,st+end)
 am=f'MarkovBlock{tag}ChartM042'
 st=''.join(f'import {m}\n' for m in decmods+gapmods)+head
 st+=f'\ntheorem block{tag}ChartM042 (C R J E : ℤ) (hC : 0≤C) (hR : 0≤R) (hJ : 0≤J) (hE : 0≤E) :\n 0≤{full(1)}^2-{full(0)}*{full(2)} := by\n rw [block{tag}Value0M042,block{tag}Value1M042,block{tag}Value2M042]\n have he : {decomposition(1)}^2-{decomposition(0)}*{decomposition(2)}=\n '+bal([f'{gn(a,b)} J E*R^{a}*C^{b}' for a,b in gdeg])+' := by\n  unfold '+' '.join(gn(a,b) for a,b in gdeg)+'\n  ring\n rw [he]\n'
 for a,b in gdeg:st+=f' have hp{a}{b} := {gn(a,b)}_nonneg J E hJ hE\n'
 st+=' positivity\n';save(am,st+end)
 inventory[tag]=dict(defs=dm,values=decmods,gaps=gapmods,chart=am,coefficients={f'{a},{b}':len(p) for (a,b),p in gaps.items()})
 print(tag,len(degs),len(gdeg),sum(len(p) for p in gaps.values()),flush=True)
(O/'certificate-inventory.json').write_text(json.dumps(inventory,indent=2)+'\n')
