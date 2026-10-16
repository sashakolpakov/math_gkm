"""Machine-authored exact finite probes. These are not universal proofs."""
from pathlib import Path
from math import comb
import json,time,random,hashlib
from experiment_ac3d4ab9 import sources,raw,divbin,region
O=Path('evidence/markov-37bf1d20')
def sharp(n,k,lo,hi):
 return (n+2)*(2*k-hi-lo+3)**2 <= 4*(n+1)*(k-hi+2)*(k-lo+2)
def bc(n,k):return comb(n,k) if 0<=k<=n else 0
def probe(seed,n,k):
 H=n+2;D=(n+1)*H
 q=[c*bc(H,k+2-r) for r,c in enumerate(seed)]
 W=sum(q);U=sum(c*(k+2-r) for r,c in enumerate(q));V=sum(c*(k+2-r)**2 for r,c in enumerate(q))
 vals=[sum(c*bc(n,k+t-r) for r,c in enumerate(seed)) for t in range(3)]
 assert [V-U,H*U-V,H*(H-1)*W-(2*H-1)*U+V]==[D*v for v in vals]
 F=U*(H*W-U)-H*(W*V-U*U)
 assert (n+1)*F==D*D*(vals[1]**2-vals[0]*vals[2])
 return vals,F,(W,U,V)
def main():
 start=time.monotonic();rng=random.Random(139)
 out={'status':'exact finite experiment only','source_bound':28,'sources':0,'rows':0,'triples':0,'zeros':0,'outside_overlap':0,'sharp':0,'sharp_beyond_prior':0,'failures':[],'examples':[]}
 for path,(a,b,p) in sources(28):
  assert raw(a,b)==p
  out['sources']+=1;d=a+b-1
  for axis in range(3):
   lim=(b-1)//2 if axis==0 else (a-1)//2 if axis==1 else d//2
   for r in range(lim+1):
    if axis==0:n=b-2*r-1;row=[p.get((k,r),0) for k in range(d-r+1)];lo=a-a*r//b;hi=a+r
    elif axis==1:n=a-2*r-1;row=[p.get((r,k),0) for k in range(d-r+1)];lo=b-b*r//a;hi=b+r
    else:n=d-2*r;row=[p.get((k,d-r-k),0) for k in range(d-r+1)];lo=0;hi=r
    seed=divbin(row,n);assert all(c>=0 for c in seed)
    assert all(c==0 for k,c in enumerate(seed) if k<lo or k>hi)
    out['rows']+=1
    for k in range(-3,len(row)+3):
     vals,F,mom=probe(seed,n,k)
     assert vals==[row[k+t] if 0<=k+t<len(row) else 0 for t in range(3)]
     assert F>=0,(a,b,axis,r,k,vals)
     out['triples']+=1;out['zeros']+=int(0 in vals)
     out['outside_overlap']+=int(not(hi<=k and k+2<=n+lo))
     hs=sharp(n,k,lo,hi);out['sharp']+=hs
     if hs:
      assert vals[0]*vals[2]<=vals[1]**2
      new=not(region(n,k,lo,hi) or region(n,k,lo,hi,True))
      out['sharp_beyond_prior']+=new
      if new and len(out['examples'])<12 and 0 not in vals:
       out['examples'].append({'a':a,'b':b,'axis':axis,'row_or_depth':r,'k':k,'values':vals,'moments':mom,'moment_gap':F})
  (O/'experiment-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 generic={'triples':0,'signed_seeds':0,'zeros':0,'sharp':0,'signed_gap_failures':0}
 for n in range(0,31):
  for degree in range(0,9):
   for signed in [False,True]:
    seed=[rng.randrange(-7 if signed else 0,9) for _ in range(degree+1)]
    generic['signed_seeds']+=int(signed)
    for k in range(-4,n+degree+4):
     vals,F,m=probe(seed,n,k);generic['triples']+=1;generic['zeros']+=int(0 in vals)
     if F<0:generic['signed_gap_failures']+=int(signed)
     if not signed and sharp(n,k,0,degree):
      assert F>=0;generic['sharp']+=1
 out['generic']=generic
 # Actual-source unbounded family is only finitely sampled here.
 out['witness_family']=[]
 for t in [1,2,3]:
  m=6*t*t+2*t-1;a=3*m+1;b=3*m+4;r=6*t;i=18*t*t+3*t-2;j=i;d=a+b-1;n=d-2*r
  assert n+2==r*r and i+j+2+r==d
  assert sharp(n,i,0,r) and not region(n,i,0,r) and not region(n,i,0,r,True)
  assert not(i>=r+r*r and j>=r+r*r)
  p=raw(a,b,None,r)
  vals=[p.get((i,j+2),0),p.get((i+1,j+1),0),p.get((i+2,j),0)]
  assert vals[0]*vals[2]<=vals[1]**2
  out['witness_family'].append({'t':t,'a':a,'b':b,'r':r,'i':i,'j':j,'values':vals})
 out['seconds']=time.monotonic()-start
 out['bindings']={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),Path('research/experiment_ac3d4ab9.py'),Path('research/experiment_interior_f1e4fe3b.py'),Path('evidence/markov/scan.py')]}
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['examples','witness_family']}))
if __name__=='__main__':main()
