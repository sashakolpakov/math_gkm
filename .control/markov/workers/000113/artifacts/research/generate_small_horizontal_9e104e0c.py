"""Machine-authored explicit finite source proofs; all numeric claims checked by Lean."""
from pathlib import Path
from math import gcd
from experiment_8833 import source,path_for
R=Path('/Users/sasha/math_gkm')
fractions=[(a,b) for a in range(2,8) for b in range(a+1,9) if gcd(a,b)==1]
def word(p):return '['+','.join('true' if t else 'false' for t in p)+']'
def row(p,j):return '+'.join(f'{v}*X^{i}' for (i,k),v in sorted(p.items()) if k==j) or '0'
modules=[]
for a,b in fractions:
 w=word(path_for(a,b));_,_,p=source(path_for(a,b));n=a+b-1
 m=f'MarkovSmallHorizontal{a}_{b}M9E1';modules.append(m)
 s='import MarkovHorizontalB46\n/-! Machine-authored request 9e104e0c. Literal finite source rows, kernel arithmetic. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 4000000\nset_option maxRecDepth 12000\n'
 s+=f'theorem small_poly_{a}_{b}M9E1 : Bivariate.swap (frame {w}).mid.p=\n'
 s+=' +\n'.join(f' C ({row(p,j)})*X^{j}' for j in range(n+1))+' := by\n'
 s+=' simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,\n  Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,\n  map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]\n norm_num\n ring\n\n'
 for j in [3,4]:
  s+=f'theorem small_row_{a}_{b}_{j}M9E1 : (Bivariate.swap (frame {w}).mid.p).coeff {j}=\n {row(p,j)} := by\n rw [small_poly_{a}_{b}M9E1]\n simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]\n norm_num\n\n'
  s+=f'theorem small_lc_{a}_{b}_{j}M9E1 (i : ℕ) (hi : i ≤ {n}) :\n coeff (frame {w}).mid.p i {j}*coeff (frame {w}).mid.p (i+2) {j} ≤\n coeff (frame {w}).mid.p (i+1) {j}^2 := by\n'
  s+=f' simp only [←swap_coeff46,small_row_{a}_{b}_{j}M9E1]\n interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]\n\n'
 s+='end\nend MathGKM.Markov\n'
 (R/'research'/f'{m}.lean').write_text(s)
s=''.join(f'import {m}\n' for m in modules)+'import MarkovUnique098\n/-! Machine-authored request 9e104e0c. Finite-denominator classification via actual path uniqueness. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 4000000\n'
s+='theorem small_horizontalM9E1 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)\n (hb : (frame path).mid.b ≤ 8) (i j : ℕ) (hj : j=3 ∨ j=4)\n (hi : i ≤ (frame path).mid.a+(frame path).mid.b-1) :\n coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤\n coeff (frame path).mid.p (i+1) j^2 := by\n'
s+=' obtain ⟨ha0,hab,hc⟩ := frame_reduced path\n generalize hea : (frame path).mid.a=a at *\n generalize heb : (frame path).mid.b=b at *\n have ha8 : a ≤ 7 := by omega\n have hb0 : 3 ≤ b := by omega\n interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *\n'
for a,b in fractions:
 w=word(path_for(a,b));n=a+b-1
 s+=f' · have hp : path={w} := frame_path_injective_098\n     (hea.trans (by decide)) (heb.trans (by decide))\n   subst path\n   rcases hj with rfl|rfl\n   · exact small_lc_{a}_{b}_3M9E1 i hi\n   · exact small_lc_{a}_{b}_4M9E1 i hi\n'
s+='\nend\nend MathGKM.Markov\n'
(R/'research/MarkovSmallHorizontalM9E1.lean').write_text(s)
print(modules)
