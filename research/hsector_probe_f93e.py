"""Machine-authored horizontal sector probe; numerical evidence only."""
import json,pathlib,time,random,sys,itertools
from sector_probe_f93e import strip, roots, generate
from balanced_f80 import A,B,mm

def main():
    mode=sys.argv[1];start=time.monotonic();count=0;objects=0;worst=None;fails=[];bad=[]
    if mode=='source':
        items=((dict(path=path,a=a,b=b),p) for path,(a,b,p) in generate(45))
    else:
        rng=random.Random(93)
        words=['A'+''.join(w)+'B' for n in range(9) for w in itertools.product('AB',repeat=n)]
        words+=['A'+''.join(rng.choice('AB') for _ in range(rng.randrange(10,50)))+'B' for _ in range(500)]
        def make():
            for w in words:
                m=A
                for c in w[1:]:m=mm(m,B if c=='B' else A)
                yield dict(word=w),m[1]
        items=make()
    for info,p in items:
        objects+=1;d=max(i+j for i,j in p)
        for j in range(d+1):
            row,m=strip([p.get((i,j),0) for i in range(d+1)])
            if len(row)<2:continue
            zs,res=roots(row);count+=1
            if res>1e-7:bad.append(dict(**info,j=j,residual=res));continue
            z=max(zs,key=lambda z:z.real/abs(z));ratio=-z.real/abs(z)
            rec=dict(**info,j=j,coefficients=row,removed_one_plus_x=m,root=[z.real,z.imag],sector_cosine=ratio,residual=res)
            if worst is None or ratio<worst['sector_cosine']:worst=rec
            if ratio<.5-1e-6:fails.append(rec)
        result=dict(status='floating point experiment, not proof',mode=mode,objects=objects,rows=count,worst=worst,failures=fails[:4],unreliable=bad[:10],seconds=time.monotonic()-start)
        pathlib.Path(f'evidence/markov-f93ee68f/hsector-{mode}.json').write_text(json.dumps(result,indent=2)+'\n')
        if fails or time.monotonic()-start>50:break
    print(json.dumps(result),flush=True)
if __name__=='__main__':main()
