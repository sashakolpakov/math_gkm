"""Machine-authored symbolic factoring and coefficient candidates, not proofs."""
from pathlib import Path
import json
from fractions import Fraction as F
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize,divD
from probe_shift_f2da221d import load,subst
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-cc599cf1'
def divide(a,b):
 p=P(a);ans=P();kb=max(b);vb=b[kb]
 while p:
  ka=max(p);va=p[ka];kk=tuple(i-j for i,j in zip(ka,kb))
  if min(kk)<0:return None
  t=P({kk:va/vb});ans=ans+t;p=p-t*b
 return ans
def main():
 lin=load(json.loads((O/'shift-groups.json').read_text())['groups'][1]['polynomial'])
 trial=divide(lin,16*(C-Rr)*X**2)
 (O/'factor-rejection.json').write_text(json.dumps(dict(candidate='16*(c-r)*x^2 divides the full shift-linear numerator',divisible=trial is not None,status='Exact symbolic candidate rejected; not a source-conjecture refutation'),indent=2)+'\n')
 q=divide(lin,16*X**2);assert q is not None
 factors=[]
 for f,label in [(1-X,'1-x'),(1+X,'1+x')]:
  while True:
   p=divide(q,f)
   if p is None:break
   q=p;factors.append(label)
 compact=subst(q,[N,Z,C,Rr-N*C,Q,T,U,X])
 print('factors',factors,'q',len(q),'compact',len(compact),flush=True)
 print('compact coefficients by x',[(i,len([1 for k in compact if k[-1]==i])) for i in range(max(k[-1] for k in compact)+1)],flush=True)
 result=dict(status='Exact Python candidate, Lean identification required',linear=serialize(lin),quotient=serialize(q),factors=factors,compact_quotient=serialize(compact))
 # Rational inverse convolution valid once j-n>=5 (all degree<=12 factors can use falling polynomial).
 shape=P()
 for ks,v in lin.items():
  xx=ks[-1];binom=coerce(F(1,16))
  for a in range(7):binom=binom*(Q+7-xx-a)
  kk=tuple(list(ks[:-1])+[0]);shape=shape+P({kk:v})*binom
 assert all(v.denominator==1 for v in shape.values())
 result['shape']=serialize(shape)
 print('shape terms',len(shape),flush=True)
 (O/'linear-factor.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':main()
