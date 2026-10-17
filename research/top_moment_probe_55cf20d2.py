"""Machine-authored exact finite moment experiments. No universal conclusion."""
from math import comb
from fractions import Fraction
from pathlib import Path
import json,time
O=Path('/Users/sasha/math_gkm/evidence/markov-55cf20d2')
def mass(d,T,i):
 return sum((1 if s==T else 4*(T-s))*comb(s,i)*comb(d+s+i+8,i+3) for s in range(i,T+1))
def moments(d,T,i):
 a=m=z=0
 for s in range(i,T+1):
  w=(1 if s==T else 4*(T-s))*comb(s,i)*comb(d+s+i+8,i+3)
  x=s*(s+d+9);a+=w;m+=w*x;z+=w*x*x
 u=i*(i+d+9);c=(i+1)*(i+4);D=m-u*a;V=a*z-m*m
 return a,D,V,c
def run():
 start=time.monotonic();count=0;failed=[];strong=[];ratios=[];worst=(Fraction(0),None)
 for T in list(range(2,61))+[80,100,150,200]:
  for d in [0,1,2,max(0,T-2),T,2*T,10*T,100*T]:
   for i in range(T-1):
    a,D,V,c=moments(d,T,i);count+=1
    gap=(2*i+6)*D*D+c*(2*i+d+10)*a*D-c*V
    if gap<0:failed.append([d,T,i,gap])
    if c*V>(2*i+6)*D*D and len(strong)<20:strong.append([d,T,i,a,D,V,c])
    if D:
     ratio=Fraction(c*V,(2*i+6)*D*D)
     if ratio>worst[0]:worst=(ratio,[d,T,i])
 out=dict(status='finite exact experiment only',tested=count,drift_failures=failed,stronger_failures=strong,worst_stronger_ratio=str(worst[0]),worst_stronger_parameters=worst[1],seconds=time.monotonic()-start)
 (O/'top-moment-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
