"""Machine-authored exact finite experiments; no proof inference."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-ad504da6')
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(j,t,m):return C(t+m+3,m)*(C(t+j+3,t+m+3)+4*C(t+j+4,t+m+5)) if m>=0 else 0
def rat(j,t,m):
 w=(t+m+4)*(t+m+5)+4*(j-m)*(t+j+4)
 return (F(m*(t+m+4)*(t+m+5)*(w-2),(j-m+1)*(t+m+2)*(t+m+3)*w),F((j-m)*(t+m+4)*(t+m+5)*(w+2),(m+1)*(t+m+6)*(t+m+7)*w))
def conv(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for k,y in enumerate(b):c[i+k]+=x*y
 return c
def coeff(a,k):return a[k] if 0<=k<len(a) else 0
def main():
 start=time.monotonic();out=dict(status='finite exact experiment only',ratio_comparisons=0,ratio_endpoint_comparisons=0,local_pair_comparisons=0,zero_denominator_pairs=0,global_order_comparisons=0,cut_coefficients=0,shift_coefficients=0,failures=[])
 for j in range(21):
  for t in range(21):
   aa=[[0]*s+[L(j,t+s,j-k) for k in range(j+1)] for s in range(3)]
   for m in range(j+1):
    a,b=rat(j,t+1,m); mid=L(j,t+1,m)
    tests=[L(j,t,m-1)==mid*F(t+4,t+j+4)*a,L(j,t+2,m+1)==mid*F(t+j+5,t+5)*b]
    out['ratio_comparisons']+=2;out['ratio_endpoint_comparisons']+=2*(m in [0,j])
    if not all(tests):out['failures'].append(['ratios',j,t,m])
   for n in range(j+1):
    for m in range(n+2,j+1):
     a,b=rat(j,t+1,m); c,d=rat(j,t+1,n);e,f=rat(j,t+1,m-1);g,h=rat(j,t+1,n+1)
     out['local_pair_comparisons']+=1
     if a*d+c*b<e*h+g*f:out['failures'].append(['pair',j,t,n,m])
   for n in range(2*j+5):
    pairs=[]
    for i in range(n//2+1):
     k=n-i;den=coeff(aa[1],i)*coeff(aa[1],k);gap=2*den-coeff(aa[0],i)*coeff(aa[2],k)-coeff(aa[2],i)*coeff(aa[0],k)
     pairs.append((gap,den));out['zero_denominator_pairs']+=den==0
    for (a,b),(c,d) in zip(pairs,pairs[1:]):
     out['global_order_comparisons']+=1
     if a*d>c*b:out['failures'].append(['order',j,t,n])
   for h in range(t+3):
    if j+h<t:continue
    H=j+h-t
    cuts=[[v if i>=H else 0 for i,v in enumerate(a)] for a in aa]
    gap=[x-y for x,y in zip(conv(cuts[1],cuts[1]),conv(cuts[0],cuts[2]))]
    out['cut_coefficients']+=len(gap)
    if any(v<0 for v in gap):out['failures'].append(['cut',j,t,h])
    for s in range(3):
     left=[0]*j+[L(j,t+s,t+s-r) if r>=h else 0 for r in range(t+s+1)]
     right=[0]*t+cuts[s]
     for k in range(max(len(left),len(right))):
      out['shift_coefficients']+=1
      if coeff(left,k)!=coeff(right,k):out['failures'].append(['shift',j,t,h,s,k])
 out['seconds']=time.monotonic()-start
 (O/'centered-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
