"""Machine-authored independent exact source recurrence and word comparisons."""
from pathlib import Path
import sys,json,time
from math import gcd,comb
sys.path.insert(0,str(Path('/Users/sasha/math_gkm/evidence/markov')))
from scan import generate
from experiment_terminal_263d8c71 import pair
from probe_bottom_gap_aa6c518b import G
O=Path('/Users/sasha/math_gkm/evidence/markov-aa6c518b')
def main():
 start=time.monotonic();fails=[];counts={'fractions':0,'word_identity':0,'vertex_identity':0,'bottom_inequalities':0,'zeros':0,'scaled_identities':0}
 for path,(a,b,p) in generate(35):
  w=tuple((r+1)*a//b-r*a//b for r in range(b))
  q=pair(w)[1];counts['word_identity']+=1
  if p!=q:fails.append(['word',a,b])
  s=2*max(2*a-b,0)
  for i in range(a+b+3):
   cs=[p.get((i,j),0) for j in range(3)]
   counts['bottom_inequalities']+=1;counts['zeros']+=int(0 in cs)
   if cs[1]**2<cs[0]*cs[2]:fails.append(['bottom',a,b,i,cs])
   if b>=5 and a<=i and i+2<=a+b-1:
    k=i-a;l=b-1-k;N=k+l
    T=(l-1)*(3*a-1)+k*(a+k+l)
    J=4*s*(l-2)*(l-3)*(l-4)+(k+1)*((9*(a-1)**2+13*(a-1)+6)*(l-2)*(l-3)+(6*(a-1)**2+6*(a-1)*(k+l-1)+8*(a-1)+6*(k+l-1)+6)*k*(l-2)+(a+k+l)*(a+k+l-1)*k*(k-1))
    tests=[cs[0]==comb(N,k),N*(N-1)*cs[1]==comb(N,k)*l*T,2*N*(N-1)*(N-2)*(N-3)*(k+1)*cs[2]==comb(N,k)*l*(l-1)*J]
    counts['scaled_identities']+=len(tests)
    if not all(tests):fails.append(['scaled',a,b,i,tests])
  if b>=5:
   counts['vertex_identity']+=1
   if 2*p.get((a,2),0)!=8*max(2*a-b,0)*(b-5)+9*a*a-5*a+2:fails.append(['vertex',a,b])
  counts['fractions']+=1
 out=dict(status='Finite exact checks, not universal proof',bound=35,counts=counts,failures=fails,seconds=time.monotonic()-start)
 (O/'bottom-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
