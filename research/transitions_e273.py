"""Machine-authored exact symbolic transition-gap exploration; not source proof."""
from pathlib import Path
import json
src=Path('research/sparse_kernel_e273.py').read_text()
exec(src[src.index('class P(dict):'):src.index('N,c,r,q,x,z=')].replace('(0,)*6','(0,)*3'))
N=P({(1,0,0):1});C=P({(0,1,0):1});R=P({(0,0,1):1})
raw=json.loads(Path('evidence/markov-e27336bc/sparse-kernel.json').read_text())['groups']
groups=[(tuple(map(int,k.strip('()').split(','))),compile(v.replace('^','**'),'<own sparse polynomial>','eval')) for k,v in raw.items()]
def val(jSlope,jConst):
 out=P()
 for (a,b),f in groups:
  slope=jSlope-a;const=jConst-a-b
  # At N>=5, polynomial choose is valid down to difference -3.
  if slope>=0 and 5*slope+const>=-3:
   d=slope*N+const
   out+=eval(f,{'__builtins__':{}},dict(N=N,c=C,r=R,q=P()))*(d+1)*(d+2)*(d+3)
  else:
   assert slope<=0 and 5*slope+const<0,(a,b,jSlope,jConst)
 return out
def sub(p,n,c,r):
 out=P()
 for (i,j,k),v in p.items():out+=v*n**i*c**j*r**k
 return out
rec=[]
for slope,const in [(0,0),(0,1),(0,2),(1,-1),(1,0),(1,1),(1,2)]:
 a,b,c=[val(slope,const+k) for k in range(3)]
 gap=sub(b*b-a*c,N+5,C+R+2,C+1)
 rec.append(dict(start=f'{slope}*n+{const}',valid='n>=5, c>=r+1, r>=1',six_doubled_coefficients=[fmt(p,['n','c','r']) for p in [a,b,c]],nonnegative=all(v>=0 for v in gap.values()),gap_expression=fmt(gap,['t','u','v']),gap_terms=len(gap),negative_terms=[[list(k),v] for k,v in gap.items() if v<0]))
out=dict(status='Exact symbolic candidates; coefficient identification and inequality proofs still require Lean checking',substitution='n=t+5,c=u+v+2,r=u+1',transitions=rec)
Path('evidence/markov-e27336bc/transition-certificates.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps([dict(start=x['start'],terms=x['gap_terms'],nonnegative=x['nonnegative'],negative_terms=x['negative_terms']) for x in rec]))
