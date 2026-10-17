"""Machine-authored generation; generated algebra is separately Lean-checked."""
from weighted_beta_symbolic_ca9709f2 import *
R=Path('/Users/sasha/math_gkm')
fall,reduced,_=run()
x,y,s,z=[var(j) for j in range(4)];aa=x+2;mm=y+2;rr=mm+s+1;HH=3*aa+rr+4+z
shifted=reduced.ev([aa,mm,rr,HH]);assert all(v>0 for v in shifted.d.values())
body='''import MarkovTopBetaComparisonMCA9
/-! Machine-authored ca9709f2. Exact polynomial-weighted beta mean.
The final nonnegative-domain hypotheses are explicit. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 8000
def betaWeightedPolynomialMCA9 (a m r H : ℤ) : ℤ :=
  REDUCED
def betaWeightedSumMCA9 (i m : ℕ) (r H : ℤ) : ℤ :=
 ∑ k ∈ range (m+1), ((i+k).choose i:ℤ)*((i+(m-k)).choose i:ℤ)*
   (r-k)*(r-((m-k:ℕ):ℤ))*betaScalarMCA9 ((i:ℤ)+1) H k ((m-k:ℕ):ℤ)

theorem beta_weighted_polynomial_shiftMCA9 (x y s z : ℤ)
 (hx : 0 ≤ x) (hy : 0 ≤ y) (hs : 0 ≤ s) (hz : 0 ≤ z) :
 0 < betaWeightedPolynomialMCA9 (x+2) (y+2) (y+3+s)
   (3*(x+2)+(y+3+s)+4+z) := by
 have he : betaWeightedPolynomialMCA9 (x+2) (y+2) (y+3+s)
   (3*(x+2)+(y+3+s)+4+z)=
  SHIFTED := by unfold betaWeightedPolynomialMCA9; ring
 rw [he]
 positivity

theorem beta_weighted_polynomial_positiveMCA9 (a m r H : ℤ)
 (ha : 2 ≤ a) (hm : 2 ≤ m) (hr : m+1 ≤ r) (hH : 3*a+r+4 ≤ H) :
 0 < betaWeightedPolynomialMCA9 a m r H := by
 have h := beta_weighted_polynomial_shiftMCA9 (a-2) (m-2) (r-m-1) (H-(3*a+r+4))
   (by omega) (by omega) (by omega) (by omega)
 convert h using 1 <;> ring
'''.replace('REDUCED',expr(reduced,['a','m','r','H'])).replace('SHIFTED',expr(shifted,['x','y','s','z']))
for n in [5,6]:
 term='*'.join(['(k:ℤ)']+[f'(k-{j})' for j in range(1,n)])
 body+=f'''
theorem beta_fall_{n}MCA9 (k : ℕ) : (k.descFactorial {n}:ℤ)={term} := by
 rw [←descPochhammer_eval_eq_descFactorial ℤ k {n}]
 norm_num [descPochhammer_succ_eval]
'''
terms=[]
for (u,v),p in sorted(fall.items()):terms.append('('+expr(p,['a','m','r','H'])+f')*betaMomentMDCB i m {u} {v}')
body+='''
theorem beta_weighted_sum_momentsMCA9 (i m : ℕ) (r H : ℤ) :
 betaWeightedSumMCA9 i m r H=
 MOMENTS := by
 unfold betaWeightedSumMCA9 betaMomentMDCB
 simp only [Finset.mul_sum,←sum_add_distrib]
 apply sum_congr rfl
 intro k hk
 have hf0 (k : ℕ) := (beta_fall_smallMCA9 k).1
 have hf1 (k : ℕ) := (beta_fall_smallMCA9 k).2.1
 have hf2 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.1
 have hf3 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.1
 have hf4 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.2
 simp only [hf0,hf1,hf2,hf3,hf4,beta_fall_5MCA9,beta_fall_6MCA9]
 unfold betaScalarMCA9
 ring
'''.replace('MOMENTS','+\n  '.join(terms).replace('a','((i:ℤ)+1)') if False else '+\n  '.join('('+expr(p,['((i:ℤ)+1)','(m:ℤ)','r','H'])+f')*betaMomentMDCB i m {u} {v}' for (u,v),p in sorted(fall.items())))
D='*'.join(f'(2*(i:ℤ)+{j+2})' for j in range(6))
body+=f'''
theorem beta_weighted_sum_clearedMCA9 (i m : ℕ) (r H : ℤ) :
 {D}*betaWeightedSumMCA9 i m r H=
 2*((i:ℤ)+1)^2*(i+2)*(m:ℤ)*(m-1)*betaWeightedPolynomialMCA9 ((i:ℤ)+1) m r H*
   betaMomentMDCB i m 0 0 := by
'''
for u,v in sorted(fall):body+=f' have h{u}{v} := beta_moment_clearedMDCB i m {u} {v}\n'
body+=''' have hf0 (k : ℕ) := (beta_fall_smallMCA9 k).1
 have hf1 (k : ℕ) := (beta_fall_smallMCA9 k).2.1
 have hf2 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.1
 have hf3 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.1
 have hf4 (k : ℕ) := (beta_fall_smallMCA9 k).2.2.2.2
 norm_num only [Nat.reduceAdd,Nat.add_zero,Nat.zero_add,hf0,hf1,hf2,hf3,hf4,
   beta_fall_5MCA9,beta_fall_6MCA9,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at '''+' '.join(f'h{u}{v}' for u,v in sorted(fall))+'\n'
