"""Machine-authored exact aggregate experiments; not proofs."""
import itertools,math,json,pathlib,time
from collections import defaultdict
out=pathlib.Path('evidence/markov-a3c53fa7')
def add(*ps):
 d=defaultdict(int)
 for p in ps:
  for k,c in p.items():d[k]+=c
 return dict(d)
def shift(p,x,y):return {(i+x,j+y):c for (i,j),c in p.items()}
def poly(w):
 f=g={(0,0):1}
 for r in reversed(w):
  h=add(shift(f,0,1),shift(g,1,0))
  f,g=(add(h,f),h) if r else (h,add(h,g))
 return add(shift(f,0,1),shift(g,1,0))
def core(a,b):
 w=[r for k in range(b) for r in ([False,True] if a*k//b<a*(k+1)//b else [False])]
 return w[1:-1]
def failures(p):
 bad=[]
 for (i,j),c in p.items():
  for d in [(1,0),(0,1),(1,-1)]:
   x,y=d; m=p.get((i+x,j+y),0);h=p.get((i+2*x,j+2*y),0)
   if m*m<c*h:bad.append([i,j,list(d),[c,m,h]])
 return bad
def main():
 start=time.monotonic();first={};counts={}
 for n in range(13):
  ct=0
  for w in itertools.product([False,True],repeat=n):
   p=poly(w);bs=failures(p);ct+=bool(bs)
   for b in bs:first.setdefault(str(b[2]),{'word':w,'failure':b})
  counts[n]=ct
  if len(first)==3:break
 result={'first_arbitrary_word_failures':first,'failing_words_by_length':counts,'seconds':time.monotonic()-start,'status':'finite experiment, arbitrary words are not all source words'}
 (out/'arbitrary-words.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
if __name__=='__main__':main()
