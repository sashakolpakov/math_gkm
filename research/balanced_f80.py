"""Machine-authored exact balanced-word experiment; not a source counterexample.

Extends only balanced prefixes. Raw generators and all coefficients are exact.
"""
import json,pathlib,sys,time
sys.path.insert(0,str(pathlib.Path('evidence/markov').resolve()))
from scan import add,mul
one={(0,0):1}; u={(1,0):1}; v={(0,1):1}; s=add(add(u,v),one)
A=(v,one,mul(u,v),add(u,one))
B=(mul(v,s),add(u,v),mul(mul(u,v),add(s,one)),mul(u,s))
I=(one,{}, {},one)
def mm(a,b):
 return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j])) for i in range(2) for j in range(2))
def failure(p):
 for di,dj in [(1,0),(0,1),(1,-1)]:
  for i,j in p:
   cs=[p.get((i+k*di,j+k*dj),0) for k in range(3)]
   if cs[1]**2<cs[0]*cs[2]: return dict(direction=[di,dj],start=[i,j],coefficients=cs)
def balanced(w):
 sums=[0]
 for c in w:sums.append(sums[-1]+(c=='B'))
 for n in range(1,len(w)+1):
  vals=[sums[i+n]-sums[i] for i in range(len(w)-n+1)]
  if max(vals)-min(vals)>1:return False
 return True
def main():
 start=time.monotonic(); bound=int(sys.argv[1]) if len(sys.argv)>1 else 15
 out=pathlib.Path('evidence/markov-f80fb8bc');out.mkdir(exist_ok=True)
 stack=[('',I)]; counts={};fails=[]; first={}; totalfails={}
 while stack:
  w,m=stack.pop()
  if w:
   counts[len(w)]=counts.get(len(w),0)+1
   for k,p in enumerate(m):
    f=failure(p)
    if f:
     totalfails[k]=totalfails.get(k,0)+1
     if k not in first or len(w)<len(first[k]['word']):first[k]=dict(word=w,entry=k,**f)
     if len(fails)<30:fails.append(dict(word=w,entry=k,**f))
  if len(w)<bound:
   for c,g in [('B',B),('A',A)]:
    if balanced(w+c):stack.append((w+c,mm(m,g)))
  if sum(counts.values())%100==0:
   (out/'balanced-progress.json').write_text(json.dumps(dict(counts=counts,failures=fails,seconds=time.monotonic()-start)))
 result=dict(status='finite experiment only; balanced family is not the source family',bound=bound,counts=counts,failures=fails,shortest_by_entry=first,total_failures=totalfails,seconds=time.monotonic()-start)
 (out/f'balanced-{bound}.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
if __name__=='__main__':main()
