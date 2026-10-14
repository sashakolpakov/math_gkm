"""Machine-authored exact implementation cross-check, not a theorem."""
import itertools,json,pathlib
from next_slice_26dd import step,terminal,R
from word_invariants_774 import product
count=0;fail=[]
for n in range(9):
 for bits in itertools.product([0,1],repeat=n):
  p=[[0]*(r+1) for r in range(R+1)];p[0][0]=1;q=p
  for bit in bits:p,q=step(p,q,bit)
  raw=product('A'+''.join('B' if b else 'A' for b in bits)+'B')[1]
  for r in [4,5,6]:
   count+=1;expected=[raw.get((k,r-k),0) for k in range(r+1)]
   if terminal(p,q,r)!=expected:fail.append(dict(bits=bits,r=r,expected=expected,actual=terminal(p,q,r)))
out=dict(status='finite exact implementation cross-check only',words=511,slices=count,failures=fail)
pathlib.Path('evidence/markov-26dd33d6/slice-crosscheck.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
