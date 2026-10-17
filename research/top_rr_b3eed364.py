"""Machine-authored exact Sturm follow-up; multiplicities retained.
This corrects the first probe's potential distinct-root/multiplicity ambiguity.
"""
from probe_upper_b3eed364 import trim,rem,F
from top_symbolic_b3eed364 import templates,evalp
from three_probe_9e205206 import frame
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-b3eed364')
def counts(p):
 p=trim([F(x) for x in p])
 while p and p[0]==0:p=p[1:]
 if len(p)<2:return max(0,len(p)-1),max(0,len(p)-1),0
 seq=[p,[i*p[i] for i in range(1,len(p))]]
 while seq[-1]:
  r=rem(seq[-2],seq[-1])
  if not r:break
  scale=abs(r[-1]);seq.append([-x/scale for x in r])
 def variations(negative):
  s=[(1 if p[-1]>0 else -1)*(-1 if negative and (len(p)-1)%2 else 1) for p in seq]
  return sum(s[i]!=s[i+1] for i in range(len(s)-1))
 distinct=variations(True)-variations(False)
 repeated=len(seq[-1])-1
 mult=counts(seq[-1])[0] if repeated else 0
 return distinct+mult,len(p)-1,repeated
def run():
 t0=time.monotonic();out=dict(status='finite exact Sturm experiment, not proof',source_rows=0,source_nonreal=[],source_repeated=[],template_rows=0,template_nonreal=[],template_repeated=[],reconciles='upper-probe.json counted distinct roots; this follow-up checks repeated factors recursively and preserves the original output')
 for q in range(1,11):
  for r in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,r])
   for j in range((b+1)//2,b+3):
    row=trim([p.get((i,j),0) for i in range(b+3-j)])
    while row and row[0]==0:row=row[1:]
    if len(row)>15:continue
    nr,deg,gcd=counts(row);out['source_rows']+=1
    if nr<deg:out['source_nonreal'].append([q,r,j,nr,deg])
    if gcd:out['source_repeated'].append([q,r,j,gcd])
 ts=templates(22)
 for t in range(3,23):
  for d in [0,1,2,5,20,100]:
   n=3*t-5+d;co=evalp(ts[t],n);row=[co.get(i,0) for i in range(t+1)]
   nr,deg,gcd=counts(row);out['template_rows']+=1
   if nr<deg:out['template_nonreal'].append([n,t,nr,deg])
   if gcd:out['template_repeated'].append([n,t,gcd])
 out['seconds']=time.monotonic()-t0
 (O/'top-rr.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':run()
