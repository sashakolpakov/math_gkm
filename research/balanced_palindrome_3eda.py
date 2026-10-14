"""Machine-authored exact test of balanced palindrome enlargement."""
import json,pathlib,time,sys
from palindrome_scan_3eda import poly
from balanced_f80 import balanced,failure
t=time.monotonic();bound=int(sys.argv[1]);states=[()];checks=0;bad=[];counts={}
for n in range((bound+1)//2+1):
 for h in states:
  for w in [h+h[::-1],h+h[:-1][::-1]] if h else [()]:
   if len(w)>bound or not balanced(''.join('B' if x else 'A' for x in w)):continue
   checks+=1;counts[len(w)]=counts.get(len(w),0)+1
   f=failure(poly(w))
   if f and len(bad)<20:bad.append(dict(word=''.join('C' if x else 'A' for x in w),**f))
 result=dict(status='finite exact experiment, not proof',bound=bound,checks=checks,counts=counts,failures=bad,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-3edac4bf/balanced-palindrome.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps(dict(half_length=n,states=len(states),checks=checks,failures=bad[:2])),flush=True)
 if bad:break
 states=[h+(c,) for h in states for c in [False,True] if balanced(''.join('B' if x else 'A' for x in h+(c,)))]
