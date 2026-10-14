import MarkovSourceFinite05ef
import MarkovFifthAll26dd
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000
theorem source_word_core05ef {R : Type*} [CommRing R] (x : R) (path : List Bool) :
    ∃ w : List Bool, w.length+2=(frame path).mid.b ∧
      w.count true+1=(frame path).mid.a ∧
      (qTree16 (C x) (1 : Polynomial R) X path).2.1=wordQuotient774 x w ∧ w=sourceCore05ef path := by
  let xy := path.foldl wordPairStep774 ([false],[true])
  have hv := wordPair_fold_valid774 path initial ([false],[true])
    indices_initial wordPair_initial774
  change WordPairValid774 (frame path) xy at hv
  obtain ⟨lb,hb,la,ha,⟨l,hl⟩,⟨z,hz⟩⟩ := hv
  refine ⟨l++z,?_,?_,?_,?_⟩
  · have h := (indices_frame path).2.1
    simp [hl,hz] at lb hb
    simp only [List.length_append]
    omega
  · have h := (indices_frame path).1
    simp [hl,hz] at la ha
    simp only [List.count_append]
    omega
  · rw [quotient_scaling16]
    simp only [one_mul]
    rw [quotient_matrix16]
    have he := wordPair_matrices774 (C x*X) X path ([false],[true])
    simp only [wordMat774,Bool.false_eq_true,if_false,if_true,mm_one_right774] at he
    change (wordMat774 (C x*X) X xy.1,wordMat774 (C x*X) X xy.2)=_ at he
    rw [← he]
    change (mm16 (wordMat774 (C x*X) X xy.1) (wordMat774 (C x*X) X xy.2)).b=_
    rw [← wordMat_append774,hl,hz]
    simpa [List.append_assoc] using word_matrix_quotient774 x (l++z)

  · change l++z=xy.1.tail++xy.2.dropLast
    rw [hl,hz]
    simp

theorem sixth_quotient_small05ef (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (ha9 : (frame path).mid.a ≤ 9) (hb : (frame path).mid.b ≤ 19) (i : ℕ) :
 (quotientSlice774 path 5).coeff i*(quotientSlice774 path 5).coeff (i+2) ≤
 (quotientSlice774 path 5).coeff (i+1)^2 := by
 by_cases hb5 : (frame path).mid.b ≤ 5
 · rw [quotient_slice_zero725 path 5 hb5]; simp
 obtain ⟨w,hl,hc,he,hw⟩ := source_word_core05ef (X : Polynomial ℤ) path
 have hg : quinticWordGood05ef w := hw ▸ source_core_good05ef path ha ha9 hb
 cases w with
 | nil => simp at hl; omega
 | cons d w => cases w with
   | nil => simp at hl; omega
   | cons e w => cases w with
     | nil => simp at hl; omega
     | cons r w =>
       let last := endTripleE582 d e r w
       let E : ℕ := (if d then 0 else 1)+(if last.2.2 then 0 else 1)
       let F : ℕ := (if hitFE582 d e r then 1 else 0)+(if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0)
       have hg2 : quinticGood05ef (d::e::r::w).length ((d::e::r::w).count true)
         (switchesFrom5a7 d (e::r::w)) (triples4f8 d e (r::w))
         (quadsHE582 d e r w) (quadsKE582 d e r w) E F := by
         simpa [quinticWordGood05ef,E,F,last,Nat.cast_add] using hg
       have H0 := quinticGood_cast05ef _ _ _ _ _ _ E F hg2
       have H := quintic_adjacent_of_ineqE582 _ _ _ _ _ _ _ _ H0 i
       have hr : 120*quotientSlice774 path 5=quinticExprE582 (X : Polynomial ℤ)
         (d::e::r::w).length ((d::e::r::w).count true) (switchesFrom5a7 d (e::r::w))
         (triples4f8 d e (r::w)) (quadsHE582 d e r w) (quadsKE582 d e r w) E F := by
         unfold quotientSlice774
         rw [he]
         have hw := word_quinticE582 (X : Polynomial ℤ) d e r w
         dsimp only at hw
         convert hw using 1 <;> simp only [E,F,Nat.cast_add]
         all_goals congr 1 <;> split_ifs <;> norm_num
       have hr' := congrArg (Polynomial.map (Int.castRingHom ℝ)) hr
       simp only [Polynomial.map_mul,Polynomial.map_ofNat,quintic_mapE582] at hr'
       change (quinticPolyE582 _ _ _ _ _ _ E F).coeff i*(quinticPolyE582 _ _ _ _ _ _ E F).coeff (i+2) ≤
         (quinticPolyE582 _ _ _ _ _ _ E F).coeff (i+1)^2 at H
       rw [← hr'] at H
       simp only [show (120 : Polynomial ℝ)=C (120 : ℝ) by rw [_root_.map_ofNat],
         Polynomial.coeff_C_mul,Polynomial.coeff_map] at H
       change 120*((quotientSlice774 path 5).coeff i:ℝ)*(120*((quotientSlice774 path 5).coeff (i+2):ℝ)) ≤
         (120*((quotientSlice774 path 5).coeff (i+1):ℝ))^2 at H
       have H' : ((quotientSlice774 path 5).coeff i:ℝ)*((quotientSlice774 path 5).coeff (i+2):ℝ) ≤
         ((quotientSlice774 path 5).coeff (i+1):ℝ)^2 := by nlinarith
       exact_mod_cast H'

theorem sixth_quotient_all05ef (path : List Bool) (ha : 2 ≤ (frame path).mid.a) (i : ℕ) :
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
