"""Machine-authored 2b34268b. Exact finite tests; no universal proof claims."""
from pathlib import Path
from math import comb
import json,sys,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources
from upper_probe_v2_2b34268b import S
O=Path('evidence/markov-2b34268b')
def main():
 start=time.monotonic();out={'status':'finite integer experiment only','source_comparisons':0,
 'coefficient_identities':0,'raw_triples':0,'zero_triples':0,'support_checks':0,
 'shifted_checks':0,'shifted_zero_products':0,'failures':[]}
 for path,(a,b,p) in sources(28):
  assert raw(a,b)==p,(a,b)
  out['source_comparisons']+=1
 for q in range(2,71):
  p=raw(2,2*q+1)
  for d in range(1,q):
   N=q-d;j=q+d
   vals=[]
   for i in range(N+7):
    v=sum(S(N,d,i,h) for h in range(i+1));a=p.get((i,j),0)
    out['coefficient_identities']+=1;out['support_checks']+=1
    if a!=v or (a>0)!=(1<=i<=N+2):out['failures'].append(['formula/support',q,j,i,a,v])
    vals.append(a)
   for i in range(len(vals)-2):
    a,b,c=vals[i:i+3];out['raw_triples']+=1;out['zero_triples']+=int(0 in [a,b,c])
    if a*c>b*b:out['failures'].append(['LC',q,j,i,a,b,c])
  if q%10==0:(O/'experiment-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 for N in range(1,22):
  for d in range(1,16):
   for i in range(N+4):
    for h in range(i+3):
     for k in range(i+3):
      a=S(N,d,i,h)*S(N,d,i+2,k)
      b=S(N,d,i+1,min(h+1,k))*S(N,d,i+1,max(h+1,k)-1)
      out['shifted_checks']+=1;out['shifted_zero_products']+=int(a==0)
      if a>b:out['failures'].append(['shifted',N,d,i,h,k,a,b])
 out['seconds']=time.monotonic()-start
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
