"""Machine-authored exact source-coefficient cross-check, not a proof."""
from ambient_transfer_probe_5c90 import transfer
from topnext_7955 import terms
import json,math,time,pathlib
t=time.monotonic();counts=dict(sources=0,formulas=0,h=0,v=0);fail={};envfails={}
for bb in range(2,65):
 for aa in range(1,bb):
  if math.gcd(aa,bb)!=1:continue
  w=tuple(aa*k//bb<aa*(k+1)//bb for k in range(bb))[1:-1]
  F=transfer(w);D=aa+bb-4;N=bb-1;B=aa-1;s=sum(x!=y for x,y in zip(w,w[1:]));counts['sources']+=1
  def A(i,j):return F.get((i+j-aa,j),0)
  for i in range(max(0,D+1)):
   j=D-i
   if D>=3:
    T3=N*(N-1)*(N-2)*i*(i-1)*(i-2)+3*(2*(N-1)*(N-2)+B*(N-2)*(N-5))*i*(i-1)*j+3*(2*(N-2)+3*B-5*B*B+(N-1)*B+(N-1)*B*B-4*s)*i*j*(j-1)+B*(B-1)*(B-2)*j*(j-1)*(j-2)
    Q=N*(N-1)*(i+1)*i+2*(B*N+N-3*B-1)*(i+1)*j+B*(B-1)*j*(j-1)
    base=math.comb(D,i)
    eqs=[6*D*(D-1)*(D-2)*A(i,j)==T3*base,2*D*(i+1)*A(i+1,j)==Q*base,(i+1)*(i+2)*A(i+2,j)==(D+1)*base*(N*(i+2)+B*j)]
    counts['formulas']+=3
    if not all(eqs):fail.setdefault('formulas',dict(a=aa,b=bb,i=i,j=j,eqs=eqs))
   if bb*i+aa*j<aa*bb:continue
   for name,seq,gap in [('h',[A(i,j),A(i+1,j),A(i+2,j)],terms(i,j,B)[0]),('v',[A(i,j),A(i,j+1),A(i,j+2)],terms(i,j,B)[1])]:
    counts[name]+=1
    if seq[1]**2<seq[0]*seq[2]:fail.setdefault(name,dict(a=aa,b=bb,i=i,j=j,seq=seq))
    if gap<0:envfails.setdefault(name,dict(a=aa,b=bb,i=i,j=j,seq=seq,gap=gap,switches=s))
rec=dict(status='finite exact cross-checks only',counts=counts,failures=fail,envelope_failures=envfails,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-7955df0c/topnext-source-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
