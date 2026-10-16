"""Machine-authored exact first-correction gap candidates, not proofs."""
from column_certificates_ae9e841e import *
def main():
 ps=[column(t) for t in range(6)];out={}
 for r in [False,True]:
  q=Padd(X,const(2));n=Padd(Pscale(q,3),const(1 if r else 2))
  def raw(t,j,correction=False):
   a=subst(ps[t],n,j)
   if correction:a=Padd(a,Pscale(choose(Padd(q,const(-2 if r else -1)),t+1),8 if r else 4))
   return a
  for direction in ['horizontal','vertical','diagonal']:
   for t in (range(2,6) if direction=='vertical' else range(1,4)):
    if direction=='horizontal':
     a,b,c=[raw(k,Padd(q,one),True) for k in [t,t+1,t+2]]
    elif direction=='vertical':
     a=raw(t,Padd(q,const(-1)));b=raw(t,q);c=raw(t,Padd(q,one),True)
    else:
     a=raw(t,Padd(q,one),True);b=raw(t+1,q);c=raw(t+2,Padd(q,const(-1)))
    gap=Padd(Pmul(b,b),Pscale(Pmul(a,c),-1));fs,core=factor_x(gap)
    key=f'{direction}-{t}-{r}'
    out[key]={'negative_count':sum(v<0 for v in core.values()),'factors':fs,'core':lean(core),'gap':lean(gap),'q':'x+2','status':'candidate polynomial only'}
 (O/'correction-candidates.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:{'negative_count':v['negative_count'],'factors':v['factors']} for k,v in out.items()}))
if __name__=='__main__':main()
