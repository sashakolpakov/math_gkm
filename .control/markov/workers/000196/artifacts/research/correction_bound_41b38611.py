"""Machine-authored exact probe of a uniform domination route; not proof."""
from correction_kernel_d0292f14 import top,correction
from fractions import Fraction
from pathlib import Path
import json,time
t=time.monotonic(); cases=0; bad=[]; maxratio=(Fraction(0),None); minmargin=None
for k in list(range(0,40))+[50,75,100,200,1000]:
 for x in [0,1,2,5,10,30,100]:
  for r in [False,True]:
   for c in range(5,min(4*k+(9 if r else 7),50)):
    A=[top(x,x+3*k+(5 if r else 4),c+j) for j in range(3)]
    D=[correction(x+(3 if r else 2),k,r,c+j+3) for j in range(3)]
    exponential=3**(c+2)*D[0]<=21*A[0]
    small=4*(c+5)*D[0]<=A[0]
    strong=(c+4)*A[1]**2 >= (c+5)*A[0]*A[2]
    if not all([exponential,small,strong]):bad.append([x,k,r,c,exponential,small,strong])
    if A[0] and Fraction(D[0],A[0])>maxratio[0]:maxratio=(Fraction(D[0],A[0]),[x,k,r,c])
    cases+=1
out=dict(cases=cases,failures=bad[:20],failure_count=len(bad),max_relative_correction=[str(maxratio[0]),maxratio[1]],seconds=time.monotonic()-t,status='Finite exact tests only; universal bounds being investigated separately.')
Path('evidence/markov-41b38611/correction-bound-probe.json').write_text(json.dumps(out,indent=2));print(json.dumps(out))
