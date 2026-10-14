"""Machine-authored exact polynomial certificates, Fractions only."""
import sys,pathlib,json
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
from fractions import Fraction
h={(1,0):1};t={(0,1):1};one={(0,0):1}
def scale(a,k):return {m:k*c for m,c in a.items() if k*c}
def plus(a,n):return add(a,scale(one,n))
def B6(a):return mul(mul(plus(a,1),plus(a,2)),plus(scale(a,2),3))
def high(c,q):return add(B6(c),scale(B6(plus(add(c,q,-1),-1)),-8))
q=plus(add(t,h),1);c=add(q,t)
gap=add(mul(high(c,q),high(c,q)),mul(high(plus(c,-1),q),high(plus(c,1),q)),-1)
res=dict(substitution='center=q+t, q=t+h+1; h,t>=0',
 gap36=[dict(h=a,t=b,coefficient=v) for (a,b),v in sorted(gap.items())],
 all_nonnegative=all(v>=0 for v in gap.values()))
pathlib.Path('evidence/markov-3556cd95/cubic-certificate.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res))
