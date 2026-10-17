"""Machine-authored exact formal-polynomial experiment, not a Lean proof.
For each fixed h, clear positive falling-factorial denominators after j=h+k.
Coefficient positivity in nonnegative k,s is tested exactly, not inferred.
"""
from pathlib import Path
from collections import defaultdict
import json,time,hashlib
O=Path('/Users/sasha/math_gkm/evidence/markov-beca0ad5')
def mul_linear(p,c,ds=1):
 q=defaultdict(int)
 for (k,s),v in p.items():
  q[k,s]+=c*v;q[k+1,s]+=v
  if ds:q[k,s+1]+=v
 return {e:v for e,v in q.items() if v}
def w(r):return 1 if r==0 else 4*r
def term(h,rs):
 # slots have parameter shifts 0,2,1,1.
 p={(0,0):1}
 for r in rs:
  for i in range(r):p=mul_linear(p,h-i,0)
 for t,r in zip([0,2,1,1],rs):
  for i in range(r,h):p=mul_linear(p,h+3+t-i)
 return p
def certificate(h):
 p=defaultdict(int)
 for a in range(h+1):
  b=h-a
  for c in range(h):
   d=h-1-c
   scale=w(a)*w(b)*w(c)*w(d)
   for e,v in term(h,[a,b,c,d]).items():p[e]+=scale*v
   for e,v in term(h,[c,d,a,b]).items():p[e]-=scale*v
 return {e:v for e,v in p.items() if v}
def run():
 start=time.monotonic();out=dict(status='exact polynomial experiment, no universal h theorem',cases=[])
 for h in range(2,13):
  p=certificate(h);neg=[(list(e),v) for e,v in p.items() if v<0]
  item=dict(h=h,terms=len(p),negative=len(neg),first_negative=neg[:3],degree=max(map(sum,p)),constant=p.get((0,0),0))
  out['cases'].append(item)
  (O/f'reverse-certificate-h{h}.json').write_text(json.dumps([[list(e),v] for e,v in sorted(p.items())],indent=2)+'\n')
  print(json.dumps(item),flush=True)
 out['seconds']=time.monotonic()-start;out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'reverse-certificate-probe.json').write_text(json.dumps(out,indent=2)+'\n')
if __name__=='__main__':run()
