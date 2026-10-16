"""Machine-authored exact finite tests; these do not establish any theorem.
All coefficients are ordinary integer coefficients and all tested zeros remain.
"""
from pathlib import Path
from math import comb,gcd
import json,sys,time,random
sys.path.insert(0,'evidence/markov')
from scan import initial,child,polygon
O=Path('evidence/markov-f1e4fe3b')
def add(*ps):
 out={}
 for p in ps:
  for k,v in p.items():out[k]=out.get(k,0)+v
 return {k:v for k,v in out.items() if v}
def raw(a,b,axis=None,bound=None):
 def sh(p,x=0,y=0):
  return {(i+x,j+y):v for (i,j),v in p.items() if axis is None or (i+x if axis==0 else j+y)<=bound}
 q,p={(0,0):1},{}
 word=[(k+1)*a//b-k*a//b for k in range(b)]
 for z in word:
  q,p=sh(add(q,sh(p,1)),y=1),add(q,p,sh(p,1))
  if z:
   rr=add(q,sh(p,1));q,p=add(q,sh(rr,y=1)),rr
 return p
def sources(bound):
 stack=[('',initial)]
 while stack:
  path,f=stack.pop();yield path,f[1]
  if f[1][1]+f[2][1]<=bound:stack.append((path+'R',child(f,True)))
  if f[0][1]+f[1][1]<=bound:stack.append((path+'L',child(f,False)))
def hguard(a,b,i,j):
 lo=max(a-j,0);hi=a+j;w=hi-lo
 return 2*j+1<=b and hi+w*w<=i and i+2+w*w<=b-2*j-1+lo
def vguard(a,b,i,j,c):
 lo=max(b-c*i,0);hi=b+i;w=hi-lo
 return 2*i+1<=a and b<=c*a and hi+w*w<=j and j+2+w*w<=a-2*i-1+lo
def main():
 start=time.monotonic();out={'status':'Finite exact experiment, not proof','source_comparisons':0,'source_coefficient_comparisons':0,'cases':[],'failures':[]}
 for path,(a,b,p) in sources(24):
  pp=raw(a,b);assert pp==p,(a,b)
  out['source_comparisons']+=1;out['source_coefficient_comparisons']+=(a+b+1)*(a+b+2)//2
 specs=[('horizontal',50,251,5),('horizontal',101,401,6),('vertical',321,641,4),('vertical',501,751,5),('diagonal',79,101,8),('diagonal',123,151,9),('diagonal',149,173,10)]
 for direction,a,b,r in specs:
  assert gcd(a,b)==1
  p=raw(a,b,1 if direction=='horizontal' else 0 if direction=='vertical' else None,r)
  data={'direction':direction,'a':a,'b':b,'row_or_depth':r,'tested':0,'zeros':0,'new_relative_to_MF25':0,'examples':[]}
  for k in range(a+b+2):
   if direction=='horizontal':
    i,j=k,r;guard=hguard(a,b,i,j);pts=[(i+t,j) for t in range(3)]
    residual=a>=2 and j>=5 and i+j+4<=a+b-1
   elif direction=='vertical':
    i,j=r,k;c=(b+a-1)//a;guard=vguard(a,b,i,j,c);pts=[(i,j+t) for t in range(3)]
    residual=a>=2 and i>=4 and j>=3 and i+j+4<=a+b-1
   else:
    i=k;j=a+b-1-r-i-2;guard=i>=r+r*r and j>=r+r*r
    pts=[(i,j+2),(i+1,j+1),(i+2,j)]
    residual=a>=2 and i+j+8<=a+b-1 and a+5<=i+j+2 and a+2<=b
   if not guard:continue
   values=[p.get(pt,0) for pt in pts]
   assert all(polygon(a,b,*pt) for pt in pts),(a,b,pts)
   gap=values[1]**2-values[0]*values[2]
   data['tested']+=1;data['zeros']+=int(0 in values);data['new_relative_to_MF25']+=int(residual)
   if gap<0:out['failures'].append([direction,a,b,pts,values])
   if len(data['examples'])<2:data['examples'].append({'points':pts,'values':values,'gap':gap})
  out['cases'].append(data)
  (O/'interior-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 rng=random.Random(136);checks=0;zero=0;nonlc=0
 for d in range(11):
  for _ in range(30):
   seed=[rng.randrange(20) if rng.randrange(3) else 0 for _ in range(d+1)]
   nonlc+=int(any(seed[i+1]**2<seed[i]*seed[i+2] for i in range(d-1)))
   n=2*d*d+d+2+rng.randrange(12)
   for k in range(d+d*d,n-d*d-1):
    values=[sum(c*comb(n,k+t-r) for r,c in enumerate(seed)) for t in range(3)]
    checks+=1;zero+=int(0 in values)
    assert values[0]*values[2]<=values[1]**2,(d,n,k,seed)
 out['generic']={'seeds':330,'non_logconcave_seeds':nonlc,'triples':checks,'zero_triples':zero,'seed':136}
 out['outside_region_obstruction']={'seed':[1,0,100],'binomial_exponent':2,'triple':[1,2,101],'gap':-97,'meaning':'Auxiliary mixture outside sufficient region; not source-family refutation.'}
 out['seconds']=time.monotonic()-start
 (O/'interior-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({**{k:v for k,v in out.items() if k!='cases'},'cases':[{k:v for k,v in c.items() if k!='examples'} for c in out['cases']]}))
if __name__=='__main__':main()
