"""Machine-authored exact Mobius expansion of the local fourth cumulant."""
from fourth_probe_01f51d63 import *
from itertools import product,combinations
def jets(p,q):
 A=Y+q*(Y**2-Y);B=coerce(1);B2=q*(1+Y)**2
 D=1+2*p*Y+q*(1+Y);D2=q*(1+2*p*Y)*(1+Y)**2
 C=Y+2*p*Y**2+q*(-2*Y-2*p*Y**2+2*p*Y**3)
 return A,-Y*B2,B,B2,C,-Y*D2,D,D2
def r123(ms):
 if not ms:return coerce(0),coerce(0),coerce(0)
 A,A2,B,B2,C,C2,D,D2=ms[0];r,s,_=r123(ms[1:])
 return B,B2+A*r-B*D,A*s+A2*r-(B2+A*r)*D+B*(D**2-D2-C*r)
def local(bits):
 ms=[jets(bits[i],bits[i+1]) for i in range(4)]
 A,A2,B,B2,C,C2,D,D2=ms[0];r,s,t=r123(ms[1:])
 g2=D2+C*r;g3=C*s+C2*r;g4=C*t+C2*s
 return 24*g4-24*D*g3-12*g2**2+24*D**2*g2-6*D**4
def main():
 table={a:local(a) for a in product([0,1],repeat=5)};mob={};canonical={};potential={}
 for k in range(6):
  for S in combinations(range(5),k):
   ans=coerce(0)
   for j in range(k+1):
    for T in combinations(S,j):ans+=(-1)**(k-j)*table[tuple(int(i in T) for i in range(5))]
   if not ans:continue
   mob[S]=ans
   if not S:canonical[()]=ans;continue
   delta=4-max(S);K=tuple(i+delta for i in S)
   canonical[K]=canonical.get(K,coerce(0))+ans
   for d in range(delta):
    T=tuple(i+d for i in S);potential[T]=potential.get(T,coerce(0))+ans
 canonical={k:v for k,v in canonical.items() if v};potential={k:v for k,v in potential.items() if v}
 assert all(not s or min(s)>=1 for s in canonical)
 for bits,value in table.items():
  rhs=sum((v for S,v in canonical.items() if all(bits[i] for i in S)),coerce(0))
  rhs+=sum((v for S,v in potential.items() if all(bits[i] for i in S)),coerce(0))
  rhs-=sum((v for S,v in potential.items() if all(bits[i+1] for i in S)),coerce(0))
  assert rhs==value
 def serstats(d):return [dict(subset=k,coefficient=ser(v)) for k,v in d.items()]
 result=dict(status='Exact polynomial derivation, not yet a Lean cyclic-source counting bridge',mobius=serstats(mob),canonical=serstats(canonical),potential=serstats(potential))
 (OUT/'fourth-local-statistics.json').write_text(json.dumps(result,indent=2)+'\n')
 print(json.dumps(dict(canonical=serstats(canonical),potential_terms=len(potential))))
if __name__=='__main__':main()
