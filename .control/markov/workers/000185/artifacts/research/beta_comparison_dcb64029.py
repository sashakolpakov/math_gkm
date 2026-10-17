"""Machine-authored exact tests of the beta-binomial comparison proof route."""
from fractions import Fraction as F
from math import comb,prod
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-dcb64029')
def B(a,m,H):
 return (2*a+2)*(2*a+3)*(H*H-(3*a+7)*H-5*a-14)-4*(m-2)*(2*a+3)*(H+a*a+5*a+7)-2*(m-2)*(m-3)*(a*a+6*a+7)
def w(r,k):return 1 if k==r else 4*(r-k) if k<r else 0
def run():
 t=time.monotonic();out=dict(status='finite exact experiment; written proof route not yet fully formalized',moment_checks=0,radial_pairs=0,group_checks=0,failures=[])
 for i in range(9):
  a=i+1
  for r in range(2,18):
   for d in sorted(set([0,max(0,i+r-2),i+4*r-1,i+4*r+9])):
    H=d+2*i+9;Q=d+i+6
    q=[F(1)]
    for k in range(2*r):q.append(q[-1]*F(H+k,Q+k))
    for m in range(2,2*r+1):
     S=a*(a+3);SS=(a+1)*(a+4)
     ww=[comb(i+k,i)*comb(i+m-k,i) for k in range(m+1)]
     gg=[w(r,k)*w(r,m-k)*q[k]*q[m-k] for k in range(m+1)]
     ff=[]
     for k in range(m+1):
      l=m-k;ak=k*(H+k);al=l*(H+l);bk=(k-1)*(H+k+1);bl=(l-1)*(H+l+1)
      ff.append(SS*ak*al-S*F(ak*bk+al*bl,2))
     mass=sum(ww);mean=sum(v*f for v,f in zip(ww,ff))/mass
     formula=F(a*a*(a+1)*m*(m-1)*B(a,m,H),prod(2*a+j for j in range(4)))
     out['moment_checks']+=1
     if mean!=formula:out['failures'].append(['beta expectation',i,d,r,m,str(mean),str(formula)])
     for k in range(m//2):
      out['radial_pairs']+=1
      if gg[k]>gg[k+1] or ff[k]>ff[k+1]:out['failures'].append(['radial order',i,d,r,m,k])
     if d>=i+4*r-1:
      out['group_checks']+=1
      actual=sum(v*g*f for v,g,f in zip(ww,gg,ff));gmass=sum(v*g for v,g in zip(ww,gg))
      if mean<=0 or actual<=0 or actual*mass<gmass*sum(v*f for v,f in zip(ww,ff)):
       out['failures'].append(['comparison or sign',i,d,r,m])
 out['seconds']=time.monotonic()-t
 (O/'beta-comparison-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
