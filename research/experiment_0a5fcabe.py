"""Machine-authored exact tests of all five small-cycle correction identities.
Finite checks are not proofs. The source recurrence comparison is independent
of the cut dynamic program, and keeps zeros and polygon guards.
"""
from pathlib import Path
from fractions import Fraction
import json,time
from experiment_8833 import backward,source,path_for,polyguard,add,shift
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-0a5fcabe'
rows=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
def mul(p,q):
 d={}
 for i,a in p.items():
  for j,b in q.items():d[i+j]=d.get(i+j,0)+a*b
 return {i:v for i,v in d.items() if v}
def scale(p,a):return {j:a*v for j,v in p.items() if a*v}
start=time.monotonic();counts=dict(cases=0,coefficient_identities=0,zeros=0,valid_triples=0,literal_comparisons=0,initial_four_triples=0,initial_all_cycle_triples=0);inputs=[];samples=[]
for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
 ch=next(k for k in range(6) if r*bounds[k+1][1]<=c*bounds[k+1][0])
 data=[(ks,int(Fraction(v))*c**ks[2]*r**ks[3]) for ks,v in rows[ch]['numerator']]
 assert all(Fraction(v).denominator==1 for ks,v in rows[ch]['numerator'])
 for n in range(81):
  a=c*n+r;b=a+c;limit=max(a+8,4*n+24)
  w=[(k+1)*a//b-k*a//b for k in range(1,b)]
  actual=backward(w,4);F=backward(w,1);S=scale(backward(w,2),2)
  H={0:1,1:1}
  num=[0]*(limit+1)
  for ks,v in data:num[ks[1]*n+ks[7]]+=v*n**ks[0]
  for _ in range(8):
   for j in range(1,len(num)):num[j]+=num[j-1]
  if c==4:corr={b:24}
  elif c==3:corr=shift(scale(add(F,scale(H,2)),-24),b)
  else:
   S0=add(S,{b:-2})
   corr=shift(scale(add(add(scale(mul(F,F),2),scale(mul(F,H),4)),add(scale(mul(H,H),6),scale(S0,-1))),12),b)
  for j in range(limit+1):
   assert num[j]+corr.get(j,0)==24*actual.get(j,0),(n,c,r,j,num[j],corr.get(j,0),actual.get(j,0))
   counts['coefficient_identities']+=1;counts['zeros']+=actual.get(j,0)==0
  for j in range(a+3):
   i=a+2-j
   if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
    assert actual.get(j,0)*actual.get(j+2,0)<=actual.get(j+1,0)**2,(n,c,r,j)
    counts['valid_triples']+=1
    counts['initial_four_triples']+=c==4 and 5<=j and j+2<n
    counts['initial_all_cycle_triples']+=5<=j and j+2<n
  if n<=8:
   aa,bb,p=source(path_for(a,b));assert (aa,bb)==(a,b)
   for j in range(a+5):
    assert p.get((a+4-j,j),0)==actual.get(j,0),(a,b,j)
    counts['literal_comparisons']+=1
  if n in [0,4,20,80]:samples.append(dict(n=n,c=c,r=r,correction=[[j,v] for j,v in sorted(corr.items())]))
  counts['cases']+=1;inputs.append([n,c,r])
  (O/'experiment-progress.json').write_text(json.dumps(dict(counts=counts,last=[n,c,r],seconds=time.monotonic()-start))+'\n')
d=dict(status='Finite exact observations only; no universal inference',counts=counts,inputs=inputs,samples=samples,failures=[],seconds=time.monotonic()-start)
(O/'experiments.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps({k:v for k,v in d.items() if k not in ['inputs','samples']}),flush=True)
