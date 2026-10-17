"""Machine-authored finite exact source/suppression experiment, not proof."""
import sys
sys.dont_write_bytecode=True
from math import comb
from pathlib import Path
from fractions import Fraction
import json,time,hashlib
from three_probe_9e205206 import frame

def D(t,j,k):
    return sum((1 if a==0 else 4*a)*comb(j-a+t+3,t+3)*comb(k-a+t,t) for a in range(min(j,k)+1))
def E(e,t,J,K):
    return 4*sum((3*a+e)*comb(J-a+t+2,t+2)*comb(K-a+t+1,t+1) for a in range(min(J,K)+1))
start=time.monotonic()
out=dict(status='Finite exact experiments, not proof',q_max=40,column_max=30,source_checks=0,suppression_checks=0,zero_corrections=0,failures=[])
for q in range(1,41):
    for r in (False,True):
        _,N,p=frame([False]*(q-1)+[True,r]);e=2 if r else 1
        for i in range(3,31):
            for j in range(N+7):
                k=N+2-i-j
                d=D(i-3,j,k) if k>=0 else 0
                J=j-q-1;K=N-q-i-j
                ex=E(e,i-3,J,K) if min(J,K)>=0 else 0
                out['source_checks']+=1;out['suppression_checks']+=1;out['zero_corrections']+=int(ex==0)
                if d+ex!=p.get((i,j),0):out['failures'].append(['source',q,r,i,j])
                if 2*(i+1)*ex>d:out['failures'].append(['suppression',q,r,i,j,d,ex])
out['seconds']=time.monotonic()-start
out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
Path('evidence/markov-9c28b628/suppression-source-experiment.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
