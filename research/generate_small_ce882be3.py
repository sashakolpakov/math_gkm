"""Machine-authored finite exceptional-source proof assembly."""
from pathlib import Path
cases=[(2,3,'[true]'),(2,5,'[false,true]'),(3,4,'[true,true]'),(3,5,'[true,false]'),(4,5,'[true,true,true]'),(5,6,'[true,true,true,true]')]
s=''.join(f'import MarkovSmallHorizontal{a}_{b}M9E1\n' for a,b,w in cases)+'import MarkovUnique098\n/-! Machine-authored ce882be3. All small source strip exceptions. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 6000000\nset_option maxRecDepth 15000\n'
for a,b,w in cases:
 s+=f'''\ntheorem small_strip_{a}_{b}MCE8 (i : ℕ) (hi : i ≤ {a+b-1}) :
 coeff (frame {w}).mid.p i 1*coeff (frame {w}).mid.p i 3 ≤ coeff (frame {w}).mid.p i 2^2 := by
 simp only [←swap_coeff46,small_poly_{a}_{b}M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
'''
s+='''
theorem source_strip_smallMCE8 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : (frame path).mid.b ≤ 6) (i : ℕ) (hi : i ≤ (frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i 1*coeff (frame path).mid.p i 3 ≤ coeff (frame path).mid.p i 2^2 := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a=a at *
 generalize heb : (frame path).mid.b=b at *
 have ha6 : a ≤ 5 := by omega
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
'''
for a,b,w in cases:
 s+=f''' · have hp : path={w} := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact small_strip_{a}_{b}MCE8 i hi
'''
s+='end\nend MathGKM.Markov\n'
Path('research/MarkovStripSmallMCE8.lean').write_text(s)
