"""Machine-authored test of a prospective positive antidiagonal decomposition."""
from generate_tail_dcb64029 import *
def run():
 out=[]
 for r in range(2,13):
  vs=[]
  for k in range(r+1):
   v=one
   for j in range(k):v=prod(v,lin(1,0,j+1),lin(2,1,j+9))
   for j in range(k,r):v=prod(v,lin(0,0,j+1),lin(1,1,j+6))
   vs.append(scale(v,1 if k==r else 4*(r-k)))
  groups=[]
  for m in range(2*r+1):
   g={}
   for k in range(r+1):
    l=m-k
    if not 0<=l<=r:continue
    ak=scale(lin(2,1,k+9),k);al=scale(lin(2,1,l+9),l);bl=scale(lin(2,1,l+10),l-1)
    scalar=add(prod(lin(1,0,2),lin(1,0,5),ak,al),scale(prod(lin(1,0,1),lin(1,0,4),al,bl),-1))
    g=add(g,prod(vs[k],vs[l],scalar))
   bad=[(a,b,str(v)) for (a,b),v in g.items() if v<0]
   groups.append(dict(m=m,terms=len(g),negative_count=len(bad),negative_first=bad[:3]))
  out.append(dict(r=r,groups=groups))
 (O/'tail-antidiagonal-probe.json').write_text(json.dumps(dict(status='finite exact experiment, not proof',cases=out),indent=2)+'\n')
 print(json.dumps([dict(r=c['r'],negative_groups=[g['m'] for g in c['groups'] if g['negative_count']]) for c in out]))
if __name__=='__main__':run()
