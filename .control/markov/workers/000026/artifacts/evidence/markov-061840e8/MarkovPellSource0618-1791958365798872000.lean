import MarkovPellShear0618
import MarkovPalindrome28b1
import MarkovRightSourceF650
/-! Machine-authored 061840e8. Literal source quotient identification. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_quotient_central0618 (path : List Bool) :
 (qTree16 (C X) (1 : BiPoly) X path).2.1=
 wordQuotient774 (X : Polynomial ℤ) (central28 path) := by
 rw [quotient_scaling16]
 simp only [one_mul]
 rw [quotient_matrix16]
 have he := wordPair_matrices774 (C (X : Polynomial ℤ)*X) (X : BiPoly)
   path ([false],[true])
 simp only [wordMat774,Bool.false_eq_true,if_false,if_true,mm_one_right774] at he
 rw [← he]
 change (mm16 (wordMat774 (C (X : Polynomial ℤ)*X) (X : BiPoly) _)
   (wordMat774 (C (X : Polynomial ℤ)*X) (X : BiPoly) _)).b=_
 rw [← wordMat_append774]
 change (wordMat774 (C (X : Polynomial ℤ)*X) (X : BiPoly) (sourceWord28 path)).b=_
 rw [sourceWord_central28,word_matrix_quotient774]

theorem central_right0618 (n : ℕ) : central28 (List.replicate n true)=List.replicate n true := by
 have hs (k : ℕ) : subst28 true (List.replicate k true)=List.replicate k true := by
   induction k with
   | zero => rfl
   | succ k ih => simp [List.replicate_succ,subst28,ih]
 induction n with
 | zero => rfl
 | succ n ih => simp [List.replicate_succ,central28,ih,hs]

theorem match_row0618 (n : ℕ) :
 (List.replicate n true).foldl (rowStep774 (X : Polynomial ℤ)) (1,1)=
 matchPair0618 (U*V) U n := by
 induction n with
 | zero => rfl
 | succ n ih =>
   rw [List.replicate_succ',List.foldl_append]
   simp only [List.foldl_cons,List.foldl_nil,ih]
   simp only [rowStep774,if_true,matchPair0618,U,V]
   apply Prod.ext <;> ring

theorem right_quotient0618 (n : ℕ) :
 (qTree16 (C X) (1 : BiPoly) X (List.replicate n true)).2.1=
 (matchPair0618 (U*V) U (n+1)).2 := by
 rw [source_quotient_central0618,central_right0618]
 simp only [wordQuotient774,match_row0618,matchPair0618,U,V]
 ring

theorem right_quotient_coeff0618 (n i j : ℕ) :
 (quotientSlice774 (List.replicate n true) (i+j)).coeff i=
   ((n+1-j).choose i : ℤ)*((n-i).choose j : ℤ) := by
 unfold quotientSlice774
 rw [right_quotient0618]
 have h := match_shear_coeff0618 (n+1) i j
 have he : n+1-i-1=n-i := by omega
 simpa only [coeff,he] using h

#print axioms right_quotient0618
#print axioms right_quotient_coeff0618
end
end MathGKM.Markov
