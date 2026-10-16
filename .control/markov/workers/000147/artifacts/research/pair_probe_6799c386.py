"""Machine-authored exact finite exploratory tests, never proof evidence."""
import json,time,sys
from pathlib import Path
from math import comb
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw
O=Path('evidence/markov-6799c386')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def f(n,i,j):
 if i==0:return int(j==n)
 return C(n-j-1,i-1)*C(i+j,i) if j>=0 else 0
def conv(a,b):
 z=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):z[i+j]+=x*y
 return z
def val(a,j):return a[j] if 0<=j<len(a) else 0
def main():
 out={'status':'finite exploratory checks only','group_lc_failures':[],'mixed_failures':[], 'paired_group_failures':[], 'tested':0}
 for q in range(1,15):
  p=raw(2,2*q+1)
  for i in range(2,2*q+3):
   parts=[]
   for l in range(i+1):
    a=conv([f(q+1,l,j) for j in range(q+2)],[f(q+1,i-l,j) for j in range(q+2)])
    b=[0]+conv([f(q,l,j) for j in range(q+1)],[f(q,i-l,j) for j in range(q+1)])
    z=[val(a,j)+val(b,j) for j in range(2*q+3)]
    parts.append(z)
    for j in range(len(z)-2):
     if z[j]*z[j+2]>z[j+1]**2 and len(out['group_lc_failures'])<8:out['group_lc_failures'].append([q,i,l,j,z[j:j+3]])
   assert all(sum(z[j] for z in parts)==p.get((i,j),0) for j in range(2*q+3))
   for l,a in enumerate(parts):
    for m,b in enumerate(parts):
     for j in range(2*q+1):
      out['tested']+=1
      if a[j]*b[j+2]+b[j]*a[j+2]>2*a[j+1]*b[j+1] and len(out['mixed_failures'])<8:
       out['mixed_failures'].append([q,i,l,m,j,a[j:j+3],b[j:j+3]])
 (O/'pair-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
