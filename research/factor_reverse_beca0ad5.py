"""Machine-authored exact sparse division of experimental certificates."""
from reverse_certificate_beca0ad5 import O
import json
from collections import Counter,defaultdict
def divide(p,c,ds):
 p=dict(p);q=defaultdict(int)
 # Monic in k. Polynomial division over Z[s].
 while p:
  e=max(p,key=lambda e:(e[0],e[1]));v=p[e]
  if e[0]==0:return None
  a,b=e[0]-1,e[1];q[a,b]+=v
  for ee,vv in [(e,v),((a,b),c*v),((a,b+1),ds*v)]:
   if vv:
    p[ee]=p.get(ee,0)-vv
    if p[ee]==0:del p[ee]
 return dict(q)
def run():
 out=[]
 for h in range(2,13):
  p={tuple(e):v for e,v in json.loads((O/f'reverse-certificate-h{h}.json').read_text())}
  factors=[]
  for c in range(1,2*h+7):
   for ds in [0,1]:
    while True:
     q=divide(p,c,ds)
     if q is None:break
     factors.append([c,ds]);p=q
  D=Counter(h+3+t-i for t in [0,2,1,1] for i in range(h))
  for c,ds in factors:
   if ds:D[c]-=1
  row=dict(h=h,factors=factors,remaining_denominator=dict(sorted(D.items())),terms=len(p),negative=sum(v<0 for v in p.values()),degree=max(map(sum,p)),polynomial=[[list(e),v] for e,v in sorted(p.items())])
  out.append(row);print(json.dumps({k:v for k,v in row.items() if k!='polynomial'}),flush=True)
 (O/'factored-reverse-certificates.json').write_text(json.dumps(out,indent=2)+'\n')
if __name__=='__main__':run()
