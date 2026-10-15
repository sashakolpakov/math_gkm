"""Machine-authored request 8ae35b59. Horner certificates; all claims require Lean."""
from pathlib import Path
from fractions import Fraction
import json,sys
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-8ae35b59'
rows=json.loads((R/'evidence/markov-8067e0c5/second-block-probe.json').read_text())['charts']
head='/-! Machine-authored request 8ae35b59. Raw central fourth-slice certificate. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 65536\n'
end='end\nend MathGKM.Markov\n'
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
def bal(xs):
 if not xs:return '0'
 if len(xs)==1:return xs[0]
 k=len(xs)//2;return '('+bal(xs[:k])+' + '+bal(xs[k:])+')'
def load(xs,scale):
 out={}
 for k,v in xs:
  v=scale*Fraction(v);assert v.denominator==1
  assert all(k[t]==0 for t in [0,1,6,7])
  out[tuple(k[t] for t in [2,3,4,5])]=v.numerator
 return out
def split(p):
 out={}
 for (b,a,j,e),v in p.items():out.setdefault((a,b),{})[(j,e)]=v
 return out
def horner(p,names):
 if not p:return '0'
 if not names:return str(sum(p.values()))
 groups={}
 for k,v in p.items():groups.setdefault(k[0],{})[k[1:]]=v
 m=max(groups);s=horner(groups.get(m,{}),names[1:])
 for k in reversed(range(m)):
  t=horner(groups.get(k,{}),names[1:]);s=f'({s}*{names[0]} + {t})' if t!='0' else f'({s}*{names[0]})'
 return s
inventory={'bases':[],'gaps':[],'columns':[],'charts':[]}
for z in [0,2,3]:
 vp=[split(load(v,16)) for v in rows[z]['values']];gp=split(load(rows[z]['gap'],256))
 pn=lambda i,a,b:f'midP{z}_{i}_{a}_{b}M722'
 hn=lambda i,a,b:f'midH{z}_{i}_{a}_{b}M8AE'
 gn=lambda a,b:f'midG{z}_{a}_{b}M8AE'
 cn=lambda i,b:f'midCol{z}_{i}_{b}M722'
 cg=lambda b:f'midGapCol{z}_{b}M8AE'
 base=f'MarkovMiddleBase{z}M8AE';inventory['bases'].append(base)
 st=f'import MarkovMiddleBase{z}M722\n'+head
 for i in range(3):
  for (a,b),p in sorted(vp[i].items()):
   st+=f'\ndef {hn(i,a,b)} (J E : ℤ) : ℤ :=\n {horner(p,["J","E"])}\n'
   st+=f'\ntheorem {hn(i,a,b)}_eq (J E : ℤ) : {pn(i,a,b)} J E={hn(i,a,b)} J E := by\n unfold {pn(i,a,b)} {hn(i,a,b)}\n ring\n'
 save(base,st+end)
 for b in range(9 if z!=3 else 1):
  m=f'MarkovMiddleGap{z}_{b}M8AE';inventory['gaps'].append(m)
  st=f'import {base}\n'+head
  for a in range(9-b):
   g=gp.get((a,b),{});assert all(v>=0 for v in g.values())
   st+=f'\ndef {gn(a,b)} (J E : ℤ) : ℤ :=\n {horner(g,["J","E"])}\n'
   terms=[];defs=set()
   for (a0,b0) in vp[1]:
    a1,b1=a-a0,b-b0
    if (a1,b1) in vp[1]:terms.append(f'{pn(1,a0,b0)} J E*{pn(1,a1,b1)} J E');defs|={(1,a0,b0),(1,a1,b1)}
   left=bal(terms);terms=[]
   for (a0,b0) in vp[0]:
    a1,b1=a-a0,b-b0
    if (a1,b1) in vp[2]:terms.append(f'{pn(0,a0,b0)} J E*{pn(2,a1,b1)} J E');defs|={(0,a0,b0),(2,a1,b1)}
   right=bal(terms)
   st+=f'\ntheorem middle_gap_eq{z}_{a}_{b}M8AE (J E : ℤ) : ({left})-({right})={gn(a,b)} J E := by\n rw ['+','.join(hn(*d)+'_eq' for d in sorted(defs))+']\n unfold '+gn(a,b)+' '+' '.join(hn(*d) for d in sorted(defs))+'\n ring\n'
   st+=f'\ntheorem middle_gap_nonneg{z}_{a}_{b}M8AE (J E : ℤ) (hJ : 0≤J) (hE : 0≤E) : 0≤{gn(a,b)} J E := by\n unfold {gn(a,b)}\n positivity\n'
  save(m,st+end)
  m2=f'MarkovMiddleColumn{z}_{b}M8AE';inventory['columns'].append(m2)
  st=f'import {m}\n'+head
  pairs=[(i,j) for i in range(5) for j in range(5) if i+j==b]
  lhs=bal([f'({cn(1,i)} J E R*{cn(1,j)} J E R-{cn(0,i)} J E R*{cn(2,j)} J E R)' for i,j in pairs])
  st+=f'\ndef {cg(b)} (J E R : ℤ) : ℤ := {lhs}\n'
  st+='\nattribute [local irreducible] '+' '.join(pn(i,a,b0) for i in range(3) for a,b0 in vp[i])+'\n'
  st+=f'\ntheorem middle_column_nonneg{z}_{b}M8AE (J E R : ℤ) (hJ : 0≤J) (hE : 0≤E) (hR : 0≤R) : 0≤{cg(b)} J E R := by\n have he : {cg(b)} J E R='+bal([f'{gn(a,b)} J E*R^{a}' for a in range(9-b)])+' := by\n  unfold '+cg(b)+' '+' '.join(cn(i,b0) for i in range(3) for b0 in range(5))+'\n  rw ['+','.join(f'←middle_gap_eq{z}_{a}_{b}M8AE' for a in range(9-b))+']\n  ring\n rw [he]\n'
  for a in range(9-b):st+=f' have hp{a} := middle_gap_nonneg{z}_{a}_{b}M8AE J E hJ hE\n'
  st+=' positivity\n';save(m2,st+end)
 if z in [0,2]:
  m=f'MarkovMiddleChart{z}M8AE';inventory['charts'].append(m)
  s=(D/f'MarkovMiddleChart{z}M5DC.lean').read_text().replace('M5DC','M8AE')
  save(m,s)
 else:
  s=(D/'MarkovMiddleHighDirectM5DC.lean').read_text().replace('M5DC','M8AE')
  s='\n'.join(l for l in s.splitlines() if not l.startswith('import MarkovMiddleGap'))
  s='import MarkovMiddleGap3_0M8AE\n'+s+'\n'
  save('MarkovMiddleHighDirectM8AE',s);inventory['charts'].append('MarkovMiddleHighDirectM8AE')
(O/'candidate-inventory.json').write_text(json.dumps(inventory,indent=2)+'\n')
print({k:len(v) for k,v in inventory.items()})
