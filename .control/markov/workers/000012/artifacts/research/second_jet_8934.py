"""Machine-authored exact second-horizontal-jet discovery, integer arithmetic."""
import json,pathlib,itertools,math
from balanced_f80 import A,B,mm
out=pathlib.Path('evidence/markov-8934af17')
def row(w,j=2):
 m=A
 for c in w[1:]:m=mm(m,A if c=='A' else B)
 return [m[1].get((i,j),0) for i in range(len(w)+w.count('B'))]
def divide(c):
 q=[c[0]]
 for a in c[1:-1]:q.append(a-q[-1])
 assert c[-1]==q[-1],c
 return q
def residual(w):
 c=row(w)
 while c and c[-1]==0:c.pop()
 for _ in range(max(len(w)-5,0)):c=divide(c)
 return c
examples={w:residual(w) for w in ['AAAAB','AAABB','AABAB','AABBB','ABABB','ABBBB','AAAAAB','AAABAB','AABBAB','ABABAB','ABBABB']}
print(json.dumps(examples))
(out/'second-jet-examples.json').write_text(json.dumps(examples,indent=2))
