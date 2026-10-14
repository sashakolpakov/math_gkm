import MarkovSmallQuartic26dd
import MarkovFiniteQuartic26dd
import MarkovRemaining6ade

/-! Machine-authored request 26dd33d6. Fifth upper diagonal: exact source
transfer of the quartic inequalities, retaining raw coefficients and zeros. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem quartic_adjacent_of_ineq26dd (n m s t : ℝ)
 (h1 : qa4f8 m*qc4f8 n m s ≤ qb4f8 n m s t^2)
 (h2 : qb4f8 n m s t*qd4f8 n m ≤ qc4f8 n m s^2)
 (h3 : qc4f8 n m s*qe4f8 n ≤ qd4f8 n m^2) (i : ℕ) :
 (quarticPoly4f8 n m s t).coeff i*(quarticPoly4f8 n m s t).coeff (i+2) ≤
 (quarticPoly4f8 n m s t).coeff (i+1)^2 := by
 by_cases hi : i ≤ 2
 · interval_cases i <;> simpa [quarticPoly4f8] using (by assumption)
 · have hz : (quarticPoly4f8 n m s t).coeff (i+2)=0 := by
     simp [quarticPoly4f8,Polynomial.coeff_C,show i≠0 by omega,show i≠1 by omega,show i≠2 by omega,show i+2≠0 by omega,
       show i+2≠1 by omega,show i+2≠2 by omega,show i+2≠3 by omega,
       show i+2≠4 by omega,show 1≠i+2 by omega,show 2≠i+2 by omega,
       show 3≠i+2 by omega,show 4≠i+2 by omega]
   rw [hz,mul_zero]
   positivity

theorem word_quartic_adjacent26dd (e r : Bool) (w : List Bool)
 (hm : 1 ≤ (e::r::w).count true) (i : ℕ) :
 let n := (e::r::w).length
 let m := (e::r::w).count true
 let s := switchesFrom5a7 e (r::w)
 let t := triples4f8 e r w
 (quarticPoly4f8 n m s t).coeff i*(quarticPoly4f8 n m s t).coeff (i+2) ≤
 (quarticPoly4f8 n m s t).coeff (i+1)^2 := by
 dsimp only
 let n := (e::r::w).length
 let m := (e::r::w).count true
 let s := switchesFrom5a7 e (r::w)
 let t := triples4f8 e r w
 change (quarticPoly4f8 n m s t).coeff i*(quarticPoly4f8 n m s t).coeff (i+2) ≤
   (quarticPoly4f8 n m s t).coeff (i+1)^2
 have hmn : m ≤ n := List.count_le_length
 have hsn : s ≤ 2*(n-m) := switches_core_bound5a7 e (r::w)
 have hsm : s ≤ 2*m := switches_true_core26dd e (r::w)
 have htn : t ≤ n-m := by
   have ht := triples_bound4f8 e r w
   have hb := bool_counts5a7 (e::r::w)
   dsimp [t,n,m]
   cases e <;> cases r <;> simp [List.count_cons,List.length_cons] at ht hb ⊢ <;> omega
 have hsn' : (s:ℝ) ≤ 2*((n:ℝ)-m) := by
   simpa [Nat.cast_sub hmn] using (show (s:ℝ) ≤ 2*((n-m:ℕ):ℝ) by exact_mod_cast hsn)
 have htn' : (t:ℝ) ≤ (n:ℝ)-m := by
   simpa [Nat.cast_sub hmn] using (show (t:ℝ) ≤ ((n-m:ℕ):ℝ) by exact_mod_cast htn)
 by_cases hm6 : 6 ≤ m
 · exact quartic_poly_adjacent4f8 n m s t (by exact_mod_cast hm6)
     (by exact_mod_cast hmn) (by positivity) hsn' (by positivity) htn' i
 · have hh : qa4f8 m*qc4f8 n m s ≤ qb4f8 n m s t^2 ∧
       qb4f8 n m s t*qd4f8 n m ≤ qc4f8 n m s^2 ∧
       qc4f8 n m s*qe4f8 n ≤ qd4f8 n m^2 := by
     by_cases hn : 10 ≤ n
     · exact small_quartic_inequalities26dd n m s t hm (by omega)
         (by exact_mod_cast hn) (by positivity) (by exact_mod_cast hsm)
         (by positivity) htn'
     · exact quarticGood_cast26dd n m s t (short_quartic26dd e r w (by omega))
   exact quartic_adjacent_of_ineq26dd n m s t hh.1 hh.2.1 hh.2.2 i

