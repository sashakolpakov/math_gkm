"""Machine-authored exact transfer generator; all resulting Lean is checked."""
from pathlib import Path
s='''import MarkovSourceFinite05ef
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000
'''
t=Path('research/MarkovWords774.lean').read_text()
t=t[t.index('theorem source_word774'):t.index('#print axioms source_word774')]
t=t.replace('source_word774','source_word_core05ef').replace('wordQuotient774 x w := by','wordQuotient774 x w ∧ w=sourceCore05ef path := by')
t=t.replace('⟨l++z,?_,?_,?_⟩','⟨l++z,?_,?_,?_,?_⟩')
t+='''  · change l++z=xy.1.tail++xy.2.dropLast
    rw [hl,hz]
    simp

'''
s+=t
t=Path('research/MarkovSixthLongE582.lean').read_text()
t=t[t.index('theorem sixth_quotient_longE582'):t.index('theorem sixth_raw_longE582')]
t=t.replace('sixth_quotient_longE582','sixth_quotient_small05ef').replace('(hb : 20 ≤ (frame path).mid.b)','(ha9 : (frame path).mid.a ≤ 9) (hb : (frame path).mid.b ≤ 19)')
t=t.replace('obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path','''by_cases hb5 : (frame path).mid.b ≤ 5
 · rw [quotient_slice_zero725 path 5 hb5]; simp
 obtain ⟨w,hl,hc,he,hw⟩ := source_word_core05ef (X : Polynomial ℤ) path
 have hg : quinticWordGood05ef w := hw ▸ source_core_good05ef path ha ha9 hb''')
t=t.replace('have H := word_quintic_adjacent_longE582 d e r w (by omega) (by omega) i\n       dsimp only at H','''have H0 := quinticGood_cast05ef _ _ _ _ _ _ _ _ hg
       have H := quintic_adjacent_of_ineqE582 _ _ _ _ _ _ _ _ H0 i
       dsimp only at H''')
s+=t
s+='''theorem sixth_quotient_all05ef (path : List Bool) (ha : 2 ≤ (frame path).mid.a) (i : ℕ) :
 (quotientSlice774 path 5).coeff i*(quotientSlice774 path 5).coeff (i+2) ≤
 (quotientSlice774 path 5).coeff (i+1)^2 := by
 by_cases hb : 20 ≤ (frame path).mid.b
 · exact sixth_quotient_longE582 path ha hb i
 by_cases ha10 : 10 ≤ (frame path).mid.a
 · exact sixth_quotient_adjacentE582 path ha10 i
 exact sixth_quotient_small05ef path ha (by omega) (by omega) i

theorem sixth_raw05ef (path : List Bool) (i j : ℕ)
 (hr : 10 ≤ (frame path).mid.a+(frame path).mid.b-1)
 (hd : i+j+7=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases ha : 2 ≤ (frame path).mid.a
 · exact upper_raw_lc_of_natural_adjacent725 path 5 i j hr (by omega)
     (sixth_quotient_all05ef path ha)
 · have ha1 : (frame path).mid.a=1 := by have hp := (frame_reduced path).1; omega
   exact (source_one_global6 path ha1).2.2 i j

theorem sixth_polygon05ef (path : List Bool) (i j : ℕ)
 (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (hd : i+j+7=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases ha : 2 ≤ (frame path).mid.a
 · apply sixth_raw05ef path i j ?_ hd
   by_contra hn
   obtain ⟨ha0,hab,hc⟩ := frame_reduced path
   have hp' := hp.1
   generalize heqa : (frame path).mid.a=a at *
   generalize heqb : (frame path).mid.b=b at *
   have ha4 : a ≤ 4 := by omega
   have hb8 : b ≤ 8 := by omega
   have hi2 : i ≤ 2 := by omega
   have hj2 : j ≤ 2 := by omega
   interval_cases a <;> interval_cases b <;> interval_cases i <;>
     interval_cases j <;> norm_num [Nat.Coprime] at *
 · have ha1 : (frame path).mid.a=1 := by have h := (frame_reduced path).1; omega
   exact (source_one_global6 path ha1).2.2 i j

theorem first_six_raw05ef (path : List Bool) (r i j : ℕ) (hr : r ≤ 5)
 (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases h4 : r ≤ 4
 · exact first_five_raw_logConcave26dd path r i j h4 hd
 have h5 : r=5 := by omega
 by_cases hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2)
 · exact sixth_polygon05ef path i j hp (by omega)
 · rw [raw_outside_polygon18 path i (j+2) hp,zero_mul]
   exact sq_nonneg _

#print axioms source_word_core05ef
#print axioms sixth_quotient_all05ef
#print axioms first_six_raw05ef
end
end MathGKM.Markov
'''
s=s.replace('import MarkovSourceFinite05ef','import MarkovSourceFinite05ef\nimport MarkovFifthAll26dd')
Path('research/MarkovSixthAll05ef.lean').write_text(s)
