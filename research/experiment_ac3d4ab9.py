"""Machine-authored exact finite experiments; no theorem is inferred."""
from pathlib import Path
from math import comb,gcd
import sys,json,time,random,hashlib
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources,hguard,vguard
from scan import polygon
O=Path('evidence/markov-ac3d4ab9')
def region(n,k,lo,hi,variance=False):
 if not(lo<=hi<=k and k+2<=n+lo):return False
 w=hi-lo
 return (n+2)*w*w<=4*(k-hi+2)*(n+lo-k) if variance else w*(w-1)*(n+2)<=2*(k-hi+2)*(n+lo-k)
def divbin(p,n):
 p=list(p)
 for _ in range(n):
  q=[p[0]]
  for c in p[1:-1]:q.append(c-q[-1])
  assert p[-1]==q[-1]
  p=q
 return p
def coeffs(p,n,k):
 return [sum(c*comb(n,k+t-r) for r,c in enumerate(p) if 0<=k+t-r<=n) for t in range(3)]
def main():
 start=time.monotonic();rng=random.Random(138)
 out={'status':'exact finite experiments only','comparisons':0,'floor_support_checks':0,'failures':[],'cases':[]}
 for path,(a,b,p) in sources(28):
  assert raw(a,b)==p
  out['comparisons']+=1
  for axis in [0,1]:
   for r in range(((b if axis==0 else a)-1)//2+1):
    n=(b if axis==0 else a)-2*r-1
    row=[p.get((k,r) if axis==0 else (r,k),0) for k in range(a+b-r)]
    q=divbin(row,n)
    lo=(a-a*r//b) if axis==0 else (b-b*r//a)
    hi=(a+r) if axis==0 else (b+r)
    assert all(c==0 for k,c in enumerate(q) if k<lo or hi<k),(a,b,r,axis,lo,hi,q)
    assert all(c>=0 for c in q)
    out['floor_support_checks']+=1
 specs=[('horizontal',50,251,5),('horizontal',101,401,6),('vertical',321,641,4),('vertical',501,751,5),('diagonal',79,101,8),('diagonal',123,151,9),('diagonal',149,173,10),('diagonal',87,89,6)]
 for direction,a,b,r in specs:
  assert gcd(a,b)==1
  p=raw(a,b,1 if direction=='horizontal' else 0 if direction=='vertical' else None,r)
  data={'direction':direction,'a':a,'b':b,'row_or_depth':r,'pair':0,'variance':0,'union':0,'new_vs_MF1E':0,'variance_beyond_pair':0,'zeros':0,'examples':[]}
  for k in range(a+b+2):
   if direction=='horizontal':
    i,j=k,r;n=b-2*r-1;lo=a-a*r//b;hi=a+r
    pts=[(i+t,j) for t in range(3)];old=hguard(a,b,i,j)
    residual=a>=2 and j>=5 and i+j+4<=a+b-1
   elif direction=='vertical':
    i,j=r,k;n=a-2*r-1;lo=b-b*r//a;hi=b+r
    pts=[(i,j+t) for t in range(3)];old=vguard(a,b,i,j,(b+a-1)//a)
    residual=a>=2 and i>=4 and j>=3 and i+j+4<=a+b-1
   else:
    i=k;j=a+b-1-r-i-2;n=a+b-1-2*r;lo=0;hi=r
    pts=[(i,j+2),(i+1,j+1),(i+2,j)];old=i>=r+r*r and j>=r+r*r
    residual=a>=2 and i+j+8<=a+b-1 and a+5<=i+j+2 and a+2<=b
   pair=region(n,k,lo,hi);variance=region(n,k,lo,hi,True)
   if not(pair or variance):continue
   assert all(polygon(a,b,*pt) for pt in pts),(direction,a,b,pts)
   values=[p.get(pt,0) for pt in pts];gap=values[1]**2-values[0]*values[2]
   assert gap>=0,(direction,a,b,pts,values)
   data['pair']+=pair;data['variance']+=variance;data['union']+=1
   data['new_vs_MF1E']+=int(residual and not old)
   data['variance_beyond_pair']+=int(variance and not pair)
   data['zeros']+=int(0 in values)
   if len(data['examples'])<3 and not old:data['examples'].append({'points':pts,'values':values,'gap':gap,'pair':pair,'variance':variance})
  out['cases'].append(data)
  (O/'experiment-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 tests=zeros=nonlc=varonly=0
 for w in range(13):
  for n in range(2,181,3):
   seed=[rng.randrange(10) if rng.randrange(3) else 0 for _ in range(w+1)]
   nonlc+=int(any(seed[k+1]**2<seed[k]*seed[k+2] for k in range(w-1)))
   for k in range(w,n-1):
    pair=region(n,k,0,w);variance=region(n,k,0,w,True)
    if not(pair or variance):continue
    values=coeffs(seed,n,k)
    assert values[0]*values[2]<=values[1]**2,(seed,n,k,values)
    tests+=1;zeros+=int(0 in values);varonly+=int(variance and not pair)
 out['generic']={'triples':tests,'zeros':zeros,'non_lc_seeds':nonlc,'variance_only_triples':varonly,'seed':138}
 out['seconds']=time.monotonic()-start
 out['bindings']={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),Path('research/experiment_interior_f1e4fe3b.py'),Path('evidence/markov/scan.py')]}
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({**{k:v for k,v in out.items() if k!='cases'},'cases':[{k:v for k,v in d.items() if k!='examples'} for d in out['cases']]}))
if __name__=='__main__':main()