theorem fifth_quotient_adjacent26dd (path : List Bool) (ha : 2 ≤ (frame path).mid.a)
 (i : ℕ) :
 (quotientSlice774 path 4).coeff i*(quotientSlice774 path 4).coeff (i+2) ≤
 (quotientSlice774 path 4).coeff (i+1)^2 := by
 obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
 cases w with
 | nil => simp at hc; omega
 | cons e w =>
   cases w with
   | nil =>
     have hb : (frame path).mid.b ≤ 4 := by simp only [List.length_cons,List.length_nil] at hl; omega
     rw [quotient_slice_zero725 path 4 hb]
     simp
   | cons r w =>
     have h := word_quartic_adjacent26dd e r w (by omega) i
     dsimp only at h
     have hex : 24*quotientSlice774 path 4 = quarticExpr4f8 (X : Polynomial ℤ)
       (e::r::w).length ((e::r::w).count true)
       (switchesFrom5a7 e (r::w)) (triples4f8 e r w) := by
       unfold quotientSlice774
       rw [he]
       exact word_quartic4f8 (X : Polynomial ℤ) e r w
     have hex' := congrArg (Polynomial.map (Int.castRingHom ℝ)) hex
     simp only [Polynomial.map_mul,Polynomial.map_ofNat,quartic_map4f8] at hex'
     rw [← hex'] at h
     simp only [show (24 : Polynomial ℝ)=C (24 : ℝ) by rw [_root_.map_ofNat],
       Polynomial.coeff_C_mul,Polynomial.coeff_map] at h
     change 24*((quotientSlice774 path 4).coeff i:ℝ)*(24*((quotientSlice774 path 4).coeff (i+2):ℝ)) ≤ (24*((quotientSlice774 path 4).coeff (i+1):ℝ))^2 at h
     have hh : ((quotientSlice774 path 4).coeff i:ℝ)*
       ((quotientSlice774 path 4).coeff (i+2):ℝ) ≤ ((quotientSlice774 path 4).coeff (i+1):ℝ)^2 := by nlinarith
     exact_mod_cast hh

theorem fifth_raw_logConcave26dd (path : List Bool) (i j : ℕ)
 (hr : 8 ≤ (frame path).mid.a+(frame path).mid.b-1)
 (hd : i+j+6=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases ha : 2 ≤ (frame path).mid.a
 · exact upper_raw_lc_of_natural_adjacent725 path 4 i j hr (by omega)
     (fifth_quotient_adjacent26dd path ha)
 · have ha1 : (frame path).mid.a=1 := by have hp := (frame_reduced path).1; omega
   exact (source_one_global6 path ha1).2.2 i j

theorem fifth_polygon_logConcave26dd (path : List Bool) (i j : ℕ)
 (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (hd : i+j+6=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases ha : 2 ≤ (frame path).mid.a
 · apply fifth_raw_logConcave26dd path i j ?_ hd
   by_contra hn
   obtain ⟨ha0,hab,_⟩ := frame_reduced path
   have hp' := hp.1
   generalize heqa : (frame path).mid.a=a at *
   generalize heqb : (frame path).mid.b=b at *
   have ha3 : a ≤ 3 := by omega
   have hb6 : b ≤ 6 := by omega
   have hi1 : i ≤ 1 := by omega
   have hj1 : j ≤ 1 := by omega
   interval_cases a <;> interval_cases b <;> interval_cases i <;>
     interval_cases j <;> norm_num at *
 · have ha1 : (frame path).mid.a=1 := by have h := (frame_reduced path).1; omega
   exact (source_one_global6 path ha1).2.2 i j

/-- All valid triples in the first five upper diagonals, unbounded source paths. -/
theorem first_five_polygon_logConcave26dd (path : List Bool) (r i j : ℕ)
 (hr : r ≤ 4)
 (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 by_cases h : r ≤ 3
 · exact first_four_polygon_logConcave5a7 path r i j h hp hd
 · exact fifth_polygon_logConcave26dd path i j hp (by have : r=4 := by omega; omega)

#print axioms word_quartic_adjacent26dd
#print axioms fifth_quotient_adjacent26dd
#print axioms fifth_raw_logConcave26dd
#print axioms fifth_polygon_logConcave26dd
#print axioms first_five_polygon_logConcave26dd
end
end MathGKM.Markov
