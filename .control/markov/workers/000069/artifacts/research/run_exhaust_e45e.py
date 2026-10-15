"""Machine-authored e45ef6ac. Exhaustive short adjacent-run words, all cuts."""
from run_order_e45e import transfer
from aligned_probe_6d2c import transfer as marked
from probe_e45e import gaps
from transport_89ce import certificate
from pathlib import Path
from itertools import product
import json,time,hashlib
O=Path('evidence/markov-e45ef6ac')
def main():
 start=time.monotonic();checks=0;tc=0;records=[];failure=None
 for L in range(7):
  for n in range(4):
   for v in product((0,1),repeat=L):
    w=(1,)*n+(0,)+sum(((1,)*(n+r)+(0,) for r in v),())+(1,)*(n+1)
    F=transfer(w,len(w));dig=hashlib.sha256()
    for s in range(1,len(w)+1):
     J=max(j for ss,j in F if ss==s)
     for j in range(J-1):
      a,b,c=(F.get((s,j+k),0) for k in range(3));checks+=1
      if b*b<a*c:failure=dict(n=n,interior=v,word=w,s=s,j=j,values=[a,b,c],gap=b*b-a*c);break
     if failure:break
    if L<=3:
     M=marked(w,len(w))
     assert all(sum(z for (ss,d,k),z in M.items() if ss==s and k==j)==a for (s,j),a in F.items())
     for s in range(1,len(w)+1):
      J=max(j for ss,d,j in M if ss==s)
      for j in range(J-1):
       G=gaps(M,s,j);c=certificate(G);tc+=1
       dig.update(json.dumps([s,j,list(G.items()),c],sort_keys=True).encode())
       if not c['success']:failure=dict(transport=True,n=n,interior=v,word=w,s=s,j=j,G=list(G.items()),certificate=c);break
      if failure:break
    records.append(dict(n=n,interior=v,length=len(w),transport_digest=dig.hexdigest() if L<=3 else None))
    rec=dict(status='finite exact experiments; arbitrary words need not be source words',inputs=records,raw_inequalities=checks,transport_checks=tc,failure=failure,seconds=time.monotonic()-start)
    (O/'run-exhaustive.json').write_text(json.dumps(rec,indent=2)+'\n')
    if failure or time.monotonic()-start>100:
     print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}));return
 print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
if __name__=='__main__':main()
