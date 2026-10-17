"""Machine-authored integer certificate generator. Every equality is checked in Lean."""
from pathlib import Path
from math import factorial,comb
from itertools import zip_longest
import sys,json
def add(p,q):return [a+b for a,b in zip_longest(p,q,fillvalue=0)]
def mul(p,q):
 if not p:return []
 return add([p[0]*v for v in q],[0]+mul(p[1:],q))
def add2(p,q):return [add(a,b) for a,b in zip_longest(p,q,fillvalue=[])]
def mul2(p,q):
 if not p:return []
 return add2([mul(p[0],v) for v in q],[[]]+mul2(p[1:],q))
def fall(e,n):
 z=[[1]]
 for j in range(n):z=mul2(z,add2(e,[[-j]]))
 return z
def prod(N,a,b,e,f):return mul2(mul2([[factorial(N)//(factorial(a)*factorial(b))]],fall(e,a)),fall(f,b))
def top(K,c):
 p=[[0]]
 e=add2([[],[1]],[[2*c+8]])
 f=add2([[0,1]],[[K]]);g=add2([[0,1]],[[K+1]])
 for l in range(c+4):
  z=add2(prod(2*c+5,c+3-l,c+l,e,f),mul2([[4]],prod(2*c+5,c+3-l,c+l+2,e,g)))
  p=add2(p,mul2([[comb(c+l,c)]],z))
 return p
def lean(p):return '['+','.join('['+','.join(str(v) if v>=0 else '('+str(v)+')' for v in r)+']' for r in p)+']'
if __name__=='__main__':
 for c in map(int,sys.argv[1:]):
  arrays=[top(c+2,j) for j in range(c,c+3)]
  a,b,z=arrays
  u=(c+4)*factorial(2*c+5)*factorial(2*(c+2)+5)
  v=-(c+5)*factorial(2*(c+1)+5)**2
  gap=add2(mul2(mul2([[u]],b),b),mul2(mul2([[v]],a),z))
  assert all(v>=0 for row in gap for v in row),(c,'negative')
  src='import MarkovTemplateIntegerM673\n/-! Machine-authored 6738b4ea. Kernel-checked exact template certificate. -/\nnamespace MathGKM.Markov\nset_option maxHeartbeats 800000000\nset_option maxRecDepth 1000000\nset_option compiler.extract_closed false\n'
  for j,p in zip(range(c,c+3),arrays):
   name=f'templateData{c}_{j}M673'
   src+=f'def {name} : DenseZM673 := {lean(p)}\n'
   src+=f'theorem template_data_{c}_{j}M673 : exprDenseM673 (topIntExprM673 {c+2} {j})={name} := by decide +kernel\n#check template_data_{c}_{j}M673\n'
  src+=f'theorem template_certificate_{c}M673 : denseNonnegM673 (exprDenseM673 (templateGapExprM673 {c})) := by\n'
  src+=f'  change denseNonnegM673 (denseZAddM673\n    (denseZMulM673 (denseZMulM673 [[{u}]] (exprDenseM673 (topIntExprM673 {c+2} {c+1}))) (exprDenseM673 (topIntExprM673 {c+2} {c+1})))\n    (denseZMulM673 (denseZMulM673 [[({v})]] (exprDenseM673 (topIntExprM673 {c+2} {c}))) (exprDenseM673 (topIntExprM673 {c+2} {c+2}))))\n'
  src+=f'  rw [template_data_{c}_{c}M673,template_data_{c}_{c+1}M673,template_data_{c}_{c+2}M673]\n  decide +kernel\n'
  src+=f'theorem template_strong_{c}M673 (d T : ℕ) (hT : {c+2} ≤ T) :\n ({c+5}:ℤ)*topMassM55C d T {c}*topMassM55C d T {c+2} ≤\n ({c+4}:ℤ)*topMassM55C d T {c+1}^2 :=\n template_integer_transferM673 {c} template_certificate_{c}M673 d T hT\n'
  src+='end MathGKM.Markov\n'
  Path(f'research/MarkovTemplateC{c}M673.lean').write_text(src)
  print(json.dumps(dict(c=c,source_bytes=len(src.encode()),array_entries=[sum(map(len,p)) for p in arrays],gap_entries=sum(map(len,gap)))))
