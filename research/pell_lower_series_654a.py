"""Machine-authored exact finite cross-check, not a proof."""
import json,time
from math import comb
from pathlib import Path
from gas_probe_0618 import poly

def lower(s,i,j):
    if s==0:return int(j==0)
    return sum(comb(2*s,k)*comb(s+i-k,s)*comb(s-1+j-(2*s-k),s-1)
        for k in range(2*s+1) if k<=i and 2*s-k<=j)

def main():
    t=time.monotonic();checks=0;fails=[]
    for a in range(1,41):
        p=poly([False,True]*(a-1)+[False])
        for i in range(2*a+3):
            for j in range(2*a+3):
                s=i+j-a
                v=lower(s,i,j) if s>=0 else 0
                checks+=1
                if v!=p.get((i,j),0):fails.append([a,i,j,v,p.get((i,j),0)])
    out=dict(status='Exact finite experiment, not proof',max_a=40,checks=checks,failures=fails,
             seconds=time.monotonic()-t)
    Path('evidence/markov-654a72ea/lower-series-check.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out))
if __name__=='__main__':main()
