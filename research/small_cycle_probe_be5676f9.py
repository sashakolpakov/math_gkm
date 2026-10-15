"""Machine-authored exact small-cycle validation, not a proof."""
from pathlib import Path
from itertools import product
import json,time
from experiment_be5676f9 import gauge,mm,jet,local4,fourth_moment
from fourth_probe_01f51d63 import coerce,Y,ypoly,lc4,ser
from experiment_8833 import backward,source,path_for,polyguard
def run():
 t=time.monotonic();checks=raw=triples=0;fail=[];corrections=[]
 for n in range(9):
  table={bits:local4(n,*bits) for bits in product(range(2),repeat=4)}
  for c,r in [(2,1),(3,1),(3,2),(4,1),(4,3)]:
   a=c*n+r;b=c*(n+1)+r;w=[0]*(c-r)+[1]*r
   mat=(coerce(1),coerce(0),coerce(0),coerce(1));p=1
   for q in w:mat=mm(mat,gauge(n,p,q));p=q
   moment=lc4([jet(mat[0]+mat[3],k) for k in range(5)])
   full=[(k+1)*a//b-k*a//b for k in range(b)]
   fs=[ypoly(backward(full[1:],k)) for k in range(5)]
   expected=lc4([fs[0]]+[fs[k]+(1+Y)*fs[k-1] for k in range(1,5)])
   checks+=1
   if moment!=expected:fail.append(['small-trace',n,c,r])
   corrections.append(dict(n=n,c=c,r=r,trace_minus_naive_four_moment=ser(moment-fourth_moment(table,c,r))))
   for j in range(a+3):
    i=a+2-j
    if all(polyguard(a,b,*pt) for pt in [(i,j+2),(i+1,j+1),(i+2,j)]):
     z=[fs[4].get((0,0,k),0) for k in [j,j+1,j+2]];triples+=1
     if z[0]*z[2]>z[1]**2:fail.append(['lc',n,c,r,j])
   if n<=3:
    aa,bb,pol=source(path_for(a,b));assert (aa,bb)==(a,b)
    for j in range(a+5):
     raw+=1
     if fs[4].get((0,0,j),0)!=pol.get((a+4-j,j),0):fail.append(['raw',n,c,r,j])
 d=dict(status='Exact finite checks, not universal proof',checks=checks,raw_positions=raw,valid_triples=triples,corrections=corrections,failures=fail,seconds=time.monotonic()-t)
 Path('evidence/markov-be5676f9/small-cycle-probe.json').write_text(json.dumps(d,indent=2)+'\n')
 print(json.dumps({k:v for k,v in d.items() if k!='corrections'}));assert not fail
if __name__=='__main__':run()
