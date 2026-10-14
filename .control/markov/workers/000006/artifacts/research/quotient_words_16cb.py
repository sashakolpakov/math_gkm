"""Machine-authored exact obstruction search, enlarged matrix-word family.
These words are not automatically source-family witnesses.
"""
import json,pathlib,sys,time
sys.path.insert(0,str(pathlib.Path('research').resolve()))
from residual_16cb import add,mul,one,x,y,check
start=time.monotonic()
A=(add(one,x),y,x,y)
B=(add(add(one,x),y),{(0,1):-1},x,{})
I=(one,{}, {},one)
def mm(a,b):
 return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j])) for i in range(2) for j in range(2))
def q(m): return add(add(m[0],m[1]),add(m[2],m[3]),-1)
nodes=[('',I)]; failures=[]; negatives=[]; counts=[]
for n in range(1,10):
 nodes=[(w+c,mm(m,t)) for w,m in nodes for c,t in [('A',A),('B',B)]]
 bad=neg=0
 for w,m in nodes:
  p=q(m); fs=check(p)
  if fs:
   bad+=1
   if len(failures)<10: failures.append([w,fs[:2]])
  if any(c<0 for c in p.values()):
   neg+=1
   if len(negatives)<10: negatives.append([w,[[i,j,c] for (i,j),c in sorted(p.items()) if c<0]])
 counts.append([n,len(nodes),bad,neg])
result=dict(status='finite enlarged-family experiment, not source refutation',counts=counts,
 first_lc_failures=failures,first_negative_quotients=negatives,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-16cb07ce/quotient-words.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result))
