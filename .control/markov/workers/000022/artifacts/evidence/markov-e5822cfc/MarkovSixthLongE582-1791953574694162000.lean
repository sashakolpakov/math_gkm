import MarkovSixthE582
import MarkovSmallQuinticE582
import MarkovQuinticCountsE582
import MarkovRemaining6ade
/-! Machine-authored request e5822cfc. All numerators at denominator >=20. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 8000
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

theorem quintic_adjacent_of_ineqE582 (n m s t h k e f : ℝ)
 (H : qaE582 m*qcE582 n m s t k e f ≤ qbE582 n m s t h e^2 ∧
 qbE582 n m s t h e*qdE582 n m s ≤ qcE582 n m s t k e f^2 ∧
 qcE582 n m s t k e f*qeE582 n m ≤ qdE582 n m s^2 ∧
 qdE582 n m s*qfE582 n ≤ qeE582 n m^2) (i : ℕ) :
 (quinticPolyE582 n m s t h k e f).coeff i*(quinticPolyE582 n m s t h k e f).coeff (i+2) ≤
 (quinticPolyE582 n m s t h k e f).coeff (i+1)^2 := by
 obtain ⟨h1,h2,h3,h4⟩ := H
 by_cases hi : i ≤ 3
 · interval_cases i <;> simpa [quinticPolyE582] using (by assumption)
 · have hz : (quinticPolyE582 n m s t h k e f).coeff (i+2)=0 := by
     simp [quinticPolyE582,Polynomial.coeff_C,show i≠0 by omega,show i≠1 by omega,
       show i≠2 by omega,show i+2≠0 by omega,
       show i+2≠1 by omega,show i+2≠2 by omega,show i+2≠3 by omega,
       show i+2≠4 by omega,show i+2≠5 by omega,show 1≠i+2 by omega,
       show 2≠i+2 by omega,show 3≠i+2 by omega,show 4≠i+2 by omega,show 5≠i+2 by omega]
   rw [hz,mul_zero]
   positivity

