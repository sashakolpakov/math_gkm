"""Machine-authored beca0ad5. Actual source recurrence experiment, not proof."""
from pathlib import Path
from math import comb
import json,time,hashlib
from three_probe_9e205206 import frame
from source_experiment_6576ccc5 import correction
from source_experiment_9647c1ba import L
O=Path('/Users/sasha/math_gkm/evidence/markov-beca0ad5')
def save(name,out,start):
    out['seconds']=time.monotonic()-start
    out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    (O/name).write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out),flush=True)
def run():
    start=time.monotonic();out=dict(status='finite exact actual-source experiment, not proof',fractions=0,rows=0,coefficients=0,zeros=0,raw_triples=[0,0,0],failures=[])
    for q in list(range(2,25))+[31,40]:
        for r in [False,True]:
            a,b,p=frame([False]*(q-1)+[True,r]);out['fractions']+=1
            for k in range((q-(2 if r else 1))//2+1):
                d=q-2*k-(2 if r else 1);j=q+k+1;out['rows']+=1
                for i in range(b+6):
                    raw=p.get((i,j),0);out['coefficients']+=1;out['zeros']+=raw==0
                    if raw!=L(d,j,i-3)+correction(d,k,i-2,r):out['failures'].append(['source identity',q,r,k,i])
            def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
            for i in range(a+b+1):
                for j in range(a+b+1-i):
                    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
                        if all(inside(*z) for z in pts):
                            vals=[p.get(z,0) for z in pts];out['raw_triples'][direction]+=1
                            if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw inequality',q,r,direction,pts,vals])
    save('source-experiment.json',out,start)
if __name__=='__main__':run()
