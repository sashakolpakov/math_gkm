"""Machine-authored exact palindrome experiment; no universal claim."""
from transfer_states_b5db import states
import itertools,json,time,pathlib
t=time.monotonic();counts={};fails={};words=0
for n in range(23):
 for half in itertools.product([False,True],repeat=(n+1)//2):
  w=half+half[:n//2][::-1];N=n+1;words+=1
  for name,p in zip(['f','g','F'],states(w)):
   for (s,j),L in p.items():
    if s+2>N:continue
    M=p.get((s+1,j),0);R=p.get((s+2,j),0)
    gap=(s+1)*(N-s-1)*M*M-(s+2)*(N-s)*L*R
    counts[name]=counts.get(name,0)+1
    if gap<0 and name not in fails:fails[name]=dict(word=''.join('B' if r else 'A' for r in w),s=s,j=j,values=[L,M,R],gap=gap)
 rec=dict(status='finite exact palindrome-word experiment only; not all palindromes are source words',max_word_length=n,words=words,counts=counts,first_failures=fails,seconds=time.monotonic()-t)
 pathlib.Path('evidence/markov-b5dbe087/palindrome-invariants.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(dict(n=n,words=words,tests=sum(counts.values()),failures=fails,seconds=time.monotonic()-t)),flush=True)
