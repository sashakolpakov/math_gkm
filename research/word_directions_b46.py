"""Machine-authored exact scan; arbitrary words are NOT source witnesses."""
import json,pathlib,sys,time
from balanced_f80 import A,B,mm
start=time.monotonic(); bound=int(sys.argv[1]); out=pathlib.Path('evidence/markov-b46c0efc')
counts={}; first={}; failcounts={}; stack=[('A',A)]; checked=0
while stack:
 w,m=stack.pop()
 if len(w)>=2 and w[-1]=='B':
  p=m[1];checked+=1;counts[len(w)]=counts.get(len(w),0)+1
  for di,dj in [(1,0),(0,1),(1,-1)]:
   key=str((di,dj))
   for i,j in p:
    cs=[p.get((i+k*di,j+k*dj),0) for k in range(3)]
    if cs[1]**2<cs[0]*cs[2]:
     failcounts[key]=failcounts.get(key,0)+1
     if key not in first or len(w)<len(first[key]['word']):
      first[key]=dict(word=w,start=[i,j],coefficients=cs)
     break
 if len(w)<bound:
  stack.extend([(w+'B',mm(m,B)),(w+'A',mm(m,A))])
 if checked%100==0:
  (out/f'word-directions-{bound}-progress.json').write_text(json.dumps(dict(checked=checked,first=first,seconds=time.monotonic()-start)))
result=dict(status='finite arbitrary-word experiment only, not source refutations',bound=bound,counts=counts,checked=checked,failcounts=failcounts,first=first,seconds=time.monotonic()-start)
(out/f'word-directions-{bound}.json').write_text(json.dumps(result,indent=2));print(json.dumps(result))
