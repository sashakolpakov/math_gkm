"""Machine-authored exact third-column quotient certificates; Lean checks generated claims."""
from explore_two_f8ca2c8b import corrected as blocks
from small_blocks_ae257c53 import divplus,lean as blocklean
from generate_all_lc_1152282d import specs,sp,ss
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-f8ca2c8b'
header='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
'''
def terms(bs):
 return [(band,k,{(i,0):c for (i,j),c in d.items() if j==k}) for band,d in enumerate(bs) for k in sorted({j for i,j in d})]
def main():
 mods=[]
 for a,r in [(2,1)]:
  tag=f'{a}{r}';nm=f'sThird{tag}';bs=blocks(a,r)
  for _ in range(7-a):bs=[divplus(d) for d in bs]
  ts=terms(bs);defs=','.join(f'{nm}c{i}_{k}MF8' for i,k,c in ts)
  E=f'{nm}EMF8'
  cmod=f'MarkovThirdSmallCoeff{tag}MF8';mods.append(cmod)
  s=f'import MarkovThirdSmallBridge{tag}MF8\nimport MarkovThirdInverseM115\n'+header
  for i,k,c in ts:s+=f'def {nm}c{i}_{k}MF8 (q : ℤ) : ℤ := {blocklean(c)}\n'
  s+=f'def {E} (q j : ℤ) : ℤ :=\n '+'+\n '.join(f'{nm}c{i}_{k}MF8 q*vFallM115 (j-{i}*q) {k}' for i,k,c in ts)+'\n'
  poly=' +\n '.join(f'C ({nm}c{i}_{k}MF8 q)*X^(m+{i}*q+{k})' for i,k,c in ts)
  summ='+\n   '.join(('' if i==0 else f'X^({i}*q)*')+f'{nm}J{i}MF8 (q:ℤ[X]) X' for i in range(4))
  s+=f'''
