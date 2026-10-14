import MarkovGasF80
import Mathlib.Data.List.Palindrome

/-! Machine-authored 28b112de. Exact palindrome structure of source words.
No coefficient inequality is assumed. -/
namespace MathGKM.Markov

def subst28 (r : Bool) : List Bool → List Bool
 | [] => []
 | d::w => (if d then (if r then [true] else [false,true])
     else (if r then [false,true] else [false])) ++ subst28 r w

theorem subst_append28 (r : Bool) (w z : List Bool) :
 subst28 r (w++z)=subst28 r w++subst28 r z := by
 induction w with
 | nil => rfl
 | cons d w ih => simp [subst28,ih,List.append_assoc]

theorem subst_fold28 (r : Bool) (path : List Bool) (xy : List Bool × List Bool) :
 path.foldl wordPairStep774 (subst28 r xy.1,subst28 r xy.2)=
 (subst28 r (path.foldl wordPairStep774 xy).1,
  subst28 r (path.foldl wordPairStep774 xy).2) := by
 induction path generalizing xy with
 | nil => rfl
 | cons d ds ih =>
   rw [List.foldl_cons,List.foldl_cons]
   have hs : wordPairStep774 (subst28 r xy.1,subst28 r xy.2) d =
     (subst28 r (wordPairStep774 xy d).1,subst28 r (wordPairStep774 xy d).2) := by
     cases d <;> simp [wordPairStep774,subst_append28]
   rw [hs,ih]

def sourceWord28 (path : List Bool) : List Bool :=
 let xy := path.foldl wordPairStep774 ([false],[true])
 xy.1++xy.2

theorem sourceWord_cons28 (r : Bool) (path : List Bool) :
 sourceWord28 (r::path)=subst28 r (sourceWord28 path) := by
 unfold sourceWord28
 rw [List.foldl_cons]
 have hs : wordPairStep774 ([false],[true]) r =
   (subst28 r [false],subst28 r [true]) := by cases r <;> rfl
 rw [hs,subst_fold28,subst_append28]

def central28 : List Bool → List Bool
 | [] => []
 | r::path => if r then true::subst28 true (central28 path)
     else subst28 false (central28 path)++[false]

theorem sourceWord_central28 (path : List Bool) :
 sourceWord28 path=false::(central28 path++[true]) := by
 induction path with
 | nil => rfl
 | cons r path ih =>
   rw [sourceWord_cons28,ih]
   cases r <;> simp [subst28,subst_append28,central28,List.append_assoc]

theorem left_palindrome28 (w : List Bool) (h : List.Palindrome w) :
 List.Palindrome (subst28 false w++[false]) := by
 induction h with
 | nil => exact List.Palindrome.singleton false
 | singleton d => cases d <;> simp [subst28] <;> decide
 | @cons_concat d w hw ih =>
   cases d
   · simpa [subst28,subst_append28,List.append_assoc] using ih.cons_concat false
   · simpa [subst28,subst_append28,List.append_assoc] using
       (ih.cons_concat true).cons_concat false

theorem right_palindrome28 (w : List Bool) (h : List.Palindrome w) :
 List.Palindrome (true::subst28 true w) := by
 induction h with
 | nil => exact List.Palindrome.singleton true
 | singleton d => cases d <;> simp [subst28] <;> decide
 | @cons_concat d w hw ih =>
   cases d
   · simpa [subst28,subst_append28,List.append_assoc] using
       (ih.cons_concat false).cons_concat true
   · simpa [subst28,subst_append28,List.append_assoc] using ih.cons_concat true

theorem central_palindrome28 (path : List Bool) : List.Palindrome (central28 path) := by
 induction path with
 | nil => exact List.Palindrome.nil
 | cons r path ih =>
   cases r
   · exact left_palindrome28 _ ih
   · exact right_palindrome28 _ ih

theorem expand_subst28 (w : List Bool) : expand80 w=subst28 false w := by
 induction w with
 | nil => rfl
 | cons d w ih => cases d <;> simp [expand80,subst28,ih]

/-- A canonical exact core, not an arbitrary palindromic enlargement. -/
def gasCore28 (path : List Bool) : List Bool := expand80 (central28 path)++[false]

theorem gasCore_palindrome28 (path : List Bool) : List.Palindrome (gasCore28 path) := by
 rw [gasCore28,expand_subst28]
 exact left_palindrome28 _ (central_palindrome28 path)

theorem source_gas_exact28 (path : List Bool) :
 (frame path).mid.p=gasScalar80 U V 1 (gasCore28 path) := by
 rw [raw_matrix18]
 have he := rawWord_pairs80 path ([false],[true])
 simp only [rawWord80,Bool.false_eq_true,if_false,if_true,mm_one_right774] at he
 rw [← he]
 change (mm16 (rawWord80 _) (rawWord80 _)).b=_
 rw [← rawWord_append80]
 change (rawWord80 (sourceWord28 path)).b=_
 rw [rawWord_expand80,sourceWord_central28]
 simpa [expand80,expand_append80,gasCore28,List.append_assoc] using
   gas_boundary80 U V (1 : BiPoly) (gasCore28 path)

#print axioms gasCore_palindrome28
#print axioms source_gas_exact28
end MathGKM.Markov
