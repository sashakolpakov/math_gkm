"""Machine-authored exact template/model probe; not a proof."""
from math import comb
from pathlib import Path
import json
def choose(n,k): return comb(n,k) if 0<=k<=n else 0
def fib(n,i,j):
 if i==0:return int(j==n)
 return choose(n-j-1,i-1)*choose(i+j,j) if i+j<=n else 0
def add(*ps):
 d={}
 for p in ps:
  for i,v in p.items(): d[i]=d.get(i,0)+v
 return {i:v for i,v in d.items() if v}
def mul(p,q):
 d={}
 for i,v in p.items():
  for j,w in q.items():d[i+j]=d.get(i+j,0)+v*w
 return {i:v for i,v in d.items() if v}
def delta(n,t):
 j=n+2-t
 return {i:fib(n+2,i,j)-2*fib(n+1,i,j)+fib(n,i,j) for i in range(t+1)}
def templates(n):
 d=[delta(n,t) for t in range(n+3)]
 p=[{0:1},add(d[1],{0:4})]
 for t in range(n+1):
  p.append(add(d[t+2],mul({0:2,1:2},d[t+1]),mul({0:1,1:2,2:1},d[t]),mul({0:2,1:-2},p[t+1]),mul({0:-1,1:-2,2:-1},p[t])))
 return p
def D(c,j,k):
 return sum((1 if r==0 else 4*r)*choose(j-r+c+3,c+3)*choose(k-r+c,c) for r in range(min(j,k)+1))
out={'comparisons':0,'failures':[]}
for n in range(40):
 ps=templates(n)
 for j in range(n+3):
  t=n+2-j
  for i in range(3,n+6):
   v=D(i-3,j,n+2-i-j) if i+j<=n+2 else 0
   actual=ps[t].get(i,0);out['comparisons']+=1
   if actual!=v:out['failures'].append([n,i,j,actual,v])
out['status']='Finite exact experiment; no universal template/source identification inferred.'
Path('evidence/markov-50c262c5/template-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({**out,'failures':out['failures'][:12]}))
