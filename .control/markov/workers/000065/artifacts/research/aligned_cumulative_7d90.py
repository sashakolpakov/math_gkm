"""Machine-authored exact cumulative graded gap probes; no proof claims."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd
import json,time,sys
O=Path('evidence/markov-7d905904')
def main():
 start=time.monotonic();tests={};fail={};inputs=[]
 for b in range(3,41):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
   F=transfer(w,b-1);M={(s,d-s,j):v for (s,d,j),v in F.items()};es=sorted({e for s,e,j in M});lo=min(es);hi=max(es)
   for s in range(b):
    for j in range(a+s+1):
     i=a+s-j
     for direction in range(3):
      name=['horizontal','vertical','diagonal'][direction]
      coords=[(i+t,j) if direction==0 else (i,j+t) if direction==1 else (i-t,j+t) for t in range(3)]
      if any(ii<0 or b*ii+a*jj<a*b or ii+jj>a+b-1 for ii,jj in coords):continue
      slices=[[M.get((ii+jj-a,e,jj),0) for ii,jj in coords] for e in range(lo,hi+1)]
      gaps=[0]*(2*len(slices)-1)
      for k,row in enumerate(slices):
       for h,col in enumerate(slices):gaps[k+h]+=row[1]*col[1]-row[0]*col[2]
      for orient in ['prefix','suffix']:
       key=name+'_'+orient
       if key in fail:continue
       indices=range(len(gaps)) if orient=='prefix' else range(len(gaps)-1,-1,-1)
       running=0;bad=None
       for k in indices:
        running+=gaps[k];tests[key]=tests.get(key,0)+1
        if running<0:bad=[2*lo+k,running];break
       if bad:fail[key]=dict(a=a,b=b,word=w,coords=coords,lowest=2*lo,gaps=gaps,slices=slices,bad=bad,total=sum(gaps))
   inputs.append([a,b]);rec=dict(status='finite exact cumulative graded gap experiment',tests=tests,failures=fail,inputs=inputs,seconds=time.monotonic()-start)
   (O/'cumulative.json').write_text(json.dumps(rec,indent=2)+'\n')
   if len(inputs)%30==0:print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=list(fail),seconds=rec['seconds'])),flush=True)
   if len(fail)==6 or time.monotonic()-start>110:print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=fail,seconds=rec['seconds'])));return
 print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=fail,seconds=rec['seconds'])))
if __name__=='__main__':main()
