"""Machine-authored numerator-three exact algebra and coefficient experiments."""
from pathlib import Path
from collections import defaultdict
import json,time
from probe_9e205206 import add,neg,mul,one,u,v,b,s
O=Path('/Users/sasha/math_gkm/evidence/markov-9e205206')
def scale(p,k):return {m:k*c for m,c in p.items() if k*c}
def power(p,n):
 r=one
 for _ in range(n):r=mul(r,p)
 return r
def cube(x,y,r):
 if r:return add(add(power(x,3),mul(v,mul(x,power(y,2)))),mul(mul(s,v),power(y,3)))
 return add(add(mul(s,power(x,3)),mul(v,mul(power(x,2),y))),mul(power(v,2),power(y,3)))
def frame(path):
 lo=(0,1,one);mid=(1,2,add(power(b,2),u));hi=(1,1,b)
 for r in path:
  L,R=(mid,hi) if r else (lo,mid);op=lo if r else hi
  mon={(R[0],R[1]):1} if r else {(L[0],L[1]):1}
  nxt=(L[0]+R[0],L[1]+R[1],add(mul(s,mul(L[2],R[2])),neg(mul(mon,op[2]))))
  if r:lo,mid=mid,nxt
  else:mid,hi=nxt,mid
 return mid
def display(p):return [[i,j,c] for (i,j),c in sorted(p.items())]
def seriesmul(p,q):
 out=[{} for _ in range(len(p)+len(q)-1)]
 for i,a in enumerate(p):
  for j,c in enumerate(q):out[i+j]=add(out[i+j],mul(a,c))
 return out
def main():
 start=time.monotonic();F=[one,b]
 for n in range(31):F.append(add(mul(s,F[-1]),neg(mul(v,F[-2]))))
 e1=add(power(s,3),scale(mul(v,s),-2))
 e2=add(add(mul(v,power(s,4)),scale(mul(power(v,2),power(s,2)),-3)),scale(power(v,3),2))
 D=[one,neg(e1),e2,neg(mul(power(v,3),e1)),power(v,6)]
 out={'status':'exact finite experiments, not proof','formula_checks':0,'coefficient_checks':0,'triples':[0,0,0],'zero_triples':[0,0,0],'failures':[],'series':{}}
 for r in [False,True]:
  polys=[cube(F[q+1],F[q],r) for q in range(31)]
  for q in range(1,31):
   a,bb,p=frame([False]*(q-1)+[True,r]);assert a==3 and bb==3*q+(1 if r else 2)
   assert p==polys[q],(q,r,'source formula');out['formula_checks']+=1
   out['coefficient_checks']+=(a+bb)*(a+bb+1)//2
   if q>=4:
    assert not add(polys[q],neg(add(add(mul(e1,polys[q-1]),neg(mul(e2,polys[q-2]))),add(mul(mul(power(v,3),e1),polys[q-3]),neg(mul(power(v,6),polys[q-4]))))))
   def inside(i,j):return i>=0 and j>=0 and a*bb<=bb*i+a*j and i+j<=a+bb-1
   for i in range(a+bb):
    for j in range(a+bb-i):
     for k,pts in enumerate([[(i,j),(i+1,j),(i+2,j)],[(i,j),(i,j+1),(i,j+2)],[(i,j+2),(i+1,j+1),(i+2,j)]]):
      if all(inside(*x) for x in pts):
       vals=[p.get(x,0) for x in pts];out['triples'][k]+=1;out['zero_triples'][k]+=int(0 in vals)
       if vals[0]*vals[2]>vals[1]**2:out['failures'].append(dict(q=q,r=r,direction=k,points=pts,values=vals))
  N=seriesmul(D,polys[:4])[:4]
  boundary=mul(power(v,1 if r else 2),power(add(v,one),2))
  H=seriesmul([one,neg(power(v,3))],N)
  H=[add(x,neg(mul(boundary,y))) for x,y in zip(H,D)]
  out['series'][str(r)]={'numerator':[display(x) for x in N],'boundary_removed':[display(x) for x in H]}
 out['q_max']=30;out['seconds']=time.monotonic()-start
 (O/'three-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k!='series'}))
 # GAP input for optional exact multivariate factorization of the U-coefficients.
 def gp(p,ui):
  return '+'.join(f'({c})*v^{j}' for (i,j),c in sorted(p.items()) if i==ui) or '0'
 lines=['u:=Indeterminate(Rationals,"u");; v:=Indeterminate(Rationals,"v");; t:=Indeterminate(Rationals,"t");;']
 for r,z in out['series'].items():
  H=[{(i,j):c for i,j,c in x} for x in z['boundary_removed']]
  for i in range(1,7):
   expr='+'.join(f'({gp(p,i)})*t^{k}' for k,p in enumerate(H))
   lines.append(f'Print("{r} U^{i}: ",Factors({expr}),"\\n");')
 lines.append('QUIT;')
 (O/'factor-input.g').write_text('\n'.join(lines)+'\n')
if __name__=='__main__':main()
