"""Machine-authored exact probes. Finite experiments, never root proof."""
from pathlib import Path
from math import comb,gcd
import json,time
from degree_limited_9c20 import limited
O=Path('evidence/markov-68a44d34')
def probe():
 start=time.monotonic();counts={};fail={};inputs=[]
 for b in range(3,31):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(1,b-1))+(1,)
   F=limited(w);inputs.append([a,b])
   G={}
   for (s,d,j),v in F.items():G.setdefault(s,{}).setdefault(d,{})[j]=v
   for mode in ['degree','degree_minus_cuts','degree_minus_twice_cuts','degree_deficit']:
    # The marker key is fixed between neighboring cut counts.
    def key(s,d):return d if mode=='degree' else d-s if mode=='degree_minus_cuts' else d-2*s if mode=='degree_minus_twice_cuts' else a+b-1-(a+s)+d
    M={}
    for (s,d,j),v in F.items():M.setdefault((s,key(s,d)),{})[j]=v
    for s in range(1,min(4,b-2)):
     keys=set(k for ss,k in M if ss==s or ss==s+1 or ss==s+2)
     for k in keys:
      for direction in [0,1]:
       name=mode+('_horizontal' if direction==0 else '_vertical')
       if name in fail:continue
       for j in range(a+s+1):
        i=a+s-j
        if any(b*(i+(t if direction==0 else 0))+a*(j+(t if direction else 0))<a*b or i+j+t>a+b-1 for t in range(3)):continue
        vals=[M.get((s+t,k),{}).get(j+t*direction,0) for t in range(3)]
        counts[name]=counts.get(name,0)+1
        if vals[1]**2<vals[0]*vals[2]:
         raw=[sum(p.get(j+t*direction,0) for p in G.get(s+t,{}).values()) for t in range(3)]
         fail[name]=dict(a=a,b=b,word=w,s=s,key=k,j=j,i=i,coefficients=vals,raw_coefficients=raw,raw_gap=raw[1]**2-raw[0]*raw[2]);break
   if len(fail)==8:break
  if len(fail)==8:break
 rec=dict(status='finite exact experiments; auxiliary layer failures are not root refutations',inputs=inputs,counts=counts,failures=fail,seconds=time.monotonic()-start)
 (O/'crosscut.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':probe()