theorem {nm}coeffMF8 (P : ℤ[X]) (m q j : ℕ)
 (h : (1-X)^6*P=X^m*({summ})) :
 120*P.coeff j={E} q ((j:ℤ)-m) := by
 have hp : X^m*({summ})={poly} := by
   simp only [{','.join(f'{nm}J{i}MF8' for i in range(4))},{defs},
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at h
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 5 j h
 change P.coeff j=vInvM115 _ j at hc
 rw [hc]
 simp only [vInv_addM115,mul_add,vInv_monomialM115]
 have hs (j m q k : ℤ) : vFallM115 j (m+q+k)=vFallM115 (j-m-q) k := by
   unfold vFallM115
   split_ifs <;> first | omega | ring
 simp only [{E},Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero,hs]
end
end MathGKM.Markov
'''
  (R/f'research/{cmod}.lean').write_text(s)
  # Independent chambers keep compiler work bounded and resumable.
  parts=[]
  for ix,(case,qq,jj,us,vs) in enumerate(specs):
   mod=f'MarkovThirdSmallGap{tag}P{ix}MF8';parts.append(mod);mods.append(mod)
   qs,js=ss(qq),ss(jj)
   t=f'import {cmod}\n'+header+f'''theorem {nm}{case}MF8 (u v : ℤ) (hu : 0≤u) (hv : 0≤v) :
 {E} ({qs}) (({js})-1)*{E} ({qs}) (({js})+1) ≤ {E} ({qs}) ({js})^2 := by
 unfold {E}
'''
   for h in [-1,1,0]:
    jstr=f'({js}){h:+}' if h else js
    for i,k,c in ts:
     d=jj+h-i*qq-k
     if all(z>=0 for z in (d+5).values()):kind='poly'
     elif all(z>=0 for z in (-d-1).values()):kind='zero'
     else:raise ValueError((a,r,case,i,k,ss(d)))
     t+=f' rw [vFall_{kind}M115 (({jstr})-{i}*({qs})) {k} (by omega)]\n'
   t+=f' apply sub_nonneg.mp\n simp only [{defs}]\n ring_nf <;> positivity\nend\nend MathGKM.Markov\n'
   (R/f'research/{mod}.lean').write_text(t)
  mod=f'MarkovThirdSmallLC{tag}MF8';mods.append(mod)
  t='\n'.join('import '+p for p in parts)+'\n'+header
  for kind in ['zero','past']:
   cond='j≤0' if kind=='zero' else '3*q+7≤j'
   t+=f'theorem {nm}{kind}MF8 (q j : ℤ) (hq : 1≤q) (hj : {cond}) : {E} q j=0 := by\n unfold {E}\n'
   for i,k,c in ts:t+=f' rw [vFall_{"zero" if kind=="zero" else "poly"}M115 (j-{i}*q) {k} (by omega)]\n'
   t+=f' simp only [{defs}]\n ring\n'
  t+=f'''theorem {nm}adjacentMF8 (q j : ℤ) (hq : 1≤q) :
 {E} q (j-1)*{E} q (j+1) ≤ {E} q j^2 := by
 by_cases h0 : j≤1
 · rw [{nm}zeroMF8 q (j-1) hq (by omega),zero_mul]; exact sq_nonneg _
 by_cases hN : 3*q+6≤j
 · rw [{nm}pastMF8 q (j+1) hq (by omega),mul_zero]; exact sq_nonneg _
 by_cases hq5 : q<5
 · interval_cases q <;> interval_cases j <;> norm_num [{E},{defs},vFallM115]
'''
  def invoke(case):
   _,_,_,us,vs=next(z for z in specs if z[0]==case)
   return f'convert {nm}{case}MF8 ({us}) ({vs}) (by omega) (by omega) using 1 <;> congr 1 <;> congr 1 <;> omega\n'
  for k in [2,3,4]:t+=f' by_cases h{k} : j={k}\n · '+invoke(f'first{k}')
  t+=' by_cases hl : j≤q\n · '+invoke('low')
  for k in range(1,5):t+=f' by_cases hc{k} : j=q+{k}\n · '+invoke(f'cross1_{k}')
  t+=' by_cases hm1 : j≤2*q+1\n · '+invoke('mid1')
  for k in range(2,6):t+=f' by_cases hd{k} : j=2*q+{k}\n · '+invoke(f'cross2_{k}')
  t+=' by_cases hm2 : j≤3*q+1\n · '+invoke('mid2')
  t+=' have ht : '+' ∨ '.join(f'j=3*q+{k}' for k in range(2,6))+' := by omega\n rcases ht with ht|ht|ht|ht\n'
  for k in range(2,6):t+=' · '+invoke(f'tail{k}')
  t+=f'''
theorem {nm}rawMF8 (n j : ℕ) :
 let path := List.replicate n false++[true]
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++[true]
 have hc (k : ℕ) : 720*coeff (frame path).mid.p 3 k={E} (n+1) ((k:ℤ)+(n+3)) := by
   have h := {nm}coeffMF8 (6*X^(n+3)*((frame path).mid.p).coeff 3) 0 (n+1) (k+(n+3))
     (by simpa only [pow_zero,one_mul,Nat.cast_add,Nat.cast_one] using {nm}sourceMF8 n)
   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Nat.cast_zero,sub_zero,mul_assoc] at h
   simp only [show (6:ℤ[X])=C (6:ℤ) from rfl,Polynomial.coeff_C_mul] at h
   rw [Polynomial.coeff_X_pow_mul] at h
   change 120*(6*coeff (frame path).mid.p 3 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : {E} (n+1) ((j:ℤ)+(n+3))*{E} (n+1) (j+2+(n+3)) ≤ {E} (n+1) (j+1+(n+3))^2 := by
   convert {nm}adjacentMF8 (n+1) (j+1+(n+3)) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
end
end MathGKM.Markov
'''
  (R/f'research/{mod}.lean').write_text(t)
 (O/'two-plan.json').write_text(json.dumps(mods,indent=2)+'\n')
 print('Generated',len(mods),'small-family modules')
if __name__=='__main__':main()
