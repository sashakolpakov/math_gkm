"""Machine-authored reproducible rational polynomial diagnostic, no proof claim.
Prints the calculation initially executed inline; does not overwrite history.
"""
from fractions import Fraction as F
from functools import reduce
from math import factorial,comb
import json
def add(a,b):
 return [(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(max(len(a),len(b)))]
def mul(a,b):
 return [sum(a[i]*b[k-i] for i in range(len(a)) if 0<=k-i<len(b)) for k in range(len(a)+len(b)-1)]
def scale(a,c):return [x*c for x in a]
def C(n,k):return reduce(mul,([F(n-i),F(1)] for i in range(k)),[F(1,factorial(k))])
L=C(6,2);M=add(scale(C(5,3),5),scale(C(6,3),8))
R=add(add(scale(C(4,4),21),scale(C(5,4),60)),scale(C(6,4),45))
gap=scale(add(mul(M,M),scale(mul(L,R),-1)),72)
assert gap==[2099520,2618064,1349732,367965,55919,4491,149]
records=[]
for m in [0,1,14,15,50,1000]:
 a=m+7;E=60*comb(a-1,2)*comb(a-2,4);mid=40*comb(a-2,3)*comb(a-1,3)
 B=(a-1)*(a-2)**2*(a-3)*(a-4)
 assert 36*(E-mid)==5*B*(a-21)
 assert 36*(2*mid-E)==5*B*(7*a-3)
 records.append(dict(a=a,E=E,M=mid,midpoint_fails=E>mid,aggregate_gap=2*mid-E))
print(json.dumps(dict(status='finite exact symbolic corroboration, not proof',
 gap_times72=list(map(str,gap)),records=records),indent=2))
