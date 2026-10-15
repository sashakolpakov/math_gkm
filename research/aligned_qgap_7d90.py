"""Machine-authored exact coefficientwise alignment-gap experiments."""
from aligned_probe_6d2c import transfer
from pathlib import Path
from math import gcd
import json,time
O=Path('evidence/markov-7d905904')
def main():
 start=time.monotonic(); tests={};fail={};inputs=[]
 for b in range(3,36):
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
      for mode in ['full','interval']:
       key=name+'_'+mode
       if key in fail:continue
       intervals=[(0,len(es)-1)] if mode=='full' else [(l,r) for l in range(len(es)) for r in range(l,len(es))]
       for l,r in intervals:
        gaps={}
        for k in range(l,r+1):
         for h in range(l,r+1):
          e=2*lo+k+h
          gaps[e]=gaps.get(e,0)+slices[k][1]*slices[h][1]-slices[k][0]*slices[h][2]
        tests[key]=tests.get(key,0)+1
        neg=[(e,v) for e,v in sorted(gaps.items()) if v<0]
        if neg:
         vals=[sum(v[t] for v in slices[l:r+1]) for t in range(3)]
         fail[key]=dict(a=a,b=b,word=w,coords=coords,interval=[lo+l,lo+r],slices=slices[l:r+1],negative=neg,gaps=gaps,values=vals,gap=sum(gaps.values()))
         break
   inputs.append([a,b]);rec=dict(status='finite exact experiment, not root proof or refutation',tests=tests,failures=fail,inputs=inputs,seconds=time.monotonic()-start)
   (O/'qgap.json').write_text(json.dumps(rec,indent=2)+'\n')
   if len(inputs)%20==0:print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=list(fail),seconds=rec['seconds'])),flush=True)
   if len(fail)==6 or time.monotonic()-start>100:print(json.dumps(rec));return
 print(json.dumps(rec))
if __name__=='__main__':main()
