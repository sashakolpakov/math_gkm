"""Machine-authored exact strengthened-invariant probes, not proof."""
import json, pathlib, random, sys, time
from balanced_f80 import A,B,mm,I
from scan import add,mul

out=pathlib.Path('evidence/markov-7252232b');out.mkdir(exist_ok=True)
def neg(p): return {k:-v for k,v in p.items()}
def row(p,i):return {(0,j):c for (k,j),c in p.items() if k==i}
def coeffwise_gap(p,i):
 return add(mul(row(p,i+1),row(p,i+1)),neg(mul(row(p,i),row(p,i+2))))
def check(p):
 for i in range(max(k for k,j in p)-1):
  g=coeffwise_gap(p,i)
  bad=[(j,c) for (k,j),c in g.items() if c<0]
  if bad:return dict(i=i,negative_coefficients=bad[:4])
def main():
 first=None;counts=0;stack=[('A',A)];start=time.monotonic()
 while stack:
  w,m=stack.pop()
  if w[-1]=='B':
   counts+=1;f=check(m[1])
   if f and (first is None or len(w)<len(first['word'])): first=dict(word=w,**f)
  if len(w)<11:stack.extend([(w+'B',mm(m,B)),(w+'A',mm(m,A))])
 result=dict(status='finite strengthened invariant probe only',words=counts,first_failure=first,seconds=time.monotonic()-start)
 (out/'coefficientwise-probe.json').write_text(json.dumps(result,indent=2)+'\n'); print(json.dumps(result))
if __name__=='__main__':main()
