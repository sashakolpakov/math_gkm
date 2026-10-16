"""Machine-authored all-source assembly candidate for b>=2a."""
from pathlib import Path
R=Path('research')
src='''import MarkovMiddleAllM570
import MarkovNextCoefficientsM570
import MarkovNextTransferM570
import MarkovStripAllMCE8
import MarkovSmallHorizontal2_5M9E1
import MarkovSmallHorizontal3_7M9E1
import MarkovSmallHorizontal3_8M9E1
/-! Machine-authored 5703599b. Raw vertical row-two strip for b>=2a. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 12000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
'''
for a,b,path in [(2,5,'[false,true]'),(3,7,'[false,true,true]'),(3,8,'[false,true,false]')]:
 src+=f'''theorem next_small_{a}_{b}M570 (i : ℕ) (hi : i ≤ {a+b-1}) :
 coeff (frame {path}).mid.p i 2*coeff (frame {path}).mid.p i 4 ≤
 coeff (frame {path}).mid.p i 3^2 := by
 simp only [←swap_coeff46,small_poly_{a}_{b}M9E1]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 interval_cases i <;> norm_num [Polynomial.coeff_one,Polynomial.coeff_X]
'''
src+='attribute [local irreducible] frame coeff\n'
old=(R/'MarkovMiddleAllM570.lean').read_text()
s=old[old.index('theorem source_middle_interiorM570'):old.index('theorem source_strip_thirdconeM570')]
for x,y in [('source_middle_interiorM570','source_next_interiorM570'),('3*(frame path).mid.a ≤','2*(frame path).mid.a ≤'),('≤ 4*(frame path).mid.a','≤ 3*(frame path).mid.a'),('source_strip_scaledMB9D','source_strip_scaledMCE8'),('source_middle_four_scaledM570','source_next_four_scaledM570'),('strip_middle_gap_nonnegM570','strip_next_gap_nonnegM570'),('strip_middle_transferM570','strip_next_transferM570'),('4*(frame path).mid.a-','3*(frame path).mid.a-')]:s=s.replace(x,y)
src+=s
src+='''theorem source_strip_halfconeM570 (path : List Bool)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 2*coeff (frame path).mid.p i 4 ≤ coeff (frame path).mid.p i 3^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases hu : 3*(frame path).mid.a ≤ (frame path).mid.b
 · exact source_strip_thirdconeM570 path hu i
 by_cases ha1 : (frame path).mid.a=1
 · simpa using (source_one_global6 path ha1).2.1 i 2
 have ha : 2 ≤ (frame path).mid.a := by omega
 have hstrict : 2*(frame path).mid.a < (frame path).mid.b := by
   by_contra hn
   have he : (frame path).mid.b=2*(frame path).mid.a := by omega
   have hc := hcop.of_dvd_right (show (frame path).mid.a ∣ (frame path).mid.b by rw [he]; exact dvd_mul_left _ _)
   have : (frame path).mid.a=1 := Nat.coprime_self.mp hc
   omega
 by_cases hb : 9 ≤ (frame path).mid.b
 · by_cases hi : i<(frame path).mid.a
   · have hz := raw_outside_polygon18 path i 2 (by
       intro hp
       have h := hp.1
       have hm := Nat.mul_le_mul_left (frame path).mid.b (show i+1 ≤ (frame path).mid.a by omega)
       nlinarith)
     rw [hz,zero_mul]; exact sq_nonneg _
   by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+4
   · have hz := raw_outside_polygon18 path i 4 (by unfold InPolygon; omega)
     rw [hz,mul_zero]; exact sq_nonneg _
   let k := i-(frame path).mid.a
   let l := (frame path).mid.b-2-k
   have he : (frame path).mid.a+k=i := by dsimp [k]; omega
   have hl : 3 ≤ l := by dsimp [l,k]; omega
   have hbl : (frame path).mid.b=k+l+2 := by dsimp [l,k]; omega
   simpa only [he] using source_next_interiorM570 path k l ha hb hs (by omega) hbl hl
 · have hc : ((frame path).mid.a=2 ∧ (frame path).mid.b=5) ∨
     ((frame path).mid.a=3 ∧ (frame path).mid.b=7) ∨
     ((frame path).mid.a=3 ∧ (frame path).mid.b=8) := by omega
   rcases hc with ⟨ea,eb⟩|⟨ea,eb⟩|⟨ea,eb⟩
'''
for a,b,path in [(2,5,'[false,true]'),(3,7,'[false,true,true]'),(3,8,'[false,true,false]')]:
 src+=f'''   · have hp : path={path} := frame_path_injective_098
       (ea.trans (by norm_num [frame,advance,initial])) (eb.trans (by norm_num [frame,advance,initial]))
     by_cases hi : i ≤ {a+b-1}
     · subst path; exact next_small_{a}_{b}M570 i hi
     · have hz := raw_outside_polygon18 path i 2 (by unfold InPolygon; rw [ea,eb]; omega)
       rw [hz,zero_mul]; exact sq_nonneg _
'''
src+='end\nend MathGKM.Markov\n';(R/'MarkovNextAllM570.lean').write_text(src)
s=(R/'MarkovResidualM570.lean').read_text().replace('MarkovMiddleAllM570','MarkovNextAllM570').replace('InteriorCore63M570','InteriorCore63HalfM570').replace('root_iff_interiorM570','root_iff_interior_halfM570').replace('source_strip_thirdconeM570','source_strip_halfconeM570').replace('<3*','<2*').replace('3*(frame path).mid.a ≤','2*(frame path).mid.a ≤')
(R/'MarkovResidualHalfM570.lean').write_text(s)
print('All-source next-cone and residual candidates written')
