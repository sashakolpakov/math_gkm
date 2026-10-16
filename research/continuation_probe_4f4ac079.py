"""Machine-authored exact experiments. No universal mathematical claim."""
from pathlib import Path
from math import comb
import json,hashlib
from newton_probe_0d346fa7 import C,lower,upper,newton
O=Path('evidence/markov-4f4ac079')
def signed_choose(n,k):
 return C(n,k) if n>=0 else (-1)**k*comb(k-n-1,k)
def continuation(j,d,i):
 return sum(signed_choose(2*d,h)*C(2*i-2-h,i)*
  (C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h)) for h in range(i-1))
def correction(i,d):
 # Coefficient of 4uv / ((1-u-v)^2-4uv).
 # Expand (1-u)^-2(1-v(2+2u-v)/(1-u)^2)^-1.
 # Instead compute denominator recurrence exactly on a finite rectangle.
 a={}
 for x in range(i+1):
  for y in range(d+1):
   a[x,y]=(4 if (x,y)==(1,1) else 0)+2*a.get((x-1,y),0)+2*a.get((x,y-1),0)\
     -a.get((x-2,y),0)-a.get((x,y-2),0)+2*a.get((x-1,y-1),0)
 return a[i,d]
def main():
 out={'status':'finite exact experiments only','continuation_tests':0,'continuation_failures':[],
 'positive_correction_tests':0,'positive_correction_failures':[]}
 for i in range(2,25):
  for d in range(1,13):
   c=correction(i,d)
   for N in range(20):
    lhs=continuation(N+2*d,-d,i)-upper(N,d,i)
    out['continuation_tests']+=1
    if lhs!=(-1)**i*c:out['continuation_failures'].append([i,d,N,lhs,c])
   # Positive coefficient formula by geometric expansion of the denominator:
   # ((1-u-v)^2-4uv)^-1=sum_k (4uv)^k(1-u-v)^(-2k-2).
   p=sum(4**(k+1)*C(i+d-1,2*k+1)*C(i+d-2*k-2,i-k-1)
     for k in range(min(i,d)))
   out['positive_correction_tests']+=1
   if p!=c:out['positive_correction_failures'].append([i,d,p,c])
 out['false_no_correction_example']={'i':2,'N':2,'d':1,
  'continued_lower':continuation(4,-1,2),'actual_upper':upper(2,1,2)}
 out['candidate_identity']='U_i(N,d)=L_i(N+2d,-d)-(-1)^i*[u^i v^d]4uv/((1-u-v)^2-4uv)'
 out['candidate_positive_correction']='sum_{k=0}^{min(i,d)-1}4^(k+1) C(i+d-1,2k+1) C(i+d-2k-2,i-k-1)'
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'continuation-probe.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
