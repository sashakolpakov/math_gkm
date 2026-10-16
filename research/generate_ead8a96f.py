"""Machine-authored exact small-column algebra and Lean certificate generator."""
from small_sparse_7584c5d0 import divide
from generate_7584c5d0 import *
O=R/'evidence/markov-ead8a96f'
cases=[(2,1),(3,1),(3,2),(4,1),(4,3)]
header='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
'''
def nm(a,r):return f's{a}{r}'
def blocks(aa,rr):
 hs=[p.subst([aa,rr,max(2*rr-aa,0),q,v,0]) for p in H]
 if aa==2:hs[0]+=2*v*(1-v)**4
 for i in range(3):
  for _ in range(5-aa):hs[i]=divide(hs[i])
 return hs
def terms(h):
 return [(k,sp.P({e[:4]+(0,0):c for e,c in h.items() if e[4]==k})) for k in range(8) if any(e[4]==k for e in h)]
def lean(p,names=['a','r','s','q','x','t']):return expr(p,names)
def main():
 src='import MarkovVerticalInverseM758\nimport MarkovVerticalSmallSourceM758\n/-! Machine-authored ead8a96f. Exact small-column sparse quotient blocks. -/\n'+header
 src+='''
theorem vFall_shiftMEA (j m q k : ℤ) :
 vFallM758 j (m+q+k)=vFallM758 (j-m-q) k := by
 unfold vFallM758
 split_ifs <;> first | omega | ring
'''
 for aa,rr in cases:
  name=nm(aa,rr);hs=blocks(aa,rr)
  for i,h in enumerate(hs):
   src+=f'\ndef {name}J{i}MEA {{R : Type*}} [CommRing R] (q x : R) : R := {lean(h)}\n'
   for k,c in terms(h):src+=f'\ndef {name}c{i}_{k}MEA (q : ℤ) : ℤ := {lean(c)}\n'
  src+=f'\ndef {name}EMEA (q j : ℤ) : ℤ :=\n '+'+\n '.join(f'{name}c{i}_{k}MEA q*vFallM758 (j-{i}*q) {k}' for i,h in enumerate(hs) for k,c in terms(h))+'\n'
  for i,h in enumerate(hs):
   correction='+2*x*(1-x)^4' if aa==2 and i==0 else ''
   src+=f'''\ntheorem {name}block{i}MEA {{R : Type*}} [CommRing R] (q x : R) :
 (1+x)^{5-aa}*{name}J{i}MEA q x = vH{i}M758 {aa} {rr} {max(2*rr-aa,0)} q x{correction} := by
 simp only [{name}J{i}MEA,vH{i}M758]; ring
'''
  poly=' +\n '.join(f'C ({name}c{i}_{k}MEA q)*X^(m+{i}*q+{k})' for i,h in enumerate(hs) for k,c in terms(h))
  defs=','.join(f'{name}c{i}_{k}MEA' for i,h in enumerate(hs) for k,c in terms(h))
  src+=f'''
theorem {name}coeffMEA (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^4*P=X^m*({name}J0MEA (q:ℤ[X]) X+
   X^q*{name}J1MEA (q:ℤ[X]) X+X^(2*q)*{name}J2MEA (q:ℤ[X]) X)) :
 6*P.coeff j={name}EMEA q ((j:ℤ)-m) := by
 have hp : X^m*({name}J0MEA (q:ℤ[X]) X+
   X^q*{name}J1MEA (q:ℤ[X]) X+X^(2*q)*{name}J2MEA (q:ℤ[X]) X)=
 {poly} := by
   simp only [{name}J0MEA,{name}J1MEA,{name}J2MEA,{defs},
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j h
 change P.coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [{name}EMEA,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,
   Nat.cast_one,Nat.cast_zero,vFall_shiftMEA]
'''
 src+='\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovSmallBlocksMEA.lean').write_text(src)
 print('Generated exact blocks and coefficient adapters.')
if __name__=='__main__':main()
