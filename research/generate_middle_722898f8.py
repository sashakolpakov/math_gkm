"""Machine-authored exact middle certificates. Python generates candidates; Lean checks them."""
from pathlib import Path
import json
from fractions import Fraction
from rational_third_bdee import P,serialize
from probe_shift_f2da221d import load
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-722898f8'
head='/-! Machine-authored request 722898f8. Exact raw fourth-slice algebra; not root closure. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 32000000\nset_option maxRecDepth 65536\nset_option linter.unusedVariables false\n'
end='end\nend MathGKM.Markov\n'
def save(m,s):
 p=R/'research'/f'{m}.lean';assert not p.exists();p.write_text(s)
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2;return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def expr(p,names):
 terms=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  for name,k in zip(names,ks):
   if k:fs.append(name if k==1 else f'{name}^{k}')
  terms.append('*'.join(fs))
 return bal(terms)
shapes=[load(p) for p in json.loads((R/'evidence/markov-00a02b28/middle-symbolic.json').read_text())['middle_shapes']]
st='import MarkovMiddleValue0M00\nimport MarkovMiddleValue3M00\n'+head
for ch in [0,3]:st+=f'\ndef middleShape{ch}M722 (n c r j : ℤ) : ℤ :=\n '+expr(shapes[ch],['n','z','c','r','j','t','u','x'])+'\n'
save('MarkovMiddleShapesM722',st+end)
for ch in range(6):
 target=0 if ch<3 else 3
 st=f'import MarkovMiddleShapesM722\nimport MarkovMiddleValue{ch}M00\n'+head
 st+=f'\ntheorem middle_shape{ch}M722 (n c r j : ℤ) : middleValue{ch}M00 n c r j=middleShape{target}M722 n c r j := by\n unfold middleValue{ch}M00 backShape{ch}M94 penFallingM00 fallingSevenK0B middleShape{target}M722 '+' '.join(f'penPart{d}M1B' for d in range(11))+'\n ring\n'
 save(f'MarkovMiddleShapeEq{ch}M722',st+end)
