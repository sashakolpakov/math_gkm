"""Machine-authored symbolic derivation and Lean source generation. No interpolation."""
from pathlib import Path
from fractions import Fraction
import json
import horizontal_third_13d40bd7 as sp
sp.N=6
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-7584c5d0'
a,r,s,q,v,t=[sp.var(i) for i in range(6)]
def AP(q):return -q+(-q-3)*v+(q-2)*v**2+(q+1)*v**3
def BL(q):return (8*q-8)*v+(8*q-32)*v**2+(-8*q-40)*v**3+(-8*q-16)*v**4
def BP(q):return q*q+q+(2*q*q+10*q+8)*v+(-q*q+15*q+32)*v**2+(-4*q*q-4*q+40)*v**3+(-q*q-17*q+16)*v**4+(2*q*q-6*q)*v**5+(q*q+q)*v**6
h=1+v;z=1-v
A=4*v+t*AP(q);A1=4*v+v*t*AP(q+1)
B=BL(q)+t*BP(q);B1=BL(q+1)+v*t*BP(q+1)
F=2-t-v*t;D=(a-r)*v*A+r*A1
N=D*D-(a-r)*v*v*A*A-r*A1*A1+t*v*((a-r)*v*B+r*B1)
N+=2*v*(a*v*v*F*F+4*r*v*F*z+4*s*z*z)*z*z
N-=2*h*t*v*D*z*z
N+=2*h*h*t*t*v*v*z**4
H=[sp.P({e[:5]+(0,):c for e,c in N.items() if e[5]==i}) for i in range(3)]
def expr(p,names=['a','r','s','q','x','t']):
 out=[]
 for e,c in sorted(p.items()):
  assert c.denominator==1
  prod=[str(abs(c.numerator))]+[f'{n}^{k}' if k!=1 else n for n,k in zip(names,e) if k]
  term='*'.join(prod)
  out.append(('+' if c>0 else '-')+term)
 return ''.join(out).lstrip('+') or '0'
def hcoeff(i,k):return sp.P({e[:4]+(0,0):c for e,c in H[i].items() if e[4]==k})
def cubic(x):return x*(x-1)*(x-2)
def sixcoef(j,qq):
 out=sp.poly(0)
 for i in range(3):
  for k in range(9):
   d=j-i*qq-k
   if isinstance(d,int):
    if d<0:continue
   out+=hcoeff(i,k).subst([a,r,s,qq,0,0])*cubic(d+3)
 return out
def main():
 old=(R/'research/validate_de6168c6.py').read_text().replace('markov-de6168c6','markov-7584c5d0')
 (R/'research/validate_7584c5d0.py').write_text(old)
 src='''import MarkovVerticalJetClosedMDE6
import MarkovBinomialExtractBC
/-! Machine-authored 7584c5d0. Sparse integral numerator, all run lengths. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
'''
 for i in range(3):src+=f'\ndef vH{i}M758 {{R : Type*}} [CommRing R] (a r s q x : R) : R :=\n {expr(H[i])}\n'
 src+='''
theorem vN_sparseM758 (n a r s : ℕ) :
 (1-X)^4*vNseedMDE6 n a r s=
 vH0M758 (a:ℤ[X]) r s (n+1) X+
 X^(n+1)*vH1M758 (a:ℤ[X]) r s (n+1) X+
 X^(2*(n+1))*vH2M758 (a:ℤ[X]) r s (n+1) X := by
 obtain ⟨ha,hb,hf⟩ := vJet_closedMDE6 n
 obtain ⟨ha',hb',_⟩ := vJet_closedMDE6 (n+1)
 let A := vAJMDE6 n
 let A' := vAJMDE6 (n+1)
 let B := vBJMDE6 n
 let B' := vBJMDE6 (n+1)
 let F := vFJMDE6 n
 have hh : (1-X)^4*vNseedMDE6 n a r s =
   (((a:ℤ[X])-r)*X*((1-X)^2*A)+r*((1-X)^2*A'))^2-
   ((a:ℤ[X])-r)*X^2*((1-X)^2*A)^2-r*((1-X)^2*A')^2+
   X^(n+1)*X*(((a:ℤ[X])-r)*X*(2*(1-X)^4*B)+r*(2*(1-X)^4*B'))+
   2*X*((a:ℤ[X])*X^2*((1-X)*F)^2+4*r*X*((1-X)*F)*(1-X)+4*s*(1-X)^2)*(1-X)^2-
   2*(X+1)*X^(n+1)*X*(((a:ℤ[X])-r)*X*((1-X)^2*A)+r*((1-X)^2*A'))*(1-X)^2+
   2*(X+1)^2*(X^(n+1))^2*X^2*(1-X)^4 := by
   dsimp [vNseedMDE6,vNexprMDE6,A,A',B,B',F]; ring
 rw [hh]
 dsimp only [A,A',B,B',F]
 rw [ha,ha',hb,hb',hf]
 simp only [vAPMDE6,vBLMDE6,vBPMDE6,vH0M758,vH1M758,vH2M758,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,pow_add,pow_mul,pow_succ]
 ring

def vNvalueM758 (n a r s j : ℕ) : ℤ :=
 ∑ k ∈ Finset.range (j+1),
   (vH0M758 (a:ℤ[X]) r s (n+1) X+
    X^(n+1)*vH1M758 (a:ℤ[X]) r s (n+1) X+
    X^(2*(n+1))*vH2M758 (a:ℤ[X]) r s (n+1) X).coeff k *
    ((3+(j-k)).choose 3:ℤ)

theorem vN_coeffM758 (n a r s j : ℕ) :
 (vNseedMDE6 n a r s).coeff j=vNvalueM758 n a r s j := by
 exact coeff_of_one_sub_mul_rangeBC _ _ 3 j (vN_sparseM758 n a r s)
end
end MathGKM.Markov
'''
 (R/'research/MarkovVerticalSparseM758.lean').write_text(src)
 print(json.dumps(dict(sparse_terms=[len(p) for p in H],degrees=[max(e[4] for e in p) for p in H])))
if __name__=='__main__':main()
