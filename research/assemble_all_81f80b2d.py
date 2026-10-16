"""Machine-authored all-source strip and exact residual candidates."""
from pathlib import Path
import re
pairs=[(2,3),(3,4),(3,5),(4,5),(4,7),(5,6),(5,7),(5,8),(6,7),(7,8)]
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 18000
set_option linter.unusedSimpArgs false
'''
src='\n'.join(f'import MarkovSmallHorizontal{a}_{b}M9E1' for a,b in pairs)+'\nimport MarkovUnique098\n'+head
paths={}
for a,b in pairs:
 s=Path(f'research/MarkovSmallHorizontal{a}_{b}M9E1.lean').read_text()
 path=re.search(r'Bivariate.swap \(frame (\[.*?\])\)',s).group(1);paths[a,b]=path
 src+=f'''theorem high_small_{a}_{b}M81F (i : ℕ) (hi : i ≤ {a+b-1}) :
 coeff (frame {path}).mid.p i 2*coeff (frame {path}).mid.p i 4 ≤ coeff (frame {path}).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_{a}_{b}M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
'''
src+='''theorem source_high_smallM81F (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : (frame path).mid.b ≤ 8) (hs : (frame path).mid.b < 2*(frame path).mid.a)
 (i : ℕ) (hi : i ≤ (frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hc⟩ := frame_reduced path
 generalize hea : (frame path).mid.a=a at *
 generalize heb : (frame path).mid.b=b at *
 have ha7 : a ≤ 7 := by omega
 have hb0 : 3 ≤ b := by omega
 interval_cases a <;> interval_cases b <;> norm_num [Nat.Coprime] at *
'''
for a,b in pairs:
 src+=f''' · have hp : path={paths[a,b]} := frame_path_injective_098
     (hea.trans (by decide)) (heb.trans (by decide))
   subst path
   exact high_small_{a}_{b}M81F i hi
'''
src+='end\nend MathGKM.Markov\n';Path('research/MarkovHighSmallM81F.lean').write_text(src)
a='(frame path).mid.a';b='(frame path).mid.b'
stats=[f'(2*{a}-{b}:ℕ)',f'(min ({b}-{a}) (3*{a}-{b}):ℕ)',f'(3*{a}-2*{b}:ℕ)',f'(h4vM511 {a} {b})',f'(h4wM511 {a} {b})',f'(h4zM511 {a} {b})']
src='import MarkovHighCoefficientsM81F\nimport MarkovHighGapM81F\nimport MarkovHighTransferM81F\nimport MarkovHighSmallM81F\nimport MarkovNextAllM570\n'+head+'attribute [local irreducible] frame coeff\n'
src+=f'''theorem source_high_interiorM81F (path : List Bool) (k l : ℕ)
 (ha : 3 ≤ {a}) (hb : 9 ≤ {b}) (hs : {b} ≤ 2*{a})
 (hbl : {b}=k+l+2) (hl : 2 ≤ l) :
 coeff (frame path).mid.p ({a}-1+k) 2*coeff (frame path).mid.p ({a}-1+k) 4 ≤
 coeff (frame path).mid.p ({a}-1+k) 3^2 := by
 have h2 := source_high2_scaledM81F path k l ha hb hbl hl
 have h3 := source_high3_scaledM81F path k l ha hb hbl hl
 have h4 := source_high4_scaledM81F path k l ha hb hbl hl
 have hg := high_source_gapM81F {a} {b} k l
   (Nat.le_of_lt (frame_reduced path).2.1) hs hbl hl (by omega)
 have h := high_transferM81F {a} k l {' '.join(stats)} ((k+l).choose k)
   (coeff (frame path).mid.p ({a}-1+k) 2)
   (coeff (frame path).mid.p ({a}-1+k) 3)
   (coeff (frame path).mid.p ({a}-1+k) 4)
   (by positivity) (by exact_mod_cast hl) (by exact_mod_cast (show 7 ≤ k+l by omega)) h2 h3 h4 hg
 exact_mod_cast h

theorem source_strip_fullM81F (path : List Bool) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases hs : 2*{a} ≤ {b}
 · exact source_strip_halfconeM570 path hs i
 have ha2 : 2 ≤ {a} := by omega
 by_cases hi : i<{a}-1
 · have hz := raw_outside_polygon18 path i 2 (by
     intro hp
     have h := hp.1
     have hm := Nat.mul_le_mul_left {b} (show i+2 ≤ {a} by omega)
     nlinarith)
   rw [hz,zero_mul]; exact sq_nonneg _
 by_cases ht : {a}+{b}-1 < i+4
 · have hz := raw_outside_polygon18 path i 4 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 by_cases hb : 9 ≤ {b}
 · let k := i-({a}-1)
   let l := {b}-2-k
   have he : {a}-1+k=i := by dsimp [k]; omega
   have hl : 2 ≤ l := by dsimp [l,k]; omega
   have hbl : {b}=k+l+2 := by dsimp [l,k]; omega
   simpa only [he] using source_high_interiorM81F path k l (by omega) hb (by omega) hbl hl
 · exact source_high_smallM81F path ha2 (by omega) (by omega) i (by omega)
end
end MathGKM.Markov
'''
Path('research/MarkovHighAllM81F.lean').write_text(src)
src=Path('research/MarkovResidualHalfM570.lean').read_text()
definition=src[src.index('def InteriorCore63HalfM570'):src.index('theorem root_iff')]
definition=definition.replace('InteriorCore63HalfM570','InteriorCore63M81F').replace('2 ≤ j →','3 ≤ j →').replace('   (j=2 → m.b<2*m.a) →\n','')
src='import MarkovHighAllM81F\nimport MarkovResidualHalfM570\n'+head+'attribute [local irreducible] frame coeff\n'+definition+'''
theorem root_iff_interiorM81F : Conjecture63 ↔ InteriorCore63M81F := by
 rw [root_iff_interior_halfM570]
 constructor
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   exact ⟨hh,fun i j h0 h1 h2 ht hi hj => hv i j h0 h1 h2 ht hi (by omega) (by omega),hd⟩
 · intro h path
   dsimp only
   intro ha
   obtain ⟨hh,hv,hd⟩ := h path ha
   refine ⟨hh,?_,hd⟩
   intro i j h0 h1 h2 ht hi hj _
   by_cases hj2 : j=2
   · subst j
     exact source_strip_fullM81F path i
   · exact hv i j h0 h1 h2 ht hi (by omega)
end
end MathGKM.Markov
'''
Path('research/MarkovResidualM81F.lean').write_text(src)
print('Generated finite exceptions, source assembly and exact residual')
