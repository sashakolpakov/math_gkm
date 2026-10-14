"""Machine-authored exact tests of enlarging the source matrix-word family.
Palindromic interiors and cyclic balance are tested as proposed invariants.
No finite scan or non-source witness resolves the pinned root.
"""
import itertools,json,pathlib,sys,time
sys.path.insert(0,str(pathlib.Path('research').resolve()))
from residual_16cb import add,mul,one,x,y,check,initial,child
A=(one,one,x,add(x,y)); B=(add(one,y),one,x,x)
def mm(a,b):
 return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j])) for i in range(2) for j in range(2))
def product(w):
 m=(one,{}, {},one)
 for c in w: m=mm(m,A if c=='A' else B)
 return m
def cyclic_balanced(w):
 for n in range(1,len(w)):
  counts=[(w+w)[i:i+n].count('B') for i in range(len(w))]
  if max(counts)-min(counts)>1:return False
 return True
def main():
 start=time.monotonic(); first=[]; trace_fails=[]; total=0; balanced=0; balanced_fails=[]
 for length in range(2,19):
  k=length-2
  for half in itertools.product('AB',repeat=(k+1)//2):
   h=''.join(half); core=h+(h[:-1] if k%2 else h)[::-1]; w='A'+core+'B'
   m=product(w); p=m[1]; total+=1
   eq=add(m[0],m[3])==mul(add(add(one,x),y),p)
   if not eq and len(trace_fails)<3: trace_fails.append(w)
   fs=check(p); bal=cyclic_balanced(w); balanced+=bal
   if fs and len(first)<8:first.append(dict(word=w,balanced=bal,failures=fs[:3]))
   if fs and bal:balanced_fails.append(dict(word=w,failures=fs[:3]))
 out=dict(status='finite exact experiment only; enlarged-family failures are not source witnesses',
  max_length=18,words=total,trace_relation_failures=trace_fails,
  first_lc_failures=first,cyclic_balanced_count=balanced,
  cyclic_balanced_failures=balanced_fails,seconds=time.monotonic()-start)
 target=pathlib.Path('evidence/markov-774eaadc/word-invariants.json')
 target.write_text(json.dumps(out,indent=2)+'\n'); print(json.dumps(out))
if __name__=='__main__':main()
