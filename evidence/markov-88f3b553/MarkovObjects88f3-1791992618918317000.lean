import MarkovSupport725
/-! Machine-authored 88f3b553. Exact finite multiplicity model for every raw
source coefficient. Repeated entries are distinct counted objects. No LC is
inferred from positivity or from the list representation. -/
namespace MathGKM.Markov
noncomputable section

abbrev Cloud88 := List (ℕ × ℕ)
def shiftU88 (l : Cloud88) : Cloud88 := l.map (fun p => (p.1+1,p.2))
def shiftV88 (l : Cloud88) : Cloud88 := l.map (fun p => (p.1,p.2+1))
def multiplicity88 (l : Cloud88) (i j : ℕ) : ℤ := l.count (i,j)

theorem multiplicity_append88 (l k : Cloud88) (i j : ℕ) :
 multiplicity88 (l++k) i j=multiplicity88 l i j+multiplicity88 k i j := by
 simp [multiplicity88]

theorem multiplicity_U_zero88 (l : Cloud88) (j : ℕ) :
 multiplicity88 (shiftU88 l) 0 j=0 := by
 induction l with
 | nil => simp [multiplicity88,shiftU88]
 | cons p l ih => simpa [multiplicity88,shiftU88,List.count_cons,Prod.mk.injEq] using ih

theorem multiplicity_U_succ88 (l : Cloud88) (i j : ℕ) :
 multiplicity88 (shiftU88 l) (i+1) j=multiplicity88 l i j := by
 induction l with
 | nil => simp [multiplicity88,shiftU88]
 | cons p l ih =>
   rcases p with ⟨a,b⟩
   simpa [multiplicity88,shiftU88,List.count_cons,Prod.mk.injEq] using
     congrArg (fun z : ℤ => z + if a=i ∧ b=j then 1 else 0) ih

theorem multiplicity_V_zero88 (l : Cloud88) (i : ℕ) :
 multiplicity88 (shiftV88 l) i 0=0 := by
 induction l with
 | nil => simp [multiplicity88,shiftV88]
 | cons p l ih => simpa [multiplicity88,shiftV88,List.count_cons,Prod.mk.injEq] using ih

theorem multiplicity_V_succ88 (l : Cloud88) (i j : ℕ) :
 multiplicity88 (shiftV88 l) i (j+1)=multiplicity88 l i j := by
 induction l with
 | nil => simp [multiplicity88,shiftV88]
 | cons p l ih =>
   rcases p with ⟨a,b⟩
   simpa [multiplicity88,shiftV88,List.count_cons,Prod.mk.injEq] using
     congrArg (fun z : ℤ => z + if a=i ∧ b=j then 1 else 0) ih

def objectPair88 : List Bool → Cloud88 × Cloud88
 | [] => ([(0,0)],[(0,0)])
 | r::rs =>
   let z := objectPair88 rs
   let h := shiftV88 z.1 ++ shiftU88 z.2
   if r then (h++z.1,h) else (h,h++z.2)

def objects88 (w : List Bool) : Cloud88 :=
 shiftV88 (objectPair88 w).1 ++ shiftU88 (objectPair88 w).2

theorem object_pair_coeff88 (w : List Bool) : ∀ i j,
 multiplicity88 (objectPair88 w).1 i j=coeff (fgWord725 w).1 i j ∧
 multiplicity88 (objectPair88 w).2 i j=coeff (fgWord725 w).2 i j := by
 induction w with
 | nil =>
   intro i j
   cases i <;> cases j <;>
     simp [objectPair88,fgWord725,multiplicity88,coeff,List.count_cons,Polynomial.coeff_one]
 | cons r rs ih =>
   intro i j
   have h (i j : ℕ) : multiplicity88 (objects88 rs) i j=
       coeff (V*(fgWord725 rs).1+U*(fgWord725 rs).2) i j := by
     simp only [objects88,multiplicity_append88,coeff,Polynomial.coeff_add]
     change multiplicity88 (shiftV88 (objectPair88 rs).1) i j+
       multiplicity88 (shiftU88 (objectPair88 rs).2) i j=
       coeff (V*(fgWord725 rs).1) i j+coeff (U*(fgWord725 rs).2) i j
     cases i <;> cases j <;>
       simp [multiplicity_U_zero88,multiplicity_U_succ88,
         multiplicity_V_zero88,multiplicity_V_succ88,(ih _ _).1,(ih _ _).2]
   cases r <;>
     simp only [objectPair88,fgWord725,Bool.false_eq_true,if_false,if_true]
   all_goals change
     (multiplicity88 _ i j=_) ∧ (multiplicity88 _ i j=_)
   all_goals
     have hh := h i j
     simp only [objects88,multiplicity_append88,coeff,Polynomial.coeff_add] at hh
     simp only [multiplicity_append88,(ih i j).1,(ih i j).2,coeff,Polynomial.coeff_add]
     simp only [hh,and_self]

theorem objects_coeff88 (w : List Bool) (i j : ℕ) :
 multiplicity88 (objects88 w) i j=coeff (gasScalar80 U V 1 w) i j := by
 rw [gas_fg725]
 simp only [objects88,multiplicity_append88,coeff,Polynomial.coeff_add]
 change multiplicity88 (shiftV88 (objectPair88 w).1) i j+
       multiplicity88 (shiftU88 (objectPair88 w).2) i j=
       coeff (V*(fgWord725 w).1) i j+coeff (U*(fgWord725 w).2) i j
 cases i <;> cases j <;>
   simp [multiplicity_U_zero88,multiplicity_U_succ88,
     multiplicity_V_zero88,multiplicity_V_succ88,
     (object_pair_coeff88 w _ _).1,(object_pair_coeff88 w _ _).2]

/-- Universal source coverage is retained: no bound on path, index, or charge.
Zero counts and duplicate entries remain literal. -/
theorem source_objects88 (path : List Bool) :
 ∃ w : List Bool, w.length+2=(frame path).mid.a+(frame path).mid.b ∧
 ∀ i j, coeff (frame path).mid.p i j=multiplicity88 (objects88 w) i j := by
 obtain ⟨w,hl,he⟩ := source_gas80 path
 exact ⟨w,hl,fun i j => by rw [he,objects_coeff88]⟩

#print axioms object_pair_coeff88
#print axioms objects_coeff88
#print axioms source_objects88
end
end MathGKM.Markov
