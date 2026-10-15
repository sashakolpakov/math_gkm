"""Machine-authored exact symbolic and numerical research. No proof claims.
Bounded foreground execution; only new request artifacts are written.
"""
from pathlib import Path
from itertools import product
from math import gcd
import json,time
from third_cert_75ad import P
from third_lower_75ad import A,B,matmul
from verify_third_75ad import source,path_for,backward
O=Path('evidence/markov-adb2c7b0')
def trim(a):
 while a and not a[-1]:a.pop()
 return a
def add(a,b):return trim([(a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0) for i in range(max(len(a),len(b)))])
def scale(a,c):return trim([c*x for x in a])
def sub(a,b):return add(a,scale(b,-1))
def mul(a,b):
 c=[0]*(len(a)+len(b)-1) if a and b else []
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]=c[i+j]+x*y
 return trim(c)
def power(a,n):
 c=[1]
 for _ in range(n):c=mul(c,a)
 return c
def sm(*xs):
 out=[]
 for x in xs:out=add(out,x)
 return out
def jets(n,p,q):
 M=A
 for _ in range(n+q):M=matmul(M,B)
 prev={(0,k):2 for k in range(1,n+p+1)}
 curr={(0,k):-2 for k in range(1,n+q+1)}
 G=matmul(matmul([[{(0,0):1},{}],[prev,{(0,0):1}]],M),[[{(0,0):1},{}],[curr,{(0,0):1}]])
 def coeff(i,j,s):
  d={k:v for (u,k),v in G[i][j].items() if u==s}
  return trim([d.get(k,0) for k in range(max(d,default=-1)+1)])
 assert coeff(0,0,0)==[] and coeff(0,1,0)==[] and coeff(1,0,0)==[] and coeff(1,1,0)==[1]
 assert coeff(0,1,1)==[1]
 return dict(a=coeff(0,0,1),b=coeff(0,1,1),c=coeff(1,0,1),d=coeff(1,1,1),
             b2=coeff(0,1,2),c2=coeff(1,0,2),d2=coeff(1,1,2),d3=coeff(1,1,3))
def edge(m,k):
 return sm(scale(power(m['d'],3),2),scale(mul(m['d'],m['d2']),-6),scale(m['d3'],6),
   scale(sm(mul(m['c'],k['b2']),m['c2']),6),scale(mul(m['c'],add(m['d'],k['d'])),-6),scale(mul(m['c'],k['a']),6))
def moment3(f,c,r,q,t,u):
 a=f[0,0,0];p=sub(f[1,0,0],a);qq=sub(f[0,1,0],a);rr=sub(f[0,0,1],a)
 pq=sm(f[1,1,0],scale(f[1,0,0],-1),scale(f[0,1,0],-1),a)
 pr=sm(f[1,0,1],scale(f[1,0,0],-1),scale(f[0,0,1],-1),a)
 qr=sm(f[0,1,1],scale(f[0,1,0],-1),scale(f[0,0,1],-1),a)
 pqr=sm(f[1,1,1],scale(f[1,1,0],-1),scale(f[1,0,1],-1),scale(f[0,1,1],-1),f[1,0,0],f[0,1,0],f[0,0,1],scale(a,-1))
 return sm(scale(a,c),scale(sm(p,qq,rr),r),scale(add(pq,qr),q),scale(pr,t),scale(add(pr,pqr),u))
def moment2(f,c,r,q):
 a=f[0,0]
 return sm(scale(a,c),scale(sm(f[1,0],f[0,1],scale(a,-2)),r),scale(sm(f[1,1],scale(f[1,0],-1),scale(f[0,1],-1),a),q))
