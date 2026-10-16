"""Machine-authored exact source-weighted slack tests. No universal inference."""
from pathlib import Path
from math import comb
from fractions import Fraction
import json,time,hashlib
from experiment_ac3d4ab9 import sources,divbin,raw,region
from experiment_37bf1d20 import sharp,probe
from experiment_interior_f1e4fe3b import hguard,vguard
from scan import polygon
O=Path('evidence/markov-55306a3b')
def main():
 t=time.monotonic();out={'status':'exact finite experiments only','bound':35,'sources':0,'rows':0,'triples':0,'zeros':0,'residual':0,'support_center_pass':0,'residual_support_center_pass':0,'optimized_integer_pass':0,'residual_integer_pass':0,'raw_failures':[],'first_center_failures':{},'first_integer_failures':{},'new_examples':[]}
 for path,(a,b,p) in sources(35):
  assert p==raw(a,b);out['sources']+=1;d=a+b-1
  for axis in range(3):
   lim=(b-1)//2 if axis==0 else (a-1)//2 if axis==1 else d//2
   for r in range(lim+1):
    if axis==0:n=b-2*r-1;row=[p.get((k,r),0) for k in range(d-r+1)];lo=a-a*r//b;hi=a+r
    elif axis==1:n=a-2*r-1;row=[p.get((r,k),0) for k in range(d-r+1)];lo=b-b*r//a;hi=b+r
    else:n=d-2*r;row=[p.get((k,d-r-k),0) for k in range(d-r+1)];lo=0;hi=r
    seed=divbin(row,n);H=n+2;out['rows']+=1
    for k in range(-2,len(row)+1):
     vals,F,(W,U,V)=probe(seed,n,k);out['triples']+=1;out['zeros']+=int(0 in vals)
     assert F>=0
     if axis==0:i,j=k,r;pts=[(i+z,j) for z in range(3)];res=a>=2 and j>=5 and i+j+4<=d and not hguard(a,b,i,j)
     elif axis==1:i,j=r,k;pts=[(i,j+z) for z in range(3)];res=a>=2 and i>=4 and j>=3 and i+j+4<=d and not vguard(a,b,i,j,(b+a-1)//a)
     else:i=k;j=d-r-k-2;pts=[(i,j+2),(i+1,j+1),(i+2,j)];res=a>=2 and r>=6 and a+5<=d-r and a+2<=b and not(i>=r+r*r and j>=r+r*r)
     res=res and all(polygon(a,b,*pt) for pt in pts) and not(region(n,k,lo,hi) or region(n,k,lo,hi,True) or sharp(n,k,lo,hi))
     out['residual']+=int(res)
     A=k-hi+2;B=k-lo+2;C=A+B
     S=(A+B)*U-A*B*W-V;D=H*(C-1)**2-4*(H-1)*A*B
     L=4*(H-1)*(C*U-V)-H*(C-1)**2*W
     assert L==4*(H-1)*S-D*W
     assert 4*(H-1)*F==(2*(H-1)*U-H*(C-1)*W)**2+H*W*L
     if L>=0:out['support_center_pass']+=1;out['residual_support_center_pass']+=int(res)
     if W:
      center=Fraction(H*W+2*(H-1)*U,H*W);c0=center.numerator//center.denominator
      scores=[(4*(H-1)*(c*U-V)-H*(c-1)**2*W,c) for c in [c0,c0+1]]
      best,bc=max(scores)
     else:best,bc=0,0
     if best>=0:out['optimized_integer_pass']+=1;out['residual_integer_pass']+=int(res)
     data={'a':a,'b':b,'path':path,'axis':axis,'row_or_depth':r,'k':k,'n':n,'lo':lo,'hi':hi,'triple':vals,'W':W,'U':U,'V':V,'F':F,'support_center':C,'linear_score':L,'best_integer_center':bc,'best_integer_score':best,'residual':res}
     if res and L<0 and axis not in out['first_center_failures']:out['first_center_failures'][axis]=data
     if res and best<0 and axis not in out['first_integer_failures']:out['first_integer_failures'][axis]=data
     if res and L>=0 and len(out['new_examples'])<9:out['new_examples'].append(data)
  if out['sources']%50==0:
   out['seconds']=time.monotonic()-t;(O/'slack-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-t
 out['bindings']={str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [Path(__file__),Path('research/experiment_37bf1d20.py'),Path('research/experiment_ac3d4ab9.py'),Path('research/experiment_interior_f1e4fe3b.py'),Path('evidence/markov/scan.py')]}
 (O/'slack-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['new_examples','bindings']}))
if __name__=='__main__':main()
