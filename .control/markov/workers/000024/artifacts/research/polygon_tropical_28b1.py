"""Machine-authored exact tropical support experiment, not a proof."""
import pathlib,json,time,math,itertools,sys
out=pathlib.Path('evidence/markov-28b112de');start=time.monotonic()
bound=int(sys.argv[1]) if len(sys.argv)>1 else 18
counts=[];exceptions=[];supported=[]
for b in range(2,bound+1):
 checked=good=0
 for a in range(1,b):
  if math.gcd(a,b)!=1:continue
  canonical=''.join('B' if a*(i+1)//b>a*i//b else 'A' for i in range(b))
  for positions in itertools.combinations(range(1,b-1),a-1):
   ss=set(positions);w=''.join('B' if i in ss or i==b-1 else 'A' for i in range(b))
   p,q=0,10**9
   for c in w:
    p,q=min(p+a,q+a+b),min(p+(a if c=='B' else 0),q+(b if c=='B' else 0))
   checked+=1
   if q>=a*b:
    good+=1
    if w!=canonical:exceptions.append(dict(a=a,b=b,word=w,canonical=canonical,weight=q))
   elif w==canonical:exceptions.append(dict(a=a,b=b,word=w,weight=q,kind='canonical rejected'))
 counts.append(dict(b=b,checked=checked,supported=good,expected=sum(math.gcd(a,b)==1 for a in range(1,b))))
 (out/'polygon-tropical-progress.json').write_text(json.dumps(dict(counts=counts,exceptions=exceptions,seconds=time.monotonic()-start)))
res=dict(status='finite exact experiment only; tropical weights compute minimum b*i+a*j in a positive matrix entry',bound=bound,counts=counts,exceptions=exceptions,seconds=time.monotonic()-start)
(out/f'polygon-tropical-{bound}.json').write_text(json.dumps(res,indent=2)+'\n');print(json.dumps(res))
