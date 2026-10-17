"""Machine-authored GAP candidate to ordinary Lean rational identities."""
from pathlib import Path
from fractions import Fraction as F
import json,time
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-418bcc64'
p=sorted(O.glob('absorbed-boundary-export-*.json'))[-1];out=json.loads(p.read_text())
assert out['returncode']==0 and 'Error,' not in out['stderr']
data=[];s=out['stdout'].strip();decoder=json.JSONDecoder()
while s:
 value,n=decoder.raw_decode(s);data.append(value);s=s[n:].lstrip()
assert len(data)==12,len(data)
def parse(rows):
 d={}
 for ms,(a,b) in rows:
  es=[0,0,0]
  for k,e in zip(ms[::2],ms[1::2]):es[k-1]=e
  d[tuple(es)]=F(a,b)
 return d
def num(x):return str(x.numerator) if x.denominator==1 else f'({x.numerator}/{x.denominator})'
def horner(d,level=0):
 if not d:return '0'
 if level==3:return num(sum(d.values()))
 m=max(es[level] for es in d);v=['x','g','z'][level]
 parts=[horner({e:c for e,c in d.items() if e[level]==k},level+1) for k in range(m+1)]
 a=parts[-1]
 for b in reversed(parts[:-1]):a=f'({b}+{v}*{a})'
 return a
def factor_den(d):
 assert all(e[1:]==(0,0) for e in d)
 a=[d.get((i,0,0),F(0)) for i in range(max(e[0] for e in d)+1)]
 factors=[]
 for off in range(5,14):
  count=0
  while len(a)>1:
   q=[F(0)]*(len(a)-1);q[-1]=a[-1]
   for k in range(len(q)-2,-1,-1):q[k]=a[k+1]-off*q[k+1]
   if a[0]!=off*q[0]:break
   a=q;count+=1
  if count:factors.append(f'(x+{off})^{count}')
 assert len(a)==1,a
 return '*'.join([num(a[0])]+factors)
src='''import MarkovAbsorbedReductionM418
/-! Machine-authored 418bcc64. Rational boundary certificates. GAP proposes
coefficients; ring and positivity check the exact identities in Lean. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 20000000
set_option maxRecDepth 8192
'''
names=[]
for s,mode,k,nr,dr in data:
 name=f'absorbedBoundary{s}{mode}{k}M418';names.append(name)
 N,D=parse(nr),parse(dr)
 assert all(x>=0 for x in N.values()) and all(x>=0 for x in D.values())
 assert D.get((0,0,0),0)>0
 c=4 if s==2 else 8
 d='t+2+g' if mode==0 else 't+1'
 a2=f'{c}*(d-t-2)/(t+3)' if mode==0 else '0'
 src+=f'''\ndef {name} (x g z : ℚ) : ℚ :=
 let t:=x+4
 let d:={d}
 let j:=d+{s}
 let B:=z+j+1
 let W := fun v m : ℚ => (v+m+4)*(v+m+5)+4*(j-m)*(v+j+4)
 let D := fun v m : ℚ => (v+m+4)*(v+m+5)
 let b0:=B*W t 0/((x+8)*(x+9))
 let b10:=B*(t+j+4)*W (t+1) 0/((x+8)*(x+9)*(x+10))
 let b11:=B*j*(t+j+4)*W (t+1) 1/((x+8)*(x+10)*(x+11))
 let b20:=B*(t+j+4)*(t+j+5)*W (t+2) 0/((x+8)*(x+9)*(x+10)*(x+11))
 let b21:=B*j*(t+j+4)*(t+j+5)*W (t+2) 1/((x+8)*(x+9)*(x+11)*(x+12))
 let b22:=B*j*(j-1)*(t+j+4)*(t+j+5)*W (t+2) 2/(2*(x+8)*(x+9)*(x+12)*(x+13))
 let a0:={c}*(d-t)/(x+5)
 let a1:={c}*(d-t-1)/(x+6)
 let a2:={a2.replace('(t+3)','(x+7)')}
 {['b11^2-(b0+a0)*b22','2*b11*(b10+a1)-(b0+a0)*b21','(b10+a1)^2-(b0+a0)*(b20+a2)'][k-1]}

theorem {name[:-4]}_nonnegM418 (x g z : ℚ) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 ≤ {name} x g z := by
 let den : ℚ := {factor_den(D)}
 let num : ℚ := {horner(N)}
 have hd : 0 < den := by dsimp [den]; positivity
 have hn : 0 ≤ num := by dsimp [num]; positivity
 {''.join(f'have h{k} : x+{k}≠0 := by positivity'+chr(10)+' ' for k in range(5,14))}
 have he : den*{name} x g z=num := by
   dsimp [den,num,{name}]
   field_simp [{','.join(f'h{k}' for k in range(5,14))}]
   <;> ring
 exact (mul_nonneg_iff_of_pos_left hd).mp (he.symm ▸ hn)
'''
src+='\nend\nend MathGKM.Markov\n'
(R/'research/MarkovAbsorbedBoundaryCertificateM418.lean').write_text(src)
(O/'boundary-generation.json').write_text(json.dumps({'source_data':str(p.relative_to(R)),'cases':names,'status':'generated candidates; build receipt determines proof status'},indent=2)+'\n')
print('generated',len(data),'cases',len(src),'bytes')
