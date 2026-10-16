"""Machine-authored exact basis comparison; not a theorem."""
from poly_probe_0d346fa7 import *
from newton_probe_0d346fa7 import diffs,newton,lower,upper
import time
O=Path('evidence/markov-29509309')
def specs(i):
 n=add(X,const(i-2));q=add(X,const(i-1));q2=add(X,const(i))
 return {
 'lower':gap(L(X,add(Y,const(2)),i),L(add(X,one),add(Y,one),i),L(add(X,const(2)),Y,i)),
 'upper':gap(U(add(n,const(2)),add(Y,one),i),U(add(n,one),add(Y,const(2)),i),U(n,add(Y,const(3)),i)),
 'cross_one':gap(L(add(q,const(-1)),one,i),L(q,{},i),U(add(q,const(-1)),one,i)),
 'cross_two':gap(L(q2,{},i),U(add(q2,const(-1)),one,i),U(add(q2,const(-2)),const(2),i))}
def evalp(p,x,y):return sum(v*x**a*y**b for (a,b),v in p.items())
def main():
 out=[];start=time.monotonic()
 for name,p in specs(8).items():
  dx=max(a for a,b in p);dy=max(b for a,b in p)
  mixed={}
  for a in range(dx+1):
   vals=[sum(v*y**b for (aa,b),v in p.items() if aa==a) for y in range(dy+1)]
   for b,v in enumerate(diffs(vals)):
    if v:mixed[a,b]=v
  co=newton(lambda x,y:evalp(p,x,y),dx,dy)
  (O/f'basis-{name}-i8.json').write_text(json.dumps({'monomial':[[a,b,str(v)] for (a,b),v in p.items()],'mixed':[[a,b,str(v)] for (a,b),v in mixed.items()],'newton':[[a,b,str(v)] for (a,b),v in co.items()]},indent=2)+'\n')
  out.append({'region':name,'degree':[dx,dy],'monomial_negative':sum(v<0 for v in p.values()),'mixed_negative':sum(v<0 for v in mixed.values()),'newton_negative':sum(v<0 for v in co.values()),'terms':[len(p),len(mixed),len(co)]})
 (O/'basis-probe.json').write_text(json.dumps({'cases':out,'seconds':time.monotonic()-start},indent=2)+'\n'); print(out,flush=True)
if __name__=='__main__':main()
