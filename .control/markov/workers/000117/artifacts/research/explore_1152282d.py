"""Machine-authored exact source chamber exploration; experiments are not proofs."""
from pathlib import Path
import json,time
import third_seed_ead8a96f as z
sp=z.sp
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-1152282d'
x,y=z.a,z.b
charts=[]
for i,j in [(0,4),(1,1),(2,0)]:
 T=x+i+1;L=3*T+y+j
 charts.append(('low',i,j,[L,T,0,0,0]))
for i,j in [(0,4),(1,2),(2,1),(3,0)]:
 X=x+i;Y=y+j
 charts.append(('midlow',i,j,[3*X+2*Y,X+Y,0,Y,0]))
 charts.append(('midhigh',i,j,[3*X+2*Y,2*X+Y,X,X+Y,0]))
for i,j in [(1,4),(2,1),(3,0)]:
 X=x+i;Y=y+j
 charts.append(('high',i,j,[3*X+Y,2*X+Y,X+Y,X,Y]))
def coeffs(p):
 return [sp.P({k[:5]+(0,):v for k,v in p.items() if k[5]==j}) for j in range(max(k[5] for k in p)+1)]
def main():
 t=time.monotonic();out=[]
 for q in range(1,5):
  cs=coeffs(z.seed(q))
  for name,i,j,vs in charts:
   vals=[c.subst(vs+[0]) for c in cs]
   gaps=[vals[k]**2-vals[k-1]*vals[k+1] for k in range(1,len(cs)-1)]
   d=dict(q=q,chamber=[name,i,j],negative_coefficients=[k for k,c in enumerate(vals) if any(v<0 for v in c.values())],negative_gaps=[k+1 for k,c in enumerate(gaps) if any(v<0 for v in c.values())],strict_coefficients=[k for k,c in enumerate(vals) if c.get((0,)*6,0)>0 and all(v>=0 for v in c.values())],max_terms=max(map(len,gaps)))
   out.append(d)
  print(q,'bad charts',[(d['chamber'],d['negative_gaps']) for d in out if d['q']==q and d['negative_gaps']],flush=True)
 (O/'fixed-run-charts.json').write_text(json.dumps(dict(status='Exact symbolic exploration only',seconds=time.monotonic()-t,charts=out),indent=2)+'\n')
if __name__=='__main__':main()
