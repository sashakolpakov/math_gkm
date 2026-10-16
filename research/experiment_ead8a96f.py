"""Machine-authored exact finite experiments; not universal proof evidence."""
from generate_ead8a96f import blocks,terms,cases,sp,O,R
from vertical_second_9e104e0c import source2
from experiment_8833 import path_for
import time,json,hashlib
sp.N=6
def main():
 start=time.monotonic(); records=[]; positions=triples=zeros=adjacent=0
 for a,r in cases:
  hs=blocks(a,r)
  for q in range(1,81):
   b=a*q+r; aa,bb,p=source2(path_for(a,b)); assert (aa,bb)==(a,b)
   cs=[p.get((2,j),0) for j in range(a+b+7)]
   sparse=[[(k,int(c.ev([0,0,0,q,0,0]))) for k,c in terms(h)] for h in hs]
   def E(j):
    ans=0
    for i,h in enumerate(sparse):
     for k,c in h:
      d=j-i*q-k
      if d>=0:ans+=c*(d+3)*(d+2)*(d+1)
    return ans
   for j,c in enumerate(cs):
    idx=j+1 if a==2 else j-(b-2*q-2)
    assert 12*c==E(idx),(a,b,j,c,E(idx))
    positions+=1; zeros+=c==0
   for j in range(len(cs)-2):
    assert cs[j]*cs[j+2]<=cs[j+1]**2,(a,b,j)
    adjacent+=1
    if a*b<=2*b+a*j and j+4<=a+b-1:triples+=1
   records.append(dict(a=a,b=b,q=q,raw_sha256=hashlib.sha256(str(cs).encode()).hexdigest()))
  print('completed family',a,r,flush=True)
 out=dict(status='Finite exact experiments only; not root proof',fractions=len(records),coefficient_comparisons=positions,all_index_adjacent_checks=adjacent,polygon_valid_checks=triples,zero_positions=zeros,failures=[],records=records,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='records'}))
if __name__=='__main__':main()
