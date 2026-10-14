"""Machine-authored exact exploration of the integral blowup quotient.
The variables x,y here mean u*t,v*t, not source Laurent x,y.+No finite result is a universal proof. Standard-library integer arithmetic.
"""
import json, pathlib, sys, time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
one={(0,0):1}; x={(1,0):1}; y={(0,1):1}
S=add(add(one,x),y)
initial=((0,1,one),(1,2,add(one,x)),(1,1,one))
def child(f,right):
    lo,mid,hi=f
    fixed,old=(hi,lo) if right else (lo,hi)
    a,b,p=fixed
    new=(a+mid[0],b+mid[1],add(mul(mul(S,p),mid[2]),mul({(a,b):1},old[2]),-1))
    return (mid,new,hi) if right else (lo,new,mid)
def check(p):
    fails=[]
    im=max((i for i,j in p),default=0); jm=max((j for i,j in p),default=0)
    for di,dj in [(1,0),(0,1),(1,-1)]:
        for i in range(im+1):
            for j in range(jm+1):
                cs=[p.get((i+k*di,j+k*dj),0) for k in range(3)]
                if cs[1]**2<cs[0]*cs[2]: fails.append([di,dj,i,j,cs])
    return fails
def main():
    start=time.monotonic(); bound=int(sys.argv[1]) if len(sys.argv)>1 else 30
    stack=[('',initial)]; count=0; negatives=[]; fails=[]; rows=[]
    while stack:
        path,f=stack.pop(); a,b,p=f[1]
        if b>bound: continue
        count+=1
        if any(c<0 for c in p.values()): negatives.append([path,a,b])
        fs=check(p)
        if fs: fails.append([path,a,b,fs[:3]])
        if b<=8: rows.append([path,a,b,[[i,j,c] for (i,j),c in sorted(p.items())]])
        if f[1][1]+f[2][1]<=bound: stack.append((path+'R',child(f,True)))
        if f[1][1]+f[0][1]<=bound: stack.append((path+'L',child(f,False)))
    result=dict(status='finite exact experiment only',bound=bound,fractions=count,
        negative_quotients=negatives,lc_failures=fails,examples=rows,seconds=time.monotonic()-start)
    out=pathlib.Path('evidence/markov-16cb07ce'); out.mkdir(exist_ok=True)
    (out/f'residual-{bound}.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='examples'}))
if __name__=='__main__': main()
