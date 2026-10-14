"""Machine-authored exact symbolic probe, reproduces interior-probe.json."""
import json,pathlib,time
from lower_symbolic_26ca import formula,power,shift,add,scale,mul
start=time.monotonic(); out=[]
ps={s:formula(s) for s in range(1,9)}
for s in range(1,7):
    for name,di,dj,li,lj in [('H',1,0,s,2*s+4),('V',0,1,s+2,2*s+2)]:
        g=add(power(shift(ps[s+1],li+di,lj+dj),2),
              scale(mul(shift(ps[s],li,lj),shift(ps[s+2],li+2*di,lj+2*dj)),-1))
        out.append(dict(s=s,direction=name,terms=len(g),negative=sum(v<0 for v in g.values()),
                        first_negative=[(k,str(v)) for k,v in g.items() if v<0][:2]))
r=dict(status='finite exact symbolic experiment only',results=out,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-3979f3c7/interior-probe-reproduced.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r))
