"""Machine-authored numerical hypothesis probe. No root-location proof."""
import cmath, json, math, pathlib, sys, time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import generate

def trim(p):
    p=list(p)
    while p and p[-1]==0:p.pop()
    while p and p[0]==0:p.pop(0)
    return p

def strip(p):
    p=trim(p); n=0
    while len(p)>1:
        q=[p[0]]
        for x in p[1:-1]:q.append(x-q[-1])
        if q[-1]!=p[-1]:break
        p=q;n+=1
    return p,n

def roots(p):
    n=len(p)-1
    if n<1:return [],0.0
    # Scale the geometric mean root modulus to one, reducing large coefficients.
    scale=(p[0]/p[-1])**(1/n)
    a=[float(c/p[-1])*scale**(k-n) for k,c in enumerate(p)]
    def ev(z):
        v=complex(a[-1]);d=0j
        for c in reversed(a[:-1]):d=d*z+v;v=v*z+c
        return v,d
    zs=[1.2*cmath.exp(2j*math.pi*(k+.37)/n) for k in range(n)]
    for _ in range(350):
        nxt=[];err=0
        for k,z in enumerate(zs):
            v,d=ev(z)
            if abs(d)<1e-200:d=1e-200
            delta=v/d
            corr=sum(1/(z-w) for h,w in enumerate(zs) if h!=k and z!=w)
            den=1-delta*corr
            if abs(den)>1e-200:delta/=den
            nxt.append(z-delta);err=max(err,abs(delta))
        zs=nxt
        if err<1e-12:break
    residual=max(abs(ev(z)[0])/sum(abs(c)*abs(z)**k for k,c in enumerate(a)) for z in zs)
    return [z*scale for z in zs],residual

def main():
    start=time.monotonic();worst={};fails={};count=0;unreliable=[]
    bound=int(sys.argv[1]) if len(sys.argv)>1 else 20
    for path,(a,b,p) in generate(bound):
        d=a+b-1
        for axis in range(3):
            for fixed in range(d+1):
                row=[p.get((k,fixed) if axis==0 else (fixed,k) if axis==1 else (k,fixed-k),0) for k in range(d+1)]
                row,m=strip(row)
                if len(row)<2:continue
                zs,res=roots(row);count+=1
                if res>1e-7:unreliable.append([path,axis,fixed,res]);continue
                z=max(zs,key=lambda z:z.real/abs(z));ratio=-z.real/abs(z)
                rec=dict(path=path,a=a,b=b,axis=axis,fixed=fixed,coefficients=row,removed_one_plus_x=m,root=[z.real,z.imag],sector_cosine=ratio,relative_residual=res)
                if str(axis) not in worst or ratio<worst[str(axis)]['sector_cosine']:worst[str(axis)]=rec
                if ratio<.5-1e-6 and str(axis) not in fails:fails[str(axis)]=rec
        result=dict(status='floating point experiment; roots and sector membership uncertified',bound=bound,rows=count,first_failures=fails,worst=worst,unreliable=unreliable,seconds=time.monotonic()-start)
        pathlib.Path('evidence/markov-f93ee68f/sector-probe.json').write_text(json.dumps(result,indent=2)+'\n')
        if time.monotonic()-start>45:break
    print(json.dumps(result),flush=True)
if __name__=='__main__':main()