def candidate(n,c,r,q,t,u):
 J={(p,z):jets(n,p,z) for p,z in product((0,1),repeat=2)}
 D=moment2({k:m['d'] for k,m in J.items()},c,r,q)
 K=moment2({k:sm(scale(m['d2'],2),scale(m['c'],2),scale(power(m['d'],2),-1)) for k,m in J.items()},c,r,q)
 L=moment3({(p,z,v):edge(J[p,z],J[z,v]) for p,z,v in product((0,1),repeat=3)},c,r,q,t,u)
 h=[1,1]
 return sm(power(D,3),scale(mul(D,K),3),L,scale(mul(h,add(power(D,2),K)),-3),scale(mul(power(h,2),D),6),scale(power(h,3),-6))
def serial(p):
 if isinstance(p,P):return [[list(k),v] for k,v in sorted(p.items())]
 return [] if p==0 else [[[0,0],p]]
def main():
 start=time.monotonic();x=P({(1,0):1});y=P({(0,1):1})
 chambers=[('low',3*(x+1)+y,x+1,0,0,0),
 ('midlow',2*(x+1)+3*(y+1),(x+1)+(y+1),0,x+1,0),
 ('midhigh',3*(x+1)+2*(y+1),2*(x+1)+(y+1),x+1,x+y+2,0),
 ('high',(x+1)+3*(y+1),(x+1)+2*(y+1),x+y+2,y+1,x+1)]
 cert=[]
 for n in range(9):
  for name,c,r,q,t,u in chambers:
   C=candidate(n,c,r,q,t,u);gaps=[]
   for j in range(len(C)-2):
    g=C[j+1]**2-C[j]*C[j+2]
    gaps.append(dict(j=j,polynomial=serial(g),negative_terms=sum(v<0 for _,v in serial(g))))
   cert.append(dict(n=n,chamber=name,coefficients=[serial(z) for z in C],gaps=gaps))
 (O/'run-chamber-symbolic.json').write_text(json.dumps(cert,indent=2)+'\n')
 rawchecks=0;backchecks=0;lowtriples=0;formula_sources=0;small=[];bad=[];maxb=48
 for b in range(2,maxb+1):
  for a in range(1,b):
   if gcd(a,b)!=1:continue
   aa,bb,raw=source(path_for(a,b));assert (aa,bb)==(a,b)
   c=b-a;n=a//c;r=a-n*c
   if c>=4 and r>0:
    C=candidate(n,c,r,max(2*r-c,0),min(c-r,max(3*r-c,0)),max(3*r-2*c,0))
    w=tuple((k+1)*a//b-k*a//b for k in range(1,b))
    Q=backward(w,3)
    for j in range(a+b+2):
     target=C[j] if j<len(C) else 0
     assert 6*Q.get(j,0)==target,(a,b,j,target,Q)
     backchecks+=1
     i=a+3-j
     if i>=0:
      assert 6*raw.get((i,j),0)==target,(a,b,i,j,target,raw.get((i,j),0))
      rawchecks+=1
    formula_sources+=1
   if 2*a<=b:
    for j in range(a+2):
     i=a+1-j;pts=[(i,j+2),(i+1,j+1),(i+2,j)]
     if all(a*b<=b*ii+a*jj and ii+jj<=a+b-1 for ii,jj in pts):
      vals=[raw.get(pt,0) for pt in pts];gap=vals[1]**2-vals[0]*vals[2]
      assert gap>=0,(a,b,pts,vals);lowtriples+=1
      if c<4:small.append(dict(a=a,b=b,points=pts,coefficients=vals,gap=gap))
 neg=[dict(n=z['n'],chamber=z['chamber'],j=g['j'],negative_terms=g['negative_terms']) for z in cert for g in z['gaps'] if g['negative_terms']]
 summary=dict(status='finite exact experiments and unchecked symbolic identities; not universal proofs',denominator_bound=maxb,formula_sources=formula_sources,independent_raw_positions=rawchecks,backward_positions=backchecks,low_slope_polygon_triples=lowtriples,small_cycles=small,symbolic_runs=list(range(9)),symbolic_gaps=sum(len(z['gaps']) for z in cert),negative_gap_coefficients=neg,seconds=time.monotonic()-start)
 (O/'experiments.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary))
if __name__=='__main__':main()
