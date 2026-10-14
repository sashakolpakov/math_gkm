"""Machine-authored exact finite checks; experiments are not proofs."""
import ast,json,pathlib,math,time
from ambient_transfer_probe_5c90 import transfer
from vertical_gap_b5db import P,coerce,i,j,b
tree=ast.parse(pathlib.Path('research/topnext_7955.py').read_text())
exec(compile(ast.Module(body=[n for n in tree.body if isinstance(n,ast.FunctionDef)],type_ignores=[]),'inherited-definitions','exec'))
t=time.monotonic();counts=dict(sources=0,formulas=0,triples=0,mixed_switch_checks=0);fail={};examples=[]
for bb in range(2,65):
 for aa in range(1,bb):
  if math.gcd(aa,bb)!=1:continue
  w=tuple(aa*k//bb<aa*(k+1)//bb for k in range(bb))[1:-1]
  F=transfer(w);D=aa+bb-4;N=bb-1;B=aa-1;s=sum(x!=y for x,y in zip(w,w[1:]));counts['sources']+=1
  if aa>=2 and bb>=aa+2:
   counts['mixed_switch_checks']+=1
   if s<2:fail.setdefault('switch',dict(a=aa,b=bb,s=s))
  def A(i,j):return F.get((i+j-aa,j),0)
  for I in range(max(0,D+1)):
   J=D-I
   if D>=3:
    Q=N*(N-1)*I*(I-1)+2*(B*N+N-3*B-1)*I*(J+1)+B*(B-1)*(J+1)*J
    base=math.comb(D,I)
    eqs=[2*D*(J+1)*A(I,J+1)==Q*base,(J+1)*(J+2)*A(I,J+2)==(D+1)*base*(B*(J+2)+N*I)]
    counts['formulas']+=2
    if not all(eqs):fail.setdefault('formulas',dict(a=aa,b=bb,i=I,j=J,eqs=eqs))
   if bb*I+aa*J<aa*bb:continue
   counts['triples']+=1
   seq=[A(I,J),A(I,J+1),A(I,J+2)]
   if seq[1]**2<seq[0]*seq[2]:fail.setdefault('raw',dict(a=aa,b=bb,i=I,j=J,seq=seq))
   if aa in [2,3] and I==1 and D>=3:
    gap=terms(I,J,B,2)[1]
    if gap<0:fail.setdefault('s2',dict(a=aa,b=bb,i=I,j=J,seq=seq))
    if len(examples)<8:examples.append(dict(a=aa,b=bb,i=I,j=J,raw=seq,switches=s,gap_s0=terms(I,J,B,0)[1],gap_s2=gap))
rec=dict(status='Finite exact checks only; no universal proof',counts=counts,failures=fail,examples=examples,seconds=time.monotonic()-t)
pathlib.Path('evidence/markov-7d80a785/vertical-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
