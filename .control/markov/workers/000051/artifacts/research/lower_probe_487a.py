"""Machine-authored exact first-cut source experiment; finite evidence only."""
import pathlib,json,math,time,random
from transfer_states_b5db import states
out=pathlib.Path('evidence/markov-487ae883');start=time.monotonic()
def firstcut(w):
    # Prefix skip state (p,1), and sum c_r(p+1) over the selected position.
    p=[0,1]; total=[]
    for r in (*w,True):
        h=p.copy();h[0]+=1
        if r:
            h=[h[0]]+[h[j]+h[j-1] for j in range(1,len(h))]+[h[-1]]
        if len(total)<len(h):total += [0]*(len(h)-len(total))
        for j,x in enumerate(h):total[j]+=x
        if r:p=[0,p[0]+2]+p[1:]
        else:p=[0]
    return total
counts=dict(sources=0,coefficients=0,triples=0,independent_transfer_checks=0)
fail=[]
inputs=[(a,b) for b in range(2,151) for a in range(1,b) if math.gcd(a,b)==1]
rng=random.Random(487)
for _ in range(400):
 b=rng.randrange(151,1501);a=rng.randrange(1,b)
 if math.gcd(a,b)==1:inputs.append((a,b))
for a,b in inputs:
 w=tuple(a*k//b<a*(k+1)//b for k in range(b))[1:-1]
 p=firstcut(w);p += [0]*max(0,a+3-len(p));c=b-a
 expected=[b-1,3*a-1]+[4*max(a-c*(j-1),0)+int(c==1 and j==a+1) for j in range(2,len(p))]
 if p!=expected:fail.append(dict(a=a,b=b,actual=p,expected=expected))
 if b<=18:
  f=states(w)[2]
  assert all(p[j]==f.get((1,j),0) for j in range(len(p)))
  counts['independent_transfer_checks']+=1
 counts['sources']+=1;counts['coefficients']+=len(p)
 for j in range(len(p)-2):
  counts['triples']+=1
  if p[j+1]**2<p[j]*p[j+2]:fail.append(dict(a=a,b=b,j=j,values=p[j:j+3]))
w=(True,False)+(True,)*7+(False,True)
p=firstcut(w)
rec=dict(status='Exact finite experiment, not proof',counts=counts,failures=fail,
 inputs=inputs,seconds=time.monotonic()-start,
 palindrome_obstruction=dict(word=list(w),virtual_label=[10,13],s=1,j=2,values=p[2:5],gap=p[3]**2-p[2]*p[4],source=False),
 formula='C0=b-1, C1=3a-1; Cj=4 max(a-(b-a)(j-1),0)+1_{b-a=1,j=a+1} for j>=2')
(out/'lower-probe.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:v for k,v in rec.items() if k!='inputs'}))
