"""Machine-authored exact probes, request 3979f3c7; no finite scan is a proof."""
import json, pathlib, random, time
from balanced_f80 import A, B, mm

def check(w):
    m=A
    for c in w[1:]: m=mm(m,B if c=='B' else A)
    p=m[1]
    for (i,j),v in p.items():
        mid=p.get((i+1,j),0); right=p.get((i+2,j),0)
        if mid*mid<v*right:
            return dict(word=w,start=[i,j],coefficients=[v,mid,right])

def main():
    rng=random.Random(3979); start=time.monotonic(); count=0; fail=[]
    words=[]
    for n in range(3,25):
        for k in range(1,8):
            words += ['A'+'B'*k+'A'*n+'B','A'+'B'*n+'A'*k+'B',
                      'A'+('AB'*k)+'A'*n+'B','A'+'B'*k+'A'*n+'B'*k]
    for _ in range(1000):
        n=rng.randrange(17,71); prob=rng.choice([.1,.3,.5,.7,.9])
        words.append('A'+''.join('B' if rng.random()<prob else 'A' for _ in range(n-2))+'B')
    out=pathlib.Path('evidence/markov-3979f3c7/word-horizontal.json')
    for w in words:
        f=check(w); count+=1
        if f: fail.append(f)
        r=dict(status='finite exact enlarged-family experiment only',checked=count,
               failures=fail,seconds=time.monotonic()-start,seed=3979)
        out.write_text(json.dumps(r,indent=2)+'\n')
        if f or time.monotonic()-start>55: break
    print(json.dumps(r),flush=True)
if __name__=='__main__': main()
