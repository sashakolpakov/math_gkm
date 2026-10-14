"""Machine-authored finite aggregation probes; enlarged words are not sources."""
from pathlib import Path
from itertools import product,combinations
from math import gcd
import json,time
from cuts_fe01 import cutterm,value
from ambient_transfer_probe_5c90 import transfer
O=Path('evidence/markov-fe01d46b')
def budget():
 t=time.monotonic();tests=0;fail=None
 for b in range(2,13):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,);n=len(w)
   for s in range(n+1):
    terms=[cutterm(w,S) for S in combinations(range(n),s)]
    for j in range(1,min(a+s,b*s//(b-a))):
     v=[(value(p,j-1),value(p,j),value(p,j+1)) for p in terms]
     selfgap=sum(m*m-l*r for l,m,r in v);neg=pos=0
     for k,(l,m,r) in enumerate(v):
      for L,M,R in v[k+1:]:
       g=2*m*M-l*R-L*r
       neg+=max(-g,0);pos+=max(g,0)
     tests+=1
     if selfgap<neg:
      fail=dict(a=a,b=b,s=s,j=j,term_count=len(terms),self_gap=selfgap,negative_mixed_mass=neg,positive_mixed_mass=pos,full_gap=selfgap+pos-neg);break
    if fail:break
   if fail:break
  if fail:break
 rec=dict(status='finite exact stronger-condition test; not root refutation',tests=tests,first_failure=fail,seconds=time.monotonic()-t)
 (O/'aggregation-budget.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec),flush=True)
def palindromes(reduced=False):
 t=time.monotonic();tests=words=0;fails={};counts={}
 for n in range(21):
  for half in product([0,1],repeat=(n+1)//2):
   w=half+half[:n//2][::-1];a=sum(w)+1;b=n+2
   if reduced and gcd(a,b)!=1:continue
   F=transfer(w)
   def ing(s,j):return 0<=s<=b-1 and 0<=j<=a+s and (b-a)*j<=b*s
   for (s,j),L in F.items():
    for ds,dj in [(1,0),(1,1),(0,1)]:
     if not all(ing(s+h*ds,j+h*dj) for h in range(3)):continue
     M=F.get((s+ds,j+dj),0);R=F.get((s+2*ds,j+2*dj),0);tests+=1
     if M*M<L*R:
      fails.setdefault(str((ds,dj)),dict(word=w,a=a,b=b,s=s,j=j,coefficients=[L,M,R],gap=M*M-L*R,gcd=gcd(a,b)))
   words+=1
  counts[n]=words
  print(json.dumps(dict(n=n,words=words,tests=tests,failures=fails,seconds=time.monotonic()-t)),flush=True)
  if (fails and not reduced) or '(0, 1)' in fails or time.monotonic()-t>100:break
 rec=dict(status='finite exact enlarged palindrome family; no source identity asserted',words=words,tests=tests,counts=counts,failures=fails,seconds=time.monotonic()-t)
 (O/('palindrome-reduced-guarded.json' if reduced else 'palindrome-guarded.json')).write_text(json.dumps(rec,indent=2)+'\n')
if __name__=='__main__':budget();palindromes()
