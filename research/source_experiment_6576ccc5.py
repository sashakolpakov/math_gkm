"""Machine-authored 6576ccc5. Exact raw recurrence versus the new positive lift.
Finite observations only; no experiment is a proof of a universal statement.
"""
from pathlib import Path
from math import comb
import json, time
from three_probe_9e205206 import frame
from source_experiment_9647c1ba import L, C
O=Path('/Users/sasha/math_gkm/evidence/markov-6576ccc5')
def correction(d,k,t,r):
    if t<0:return 0
    a=2 if r else 1
    return 4*sum(C(d,t-m)*C(t+m+1,m)*(a*C(k+t+3,t+m+3)+(3-a)*C(k+t+2,t+m+3)) for m in range(t+1))
def positive(d,k,r):
    a=2 if r else 1
    return [4*sum((3*(k-s)+a)*C(s+1,m+1)*C(d+s+m+1,m) for s in range(k+1)) for m in range(k+1)]
def run():
    start=time.monotonic()
    out=dict(status='finite exact experiment, not a proof',q_values=list(range(2,25))+[32,50,73],rows=0,coefficients=0,zeros=0,raw_triples=0,polygon_triples=0,lift_comparisons=0,failures=[],first_gap_examples=[])
    for q in out['q_values']:
      for r in [False,True]:
        a,b,p=frame([False]*(q-1)+[True,r]);N=3*q+(1 if r else 2)
        for k in range((q-(2 if r else 1))//2+1):
          d=q-2*k-(2 if r else 1);j=q+k+1
          Q=positive(d,k,r);out['rows']+=1
          vals=[]
          for i in range(N+6):
            actual=p.get((i,j),0);vals.append(actual)
            c=correction(d,k,i-2,r)
            predicted=L(d,j,i-3)+c
            old=sum(v*C(d,i-2-m) for m,v in enumerate(Q))
            out['lift_comparisons']+=1;out['coefficients']+=1;out['zeros']+=actual==0
            if old!=c or actual!=predicted:out['failures'].append([q,r,k,i,actual,predicted,old,c])
          for i in range(len(vals)-2):
            valid=all(a*b<=b*x+a*j and x+j<=a+b-1 for x in range(i,i+3))
            out['raw_triples']+=1;out['polygon_triples']+=valid
            if vals[i]*vals[i+2]>vals[i+1]**2:out['failures'].append(['LC',q,r,k,i,vals[i:i+3],valid])
          if (q,k,r) in [(17,8,False),(50,20,True),(73,36,False)]:
            out['first_gap_examples'].append(dict(q=q,k=k,r=r,d=d,j=j,raw=vals[2:5],gap=vals[3]**2-vals[2]*vals[4]))
      (O/'source-progress.json').write_text(json.dumps(out,indent=2)+'\n')
    out['seconds']=time.monotonic()-start
    (O/'source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out))
if __name__=='__main__':run()
