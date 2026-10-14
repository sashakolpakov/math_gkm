"""Machine-authored exact polynomial exploration; not a Lean proof."""
import json,pathlib,itertools,time
from residual_16cb import add,mul
class P:
 def __init__(self,v): self.v=v.v if isinstance(v,P) else (v if isinstance(v,dict) else ({(0,0):v} if v else {}))
 def __add__(self,o):return P(add(self.v,P(o).v))
 __radd__=__add__
 def __mul__(self,o):return P(mul(self.v,P(o).v))
 __rmul__=__mul__
 def __neg__(self):return self*-1
 def __sub__(self,o):return self+-P(o)
 def __rsub__(self,o):return P(o)+-self
 def __pow__(self,n):
  p=P(1)
  for _ in range(n):p=p*self
  return p

def vals(n,m,s,t,h,k,e,f):
 return [m*(m-1)*(m-2)*(m-3)*(m-4),
 -360+750*m-605*m**2+270*m**3-55*m**4+120*n-170*n*m+55*n*m**2-10*n*m**3+5*n*m**4+(-360+360*m-120*m**2)*s+(-240+240*m)*t+240*h+120*e,
 -1440+2040*m-1140*m**2+660*m**3+720*n-940*n*m-30*n*m**2-170*n*m**3+140*n**2*m+30*n**2*m**2+10*n**2*m**3+(-1080+1440*m-240*n*m)*s+(-1200+240*n)*t-240*k-120*e+240*f,
 -720+420*m-1500*m**2+1320*n+670*n*m+950*n*m**2-720*n**2-420*n**2*m-180*n**2*m**2+120*n**3+50*n**3*m+10*n**3*m**2+(-1440+840*n-120*n**2)*s,
 240*m-120*n-470*n*m+220*n**2+295*n**2*m-120*n**3-70*n**3*m+20*n**4+5*n**4*m,
 (n+1)*n*(n-1)*(n-2)*(n-3)]

def bounds(n,m,smax):
 a,bl,_,dl,e,f=vals(n,m,smax,0,0,0,0,0)
 _,bu,cu,du,_,_=vals(n,m,0,n-m,n-m,0,2,2)
 # C upper requires e=0, B upper e=2.
 cu=vals(n,m,0,n-m,0,0,0,2)[2]
 cl=vals(n,m,smax,0,0,2*(n-m),2,0)[2]
 return dict(bl=bl,cl=cl,dl=dl,e=e,f=f,gap1=bl**2-a*cu,
   gap2=cl**2-bu*du,gap3=dl**2-cu*e,gap4=e**2-du*f)

def main():
 start=time.monotonic();x=P({(1,0):1});y=P({(0,1):1});out={}
 for M in range(5,61):
  m=x+M;n=m+y;ps=bounds(n,m,2*y)
  neg={k:sum(c<0 for c in v.v.values()) for k,v in ps.items()}
  if not any(neg.values()):
   out['large_m']={'threshold':M,'polynomials':{k:[[list(a),b] for a,b in sorted(v.v.items())] for k,v in ps.items()}};break
 out['last_negatives']=neg
 out['small_m']=[]
 if 'large_m' in out:
  for m in range(1,out['large_m']['threshold']):
   for N in range(max(m,6),101):
    ps=bounds(x+N,P(m),P(2*m))
    # A=0 for m<5; B may also be zero in thin cases: skip its lower positivity.
    keys=list(ps) if m>=5 else [k for k in ps if k not in ['bl','gap1']]
    if all(c>=0 for k in keys for c in ps[k].v.values()):
     out['small_m'].append(dict(m=m,N=N));break
   else:out['small_m'].append(dict(m=m,no_threshold_through=100))
 out['status']='exact polynomial exploration only';out['seconds']=time.monotonic()-start
 pathlib.Path('evidence/markov-e5822cfc/quintic-bounds.json').write_text(json.dumps(out,indent=2)+'\n')
 print({k:(v if k!='large_m' else v['threshold']) for k,v in out.items()})
if __name__=='__main__':main()
