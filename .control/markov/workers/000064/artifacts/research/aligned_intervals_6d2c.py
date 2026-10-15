"""Machine-authored exact aligned interval aggregation probes."""
from pathlib import Path
from math import gcd
import json,time,sys
from aligned_probe_6d2c import transfer
O=Path('evidence/markov-6d2c5a67')
def main():
 start=time.monotonic();inputs=[];tests={};fail={};allcuts=len(sys.argv)>1 and sys.argv[1]=='all'
 for b in range(3,37):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
   F=transfer(w,b-1 if allcuts else 7);M={(s,d-s,j):v for (s,d,j),v in F.items()};es=sorted(set(e for s,e,j in M));lo=min(es);hi=max(es)
   for s in range(b if allcuts else 6):
    for j in range(a+s+1):
     i=a+s-j
     for direction in range(3):
      name=['horizontal','vertical','diagonal'][direction]
      if name in fail:continue
      coords=[(i+t,j) if direction==0 else (i,j+t) if direction==1 else (i-t,j+t) for t in range(3)]
      if any(ii<0 or b*ii+a*jj<a*b or ii+jj>a+b-1 for ii,jj in coords):continue
      slices=[[M.get((ii+jj-a,e,jj),0) for ii,jj in coords] for e in range(lo,hi+1)]
      raw=[sum(v[k] for v in slices) for k in range(3)]
      for l in range(len(slices)):
       vals=[0,0,0]
       for r in range(l,len(slices)):
        vals=[vals[k]+slices[r][k] for k in range(3)];tests[name]=tests.get(name,0)+1
        if vals[1]**2<vals[0]*vals[2]:
         fail[name]=dict(a=a,b=b,word=w,coords=coords,e_interval=[lo+l,lo+r],values=vals,gap=vals[1]**2-vals[0]*vals[2],layers=slices[l:r+1],raw_values=raw,raw_gap=raw[1]**2-raw[0]*raw[2]);break
       if name in fail:break
   inputs.append([a,b]);rec=dict(status='finite exact interval experiment',all_cuts=allcuts,inputs=inputs,tests=tests,failures=fail,seconds=time.monotonic()-start)
   (O/('aligned-intervals-all.json' if allcuts else 'aligned-intervals.json')).write_text(json.dumps(rec,indent=2)+'\n')
   if len(inputs)%25==0 or len(fail)==3:print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=fail,seconds=rec['seconds'])),flush=True)
   if len(fail)==3 or time.monotonic()-start>130:return
 print(json.dumps(dict(inputs=len(inputs),tests=tests,failures=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
