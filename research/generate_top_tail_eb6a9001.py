"""Machine-authored exact integer tail certificate; Lean checks the result."""
from top_symbolic_b3eed364 import add,scale,mul,one,x,n,F,serial
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-eb6a9001'
def lin(i,d,c):return add(add(scale(x,i),scale(n,d)),scale(one,c))
def prod(*ps):
 a=one
 for p in ps:a=mul(a,p)
 return a
L=scale(prod(lin(1,1,6),lin(1,1,7)),2)
V1=scale(prod(lin(1,0,1),lin(2,1,9),lin(1,1,7)),2)
V2=prod(lin(1,0,1),lin(1,0,2),lin(2,1,9),lin(2,1,10))
A=add(add(scale(L,8),scale(V1,4)),V2)
E=add(scale(prod(lin(2,1,10),V1),4),scale(prod(lin(2,1,11),V2),2))
C=scale(prod(lin(2,1,11),lin(2,1,12),V2),2)
a=prod(lin(1,0,1),lin(1,0,4));b=prod(lin(1,0,2),lin(1,0,5))
g=add(prod(b,E,E),scale(prod(a,A,C),-1))
assert all(v>0 for v in g.values())
expr='+\n  '.join(str(v.numerator)+(f'*i^{j}' if j else '')+(f'*d^{k}' if k else '') for (j,k),v in sorted(g.items()))
src='''import MarkovTopTailKernelMEB6
/-! Machine-authored eb6a9001. Positive integer certificate for the last
three nonzero high-column masses, valid for unbounded column and parameter. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 15000000
set_option maxRecDepth 20000

def tailDenMEB6 (i d : ℤ) : ℤ := 2*(d+i+6)*(d+i+7)
def tailOneMEB6 (i d : ℤ) : ℤ := 2*(i+1)*(d+2*i+9)*(d+i+7)
def tailTwoMEB6 (i d : ℤ) : ℤ := (i+1)*(i+2)*(d+2*i+9)*(d+2*i+10)
def tailAMMEB6 (i d : ℤ) : ℤ := 8*tailDenMEB6 i d+4*tailOneMEB6 i d+tailTwoMEB6 i d
def tailEMMEB6 (i d : ℤ) : ℤ := 4*(d+2*i+10)*tailOneMEB6 i d+2*(d+2*i+11)*tailTwoMEB6 i d
def tailCMMEB6 (i d : ℤ) : ℤ := 2*(d+2*i+11)*(d+2*i+12)*tailTwoMEB6 i d

theorem top_tail_scalar_positiveMEB6 (i d : ℤ) (hi : 0 ≤ i) (hd : 0 ≤ d) :
 (i+1)*(i+4)*tailAMMEB6 i d*tailCMMEB6 i d < (i+2)*(i+5)*tailEMMEB6 i d^2 := by
 have he : (i+2)*(i+5)*tailEMMEB6 i d^2-(i+1)*(i+4)*tailAMMEB6 i d*tailCMMEB6 i d=
  EXPR := by
   unfold tailAMMEB6 tailCMMEB6 tailEMMEB6 tailDenMEB6 tailOneMEB6 tailTwoMEB6
   ring
 have hp : (0:ℤ)<EXPR := by positivity
 linarith

end
end MathGKM.Markov
'''.replace('EXPR',expr)
(R/'research/MarkovTopTailScalarMEB6.lean').write_text(src)
(O/'top-tail-certificate.json').write_text(json.dumps(dict(coefficients=serial(g),terms=len(g),all_positive=True,status='generated identity; Lean validation required'),indent=2)+'\n')
print(dict(terms=len(g),degree=max(i+j for i,j in g)))
