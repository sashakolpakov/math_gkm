"""Machine-authored finite exact source and fourth-moment checks; not proofs."""
from pathlib import Path
from math import comb
import json,time,hashlib,random
from three_probe_9e205206 import frame
from source_experiment_55cf20d2 import upper
from exact_integer_experiment_73199834 import scalar,cut
O=Path('/Users/sasha/math_gkm/evidence/markov-97b019af')
def save(name,out,start):
 out.update(seconds=time.monotonic()-start,status='finite exact experiment only',script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
 (O/name).write_text(json.dumps(out,indent=2)+'\n'); print(json.dumps({k:v for k,v in out.items() if k not in ['labels','witness']}),flush=True)
def source():
 start=time.monotonic();out=dict(coefficients=0,zeros=0,rows=0,quadratic_triples=0,beyond_old_linear_and_wedge=0,raw_triples=[0,0,0],failures=[])
 polys=[]
 for q in list(range(1,21))+[28,40,60,100]:
  for residue in [False,True]:
   a,b,p=frame([False]*(q-1)+[True,residue]);polys.append((a,b,p))
   for t in range(q+3):
    j=b+2-t;out['rows']+=1
    for c in range(t+5):
     raw=p.get((c,j),0);out['coefficients']+=1;out['zeros']+=raw==0
     if raw!=upper(b,t,c):out['failures'].append(['template',q,residue,t,c])
    for c in range(5,t-1):
     if 8*(t-c-1)>(c-5)**2:continue
     vals=[p.get((c+k,j),0) for k in range(3)];out['quadratic_triples']+=1
     novel=6*t>b+3*c+4 and 4*t+2>5*c
     out['beyond_old_linear_and_wedge']+=novel
     if novel and 'witness' not in out:out['witness']=dict(q=q,residue=residue,b=b,t=t,c=c,j=j,raw=vals)
     if vals[0]*vals[2]>=vals[1]**2:out['failures'].append(['quadratic',q,residue,t,c,vals])
 rng=random.Random(189)
 polys.extend(frame([bool(rng.randrange(2)) for _ in range(6)]) for _ in range(15))
 polys.extend([(0,1,{(0,0):1}),(1,1,{(1,0):1,(0,1):1})]);seen=set()
 for a,b,p in polys:
  if (a,b) in seen:continue
  seen.add((a,b))
  def inside(i,j):return a*b<=b*i+a*j and i+j<=a+b-1
  for i in range(a+b+1):
   for j in range(a+b+1-i):
    for direction,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
     if all(inside(*z) for z in pts):
      vals=[p.get(z,0) for z in pts];out['raw_triples'][direction]+=1
      if vals[0]*vals[2]>vals[1]**2:out['failures'].append(['raw',a,b,direction,pts,vals])
 out['labels']=sorted(seen);out['fractions']=len(seen);save('source-experiment.json',out,start)
def moment():
 start=time.monotonic();out=dict(cases=0,zero_masses=0,quadratic_groups=0,beyond_old_wedge=0,failures=[])
 for i in [0,1,2,3,5,9,19,49,99]:
  for r in [1,2,5,10,30,100]:
   for d in [max(i+r-2,0),i+2*r+1]:
    a=i+1;H=d+2*i+9
    for m in sorted(set([0,1,2,r,r+1,3*r//2,2*r-2,2*r-1,2*r,2*r+1])):
     base=[comb(i+k,i)*comb(i+m-k,i) for k in range(m+1)]
     density=[comb(i+k,i)*comb(H+k-1,i+3) for k in range(m+1)]
     weights=[density[k]*density[m-k]*cut(r,k)*cut(r,m-k) for k in range(m+1)]
     B=(2*a+1)*(2*a+3);N=m*(2*a+m)*(3*m*(2*a+m)-4*a)
     actualmass=sum(weights);actualfour=sum(w*(2*k-m)**4 for k,w in enumerate(weights))
     basefour=sum(w*(2*k-m)**4 for k,w in enumerate(base))
     out['cases']+=1;out['zero_masses']+=actualmass==0
     if B*basefour!=N*sum(base):out['failures'].append(['base',d,i,r,m])
     if B*actualfour>N*actualmass:out['failures'].append(['bound',d,i,r,m])
     if i>=2 and 2<=m<=2*r and 4*(m-2)<=(i-2)**2 and 6*a+m+8<=2*H:
      out['quadratic_groups']+=1;out['beyond_old_wedge']+=2*m>i+1
      group=sum(w*scalar(a,H,k,m-k) for k,w in enumerate(weights))
      if group<=0:out['failures'].append(['group',d,i,r,m])
 save('fourth-moment-experiment.json',out,start)
if __name__=='__main__':
 import sys
 {'source':source,'moment':moment}[sys.argv[1]]()
