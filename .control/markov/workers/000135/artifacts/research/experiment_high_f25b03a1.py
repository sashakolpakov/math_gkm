"""Machine-authored exact checks of proposed high-cone identities; not a proof."""
from pathlib import Path
from math import comb
import sys,re,json,time
sys.path.insert(0,'evidence/markov')
from scan import initial,child
def generate(bound):
 stack=[(chr(0),initial)]
 while stack:
  path,f=stack.pop()
  yield path,f[1]
  if f[1][1]+f[2][1]<=bound:stack.append((path+chr(82),child(f,True)))
  if f[0][1]+f[1][1]<=bound:stack.append((path+chr(76),child(f,False)))
def fall(x,n):
 r=1
 for j in range(n):r*=x-j
 return r
source=Path('research/MarkovHorizontalFourthSeedM511.lean').read_text()
bodies=[re.search(r'def h4c'+str(r)+r'M511.*?:=\n(.*?)(?=\n\n)',source,re.S).group(1).strip().replace('^','**') for r in range(8)]
counts=dict(source_fractions=0,high_fractions=0,identities=0,inequalities=0,zeros=0,gaps=0)
fails=[];start=time.monotonic()
for path,(a,b,p) in generate(48):
 counts['source_fractions']+=1
 if not (a>=3 and b>=9 and b<2*a):continue
 counts['high_fractions']+=1
 q=2*a-b;t=b-a;u=max(3*a-2*b,0);v=0;w=q if 3*a<=2*b else b-a;z=max(4*a-3*b,0)
 c4s=[eval(body,{'__builtins__':{}},dict(a=a,b=b,q=q,t=t,u=u,v=v,w=w,z=z)) for body in bodies]
 c3s=[24*u,24*t+(72*a-120)*q,27*a**3-18*a*a+21*a-6+24*(a+b-7)*q,
 27*a**3+27*a*a*b-114*a*a+3*a*b+33*a+6*b-18,
 9*a**3+18*a*a*b-54*a*a+9*a*b*b-51*a*b+87*a+3*b*b-3*b-18,
 (a+b-1)*(a+b-2)*(a+b-3)]
 c2s=[8*q,9*a*a-5*a+2,6*a*a+6*a*b-16*a+4,(a+b-1)*(a+b-2)]
 for i in range(a+b+3):
  c2,c3,c4=[p.get((i,j),0) for j in [2,3,4]]
  counts['inequalities']+=1;counts['zeros']+=int(0 in [c2,c3,c4])
  if c2*c4>c3*c3:fails.append(['raw',a,b,i,[c2,c3,c4]])
  if not a-1<=i<=a+b-5:continue
  k=i-a+1;l=b-2-k;N=k+l;C=comb(N,k)
  J=sum(c*fall(k,r)*fall(l,3-r) for r,c in enumerate(c2s))
  H=sum(c*fall(k+1,r)*fall(l-1,5-r) for r,c in enumerate(c3s))
  I=sum(c*fall(k+2,r)*fall(l-2,7-r) for r,c in enumerate(c4s))
  tests=[2*fall(N,3)*c2==C*J,6*fall(N,5)*(k+1)*c3==C*l*H,24*fall(N,7)*(k+1)*(k+2)*c4==C*l*(l-1)*I]
  counts['identities']+=3
  if not all(tests):fails.append(['identities',a,b,i,tests])
  G=4*(N-5)*(N-6)*(k+2)*l*H*H-3*(N-3)*(N-4)*(k+1)*(l-1)*J*I
  counts['gaps']+=1
  if G<0:fails.append(['gap',a,b,i,G])
  if 144*fall(N,5)**2*(N-5)*(N-6)*(k+1)**2*(k+2)*(c3*c3-c2*c4)!=C*C*l*G:fails.append(['transfer',a,b,i])
out={'status':'Finite exact checks only; theorem status is recorded separately in validation.json','bound':48,'counts':counts,'failures':fails,'seconds':time.monotonic()-start}
Path('evidence/markov-f25b03a1/high-cone-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
