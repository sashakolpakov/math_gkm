"""Machine-authored exact univariate rational algebra; generated identities need Lean."""
from fractions import Fraction as F
from math import comb, factorial,lcm
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-418bcc64'
def trim(a):
 while len(a)>1 and a[-1]==0:a.pop()
 return a
def add(a,b):return trim([(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(max(len(a),len(b)))])
def neg(a):return [-x for x in a]
def scale(a,c):return trim([c*x for x in a])
def mul(a,b):
 c=[F(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return trim(c)
def choose(a,k):
 out=[F(1)]
 for i in range(k):out=mul(out,add(a,[-i]))
 return scale(out,F(1,factorial(k)))
def low(n,x,t):
 out=[F(0)]; d=add(add(n,scale(x,-2)),[-1])
 for m in range(t+1):
  out=add(out,scale(mul(choose(d,t-m),add(choose(add(x,[t+3]),t+m+3),scale(choose(add(x,[t+4]),t+m+5),4))),comb(t+m+3,m)))
 return out
def correction(q,r,i):
 c=8 if r else 4
 if i==2:return [F(c)]
 return add(low(add(scale(q,3),[1 if r else 2]),add(q,[1]),i-3),scale(choose(add(q,[-2 if r else -1]),i-2),c))
def horner(a,var='x'):
 def num(x):return str(x.numerator) if x.denominator==1 else f'({x.numerator}/{x.denominator})'
 out=num(a[-1])
 for x in reversed(a[:-1]):out=f'({num(x)}+{var}*{out})'
 return out
def main():
 report=[]
 for i in range(2,21):
  for r in [False,True]:
   for shift in [2,max(2,i if r else i-1)]:
    a,b,c=[correction([F(shift),F(1)],r,i+k) for k in range(3)]
    gap=add(mul(b,b),neg(mul(a,c)))
    report.append({'i':i,'r':r,'shift':shift,'degree':len(gap)-1,'negative_coefficients':sum(x<0 for x in gap),'positive_constant':gap[0]>0})
 (O/'polynomial-probe.json').write_text(json.dumps(report,indent=2)+'\n')
 print(json.dumps(report))
if __name__=='__main__':main()
