"""Machine-authored exact experiments; no experimental result is a proof."""
from pathlib import Path
from math import comb
import json,sys,time
sys.path.insert(0,'research')
from experiment_interior_f1e4fe3b import raw,sources
O=Path('evidence/markov-6e1369de')
class P(dict):
 def __add__(a,b):
  if not isinstance(b,P):b=P({(0,0):b})
  d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  if not isinstance(b,P):b=P({(0,0):b})
  d=P()
  for (i,j),v in a.items():
   for (k,l),w in b.items():d[i+k,j+l]=d.get((i+k,j+l),0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  d=P({(0,0):1})
  for _ in range(n):d=d*a
  return d
def main():
 start=time.monotonic()
 k=P({(1,0):1});r=P({(0,1):1});q=k+2+r
 A=lambda k:(2*k+5)*(k+1)*(k+3)
 B=lambda k:(q+k+3)*(q-k)*(2*k+3)
 gap=B(k)*A(k+1)-B(k+1)*A(k)
 out={'status':'finite exact computation only; symbolic identity must be kernel checked',
      'gap_polynomial':[[i,j,v] for (i,j),v in sorted(gap.items())],
      'sources':0,'formula_checks':0,'triple_checks':0,'zero_triples':0,'source_comparisons':0,'failures':[]}
 assert all(v>0 for v in gap.values())
 print('Gap polynomial:',out['gap_polynomial'],flush=True)
 for path,(a,b,p) in sources(22):
  assert raw(a,b)==p,(a,b)
  out['source_comparisons']+=1
 for q in range(1,91):
  p=raw(2,2*q+1);out['sources']+=1
  D=[]
  for i in range(2*q+5):
   pred=comb(2*i-2,i-2)*(comb(q+i+1,2*i-1)+comb(q+i,2*i-1)) if i>=2 else 0
   actual=p.get((i,q),0)
   assert actual==pred,(q,i,actual,pred)
   D.append(actual);out['formula_checks']+=1
  for i in range(len(D)-2):
   L,M,R=D[i:i+3]
   assert L*R<=M*M,(q,i,L,M,R)
   out['triple_checks']+=1;out['zero_triples']+=int(0 in (L,M,R))
  if q%10==0:(O/'experiment-progress.json').write_text(json.dumps(out,indent=2)+'\n')
 out['seconds']=time.monotonic()-start
 (O/'experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out),flush=True)
if __name__=='__main__':main()
