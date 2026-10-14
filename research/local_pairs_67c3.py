"""Machine-authored exact experiments, not proofs. Reproduces saved pair scans."""
import math,json,pathlib,sys
O=pathlib.Path('evidence/markov-67c3f3f5')
def C(n,k): return math.comb(n,k) if 0<=k<=n else 0
def H(a,j,s,q): return C(a-q,s)*C(s+q-1,q)*C(2*s,j-q)
def scan(bound,ds):
 bad={};ct=0
 for a in range(3,bound):
  for j in range(2*a+1):
   for s in range(1,a-1):
    for q in range(min(j,a-s)+1):
     for d in ds:
      if q+d<0:continue
      ct+=1;x=(2*q+d)//2;y=2*q+d-x
      mid=H(a,j,s+1,x)*H(a,j,s+1,y)
      end=H(a,j,s,q)*H(a,j,s+2,q+d)
      if end>mid:bad.setdefault(str(d),[a,j,s,q,end,mid])
 return dict(tests=ct,failures=bad,status='finite exact experiment, not proof')
if __name__=='__main__':
 result=scan(55,[0,1,2,-1,-2])
 print(json.dumps(result));(O/'local-midpoint-rerun.json').write_text(json.dumps(result,indent=2)+'\n')
