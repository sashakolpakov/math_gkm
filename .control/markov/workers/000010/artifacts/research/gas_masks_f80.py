"""Machine-authored direct ordered-gap enumeration and coefficient check."""
import pathlib,json,time,sys
from math import comb
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import generate
def source_word(path):
 lo,hi='A','B'
 for c in path:
  if c=='L':hi=lo+hi
  else:lo=lo+hi
 return (lo+hi).replace('B','AC')
def records(core):
 m=len(core)
 for mask in range(1<<m):
  gaps=[''];r=0
  for k,c in enumerate(core):
   if mask>>k&1:gaps[-1]+=c;r+=1
   else:gaps.append('')
  if any('A' in g and 'C' in g for g in gaps):continue
  p=sum(bool(g) and g[0]=='A' for g in gaps)
  q=sum(bool(g) and g[0]=='C' for g in gaps)
  e=sum(not g for g in gaps)
  yield r,p,q,e
start=time.monotonic();counts=0;bad=[];masks=0; examples={}
bound=int(sys.argv[1]) if len(sys.argv)>1 else 10
for path,(a,b,P) in generate(bound):
 word=source_word(path);core=word[1:-1]
 assert word[0]=='A' and word[-1]=='C' and len(word)==a+b
 out={};hist={}
 for r,p,q,e in records(core):
  masks+=1
  assert r+p+q+e==a+b-1
  hist[(r,p,q,e)]=hist.get((r,p,q,e),0)+1
  for k in range(e+1):
   ij=(p+k,q+e-k);out[ij]=out.get(ij,0)+comb(e,k)
 counts+=1
 if out!=P:bad.append([a,b,path])
 if (a,b) in [(2,5),(3,5),(5,8)]:examples[f'{a}/{b}']=dict(word=word,core=core,histogram=[list(k)+[v] for k,v in sorted(hist.items())])
res=dict(status='finite exact coefficient identity check, not a log-concavity proof',bound=bound,fractions=counts,admissible_masks=masks,mismatches=bad,examples=examples,seconds=time.monotonic()-start)
pathlib.Path(f'evidence/markov-f80fb8bc/masks-{bound}.json').write_text(json.dumps(res,indent=2));print(json.dumps({k:v for k,v in res.items() if k!='examples'}))