rows=json.loads((R/'evidence/markov-8067e0c5/second-block-probe.json').read_text())['charts']
chartargs=[('2*R+C+5','R+2',0),('C+5','1',0),('2*C+R+5','C+R+3',3),('R+5','R+4',3)]
inventory={'shape_defs':['MarkovMiddleShapesM722'],'shape_eq':[f'MarkovMiddleShapeEq{ch}M722' for ch in range(6)],'bases':[],'values':[],'gaps':[],'columns':[],'charts':[]}
for z,(row,(cv,rv,ch)) in enumerate(zip(rows,chartargs)):
 vals=[16*load(p) for p in row['values']];gap=256*load(row['gap'])
 def split(p):
  out={}
  for ks,v in p.items():
   a,b=ks[3],ks[2];k=list(ks);k[2]=k[3]=0
   out.setdefault((a,b),P())[tuple(k)]=v
  return out
 vp=[split(v) for v in vals];gp=split(gap)
 pn=lambda i,a,b:f'midP{z}_{i}_{a}_{b}M722'
 gn=lambda a,b:f'midG{z}_{a}_{b}M722'
 cn=lambda i,b:f'midCol{z}_{i}_{b}M722'
 cg=lambda b:f'midGapCol{z}_{b}M722'
 base=f'MarkovMiddleBase{z}M722';inventory['bases'].append(base)
 st='import MarkovMiddleShapesM722\n'+head
 for i in range(3):
  for (a,b),p in sorted(vp[i].items()):st+=f'\ndef {pn(i,a,b)} (J E : ℤ) : ℤ :=\n '+expr(p,['n','z','C','R','J','E','u','x'])+'\n'
  for b in range(5):st+=f'\ndef {cn(i,b)} (J E R : ℤ) : ℤ := '+bal([f'{pn(i,a,b)} J E*R^{a}' for a in range(5-b) if (a,b) in vp[i]])+'\n'
 save(base,st+end)
 full=lambda i:f'middleShape{ch}M722 (J+E+6) ({cv}) ({rv}) (2*(J+E+6)+J+{6+i})'
 dec=lambda i:bal([f'{cn(i,b)} J E R*C^{b}' for b in range(5)])
 for i in range(3):
  m=f'MarkovMiddleValue{z}_{i}M722';inventory['values'].append(m)
  st=f'import {base}\n'+head
  st+=f'\ntheorem middle_value{z}_{i}M722 (C R J E : ℤ) : {full(i)}={dec(i)} := by\n unfold middleShape{ch}M722 '+' '.join(cn(i,b) for b in range(5))+' '+' '.join(pn(i,a,b) for a,b in vp[i])+'\n ring\n'
  save(m,st+end)
 for b in range(9):
  m=f'MarkovMiddleGap{z}_{b}M722';inventory['gaps'].append(m)
  st=f'import {base}\n'+head
  for a in range(9-b):
   g=gp.get((a,b),P());assert all(v>=0 for v in g.values())
   st+=f'\ndef {gn(a,b)} (J E : ℤ) : ℤ :=\n '+expr(g,['n','z','C','R','J','E','u','x'])+'\n'
   terms=[];defs=set()
   for (a0,b0) in vp[1]:
    a1,b1=a-a0,b-b0
    if (a1,b1) in vp[1]:terms.append(f'{pn(1,a0,b0)} J E*{pn(1,a1,b1)} J E');defs|={pn(1,a0,b0),pn(1,a1,b1)}
   left=bal(terms);terms=[]
   for (a0,b0) in vp[0]:
    a1,b1=a-a0,b-b0
    if (a1,b1) in vp[2]:terms.append(f'{pn(0,a0,b0)} J E*{pn(2,a1,b1)} J E');defs|={pn(0,a0,b0),pn(2,a1,b1)}
   right=bal(terms)
   st+=f'\ntheorem middle_gap_eq{z}_{a}_{b}M722 (J E : ℤ) : ({left})-({right})={gn(a,b)} J E := by\n unfold {gn(a,b)} '+' '.join(sorted(defs))+'\n ring\n'
   st+=f'\ntheorem middle_gap_nonneg{z}_{a}_{b}M722 (J E : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) : 0 ≤ {gn(a,b)} J E := by\n unfold {gn(a,b)}\n positivity\n'
  save(m,st+end)
  m2=f'MarkovMiddleColumn{z}_{b}M722';inventory['columns'].append(m2)
  st=f'import {m}\n'+head
  pairs=[(i,j) for i in range(5) for j in range(5) if i+j==b]
  lhs=bal([f'({cn(1,i)} J E R*{cn(1,j)} J E R-{cn(0,i)} J E R*{cn(2,j)} J E R)' for i,j in pairs])
  st+=f'\ndef {cg(b)} (J E R : ℤ) : ℤ := {lhs}\n'
  st+='\nattribute [local irreducible] '+' '.join(pn(i,a,b0) for i in range(3) for a,b0 in vp[i])+'\n'
  st+=f'\ntheorem middle_column_nonneg{z}_{b}M722 (J E R : ℤ) (hJ : 0 ≤ J) (hE : 0 ≤ E) (hR : 0 ≤ R) : 0 ≤ {cg(b)} J E R := by\n have he : {cg(b)} J E R='+bal([f'{gn(a,b)} J E*R^{a}' for a in range(9-b)])+' := by\n  unfold '+cg(b)+' '+' '.join(cn(i,b0) for i in range(3) for b0 in range(5))+'\n  rw ['+','.join(f'←middle_gap_eq{z}_{a}_{b}M722' for a in range(9-b))+']\n  ring\n rw [he]\n'
  for a in range(9-b):st+=f' have hp{a} := middle_gap_nonneg{z}_{a}_{b}M722 J E hJ hE\n'
  st+=' positivity\n';save(m2,st+end)
 m=f'MarkovMiddleChart{z}M722';inventory['charts'].append(m)
 st=''.join(f'import MarkovMiddleValue{z}_{i}M722\n' for i in range(3))+''.join(f'import MarkovMiddleColumn{z}_{b}M722\n' for b in range(9))+head
 st+='\nattribute [local irreducible] '+' '.join(cn(i,b) for i in range(3) for b in range(5))+'\n'
 st+=f'\ntheorem middle_chart{z}M722 (C R J E : ℤ) (hC : 0 ≤ C) (hR : 0 ≤ R) (hJ : 0 ≤ J) (hE : 0 ≤ E) : {full(0)}*{full(2)}≤{full(1)}^2 := by\n apply sub_nonneg.mp\n rw [middle_value{z}_0M722,middle_value{z}_1M722,middle_value{z}_2M722]\n have he : {dec(1)}^2-{dec(0)}*{dec(2)}='+bal([f'{cg(b)} J E R*C^{b}' for b in range(9)])+' := by\n  unfold '+' '.join(cg(b) for b in range(9))+'\n  ring\n rw [he]\n'
 for b in range(9):st+=f' have hp{b} := middle_column_nonneg{z}_{b}M722 J E R hJ hE hR\n'
 st+=' positivity\n';save(m,st+end)
(O/'middle-inventory.json').write_text(json.dumps(inventory,indent=2)+'\n')
print({k:len(v) for k,v in inventory.items()})
