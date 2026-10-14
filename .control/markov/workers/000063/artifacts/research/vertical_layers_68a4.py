"""Machine-authored exact truncated y-series; low coefficients unchanged."""
from pathlib import Path
import json,time
O=Path('evidence/markov-68a44d34')
def add(*ps):
 q={}
 for p in ps:
  for k,v in p.items():q[k]=q.get(k,0)+v
 return q
def shift(p,s=0,d=0,j=0):return {(a+s,b+d,k+j):v for (a,b,k),v in p.items() if a+s<=10 and k+j<=6}
def smooth(p):return add(p,shift(p,j=1))
def layer(w):
 W={(0,0,0):1};H={(0,1,0):1,(0,1,1):1};Z={(0,1,0):1}
 for r in w:
  if r:
   C=shift(smooth(H),s=1,d=1)
   W,H,Z=add(W,C),add(shift(H,d=1,j=1),shift(smooth(Z),d=1),shift(smooth(C),d=1)),add(shift(Z,d=1),shift(C,d=1))
  else:
   C=shift(H,s=1)
   W,H,Z=add(W,C),add(W,shift(smooth(C),d=1)),add(W,shift(C,d=1))
 return W
def main():
 start=time.monotonic();tests=0;inputs=[];fail=None
 for p in range(1,101):
  w=(1,)*p+(0,)+(1,)*(p+1);a,b=2*p+1,2*p+3
  F=layer(w)
  for (s,d,j),v in F.items():
   if s+2>10 or j+2>6 or s+2>b-1:continue
   i=a+s-j
   if i<0 or any(b*i+a*(j+k)<a*b for k in range(3)):continue
   vals=[F.get((s+k,d,j+k),0) for k in range(3)];tests+=1
   if vals[1]**2<vals[0]*vals[2]:
    raw=[sum(v for (ss,dd,jj),v in F.items() if ss==s+k and jj==j+k) for k in range(3)]
    fail=dict(p=p,a=a,b=b,s=s,d=d,j=j,i=i,coefficients=vals,gap=vals[1]**2-vals[0]*vals[2],raw=raw,raw_gap=raw[1]**2-raw[0]*raw[2]);break
  inputs.append(p)
  if len(inputs)%10==0 or fail:
   rec=dict(status='finite exact truncation: cuts<=10, y exponent<=6',inputs=inputs,tests=tests,failure=fail,seconds=time.monotonic()-start)
   (O/'vertical-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(inputs=len(inputs),tests=tests,failure=fail,seconds=rec['seconds'])),flush=True)
  if fail or time.monotonic()-start>90:break
 rec=dict(status='finite exact experiment; not universal',inputs=inputs,tests=tests,failure=fail,seconds=time.monotonic()-start)
 (O/'vertical-source.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(dict(inputs=len(inputs),tests=tests,failure=fail,seconds=rec['seconds'])),flush=True)
if __name__=='__main__':main()
