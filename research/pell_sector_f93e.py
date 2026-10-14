"""Machine-authored targeted sector probe, with exact coefficient data."""
import json,pathlib,time
from sector_probe_f93e import strip,roots
from scan import initial,child

t=time.monotonic();f=initial;records=[]
for a in range(1,41):
    if a>1:f=child(f,True)
    p=f[1][2]
    for j in range(a, min(a+7,2*a)+1):
        original=[p.get((i,j),0) for i in range(2*a+1)]
        row,m=strip(original)
        if len(row)<2:continue
        zs,res=roots(row);z=max(zs,key=lambda z:z.real/abs(z))
        ratio=-z.real/abs(z)
        rec=dict(a=a,b=a+1,path='R'*(a-1),j=j,coefficients=row,removed_one_plus_x=m,root=[z.real,z.imag],sector_cosine=ratio,residual=res,raw_lc=all(original[k]**2>=original[k-1]*original[k+1] for k in range(1,len(original)-1)))
        records.append(rec)
        if ratio<.49 and res<1e-9:
            out=dict(status='numerical sector obstruction only; exact raw row remains LC',first_failure=rec,records=records,seconds=time.monotonic()-t)
            pathlib.Path('evidence/markov-f93ee68f/pell-sector.json').write_text(json.dumps(out,indent=2)+'\n')
            print(json.dumps(out['first_failure']),flush=True);raise SystemExit
    pathlib.Path('evidence/markov-f93ee68f/pell-sector.json').write_text(json.dumps(dict(status='numerical experiment',records=records,seconds=time.monotonic()-t),indent=2)+'\n')
    if time.monotonic()-t>45:break
print(json.dumps(dict(records=len(records),seconds=time.monotonic()-t)),flush=True)
