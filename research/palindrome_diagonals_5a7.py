"""Machine-authored finite test of a revisable diagonal-only invariant.
Palindrome words are an enlarged family, not automatically source witnesses.
"""
import itertools,json,pathlib,sys,time
sys.path.insert(0,str(pathlib.Path('research').resolve()))
from word_invariants_774 import product,cyclic_balanced
def source_word(a,b):
 lo=(0,1,'A');hi=(1,1,'B');path=''
 while True:
  c,d,w=lo[0]+hi[0],lo[1]+hi[1],lo[2]+hi[2]
  if c*b==a*d:return dict(word=w,path=path,a=c,b=d)
  if c*b<a*d:lo=(c,d,w);path+='R'
  else:hi=(c,d,w);path+='L'
def main():
 start=time.monotonic();count=0;checks=0;failures=[]
 max_len=int(sys.argv[1]) if len(sys.argv)>1 else 24
 for length in range(2,max_len+1):
  k=length-2
  for half in itertools.product('AB',repeat=(k+1)//2):
   h=''.join(half);w='A'+h+(h[:-1] if k%2 else h)[::-1]+'B'
   p=product(w)[1];a=w.count('B');b=len(w);d=a+b-1;count+=1
   for r in range(min(max((i+j for i,j in p),default=0),d//2)+1):
    cs=[p.get((i,r-i),0) for i in range(r+1)]
    for i in range(1,r):
     checks+=1
     if cs[i]**2<cs[i-1]*cs[i+1] and len(failures)<8:
      src=source_word(a,b);sp=product(src['word'])[1]
      failures.append(dict(word=w,a=a,b=b,r=r,i=i,coefficients=cs,
        cyclic_balanced=cyclic_balanced(w),source=src,
        source_coefficients=[sp.get((j,r-j),0) for j in range(r+1)]))
 result=dict(status='finite exact experiment only; quotient slices, not raw root triples',
  max_length=max_len,words=count,triples=checks,first_failures=failures,seconds=time.monotonic()-start)
 p=pathlib.Path(f'evidence/markov-5a7c193a/palindrome-diagonals-{max_len}.json')
 p.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
if __name__=='__main__':main()
