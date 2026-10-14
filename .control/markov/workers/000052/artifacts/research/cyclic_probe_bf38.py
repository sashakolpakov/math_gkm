"""Machine-authored bf38fa19. Exact truncated matrix products; no proof claims."""
import itertools,json,pathlib,time,math
from ambient_transfer_probe_5c90 import add
def mul(p,q):
 z={}
 for (s,j),c in p.items():
  for (t,k),d in q.items():
   if s+t<=2:z[s+t,j+k]=z.get((s+t,j+k),0)+c*d
 return {k:v for k,v in z.items() if v}
O={};I={(0,0):1};X={(1,0):1};Y={(0,1):1}
A=({(1,1):1},X,{(1,1):1},add(I,X))
B=({(0,1):1,(1,1):1,(1,2):1},{(1,0):1,(1,1):1},{(0,1):2,(1,1):1,(1,2):1},{(0,0):1,(1,0):1,(1,1):1})
def mm(m,n):return tuple(add(mul(m[2*i],n[j]),mul(m[2*i+1],n[2+j])) for i in range(2) for j in range(2))
def prod(ns):
 m=(I,O,O,I)
 for n in ns:
  m=mm(m,A)
  for _ in range(n):m=mm(m,B)
 return m
def trace2(ns):
 m=prod(ns);p=add(m[0],m[3]);return tuple(p.get((2,j),0) for j in range(2*max(ns,default=0)+5))
def main():
 t=time.monotonic();records=[]
 for n in range(4):
  for c in range(3,9):
   for r in range(1,c):
    variants={}
    for pos in itertools.combinations(range(c),r):
     ns=tuple(n+int(i in pos) for i in range(c));p=trace2(ns)
     transitions=sum(ns[i]!=ns[(i+1)%c] for i in range(c))
     variants.setdefault(p,dict(ns=ns,transitions=transitions))
    if len(variants)>1:records.append(dict(n=n,c=c,r=r,variants=[dict(coefficients=p,**v) for p,v in variants.items()]))
 out=dict(status='Exact finite experiment only',seconds=time.monotonic()-t,ordering_dependence=records)
 pathlib.Path('evidence/markov-bf38fa19/cyclic-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(dict(seconds=out['seconds'],dependence_cases=len(records),first=records[:2])))
if __name__=='__main__':main()
