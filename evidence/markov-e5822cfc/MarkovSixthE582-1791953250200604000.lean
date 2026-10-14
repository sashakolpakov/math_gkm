import MarkovQuinticSourceE582
import MarkovQuinticBoundsE582

/-! Machine-authored request e5822cfc. Sixth upper diagonal for a>=10. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 8000
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def quinticPolyE582 (n m s t h k e f : ℝ) : Polynomial ℝ :=
 C (qaE582 m)+C (qbE582 n m s t h e)*X+C (qcE582 n m s t k e f)*X^2+
 C (qdE582 n m s)*X^3+C (qeE582 n m)*X^4+C (qfE582 n)*X^5

theorem quintic_mapE582 (n m s t h k e f : ℕ) :
 (quinticExprE582 (X : Polynomial ℤ) n m s t h k e f).map (Int.castRingHom ℝ)=
 quinticPolyE582 n m s t h k e f := by
 simp [quinticExprE582,quinticPolyE582,qaE582,qbE582,qcE582,qdE582,qeE582,qfE582,
   _root_.map_natCast,_root_.map_ofNat]
 ring

theorem quintic_poly_adjacentE582 (n m s t h k e f : ℝ)
 (hm : 9 ≤ m) (hn : m ≤ n)
 (hs : 0 ≤ s) (hsu : s ≤ 2*(n-m))
 (ht : 0 ≤ t) (htu : t ≤ n-m)
 (hh : 0 ≤ h) (hhu : h ≤ n-m)
 (hk : 0 ≤ k) (hku : k ≤ 2*(n-m))
 (he : 0 ≤ e) (heu : e ≤ 2) (hf : 0 ≤ f) (hfu : f ≤ 2) (i : ℕ) :
 (quinticPolyE582 n m s t h k e f).coeff i*(quinticPolyE582 n m s t h k e f).coeff (i+2) ≤
 (quinticPolyE582 n m s t h k e f).coeff (i+1)^2 := by
 obtain ⟨h1,h2,h3,h4⟩ := quintic_inequalitiesE582 n m s t h k e f
   hm hn hs hsu ht htu hh hhu hk hku he heu hf hfu
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

theorem sixth_quotient_adjacentE582 (path : List Bool) (ha : 10 ≤ (frame path).mid.a)
 (i : ℕ) :
 (quotientSlice774 path 5).coeff i*(quotientSlice774 path 5).coeff (i+2) ≤
 (quotientSlice774 path 5).coeff (i+1)^2 := by
 obtain ⟨n,m,s,t,h,k,e,f,_,_,hm,hn,hs,ht,hh,hk,he,hf,hr⟩ := quintic_source_formulaE582 path ha
 have hs' : (s:ℝ) ≤ 2*((n:ℝ)-m) := by
   simpa [Nat.cast_sub hn] using (show (s:ℝ) ≤ 2*((n-m:ℕ):ℝ) by exact_mod_cast hs)
 have ht' : (t:ℝ) ≤ (n:ℝ)-m := by
   simpa [Nat.cast_sub hn] using (show (t:ℝ) ≤ ((n-m:ℕ):ℝ) by exact_mod_cast ht)
 have hh' : (h:ℝ) ≤ (n:ℝ)-m := by
   simpa [Nat.cast_sub hn] using (show (h:ℝ) ≤ ((n-m:ℕ):ℝ) by exact_mod_cast hh)
 have hk' : (k:ℝ) ≤ 2*((n:ℝ)-m) := by
   simpa [Nat.cast_sub hn] using (show (k:ℝ) ≤ 2*((n-m:ℕ):ℝ) by exact_mod_cast hk)
 have H := quintic_poly_adjacentE582 n m s t h k e f (by exact_mod_cast hm)
   (by exact_mod_cast hn) (by positivity) hs' (by positivity) ht'
   (by positivity) hh' (by positivity) hk' (by positivity) (by exact_mod_cast he)
   (by positivity) (by exact_mod_cast hf) i
 have hr' := congrArg (Polynomial.map (Int.castRingHom ℝ)) hr
 simp only [Polynomial.map_mul,Polynomial.map_ofNat,quintic_mapE582] at hr'
 rw [← hr'] at H
 simp only [show (120 : Polynomial ℝ)=C (120 : ℝ) by rw [_root_.map_ofNat],
   Polynomial.coeff_C_mul,Polynomial.coeff_map] at H
 change 120*((quotientSlice774 path 5).coeff i:ℝ)*(120*((quotientSlice774 path 5).coeff (i+2):ℝ)) ≤
   (120*((quotientSlice774 path 5).coeff (i+1):ℝ))^2 at H
 have H' : ((quotientSlice774 path 5).coeff i:ℝ)*((quotientSlice774 path 5).coeff (i+2):ℝ) ≤
   ((quotientSlice774 path 5).coeff (i+1):ℝ)^2 := by nlinarith
 exact_mod_cast H'

theorem sixth_raw_logConcaveE582 (path : List Bool) (ha : 10 ≤ (frame path).mid.a)
 (i j : ℕ) (hd : i+j+7=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have hb := (frame_reduced path).2.1
 exact upper_raw_lc_of_natural_adjacent725 path 5 i j (by omega) (by omega)
   (sixth_quotient_adjacentE582 path ha)

#print axioms sixth_quotient_adjacentE582
#print axioms sixth_raw_logConcaveE582
end
end MathGKM.Markov
