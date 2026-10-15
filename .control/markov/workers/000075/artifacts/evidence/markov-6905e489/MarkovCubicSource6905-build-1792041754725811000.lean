import MarkovCubicCycle6905
import MarkovThirdTransfer75
import MarkovCyclicSecondBF
/-! Machine-authored request 6905e489. Source run blocks have the common
projection required by the cubic expansion. This is an exact coefficient
bridge, not a log-concavity theorem or an assertion of ThirdFormula75. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def runGaugeEnd6905 (a : ℤ[X]) : List ℕ → ℤ[X]
 | [] => a
 | n::ns => runGaugeEnd6905 (2*runSumA27 X n) ns
def gaugedRuns6905 (a : ℤ[X]) : List ℕ → List (Mat16 BiPoly)
 | [] => []
 | n::ns => gauge75 (C a) (C (2*runSumA27 X n)) (lowerMatrix487 n)::
   gaugedRuns6905 (2*runSumA27 X n) ns

theorem gaugedRuns_shape6905 (a : ℤ[X]) (ns : List ℕ) :
 ∀ m∈gaugedRuns6905 a ns, Projection6905 m := by
 induction ns generalizing a with
 | nil => simp [gaugedRuns6905]
 | cons n ns ih =>
   intro m hm
   simp only [gaugedRuns6905,List.mem_cons] at hm
   rcases hm with rfl|hm
   · exact run_gauge_constant75 a n
   · exact ih _ m hm

theorem gaugedRuns_product6905 (a : ℤ[X]) (ns : List ℕ) :
 projProduct6905 (gaugedRuns6905 a ns)=
 gauge75 (C a) (C (runGaugeEnd6905 a ns)) (runMatrixBF ns) := by
 induction ns generalizing a with
 | nil =>
   apply Mat16.ext <;>
     simp [gaugedRuns6905,projProduct6905,runGaugeEnd6905,runMatrixBF,
       ambientWord5c,gauge75,shear75,unshear75,mm16] <;> ring
 | cons n ns ih =>
   simp only [gaugedRuns6905,projProduct6905,runGaugeEnd6905,runMatrix_consBF,ih,gauge_mul75]

theorem runGaugeEnd_append6905 (a : ℤ[X]) (ns : List ℕ) (n : ℕ) :
 runGaugeEnd6905 a (ns++[n])=2*runSumA27 X n := by
 induction ns generalizing a with
 | nil => rfl
 | cons m ms ih => simpa only [List.cons_append,runGaugeEnd6905] using ih (2*runSumA27 X m)

theorem gaugedRuns_trace6905 (ns : List ℕ) (n : ℕ) :
 tr16 (projProduct6905 (gaugedRuns6905 (2*runSumA27 X n) (ns++[n])))=
 tr16 (runMatrixBF (ns++[n])) := by
 rw [gaugedRuns_product6905,runGaugeEnd_append6905,gauge_trace75]

/-- Literal source identification and list decomposition are explicit. No
third-slice coefficient identity or inequality is a premise. -/
theorem source_cut3_cyclic6905 (path : List Bool) (ns : List ℕ) (n : ℕ)
 (hw : sourceWord28 path=(ns++[n]).flatMap lowerRun487)
 (a b c d : Mat16 BiPoly) (ms : List (Mat16 BiPoly))
 (hg : gaugedRuns6905 (2*runSumA27 X n) (ns++[n])=a::b::(ms++[c,d])) :
 cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 3=
 cyclicCubic6905 a b ms c d-
 (1+X)*cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 2 := by
 have hs := source_cut_trace75 path 2
 have ht := gaugedRuns_trace6905 ns n
 have hshape := gaugedRuns_shape6905 (2*runSumA27 X n) (ns++[n])
 rw [hg] at ht hshape
 rw [hw] at hs
 change (tr16 (runMatrixBF (ns++[n]))).coeff 3=_ at hs
 rw [←ht,projection_trace3_cyclic6905 a b c d ms hshape] at hs
 linear_combination -hs

/-- The integer raw-coefficient correspondence retains every j, including zero
positions. Its only extra premises specify the exact run decomposition. -/
theorem source_raw3_cyclic6905 (path : List Bool) (ns : List ℕ) (n : ℕ)
 (hw : sourceWord28 path=(ns++[n]).flatMap lowerRun487)
 (a b c d : Mat16 BiPoly) (ms : List (Mat16 BiPoly))
 (hg : gaugedRuns6905 (2*runSumA27 X n) (ns++[n])=a::b::(ms++[c,d]))
 (i j : ℕ) (hij : i+j=(frame path).mid.a+3) :
 coeff (frame path).mid.p i j=
 (cyclicCubic6905 a b ms c d-
 (1+X)*cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 2).coeff j := by
 rw [source_cut_coeffA27 path i j 3 hij,source_cut3_cyclic6905 path ns n hw a b c d ms hg]

#print axioms gaugedRuns_shape6905
#print axioms gaugedRuns_trace6905
#print axioms source_cut3_cyclic6905
#print axioms source_raw3_cyclic6905
end
end MathGKM.Markov
