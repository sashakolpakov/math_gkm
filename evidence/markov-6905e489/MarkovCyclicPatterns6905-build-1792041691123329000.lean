import MarkovTriplePatterns6905
/-! Machine-authored request 6905e489. Exact circular-window interpretation
of the source pattern scans, including the length-two source word. -/
namespace MathGKM.Markov
noncomputable section

def cyclic1116905 (w : List Bool) : ℕ :=
 tripleOneScan5 false false (w++w.take 2)
def cyclic1016905 (w : List Bool) : ℕ :=
 separatedScan5 false false (w++w.take 2)

theorem triple_wrap6905 (w : List Bool) (p q r : Bool) :
 tripleOneScan5 p q (w++[false,r])=tripleOneScan5 p q w := by
 induction w generalizing p q with
 | nil => simp [tripleOneScan5]
 | cons a as ih => simp [tripleOneScan5,ih]

theorem separated_wrap6905 (w : List Bool) (p q r : Bool) :
 separatedScan5 p q (w++[true,false,r])=
 separatedScan5 p q (w++[true])+(if r then 1 else 0) := by
 induction w generalizing p q with
 | nil => cases p <;> cases q <;> cases r <;> decide
 | cons a as ih => simp [separatedScan5,ih,Nat.add_assoc]

theorem cyclic111_source6905 (path : List Bool) :
 cyclic1116905 (sourceWord28 path)=tripleOne5 (sourceWord28 path) := by
 rw [sourceWord_central28]
 unfold cyclic1116905 tripleOne5
 cases central28 path with
 | nil => decide
 | cons r rs =>
   simp only [List.take_succ_cons,List.take_zero,List.append_nil,List.cons_append]
   exact triple_wrap6905 (false::r::(rs++[true])) false false r

theorem cyclic101_source6905 (path : List Bool) :
 cyclic1016905 (sourceWord28 path)=separated5 (sourceWord28 path) := by
 rw [sourceWord_central28]
 unfold cyclic1016905 separated5
 cases central28 path with
 | nil => decide
 | cons r rs =>
   simp only [List.take_succ_cons,List.take_zero,List.append_nil,List.cons_append]
   have h := separated_wrap6905 (false::r::rs) false false r
   simp only [List.cons_append] at h
   rw [show false::r::((rs++[true])++[false,r])=
     false::r::(rs++[true,false,r]) by simp [List.append_assoc]]
   rw [h]
   cases r <;> simp [separatedScan5,Nat.add_comm]

theorem source_cyclic111_count6905 (path : List Bool) :
 cyclic1116905 (sourceWord28 path)=3*(frame path).mid.a-2*(frame path).mid.b := by
 rw [cyclic111_source6905,source_tripleOne5]

theorem source_cyclic101_count6905 (path : List Bool) :
 cyclic1016905 (sourceWord28 path)=
 min ((frame path).mid.b-(frame path).mid.a)
   (3*(frame path).mid.a-(frame path).mid.b) := by
 rw [cyclic101_source6905,source_separated5]

#print axioms source_cyclic111_count6905
#print axioms source_cyclic101_count6905
end
end MathGKM.Markov
