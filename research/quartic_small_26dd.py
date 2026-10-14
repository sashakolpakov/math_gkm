"""Machine-authored exact exploratory algebra. Not a proof."""
import json, math, pathlib
from fractions import Fraction as F
from itertools import product

def vals(n,m,s,t):
    return [m*(m-1)*(m-2)*(m-3),
      4*((n-8)*m**3+18*m*m+(5*n-22)*m-6*n+12)+48*(1-m)*s+48*t,
      6*(n*n*(m*m+3*m+6)+n*(-11*m*m-9*m-18)+26*m*m-10*m+12)+(144-48*n)*s,
      4*(n-1)*(n-2)*(3*n+m*(n-6)),(n+1)*n*(n-1)*(n-2)]

def polcoeff(f,shift,degree=8):
    samples=[F(f(shift+j)) for j in range(degree+1)]
    diffs=[]
    while samples:
        diffs.append(samples[0]); samples=[b-a for a,b in zip(samples,samples[1:])]
    poly=[F(1)]; res=[F(0)]*(degree+1)
    for k,c in enumerate(diffs):
        for j,v in enumerate(poly):res[j]+=c*v/math.factorial(k)
        nxt=[F(0)]*(len(poly)+1)
        for j,v in enumerate(poly):nxt[j]-=k*v;nxt[j+1]+=v
        poly=nxt
    return res

def bounds(n,m):
    a,bl,cl,d,e=vals(n,m,2*m,0)
    _,bu,cu,_,_=vals(n,m,0,n-m)
    return [cl,cl*cl-bu*d,d*d-cu*e] if m<=3 else [bl,cl,bl*bl-a*cu,cl*cl-bu*d,d*d-cu*e]

def main():
    thresholds=[]
    for m in range(1,6):
      for N in range(max(m,3),100):
        cs=[polcoeff(lambda n:bounds(n,m)[k],N) for k in range(len(bounds(N,m)))]
        if all(c>=0 for row in cs for c in row):
          thresholds.append(dict(m=m,n_min=N,coefficients=[[str(c) for c in row] for row in cs]));break
    fake=[];actual=[]
    for n in range(2,14):
      for m in range(1,min(n,5)+1):
       for s in range(min(2*m,2*(n-m),n-1)+1):
        for t in range(n-m+1):
         v=vals(n,m,s,t)
         if min(v)>=0 and any(v[i]*v[i+2]>v[i+1]**2 for i in range(3)):
          fake.append([n,m,s,t,v])
      for w in product([0,1],repeat=n):
       m=sum(w);s=sum(x!=y for x,y in zip(w,w[1:]));t=sum(x==z and y==0 for x,y,z in zip(w,w[1:],w[2:]))
       v=vals(n,m,s,t)
       if any(v[i]*v[i+2]>v[i+1]**2 for i in range(3)):actual.append([list(w),v])
    out=dict(thresholds=thresholds,fake_failures=fake,actual_failures=actual,status='finite exact exploration only')
    dest=pathlib.Path('evidence/markov-26dd33d6');dest.mkdir(exist_ok=True)
    (dest/'small-exploration.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(dict(thresholds=[(r['m'],r['n_min']) for r in thresholds],fake_count=len(fake),fake_first=fake[:10],actual=actual)))
if __name__=='__main__':main()
