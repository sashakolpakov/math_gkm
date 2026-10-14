"""Machine-authored exact algebra envelope probe, not a source proof."""
import json,pathlib,time
def norm(s,N,m,t):
 n=N-1
 A=4*t;B=9*m*m+13*m+6;C=6*m*m+6*m*n+8*m+6*n+6;D=(m+n+2)*(m+n+1)
 return s*(A*(N-s)*(N-s-1)*(N-s-2)+B*(s-1)*(N-s)*(N-s-1)+C*(s-1)*(s-2)*(N-s)+D*(s-1)*(s-2)*(s-3))
start=time.monotonic();tests=0;fail=[]
for N in range(4,61):
 for m in range(N):
  for t in range((2*m if m==N-1 else max(2*m-1,0))+1):
   for s in range(N-1):
    L,M,R=[norm(s+k,N,m,t) for k in range(3)];gap=M*M-L*R;tests+=1
    if gap<0:
     fail.append(dict(N=N,m=m,t=t,s=s,values=[L,M,R],gap=gap));break
   if fail:break
  if fail:break
 if fail:break
r=dict(status='finite exact algebra parameter envelope probe; t need not be realized by any word',tests=tests,first_failure=fail,seconds=time.monotonic()-start)
pathlib.Path('evidence/markov-a27f6d42/second-normal-sharp-probe.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r))
