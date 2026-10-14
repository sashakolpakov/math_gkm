import MarkovObjects88f3
import MarkovPalindrome28b1
import MarkovReduction18
/-! Machine-authored 88f3b553. Exact count target for the FULL pinned root.
This is an equivalence, and neither side has been proved. -/
namespace MathGKM.Markov
noncomputable section

def sourceObjects88 (path : List Bool) : Cloud88 := objects88 (gasCore28 path)

theorem source_multiplicity88 (path : List Bool) (i j : ℕ) :
 coeff (frame path).mid.p i j=multiplicity88 (sourceObjects88 path) i j := by
 rw [source_gas_exact28,sourceObjects88,objects_coeff88]

def ObjectLC88 (l : Cloud88) : Prop :=
 (∀ i j, multiplicity88 l i j * multiplicity88 l (i+2) j ≤
   multiplicity88 l (i+1) j^2) ∧
 (∀ i j, multiplicity88 l i j * multiplicity88 l i (j+2) ≤
   multiplicity88 l i (j+1)^2) ∧
 (∀ i j, multiplicity88 l i (j+2) * multiplicity88 l (i+2) j ≤
   multiplicity88 l (i+1) (j+1)^2)

def ObjectGoal88 : Prop := ∀ path : List Bool, ObjectLC88 (sourceObjects88 path)

theorem source_object_iff_global88 (path : List Bool) :
 ObjectLC88 (sourceObjects88 path) ↔ GlobalLC18 (frame path).mid.p := by
 simp only [ObjectLC88,GlobalLC18,source_multiplicity88]

/-- All finite paths, all three directions, all zero coefficients, and both
endpoint clauses are retained through the audited exact raw reduction. -/
theorem root_iff_objects88 : Conjecture63 ↔ ObjectGoal88 := by
 rw [root_iff_raw_matrix18]
 constructor
 · intro h path
   apply (source_object_iff_global88 path).mpr
   rw [raw_matrix18]
   exact h path
 · intro h path
   rw [← raw_matrix18]
   exact (source_object_iff_global88 path).mp (h path)

#print axioms source_multiplicity88
#print axioms root_iff_objects88
end
end MathGKM.Markov
