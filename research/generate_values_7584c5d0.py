"""Machine-authored exact symbolic generation of coefficient formulas."""
from explore_seed_7584c5d0 import *
header='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
'''
def cn(i,k):return f'vH{i}c{k}M758'
def en(i):return f'vE{i}M758'
def main():
 src='import MarkovVerticalInverseM758\n/-! Machine-authored 7584c5d0. Integral coefficient adapter, retaining zeros. -/\n'+header
 inds=[[(i,k) for k in range(9) if hcoeff(i,k)] for i in range(3)]
 for inds0 in inds:
  for i,k in inds0:src+=f'\ndef {cn(i,k)} (a r s q : ℤ) : ℤ := {expr(hcoeff(i,k))}\n'
 for i in range(3):
  src+=f'\ndef {en(i)} (a r s q j : ℤ) : ℤ :=\n '+'+'.join(f'{cn(i,k)} a r s q*vFallM758 j {k}' for _,k in inds[i])+'\n'
 src+='\ndef vEM758 (a r s q j : ℤ) : ℤ := vE0M758 a r s q j+vE1M758 a r s q (j-q)+vE2M758 a r s q (j-2*q)\n'
 poly=' +\n '.join(f'C ({cn(i,k)} a r s (n+1))*X^({i}*(n+1)+{k})' for row in inds for i,k in row)
 defs=','.join(cn(i,k) for row in inds for i,k in row)
 src+=f'''
theorem vN_coeff_scaledM758 (n a r s j : ℕ) :
 6*(vNseedMDE6 n a r s).coeff j=vEM758 a r s (n+1) j := by
 have hs := vN_sparseM758 n a r s
 have hp : vH0M758 (a:ℤ[X]) r s (n+1) X+
   X^(n+1)*vH1M758 (a:ℤ[X]) r s (n+1) X+
   X^(2*(n+1))*vH2M758 (a:ℤ[X]) r s (n+1) X=
 {poly} := by
   simp only [vH0M758,vH1M758,vH2M758,{defs},
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [hp] at hs
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 3 j hs
 change (vNseedMDE6 n a r s).coeff j=vInvM758 _ j at hc
 rw [hc]
 simp only [vInv_addM758,mul_add,vInv_monomialM758]
 simp only [vEM758,vE0M758,vE1M758,vE2M758,vFallM758,Nat.cast_add,
   Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,zero_mul,zero_add,one_mul]
 congr 1 <;> congr 1 <;> congr 1 <;> congr 1 <;> congr 1 <;>
   first | rfl | (congr 1 <;> first | omega | ring)
'''
 src+='\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovVerticalValuesM758.lean').write_text(src)
 # Coefficient shape formulas and individual block formulas.
 src='import MarkovVerticalValuesM758\n/-! Machine-authored 7584c5d0. Exact piecewise cubic coefficients. -/\n'+header
 formulas=coeff_exprs()
 for name,p in formulas.items():src+=f'\ndef v{name}M758 (a r s q j : ℤ) : ℤ := {expr(p,["a","r","s","q","j","t"])}\n'
 for i in range(3):
  f=sum((hcoeff(i,k)*cubic(v-k+3) for k in range(9)),sp.poly(0))
  src+=f'\ndef vBlock{i}M758 (a r s q j : ℤ) : ℤ := {expr(f,["a","r","s","q","j","t"])}\n'
  cutoff=[2,3,5][i]
  src+=f'\ntheorem vE{i}_polyM758 (a r s q j : ℤ) (hj : {cutoff} ≤ j) :\n vE{i}M758 a r s q j=vBlock{i}M758 a r s q j := by\n unfold vE{i}M758\n'
  for _,k in inds[i]:src+=f' rw [vFall_polyM758 j {k} (by omega)]\n'
  src+=f' simp only [{defs},vBlock{i}M758]\n ring\n'
  cutoff0=[0,1,1][i]
  src+=f'\ntheorem vE{i}_zeroM758 (a r s q j : ℤ) (hj : j ≤ {cutoff0}) :\n vE{i}M758 a r s q j=0 := by\n unfold vE{i}M758\n'
  for _,k in inds[i]:src+=f' rw [vFall_zeroM758 j {k} (by omega)]\n'
  src+=' ring\n'
 # For the isolated small-index block terms, unfolding is bounded.
 all_defs=defs+',vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,'+','.join('v'+k+'M758' for k in formulas)
 cases=[('zero','j ≤ 0','0',['rw [vEM758,vE0_zeroM758 _ _ _ _ _ (by omega),vE1_zeroM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]','ring']),
 ('one','j=1','48*s',['subst j','rw [vEM758,vE1_zeroM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]',f'norm_num [{all_defs}]']),
 ('low','2 ≤ j ∧ j ≤ q+1','vlowM758 a r s q j',['rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_zeroM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]',f'simp only [{all_defs}]; ring']),
 ('bridge','j=q+2','vbridgeM758 a r s q j',['subst j','rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]','rw [show q+2-q=2 by ring]',f'norm_num [{all_defs}]; ring']),
 ('mid','q+3 ≤ j ∧ j ≤ 2*q+1','vmidM758 a r s q j',['rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]',f'simp only [{all_defs}]; ring'])]
 for k in [2,3,4]:
  cases.append((f'tail{k}',f'j=2*q+{k}',f'vtail{k}M758 a r s q j',['subst j','rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega)]',f'rw [show 2*q+{k}-2*q={k} by ring]',f'norm_num [{all_defs}]; ring']))
 cases.append(('past','2*q+5 ≤ j','0',['rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega),vE2_polyM758 _ _ _ _ _ (by omega)]',f'simp only [{all_defs}]; ring']))
 for name,hyp,rhs,proof in cases:
  src+=f'\ntheorem vE_{name}M758 (a r s q j : ℤ) (hq : 3 ≤ q) (hj : {hyp}) :\n vEM758 a r s q j={rhs} := by\n '+'\n '.join(proof)+'\n'
 src+='\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovVerticalShapesM758.lean').write_text(src)
 print('Generated exact coefficient adapter and piecewise shapes.')
if __name__=='__main__':main()
