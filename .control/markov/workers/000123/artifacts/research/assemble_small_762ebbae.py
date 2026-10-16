"""Machine-authored finite-family and universal-path third-column assembly."""
from pathlib import Path
from math import gcd
from experiment_8833 import path_for
R=Path('/Users/sasha/math_gkm')
pairs=[(t,a) for t in range(1,6) for a in range(4,7) if t<a and gcd(t,a)==1]
imports=[]
for t,a in pairs:
 imports += [f'MarkovThirdSmallLC{a}{a-t}M762', f'MarkovThirdRight{a}_{2*a-t}M762']
s='\n'.join('import '+m for m in imports)+'''
import MarkovThirdLargeSourceM762
/-! Machine-authored 762ebbae. Third column for every path with numerator at least four. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 7000000

theorem small_vertical_third_rightM762 (rest : List Bool)
 (hlo : 4≤(frame rest).mid.b) (hhi : (frame rest).mid.b≤6) (j : ℕ) :
 coeff (frame (true::rest)).mid.p 3 j*coeff (frame (true::rest)).mid.p 3 (j+2) ≤
 coeff (frame (true::rest)).mid.p 3 (j+1)^2 := by
 by_cases hj : j ≤ (frame (true::rest)).mid.a+(frame (true::rest)).mid.b-1
 · obtain ⟨ha0,hab,hc⟩ := frame_reduced rest
   have hi := source_vertical_indicesMDE6 0 rest
   simp only [List.replicate_zero,List.nil_append,Nat.zero_add,mul_one] at hi
   rw [hi.1,hi.2] at hj
   generalize hea : (frame rest).mid.a=a at *
   generalize heb : (frame rest).mid.b=b at *
   have ha5 : a≤5 := by omega
   interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
'''
for t,a in pairs:
 w='['+','.join('true' if x else 'false' for x in path_for(t,a))+']'
 s+=f'''   · have hp : rest={w} := frame_path_injective_098
       (hea.trans (by decide)) (heb.trans (by decide))
     subst rest
     exact small_v3lc_{a}_{2*a-t}M762 j hj
'''
s+=''' · have hz := raw_outside_polygon18 (true::rest) 3 j (by unfold InPolygon; omega)
   rw [hz,zero_mul]; exact sq_nonneg _

theorem vertical_third_four_to_sixM762 (path : List Bool)
 (ha : 4≤(frame path).mid.a) (hb : (frame path).mid.a≤6) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩|⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · have hi := (source_vertical_indicesMDE6 n rest).1
   by_cases hn : n=0
   · subst n
     simpa using small_vertical_third_rightM762 rest (by omega) (by omega) j
   obtain ⟨ha0,hab,hc⟩ := frame_reduced rest
   generalize hea : (frame rest).mid.a=a at *
   generalize heb : (frame rest).mid.b=b at *
   have ha5 : a≤5 := by omega
   have hb4 : 4≤b := by omega
   have hb6 : b≤6 := by omega
   interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
'''
for t,a in pairs:s+=f'   · exact sThird{a}{a-t}rawM762 n (by omega) rest hea heb j\n'
s+='''
theorem vertical_third_ge_fourM762 (path : List Bool)
 (ha : 4≤(frame path).mid.a) (j : ℕ) :
 coeff (frame path).mid.p 3 j*coeff (frame path).mid.p 3 (j+2) ≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 by_cases hb : 7≤(frame path).mid.a
 · exact vertical_third_largeM762 path hb j
 · exact vertical_third_four_to_sixM762 path ha (by omega) j
end
end MathGKM.Markov
'''
(R/'research/MarkovThirdGeFourM762.lean').write_text(s)
print('Assembly candidate written')
