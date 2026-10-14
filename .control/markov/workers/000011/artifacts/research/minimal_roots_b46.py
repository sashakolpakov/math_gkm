"""Machine-authored denominator-ordered exact Sturm exploration."""
import pathlib,sys,json,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import generate
namespace={}
exec(pathlib.Path('research/horizontal_roots_b46.py').read_text().split('start=time.monotonic()')[0],namespace)
realrooted=namespace['realrooted']
start=time.monotonic(); tested=0; first=None
for path,(a,b,p) in sorted(generate(18),key=lambda x:(x[1][1],x[1][0])):
 for j in range(a+b):
  row=[p.get((i,j),0) for i in range(a+b)]
  ok,detail=realrooted(row);tested+=1
  if not ok:
   first=dict(path=path,a=a,b=b,j=j,coefficients=row,sturm=detail);break
 if first:break
res=dict(rows=tested,first=first,seconds=time.monotonic()-start,status='finite exact Sturm evidence only')
pathlib.Path('evidence/markov-b46c0efc/minimal-horizontal-roots.json').write_text(json.dumps(res,indent=2));print(json.dumps(res))
