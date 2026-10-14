"""Finite exact stress test of centered pair sums, machine-authored 65c4dfb8."""
from pair_probe_65c4 import h
import random,time,json,pathlib
r=random.Random(6504);start=time.monotonic();fail={};count=0;largest=0
for trial in range(1500):
 n=r.randrange(4,501);s=r.randrange(1,n);j=r.randrange(2*n+1)
 k=r.randrange(2*(n-s)+1);terms=[]
 for q in range(k//2+1):
  z=k-q
  v=2*h(n,j,s,q)*h(n,j,s,z)-h(n,j,s-1,q)*h(n,j,s+1,z)-h(n,j,s+1,q)*h(n,j,s-1,z)
  if q==z:v//=2
  terms.append(v)
 if not any(terms):continue
 count+=1;largest=max(largest,n)
 signs=[v>0 for v in terms if v]
 if any(signs[t] and not signs[t+1] for t in range(len(signs)-1)):
  fail['single_sign_change']=dict(n=n,j=j,s=s,k=k,terms=terms);break
 acc=0
 for t in reversed(range(len(terms))):
  acc+=terms[t]
  if acc<0:fail['center_partial']=dict(n=n,j=j,s=s,k=k,terms=terms,t=t);break
 if fail or time.monotonic()-start>40:break
out=dict(status='finite exact randomized experiment only',seed=6504,trials=trial+1,nonzero_fibers=count,largest_n=largest,failures=fail,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-65c4dfb8/pair-random.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
