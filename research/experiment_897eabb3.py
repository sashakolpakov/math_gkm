"""Machine-authored exact finite checks. Experiments are not Lean premises."""
from pathlib import Path
from math import gcd
import json,time
from experiment_8833 import source,path_for,backward,polyguard
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-897eabb3'
def run():
 start=time.monotonic();patterns=words=triples=positions=raw_sources=0;fails=[];boundary=[]
 for c in range(2,161):
  for r in range(1,c):
   if gcd(c,r)!=1:continue
   w=[(i+1)*r//c-i*r//c for i in range(c)]
   if 2*r<=c:expected=[min(c-2*r,max(4*r-c,0)),0,0,0]
   elif 3*r<=2*c:expected=[4*r-2*c,2*r-c,2*r-c,0]
   elif 4*r<=3*c:expected=[2*c-2*r,c-r,c-r,0]
   else:expected=[2*r-c,3*r-2*c,3*r-2*c,4*r-3*c]
   masks=[(0,3),(0,1,3),(0,2,3),(0,1,2,3)]
   actual=[sum(all(w[(i+k)%c] for k in mask) for i in range(c)) for mask in masks]
   if actual!=expected:fails.append(dict(kind='counts',c=c,r=r,actual=actual,expected=expected))
   # Independently evaluate the exact scan convention used by Lean.
   scan=[]
   for mask in masks:
    state=[False,bool(w[-2]),bool(w[-1])];v=0
    for b in w:
     window=state+[bool(b)];v+=int(all(window[k] for k in mask));state=window[1:]
    scan.append(v)
   if scan!=actual:fails.append(dict(kind='scan-boundary',c=c,r=r,scan=scan,actual=actual))
   patterns+=4;words+=1
   if 4*r in [c,3*c] or 3*r in [c,2*c] or 2*r==c:boundary.append([c,r,actual])
 for b in range(2,51):
  for a in range(1,b):
   if gcd(a,b)>1 or 2*a>b:continue
   aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   raw_sources+=1
   w=[(k+1)*a//b-k*a//b for k in range(1,b)]
   sl=backward(w,4)
   for j in range(a+5):
    v=raw.get((a+4-j,j),0)
    if sl.get(j,0)!=v:fails.append(dict(kind='raw-extraction',a=a,b=b,j=j))
    positions+=1
   for j in range(a+3):
    i=a+2-j
    if all(polyguard(a,b,*z) for z in [(i,j+2),(i+1,j+1),(i+2,j)]):
     left=raw.get((i,j+2),0)*raw.get((i+2,j),0);right=raw.get((i+1,j+1),0)**2
     if left>right:fails.append(dict(kind='raw-gap',a=a,b=b,i=i,j=j,left=left,right=right))
     triples+=1
 rec=dict(status='Finite exact checks only; no universal conclusion',source_words=words,
   pattern_checks=patterns,word_denominator_bound=160,small_chamber_boundaries=boundary,
   raw_sources=raw_sources,raw_denominator_bound=50,raw_coefficient_positions=positions,
   valid_fourth_lower_triples=triples,zeros_retained=True,failures=fails,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(rec,indent=2)+'\n')
 print(json.dumps(rec));assert not fails
if __name__=='__main__':run()
