"""Machine-authored a24fe23d. Exact source/array tests; not proof admission."""
from pathlib import Path
from math import comb
import sys,json,time,hashlib
sys.path.insert(0,'evidence/markov')
from experiment_interior_f1e4fe3b import raw
from scan import initial,child
O=Path('evidence/markov-a24fe23d')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def H(a,j,k,q):return C(a-q,k)*C(k+q-1,q)*C(2*k,j-q) if k>=1 else int(q==j==0)
def main():
 t=time.monotonic();d={'status':'finite exact experiments only','coefficient_identities':0,'coefficient_zeros':0,
 'source_crosschecks':0,'raw_triples':0,'zero_triples':0,'reverse_midpoints':0,'rr2':0,'failures':[]}
 f=initial
 for a in range(1,41):
  p=raw(a,a+1)
  if a>1:f=child(f,True)
  assert f[1][:2]==(a,a+1) and f[1][2]==p;d['source_crosschecks']+=1
  for i in range(2*a+4):
   for j in range(2*a+4):
    k=i+j-a
    pred=sum(H(a,j,k,q) for q in range(a+1)) if 0<=k<=a else 0
    v=p.get((i,j),0);d['coefficient_identities']+=1;d['coefficient_zeros']+=int(v==0)
    if pred!=v:d['failures'].append(['coefficient',a,i,j,v,pred])
    for dx,dy in [(1,0),(0,1),(1,-1)]:
     x=i;y=j if dy>=0 else j+2
     values=[p.get((x+z*dx,y+z*dy),0) for z in range(3)]
     d['raw_triples']+=1;d['zero_triples']+=int(0 in values)
     if values[1]**2<values[0]*values[2]:d['failures'].append(['raw',a,i,j,dx,dy,values])
  if a<=28:
   for j in range(2*a+3):
    for k in range(1,a):
     hs=[[H(a,j,k+h,q) for q in range(a+3)] for h in range(3)]
     for q in range(a+2):
      d['rr2']+=1
      if hs[0][q]*hs[1][q+1]>hs[0][q+1]*hs[1][q]:d['failures'].append(['rr2',a,j,k,q])
      for r in range(max(0,q-2)):
       d['reverse_midpoints']+=1
       if hs[0][q]*hs[2][r]>hs[1][(q+r)//2]*hs[1][(q+r+1)//2]:d['failures'].append(['midpoint',a,j,k,q,r])
 d['seconds']=time.monotonic()-t;d['bounds']={'Pell_numerator':[1,40],'grid':'0..2a+3, including zeros',
 'reverse_midpoints':'a<=28, 0<=j<=2a+2, 1<=k<a, 0<=r<=q-3, q<=a+1'}
 d['inputs']={p:hashlib.sha256(Path(p).read_bytes()).hexdigest() for p in ['research/experiments_a24fe23d.py',
 'research/experiment_interior_f1e4fe3b.py','evidence/markov/scan.py']}
 (O/'experiments.json').write_text(json.dumps(d,indent=2)+'\n');print(json.dumps(d))
if __name__=='__main__':main()