body+=' rw [beta_weighted_sum_momentsMCA9]\n unfold betaWeightedPolynomialMCA9\n linear_combination\n  '
lc=[]
for (u,v),p in sorted(fall.items()):
 coeff=p*muls(2*var(0)+j for j in range(u+v,6))
 lc.append('('+expr(coeff,['((i:ℤ)+1)','(m:ℤ)','r','H'])+f')*h{u}{v}')
body+='+\n  '.join(lc)+'\n'
body+=f'''
theorem beta_weighted_sum_positiveMCA9 (i m : ℕ) (r H : ℤ)
 (hi : 1 ≤ i) (hm : 2 ≤ m) (hr : (m:ℤ)+1 ≤ r) (hH : 3*((i:ℤ)+1)+r+4 ≤ H) :
 0 < betaWeightedSumMCA9 i m r H := by
 have hG := beta_weighted_polynomial_positiveMCA9 ((i:ℤ)+1) m r H
   (by omega) (by exact_mod_cast hm) hr hH
 have hM := beta_mass_positiveMDCB i m
 have hm0 : (0:ℤ) < m := by omega
 have hm1 : (0:ℤ) < (m:ℤ)-1 := by omega
 have hp : 0 < 2*((i:ℤ)+1)^2*(i+2)*(m:ℤ)*(m-1)*betaWeightedPolynomialMCA9 ((i:ℤ)+1) m r H*
   betaMomentMDCB i m 0 0 := by positivity
 rw [←beta_weighted_sum_clearedMCA9] at hp
 exact (mul_pos_iff_of_pos_left (by positivity : 0 < {D})).mp hp
end
end MathGKM.Markov
'''
(R/'research/MarkovTopWeightedBetaMeanMCA9.lean').write_text(body)
(O/'weighted-beta-positive-certificate.json').write_text(json.dumps(dict(shift='a=x+2,m=y+2,r=m+s+1,H=3a+r+4+z',terms=len(shifted.d),coefficients=[[list(k),str(v)] for k,v in sorted(shifted.d.items())],status='candidate algebra; separate Lean validation required'),indent=2)+'\n')
print(json.dumps(dict(lean_bytes=len(body),moments=len(fall),certificate_terms=len(shifted.d))))
