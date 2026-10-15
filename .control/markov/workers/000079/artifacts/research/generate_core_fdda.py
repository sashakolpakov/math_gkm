"""Machine-authored exact normal forms and compositional certificate generation."""
from pathlib import Path
from itertools import product
import json
import rational_third_bdee as m
from generate_normal_fdda import poly,head,tail
R=Path('/Users/sasha/math_gkm')
h0=m.jet(3,1)+m.jet(2,0);h1=m.jet(3,1,1)+m.jet(2,0,1)
k0=m.jet(3,2)+m.jet(2,1);k1=m.jet(3,2,1)+m.jet(2,1,1)
b=m.jet(2,0);d=m.Rat(2*m.Z*m.X)
f=h0*(m.C-m.Rr)+h1*m.Rr-(1+m.X)
sec=2*(k0*(m.C-m.Rr)+k1*m.Rr)+(h0*(m.C-m.Rr)+h1*m.Rr)**2-(h0**2*(m.C-m.Rr)+h1**2*m.Rr)+2*((b*m.C+d*m.Rr)*(m.X-1)+(b**2*m.C+2*b*d*m.Rr+d**2*m.Q)*m.X)-2*(h0*(m.C-m.Rr)+h1*m.Rr-1-m.X)*(1+m.X)
assert f.d==2 and sec.d==4
s='import MarkovNormalJetsFDDA\n'+head
s+='''def normalHFDDA (N Z x : RunFieldBDEE) := normalJet31FDDA N Z x+normalJet20FDDA N Z x
def normalKFDDA (N Z x : RunFieldBDEE) := normalJet32FDDA N Z x+normalJet21FDDA N Z x
def normalFirstFDDA (N Z c r x : RunFieldBDEE) :=
 (c-r)*normalHFDDA N Z x+r*normalHFDDA (N+1) (Z*x) x-(1+x)
def normalSecondFDDA (N Z c r q x : RunFieldBDEE) :=
 let h₀ := normalHFDDA N Z x
 let h₁ := normalHFDDA (N+1) (Z*x) x
 let k₀ := normalKFDDA N Z x
 let k₁ := normalKFDDA (N+1) (Z*x) x
 let b := normalJet20FDDA N Z x
 let d := 2*Z*x
 2*((c-r)*k₀+r*k₁)+((c-r)*h₀+r*h₁)^2-((c-r)*h₀^2+r*h₁^2)+
 2*((x-1)*(c*b+r*d)+x*(c*b^2+2*r*b*d+q*d^2))-
 2*(1+x)*((c-r)*h₀+r*h₁-1-x)
'''
for name,p,args in [('First',f,'N Z c r x'),('Second',sec,'N Z c r q x')]:
 s+=f'def normal{name}NumFDDA ({args} : RunFieldBDEE) : RunFieldBDEE :=\n {poly(p.p)}\n'
 s+=f'''theorem normal_{name.lower()}FDDA ({args} : RunFieldBDEE) (hx : 1-x≠0) :
 (1-x)^{p.d}*normal{name}FDDA {args}=normal{name}NumFDDA {args} := by
 unfold normal{name}FDDA normal{name}NumFDDA normalHFDDA '''+('normalKFDDA ' if name=='Second' else '')+'''normalJet31FDDA normalJet20FDDA '''+('normalJet32FDDA normalJet21FDDA' if name=='Second' else '')+'''
 field_simp
 <;> ring
'''
s+=tail
(R/'research/MarkovNormalFirstSecondFDDA.lean').write_text(s)
data=json.loads((R/'evidence/markov-bdee9a64/rational-normalization.json').read_text())
num=m.P({tuple(k):m.F(v) for k,v in data['numerator']})
s='import MarkovNormalFirstSecondFDDA\n'+''.join(f'import MarkovNormalLocal{"".join(map(str,a))}FDDA\n' for a in product((0,1),repeat=3))+head
for i in range(4):
 p=m.P({tuple(0 if k==1 else a for k,a in enumerate(ks)):v for ks,v in num.items() if ks[1]==i})
 s+=f'def normalBand{i}FDDA {{A : Type*}} [CommRing A] (N c r q t u x : A) : A :=\n {poly(p)}\n'
 # Factor off the lowest power for delayed bands, preserving generic commutative ring.
 if i:
  shift=i+1
  p=m.P({ks[:-1]+(ks[-1]-shift,):v for ks,v in p.items()})
  assert all(k[-1]>=0 for k in p)
  s+=f'def normalTail{i}FDDA {{A : Type*}} [CommRing A] (N c r q t u x : A) : A :=\n {poly(p)}\n'
  s+=f'''theorem normal_band_factor_{i}FDDA {{A : Type*}} [CommRing A] (N c r q t u x : A) :
 normalBand{i}FDDA N c r q t u x=x^{shift}*normalTail{i}FDDA N c r q t u x := by
 unfold normalBand{i}FDDA normalTail{i}FDDA
 ring
'''
s+='def normalLocalFDDA (N Z x : RunFieldBDEE) (p q r : Bool) : RunFieldBDEE :=\n match p,q,r with\n'
for a in product((0,1),repeat=3):
 tag=''.join(map(str,a));bs=','.join('true' if x else 'false' for x in a)
 s+=f' | {bs} => normalLocal{tag}FDDA N Z x\n'
s+='''theorem normal_combineFDDA (N Z c r q t u x : RunFieldBDEE) :
 3*normalFirstNumFDDA N Z c r x*normalSecondNumFDDA N Z c r q x-
 2*(normalFirstNumFDDA N Z c r x)^3-2*(1-x)^6*(1+x)^3+
 boolMomentADB2 (normalLocalFDDA N Z x) c r q t u =
 normalBand0FDDA N c r q t u x+Z*normalBand1FDDA N c r q t u x+
 Z^2*normalBand2FDDA N c r q t u x+Z^3*normalBand3FDDA N c r q t u x := by
 unfold normalFirstNumFDDA normalSecondNumFDDA normalBand0FDDA normalBand1FDDA
   normalBand2FDDA normalBand3FDDA boolMomentADB2 boolJetADB2 normalLocalFDDA
'''+ '   '+' '.join(f'normalLocal{"".join(map(str,a))}FDDA' for a in product((0,1),repeat=3))+'\n ring\n'+tail
(R/'research/MarkovNormalCombineFDDA.lean').write_text(s)
print(json.dumps(dict(first_terms=len(f.p),second_terms=len(sec.p),total_terms=len(num))))
