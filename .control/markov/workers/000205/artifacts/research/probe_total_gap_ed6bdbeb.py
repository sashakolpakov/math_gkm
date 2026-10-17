"""Machine-authored finite diagnostics of full mixed gaps, not a proof."""
from math import comb
from functools import lru_cache
from fractions import Fraction
from pathlib import Path
import json,time,hashlib
O=Path('evidence/markov-ed6bdbeb'); start=time.monotonic()
@lru_cache(None)
def D(i,j,k):
 if k<0:return 0
 return sum((1 if s==0 else 4*s)*comb(j-s+i,i)*comb(k-s+i-3,i-3) for s in range(min(j,k)+1))
@lru_cache(None)
def E(q,r,i,j):
 B=3*q+(1 if r else 2);J=j-q-1;K=B-q-i-j
 if min(J,K)<0:return 0
 return 4*sum((3*s+(2 if r else 1))*comb(J-s+i-1,i-1)*comb(K-s+i-2,i-2) for s in range(min(J,K)+1))
out=dict(status='Finite experimental inequalities, not universal theorems.',q_max=65,directions={})
for direction in ['vertical','diagonal']:
 rec=dict(checked=0,mixed_negative=0,failures={k:[] for k in ['base_absorbs_mixed','base_absorbs_unsigned','correction_lc','total_lc']});minimum=None;argmin=None
 for q in range(1,66):
  for r in (False,True):
   B=3*q+(1 if r else 2)
   for i in range(3,q+5):
    for j in range(max(0,q-2),2*q+4):
     pts=[(i,j),(i,j+1),(i,j+2)] if direction=='vertical' else [(i,j+2),(i+1,j+1),(i+2,j)]
     if not all(3*B<=B*ii+3*jj and ii+jj<=B+2 for ii,jj in pts):continue
     d=[D(ii,jj,B+2-ii-jj) for ii,jj in pts];e=[E(q,r,ii,jj) for ii,jj in pts]
     dg=d[1]**2-d[0]*d[2];eg=e[1]**2-e[0]*e[2];mx=2*d[1]*e[1]-d[0]*e[2]-d[2]*e[0]
     rec['checked']+=1
     if mx<0:
      rec['mixed_negative']+=1
      ratio=Fraction(dg,-mx)
      if minimum is None or ratio<minimum:minimum=ratio;argmin=[q,r,i,j,d,e]
     for key,val in [('base_absorbs_mixed',dg+mx),('base_absorbs_unsigned',dg-d[0]*e[2]-d[2]*e[0]),('correction_lc',eg),('total_lc',dg+mx+eg)]:
      if val<0 and len(rec['failures'][key])<8:rec['failures'][key].append(dict(q=q,r=r,i=i,j=j,base=d,correction=e,gap=val))
  if q%10==0:D.cache_clear();E.cache_clear()
 rec['minimum_base_over_negative_mixed']=str(minimum);rec['minimum_witness']=argmin;out['directions'][direction]=rec
out['seconds']=time.monotonic()-start;out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
(O/'total-gap-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
