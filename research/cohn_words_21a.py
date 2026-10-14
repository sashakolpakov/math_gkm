"""Machine-authored finite experiment, worker 21afc594. Not a root proof.
Conjugated published Cohn matrices, w=1; every binary word up to length 8.
Tests raw coefficients with zero extension, without identifying arbitrary words
with the source Farey family. Input source: published paper equation (35).
"""
import itertools, json, pathlib, sys, time
sys.path.insert(0, str(pathlib.Path('evidence/markov').resolve()))
from scan import add, mul, generate
start=time.monotonic()
one={(0,0):1}; u={(1,0):1}; v={(0,1):1}
uv=mul(u,v); s=add(add(u,v),one)
A=(v,one,uv,add(u,one))
B=(mul(v,s),add(u,v),mul(uv,add(s,one)),mul(u,s))
I=(one,{}, {},one)
def mm(a,b):
    return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j]))
                 for i in range(2) for j in range(2))
def failure(p):
    im=max((i for i,j in p),default=0)
    jm=max((j for i,j in p),default=0)
    for di,dj in [(1,0),(0,1),(1,-1)]:
        for i in range(im+1):
            for j in range(jm+1):
                pts=[(i+k*di,j+k*dj) for k in range(3)]
                cs=[p.get(pt,0) for pt in pts]
                if cs[1]**2<cs[0]*cs[2]:
                    return dict(direction=[di,dj],points=pts,coefficients=cs)
    return None
counts={}; failures=[]; nodes=[('',I)]
for n in range(1,9):
    nodes=[(w+c,mm(m,t)) for w,m in nodes for c,t in [('A',A),('B',B)]]
    bad=0
    for w,m in nodes:
        f=failure(m[1])
        if f:
            bad+=1
            if len(failures)<12: failures.append(dict(word=w,**f))
    counts[n]=dict(words=len(nodes),failures=bad)
# Source indexing bridge tested independently on finite Farey paths.
bridge_fail=[]; checked=0
for path,(a,b,p) in generate(15):
    lo,hi=A,B
    for c in path:
        mid=mm(lo,hi)
        if c=='L': hi=mid
        else: lo=mid
    m=mm(lo,hi)
    checked+=1
    if m[1]!=p: bridge_fail.append([path,a,b])
report=dict(status='finite exact experiment only; arbitrary words are not source witnesses',
    word_counts=counts,first_failures=failures,source_bridge_checked=checked,
    source_bridge_failures=bridge_fail,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-21afc594/cohn-words.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
