"""Machine-authored exact source and closed-coefficient checks; experiments only."""
import json,pathlib,math,time
from second_envelope_bf38 import formula,prod,pol,sub,mul,Q,I,jets
from transfer_states_b5db import states
def closedK(n,j):
 if n==0:return int(j==1)
 if n==1:return [1,5,3][j] if j<3 else 0
 if j==0:return n*(n+1)//2
 if j==1:return 3*n*n-n+3
 if j==2:return (17*n*n-31*n+24)//2
 if j==n+1:return 4*n-2
 if j>n+1:return 0
 t=n-j+1
 return 8*(j-1)*t*t+8*(j-2)*t+4*(j-1)
def main():
 start=time.monotonic();counts=dict(sources=0,coefficient_checks=0,raw_transfer_checks=0,triples=0,tail_checks=0,closedK_checks=0)
 fail=[];inputs=[]
 for b in range(3,101):
  for a in range(1,b):
   if math.gcd(a,b)!=1 or b-a<2:continue
   w=tuple(a*k//b<a*(k+1)//b for k in range(b));ns=[]
   for letter in w:
    if not letter:ns.append(0)
    else:ns[-1]+=1
   c=b-a;n,r=divmod(a,c)
   assert all(k in [n,n+1] for k in ns)
   q=sum(ns[i]==n+1 and ns[(i+1)%c]==n+1 for i in range(c))
   if q!=max(2*r-c,0):fail.append(dict(kind='source_adjacency',a=a,b=b,q=q))
   p=formula(n,c,r,q)
   if c==2:p=p.copy();p[0,a+2]=p.get((0,a+2),0)+1
   m=prod(ns);tr={k:m[0].get(k,0)+m[3].get(k,0) for k in m[0].keys()|m[3].keys()}
   f1=sub(pol(tr,1),Q);direct=sub(pol(tr,2),mul(Q,f1))
   vals=[p.get((0,j),0) for j in range(a+5)]
   for j,v in enumerate(vals):
    counts['coefficient_checks']+=1
    if v!=direct.get((0,j),0):fail.append(dict(kind='matrix_formula',a=a,b=b,j=j))
   if b<=18:
    raw=states(w[1:-1])[2]
    assert all(vals[j]==raw.get((2,j),0) for j in range(len(vals)))
    counts['raw_transfer_checks']+=1
   if n>=2 and c>=3:
    tail=[16*r*(c+r)+4*c-24*r,8*r*r,4*q]
    assert vals[2*n+1:2*n+4]==tail
    counts['tail_checks']+=1
   for j in range(len(vals)-2):
    counts['triples']+=1
    if vals[j+1]**2<vals[j]*vals[j+2]:fail.append(dict(kind='lc',a=a,b=b,j=j,values=vals[j:j+3]))
   counts['sources']+=1;inputs.append([a,b])
 for n in range(101):
  k=jets(n)[1]
  for j in range(n+4):
   counts['closedK_checks']+=1
   if k.get((0,j),0)!=closedK(n,j):fail.append(dict(kind='closedK',n=n,j=j))
 rec=dict(status='Exact finite evidence only; matrix, tail and closed-K formula checks do not prove universal LC',counts=counts,failures=fail,inputs=inputs,seconds=time.monotonic()-start)
 pathlib.Path('evidence/markov-bf38fa19/source-second-probe.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
if __name__=='__main__':main()
