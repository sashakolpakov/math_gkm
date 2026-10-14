"""Exact sparse rational algebra for arbitrary-run generating numerators.
Machine-authored e27336bc. Generates candidates; Lean checks the identities.
"""
from fractions import Fraction
from pathlib import Path
import json
class P(dict):
 def __add__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0):Fraction(b)});d=P(a)
  for k,v in b.items(): d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+(-b)
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,P) else P({(0,0,0):Fraction(b)});d=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  b=P({(0,0,0):Fraction(1)})
  for _ in range(n):b=b*a
  return b
 def subst(a,n,x,z):
  b=P()
  for (i,j,k),v in a.items():b+=v*n**i*x**j*z**k
  return b
 def part(a,i,k):return P({(0,j,0):v for (ii,j,kk),v in a.items() if ii==i and kk==k})
def divd(p):
 assert all(i==0 and k==0 for i,j,k in p)
 cs=[p.get((0,j,0),0) for j in range(max(j for i,j,k in p)+1)]
 out=[];a=0
 for v in cs:a+=v;out.append(a)
 assert out[-1]==0
 return P({(0,j,0):v for j,v in enumerate(out[:-1]) if v})
def fmt(p,names=('N','x','z')):
 return ' + '.join(str(v.numerator) + ''.join('*'+x+('^'+str(i) if i>1 else '') for x,i in zip(names,k) if i) if v.denominator==1 else '('+str(v)+')' for k,v in sorted(p.items())) or '0'
N=P({(1,0,0):Fraction(1)});x=P({(0,1,0):Fraction(1)});z=P({(0,0,1):Fraction(1)});d=1-x
H=N*d*(1+x)**2+(1+x)*(1-3*x)+4*x*z
C=2*N*x*d*(1+x)**2+x*d**3-8*x*x*(1+x)+z*(2*N*d*(1+x)**2+8*x*(1+x))
delta=(1+x)*(d*C+d*d*H-2*d**3*(x-z))
A=delta.part(1,0);B=delta.part(0,0)
CC=-divd(delta.part(1,1));DD=divd(x*CC-delta.part(0,1))
D=Fraction(1,2)*N*(N-1)*A+N*B+z*(N*CC+DD)-x*DD
assert D.subst(N+1,x,z*x)-D==delta
assert C.subst(N+1,x,z*x)-x*C==2*x*d*H+d**3*(x-x*x+2*x*z)
assert H.subst(N+1,x,z*x)-H==d*d*(1+3*x)+4*x*d*(x-z)
K=2*D+2*d*C
rec=dict(status='Exact symbolic identities; not yet Lean proofs',H=fmt(H),C=fmt(C),twiceD=fmt(2*D),twiceK=fmt(K))
Path('evidence/markov-e27336bc/kernels.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
s='''import MarkovSecondCompressed446
/-! Machine-authored e27336bc. Arbitrary-run cleared coefficient kernels. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1500000
set_option linter.unusedSimpArgs false

def hKernelE273 (N x z : ℤ[X]) := N*(1-x)*(1+x)^2+(1+x)*(1-3*x)+4*x*z
def cKernelE273 (N x z : ℤ[X]) :=
 2*N*x*(1-x)*(1+x)^2+x*(1-x)^3-8*x^2*(1+x)+
 z*(2*N*(1-x)*(1+x)^2+8*x*(1+x))
def dKernelE273 (N x z : ℤ[X]) := DEXPR

theorem hKernel_clearE273 (n : ℕ) :
 (1-X)^2*lowerH487 n=hKernelE273 n X (X^(n+1)) := by
 induction n with
 | zero => norm_num [lowerH487,hKernelE273]; ring
 | succ n ih =>
   rw [lowerH487]
   have hs := runSum_clear487 n
   simp only [Nat.cast_add,Nat.cast_one]
   have he : X^(n+1+1)=(X : ℤ[X])^(n+1)*X := pow_succ _ _
   rw [he]
   dsimp [hKernelE273] at *
   linear_combination ih + (4*X*(1-X))*hs

theorem cKernel_clearE273 (n : ℕ) :
 (1-X)^3*runCOneBF n=cKernelE273 n X (X^(n+1)) := by
 induction n with
 | zero => norm_num [runCOneBF,cKernelE273]; ring
 | succ n ih =>
   rw [runCOneBF]
   have hh := hKernel_clearE273 n
   simp only [Nat.cast_add,Nat.cast_one]
   have he : X^(n+1+1)=(X : ℤ[X])^(n+1)*X := pow_succ _ _
   have hf : X^(n+2)=(X : ℤ[X])^(n+1)*X := by rw [show n+2=n+1+1 by omega,pow_succ]
   rw [he]
   dsimp [hKernelE273,cKernelE273] at *
   linear_combination X*ih + (2*X*(1-X))*hh

theorem dKernel_clearE273 (n : ℕ) :
 2*(1-X)^4*runDTwoBF n=dKernelE273 n X (X^(n+1)) := by
 induction n with
 | zero => norm_num [runDTwoBF,dKernelE273]; ring
 | succ n ih =>
   rw [runDTwoBF]
   have hh := hKernel_clearE273 n
   have hc := cKernel_clearE273 n
   have hs := runSum_clear487 n
   simp only [Nat.cast_add,Nat.cast_one]
   rw [pow_succ X (n+1)]
   dsimp [hKernelE273,cKernelE273,dKernelE273] at *
   linear_combination ih + (2*(1+X)*(1-X))*hc +
     (2*(1+X)*(1-X)^2)*hh - (4*(1+X)*(1-X)^3)*hs

def kKernelE273 (N x z : ℤ[X]) := dKernelE273 N x z+2*(1-x)*cKernelE273 N x z
theorem kKernel_clearE273 (n : ℕ) :
 2*(1-X)^4*runKBF (lowerMatrix487 n)=kKernelE273 n X (X^(n+1)) := by
 rw [runK_scalarBF]
 dsimp [kKernelE273]
 linear_combination dKernel_clearE273 n + (2*(1-X))*cKernel_clearE273 n

#print axioms hKernel_clearE273
#print axioms cKernel_clearE273
#print axioms dKernel_clearE273
#print axioms kKernel_clearE273
end
end MathGKM.Markov
'''.replace('DEXPR',fmt(2*D))
Path('research/MarkovRunKernelsE273.lean').write_text(s)
