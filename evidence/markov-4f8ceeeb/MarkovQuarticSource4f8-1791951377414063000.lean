import MarkovQuarticJet4f8
import MarkovQuarticBounds4f8
import MarkovFourth5a7

/-! Machine-authored request 4f8ceeeb. Exact quartic source bridge and
fifth upper diagonal for source numerator at least nine. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

theorem triples_bound4f8 (e r : Bool) (w : List Bool) :
 triples4f8 e r w ≤ (r::w).count false := by
 induction w generalizing e r with
 | nil => simp [triples4f8]
 | cons z zs ih =>
   have h := ih r z
   cases e <;> cases r <;> cases z <;> simp [triples4f8,List.count_cons] at h ⊢ <;> omega

theorem quartic_source_formula4f8 (path : List Bool) (ha : 9 ≤ (frame path).mid.a) :
 ∃ n m s t : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧
   8 ≤ m ∧ m ≤ n ∧ s ≤ 2*(n-m) ∧ t ≤ n-m ∧
   24*quotientSlice774 path 4=quarticExpr4f8 (X : Polynomial ℤ) n m s t := by
 obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
 cases w with
 | nil => simp at hc; omega
 | cons e w =>
   cases w with
   | nil => cases e <;> simp at hc <;> omega
   | cons r w =>
     refine ⟨(e::r::w).length,(e::r::w).count true,
       switchesFrom5a7 e (r::w),triples4f8 e r w,hl,hc,by omega,
       List.count_le_length,switches_core_bound5a7 e (r::w),?_,?_⟩
     · have ht := triples_bound4f8 e r w
       have hb := bool_counts5a7 (e::r::w)
       cases e <;> simp only [List.count_cons,Bool.false_eq_true,Bool.true_eq_false,
         if_false,if_true] at hb ⊢ <;> omega
     · unfold quotientSlice774
       rw [he]
       exact word_quartic4f8 (X : Polynomial ℤ) e r w

def quarticPoly4f8 (n m s t : ℝ) : Polynomial ℝ :=
 C (qa4f8 m)+C (qb4f8 n m s t)*X+C (qc4f8 n m s)*X^2+
 C (qd4f8 n m)*X^3+C (qe4f8 n)*X^4

theorem quartic_map4f8 (n m s t : ℕ) :
 (quarticExpr4f8 (X : Polynomial ℤ) n m s t).map (Int.castRingHom ℝ)=
 quarticPoly4f8 n m s t := by
 simp [quarticExpr4f8,quarticPoly4f8,qa4f8,qb4f8,qc4f8,qd4f8,qe4f8,
   _root_.map_natCast,_root_.map_ofNat]

theorem quartic_poly_adjacent4f8 (n m s t : ℝ) (hm : 8 ≤ m) (hn : m ≤ n)
 (hs : 0 ≤ s) (hsu : s ≤ 2*(n-m)) (ht : 0 ≤ t) (htu : t ≤ n-m) (i : ℕ) :
 (quarticPoly4f8 n m s t).coeff i*(quarticPoly4f8 n m s t).coeff (i+2) ≤
   (quarticPoly4f8 n m s t).coeff (i+1)^2 := by
 obtain ⟨h1,h2,h3⟩ := quartic_inequalities4f8 n m s t hm hn hs hsu ht htu
 by_cases hi : i ≤ 2
 · interval_cases i <;> simpa [quarticPoly4f8] using (by assumption)
 · have hz : (quarticPoly4f8 n m s t).coeff (i+2)=0 := by
     simp [quarticPoly4f8,Polynomial.coeff_C,show i+2≠0 by omega,
       show i+2≠1 by omega,show i+2≠2 by omega,show i+2≠3 by omega,
       show i+2≠4 by omega,show 1≠i+2 by omega,show 2≠i+2 by omega,
       show 3≠i+2 by omega,show 4≠i+2 by omega]
   rw [hz,mul_zero]
   positivity

theorem fifth_quotient_adjacent4f8 (path : List Bool) (ha : 9 ≤ (frame path).mid.a)
 (i : ℕ) :
 (quotientSlice774 path 4).coeff i*(quotientSlice774 path 4).coeff (i+2) ≤
 (quotientSlice774 path 4).coeff (i+1)^2 := by
 obtain ⟨n,m,s,t,_,_,hm,hn,hs,ht,he⟩ := quartic_source_formula4f8 path ha
 have hs' : (s:ℝ) ≤ 2*((n:ℝ)-m) := by exact_mod_cast (by simpa [Nat.cast_sub hn] using (show (s:ℝ) ≤ 2*((n-m:ℕ):ℝ) by exact_mod_cast hs))
 have ht' : (t:ℝ) ≤ (n:ℝ)-m := by
   simpa [Nat.cast_sub hn] using (show (t:ℝ) ≤ ((n-m:ℕ):ℝ) by exact_mod_cast ht)
 have h := quartic_poly_adjacent4f8 n m s t (by exact_mod_cast hm)
   (by exact_mod_cast hn) (by positivity) hs' (by positivity) ht' i
 have he' := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
 simp only [Polynomial.map_mul,Polynomial.map_ofNat,quartic_map4f8] at he'
 rw [← he'] at h
 simp only [show (24 : Polynomial ℝ)=C (24 : ℝ) by norm_num,
   Polynomial.coeff_C_mul,Polynomial.coeff_map] at h
 have hh : ((quotientSlice774 path 4).coeff i:ℝ)*
     ((quotientSlice774 path 4).coeff (i+2):ℝ) ≤ ((quotientSlice774 path 4).coeff (i+1):ℝ)^2 := by
   nlinarith
 exact_mod_cast hh

theorem fifth_raw_logConcave4f8 (path : List Bool) (ha : 9 ≤ (frame path).mid.a)
 (i j : ℕ) (hd : i+j+6=(frame path).mid.a+(frame path).mid.b-1) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have hb := (frame_reduced path).2.1
 exact upper_raw_lc_of_natural_adjacent725 path 4 i j (by omega) (by omega)
   (fifth_quotient_adjacent4f8 path ha)

#print axioms quartic_source_formula4f8
#print axioms fifth_quotient_adjacent4f8
#print axioms fifth_raw_logConcave4f8
end
end MathGKM.Markov
