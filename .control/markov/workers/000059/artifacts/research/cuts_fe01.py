"""Machine-authored exact cut-gap experiment; no universal conclusion."""
from pathlib import Path
from itertools import combinations
from math import gcd,comb
import json,time
from polarization_34071 import cuts,mul
O=Path('evidence/markov-fe01d46b')
def kernel(segment):
 r=0
 for b in reversed(segment):
  if not b:break
  r+=1
 return ([1]+[2]*r+[1]) if r==len(segment) else ([1]+[2]*r)
def cutterm(w,S):
 p=[1];last=0
 for k in S:
  p=mul(p,kernel(w[last:k]))
  if w[k]:p=mul(p,[1,1])
  last=k+1
 return p
def value(p,j):return p[j] if 0<=j<len(p) else 0
def main():
 t=time.monotonic();count=lc=sync=0;fail=[];firstsync=None;sample=[]
 for b in range(2,16):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
   direct=cuts(w);n=len(w)
   for s in range(n+1):
    terms=[]
    for S in combinations(range(n),s):
     p=cutterm(w,S);mask=sum(1<<k for k in S);count+=1
     if p!=direct[mask]:
      # direct uses untrimmed lists; retain zeros when comparing
      if any(value(p,j)!=value(direct[mask],j) for j in range(max(len(p),len(direct[mask])))):fail.append([a,b,S,p,direct[mask]])
     for j in range(1,len(p)-1):
      lc+=1
      if p[j]**2<p[j-1]*p[j+1]:fail.append(['term_lc',a,b,S,j,p])
     terms.append((S,p))
    if firstsync is None:
     for x,(S,p) in enumerate(terms):
      for T,q in terms[x+1:]:
       for j in range(1,max(len(p),len(q))):
        sync+=1
        gap=2*value(p,j)*value(q,j)-value(p,j-1)*value(q,j+1)-value(q,j-1)*value(p,j+1)
        if gap<0:
         firstsync=dict(a=a,b=b,word=w,s=s,S=S,T=T,j=j,p=p,q=q,gap=gap);break
       if firstsync:break
      if firstsync:break
   sample.append([a,b])
 rec=dict(status='exact finite experiment only',sources=sample,cut_identities=count,term_lc_tests=lc,failures=fail[:10],synchronization_tests=sync,first_synchronization_failure=firstsync,seconds=time.monotonic()-t)
 (O/'cut-experiment.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
