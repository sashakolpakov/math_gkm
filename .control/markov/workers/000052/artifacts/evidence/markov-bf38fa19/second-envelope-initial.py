"""Machine-authored exact second lower-slice envelope probe; finite only."""
import pathlib,json,time,math
from cyclic_probe_bf38 import prod,add,mul
def scale(p,c):return {k:v*c for k,v in p.items() if v*c}
def sub(p,q):return add(p,scale(q,-1))
def pol(p,s):return {(0,j):v for (i,j),v in p.items() if i==s}
I={(0,0):1};Y={(0,1):1};Q=add(I,Y)
def jets(n):
 m=prod([n]);b=pol(m[2],0);d=pol(m[3],1)
 return add(b,d),add(pol(m[3],2),pol(m[2],1)),b
def formula(n,c,r,q):
 h,k,b=jets(n);hh,kk,bb=jets(n+1);delta=sub(bb,b)
 t=add(scale(k,c-r),scale(kk,r),scale(mul(h,h),math.comb(c-r,2)),
       scale(mul(h,hh),(c-r)*r),scale(mul(hh,hh),math.comb(r,2)),
       mul(sub(Y,I),add(scale(b,c),scale(delta,r))),
       mul(Y,add(scale(mul(b,b),c),scale(mul(b,delta),2*r),scale(mul(delta,delta),q))))
 f1=sub(add(scale(h,c-r),scale(hh,r)),Q)
 return sub(t,mul(Q,f1))
def main():
 start=time.monotonic();count=0;fail=[];examples=[]
 for n in range(16):
  for c in range(3,61):
   for r in range(1,c):
    for q in ([0] if 2*r<c else range(max(2*r-c,0),r)):
     p=formula(n,c,r,q);a=c*n+r;b=a+c
     vals=[p.get((0,j),0) for j in range(2*n+6)]
     for j in range(len(vals)-2):
      count+=1
      if vals[j+1]**2<vals[j]*vals[j+2]:
       if len(fail)<20:fail.append(dict(n=n,c=c,r=r,q=q,j=j,values=vals[j:j+3],source_candidate=math.gcd(a,b)==1))
     if c==3 and r==1 and n<3:examples.append(dict(n=n,c=c,r=r,q=q,coefficients=vals))
 out=dict(status='Exact finite artificial-parameter tests, not universal proof or source witnesses',tests=count,first_failures=fail,examples=examples,seconds=time.monotonic()-start)
 pathlib.Path('evidence/markov-bf38fa19/second-envelope.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
