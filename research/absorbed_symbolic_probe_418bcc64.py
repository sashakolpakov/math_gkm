"""Machine-authored 418bcc64. Exact polynomial-in-gap probe, not a universal theorem."""
from correction_polynomials_418bcc64 import *
import time
def term_poly(j,t,m):
 return scale(add(choose(add(j,[t+3]),t+m+3),scale(choose(add(j,[t+4]),t+m+5),4)),comb(t+m+3,m))
def poly_mul(a,b):
 out=[[F(0)] for _ in range(len(a)+len(b)-1)]
 for i,x in enumerate(a):
  for k,y in enumerate(b):out[i+k]=add(out[i+k],mul(x,y))
 return out
def kernel(t,k,s,c):
 # d=t+2+g, j=d+s; k is the adjacent-polynomial offset 0,1,2.
 j=[F(t+2+s),F(1)];n=t+k
 a=[term_poly(j,n,n-r) for r in range(n+1)]
 a[-1]=add(a[-1],scale([F(2-k),F(1)],F(c,n+1)))
 return a
def main():
 start=time.monotonic();out={'status':'exact symbolic experiment, not Lean proof','t_range':[0,12],
  'parameterization':'d=t+2+g, j=d+3,c=8 or j=d+2,c=4, g>=0; excludes d=t+1 clamp boundary',
  'gap_polynomials':0,'coefficients':0,'negative_coefficients':[]}
 for t in range(13):
  for s,c in [(3,8),(2,4)]:
   ps=[kernel(t,k,s,c) for k in range(3)]
   for h in range(t+1):
    a,b,e=[[v if r>=h else [F(0)] for r,v in enumerate(z)] for z in ps]
    gaps=[add(x,neg(y)) for x,y in zip(poly_mul(b,b),poly_mul(a,e))]
    for k,g in enumerate(gaps):
     out['gap_polynomials']+=1;out['coefficients']+=len(g)
     bad=[(m,str(x)) for m,x in enumerate(g) if x<0]
     if bad and len(out['negative_coefficients'])<20:out['negative_coefficients'].append([t,s,c,h,k,bad[:3]])
  print('t',t,flush=True)
 out['seconds']=time.monotonic()-start
 (O/'absorbed-symbolic-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