theorem word_quintic_adjacent_longE582 (d e r : Bool) (w : List Bool)
 (hm : 1 ≤ (d::e::r::w).count true) (hn : 18 ≤ (d::e::r::w).length) (i : ℕ) :
 let last := endTripleE582 d e r w
 let n := (d::e::r::w).length
 let m := (d::e::r::w).count true
 let s := switchesFrom5a7 d (e::r::w)
 let t := triples4f8 d e (r::w)
 let h := quadsHE582 d e r w
 let k := quadsKE582 d e r w
 let E : ℕ := (if d then 0 else 1)+(if last.2.2 then 0 else 1)
 let F : ℕ := (if hitFE582 d e r then 1 else 0)+(if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0)
 (quinticPolyE582 n m s t h k E F).coeff i*(quinticPolyE582 n m s t h k E F).coeff (i+2) ≤
 (quinticPolyE582 n m s t h k E F).coeff (i+1)^2 := by
 dsimp only
 let n := (d::e::r::w).length
 let m := (d::e::r::w).count true
 let s := switchesFrom5a7 d (e::r::w)
 let t := triples4f8 d e (r::w)
 let h := quadsHE582 d e r w
 let k := quadsKE582 d e r w
 let last := endTripleE582 d e r w
 let E : ℕ := (if d then 0 else 1)+(if last.2.2 then 0 else 1)
 let F : ℕ := (if hitFE582 d e r then 1 else 0)+(if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0)
 change (quinticPolyE582 n m s t h k E F).coeff i*(quinticPolyE582 n m s t h k E F).coeff (i+2) ≤
   (quinticPolyE582 n m s t h k E F).coeff (i+1)^2
 have hmn : m ≤ n := List.count_le_length
 have hsn : s ≤ 2*(n-m) := switches_core_bound5a7 d (e::r::w)
 have hsm : s ≤ 2*m := switches_true_core26dd d (e::r::w)
 have htn : t ≤ n-m := by
   have ht := triples_bound4f8 d e (r::w)
   have hb := bool_counts5a7 (d::e::r::w)
   dsimp [t,n,m]
   cases d <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
 have hhn : h ≤ n-m := by
   have ht := quadsH_boundE582 d e r w
   have hb := bool_counts5a7 (d::e::r::w)
   dsimp [h,n,m]
   cases d <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
 have hkn : k ≤ 2*(n-m) := by
   have ht := quadsK_boundE582 d e r w
   have hb := bool_counts5a7 (d::e::r::w)
   dsimp [k,n,m]
   cases d <;> cases e <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
 have he : E ≤ 2 := by dsimp [E]; split_ifs <;> omega
 have hf : F ≤ 2 := by dsimp [F]; split_ifs <;> omega
 have hs' : (s:ℝ) ≤ 2*((n:ℝ)-m) := by
   simpa [Nat.cast_sub hmn] using (show (s:ℝ) ≤ 2*((n-m:ℕ):ℝ) by exact_mod_cast hsn)
 have ht' : (t:ℝ) ≤ (n:ℝ)-m := by
   simpa [Nat.cast_sub hmn] using (show (t:ℝ) ≤ ((n-m:ℕ):ℝ) by exact_mod_cast htn)
 have hh' : (h:ℝ) ≤ (n:ℝ)-m := by
   simpa [Nat.cast_sub hmn] using (show (h:ℝ) ≤ ((n-m:ℕ):ℝ) by exact_mod_cast hhn)
 have hk' : (k:ℝ) ≤ 2*((n:ℝ)-m) := by
   simpa [Nat.cast_sub hmn] using (show (k:ℝ) ≤ 2*((n-m:ℕ):ℝ) by exact_mod_cast hkn)
 apply quintic_adjacent_of_ineqE582
 by_cases hm9 : 9 ≤ m
 · exact quintic_inequalitiesE582 n m s t h k E F (by exact_mod_cast hm9)
     (by exact_mod_cast hmn) (by positivity) hs' (by positivity) ht' (by positivity) hh'
     (by positivity) hk' (by positivity) (by exact_mod_cast he) (by positivity) (by exact_mod_cast hf)
 · have htl : (n:ℝ)-3*m-2 ≤ t := by
     have ht : n ≤ t+3*m+2 := triples_lowerE582 d e r w
     have ht' : (n:ℝ) ≤ t+3*m+2 := by exact_mod_cast ht
     linarith
   have hhl : (n:ℝ)-4*m-3 ≤ h := by
     have ht : n ≤ h+4*m+3 := quadsH_lowerE582 d e r w
     have ht' : (n:ℝ) ≤ h+4*m+3 := by exact_mod_cast ht
     linarith
   exact small_quintic_inequalitiesE582 n m s t h k E F hm (by omega)
     (by exact_mod_cast hn) (by positivity) (by exact_mod_cast hsm) (by positivity) htl ht'
     (by positivity) hhl hh' (by positivity) hk' (by positivity) (by exact_mod_cast he)
     (by positivity) (by exact_mod_cast hf)

theorem sixth_quotient_longE582 (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (hb : 20 ≤ (frame path).mid.b) (i : ℕ) :
 (quotientSlice774 path 5).coeff i*(quotientSlice774 path 5).coeff (i+2) ≤
 (quotientSlice774 path 5).coeff (i+1)^2 := by
 obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
 cases w with
 | nil => simp at hl; omega
 | cons d w => cases w with
   | nil => simp at hl; omega
   | cons e w => cases w with
     | nil => simp at hl; omega
     | cons r w =>
       have H := word_quintic_adjacent_longE582 d e r w (by omega) (by omega) i
       dsimp only at H
       let last := endTripleE582 d e r w
       let E : ℕ := (if d then 0 else 1)+(if last.2.2 then 0 else 1)
       let F : ℕ := (if hitFE582 d e r then 1 else 0)+(if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0)
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

theorem sixth_raw_longE582 (path : List Bool) (hb : 20 ≤ (frame path).mid.b)
 (i j : ℕ) (hd : i+j+7=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases ha : 2 ≤ (frame path).mid.a
 · exact upper_raw_lc_of_natural_adjacent725 path 5 i j (by omega) (by omega)
     (sixth_quotient_longE582 path ha hb)
 · have ha1 : (frame path).mid.a=1 := by have hp := (frame_reduced path).1; omega
   exact (source_one_global6 path ha1).2.2 i j

#print axioms sixth_raw_longE582
end
end MathGKM.Markov
