"""Machine-authored c3e5369f. Direct protected-recurrence coefficient comparisons."""
from pathlib import Path
from math import comb
from fractions import Fraction as F
import json,time
from three_probe_9e205206 import frame
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-c3e5369f'
def C(n,k):return comb(n,k) if 0<=k<=n else 0
def L(d,j,t):
 if t<0:return 0
 return C(d+j,t)*C(t+j+3,j)+4*sum((j-s)*C(d+s,t)*C(t+s+3,s) for s in range(j))
def run():
 start=time.monotonic()
 out={'status':'exact finite experiments only, not proofs','q_values':[1,2,3,4,5,7,10,16,24,40,64],
 'coefficients':0,'zeros':0,'triples':0,'polygon_triples':0,'formula_comparisons':0,'failures':[],'samples':[]}
 for q in out['q_values']:
  for r in [False,True]:
   a,n,p=frame([False]*(q-1)+[True,r]);assert (a,n)==(3,3*q+(1 if r else 2))
   j=q+2;d=q-(4 if r else 3);c0=36 if r else 24;c1=8*q-8 if r else 4*q
   vals=[]
   for i in range(n+7):
    actual=p.get((i,j),0);vals.append(actual);out['coefficients']+=1;out['zeros']+=actual==0
    if d>=0:
     pred=L(d,j,i-3)+c0*C(d,i-2)+c1*C(d,i-3)
     out['formula_comparisons']+=1
     if actual!=pred:out['failures'].append(['formula',q,r,i,actual,pred])
   for i in range(len(vals)-2):
    out['triples']+=1
    inside=lambda k:3*n<=n*k+3*j and k+j<=n+2
    out['polygon_triples']+=all(inside(k) for k in [i,i+1,i+2])
    if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['raw_lc',q,r,i,vals[i:i+3]])
   if q in [3,4,7]:out['samples'].append({'q':q,'residue':r,'denominator':n,'row':j,'coefficients':vals})
  out['completed_q']=q;(O/'source-progress.json').write_text(json.dumps(out,indent=2)+'\n');print('completed q',q,flush=True)
 out['seconds']=time.monotonic()-start
 (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='samples'}))
if __name__=='__main__':run()
