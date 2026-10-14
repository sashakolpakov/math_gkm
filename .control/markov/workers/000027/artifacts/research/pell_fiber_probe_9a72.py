"""Exact summand-pair fiber probe; not a theorem."""
import pathlib,json,time
from pell_sum_probe_9a72 import f,g
def conv(a,b):
 out={}
 for i,x in a.items():
  for j,y in b.items():out[i+j]=out.get(i+j,0)+x*y
 return out
def main():
 t=time.monotonic();checks=0;fail={};triples=0
 for n in range(1,51):
  for name,F in [('horizontal',f),('vertical',g)]:
   for fixed in range(2*n+1):
    rows=[{k:x for k in range(n+1) if (x:=F(n,fixed,s,k))} for s in range(n+1)]
    for s in range(1,n):
     a=conv(rows[s-1],rows[s+1]);b=conv(rows[s],rows[s]);triples+=1
     for k,v in a.items():
      checks+=1
      if v>b.get(k,0) and name not in fail:fail[name]=dict(n=n,fixed=fixed,s=s,fiber=k,endpoint_pairs=v,center_pairs=b.get(k,0),raw=[sum(rows[z].values()) for z in [s-1,s,s+1]])
  out=dict(status='finite exact pair-fiber experiment only',n_max=n,triples=triples,nonzero_endpoint_fibers=checks,first_failures=fail,seconds=time.monotonic()-t)
  pathlib.Path('evidence/markov-9a720f77/pell-pair-fibers.json').write_text(json.dumps(out,indent=2)+'\n')
  if n%5==0:print(json.dumps(out),flush=True)
if __name__=='__main__':main()
