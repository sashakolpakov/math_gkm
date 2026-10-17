"""Machine-authored support-aware polynomial experiment; no universal proof."""
from general_jets_probe_80fb7777 import *
start=time.monotonic();data=json.loads((O/'extended-jets.json').read_text());out=[]
for r in [False,True]:
 js=[P({tuple(z):F(v) for z,v in p}) for p in data[str(r)]]
 base=5 if r else 4
 raw={c:short(q,q+3*k+base,c-3)+js[c].ev([q+2*k+base,k,P(),P()]) for c in range(3,12)}
 for c in range(3,10):
  gap=raw[c+1]**2-raw[c]*raw[c+2]
  cut=max(0,(c-base+1)//3)
  tests=[('tail',None,gap.ev([q,k+cut,P(),P()]))]
  tests += [('base',j,gap.ev([q+max(0,c-base-1-3*j),P(j),P(),P()])) for j in range(cut)]
  out.append(dict(r=r,c=c,cut=cut,checks=[dict(kind=kind,k=j,terms=len(p.d),negative=sum(v<0 for v in p.d.values()),constant=str(p.d.get((0,0,0,0),0))) for kind,j,p in tests]))
(O/'polygon-shift-probe.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-start,status='finite symbolic experiment; interpolation identities and all-column positivity still require proof'),indent=2))
print(json.dumps(out))
