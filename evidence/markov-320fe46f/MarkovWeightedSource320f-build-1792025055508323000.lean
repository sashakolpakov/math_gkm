import MarkovWeightedOne320f
/-! Machine-authored 320fe46f. Source-wide one-cut weighted run decomposition. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

def endBlock320 (n : ℕ) : List Bool := List.replicate n true++[false]

theorem rotate_blocks320 (n : ℕ) (v : List Bool) :
 lowerSub487 n v++[false]=
 false::(v.flatMap (fun r => endBlock320 (n+if r then 1 else 0))) := by
 induction v with
 | nil => simp [lowerSub487]
 | cons r rs ih =>
   simp only [lowerSub487,List.flatMap_cons,lowerRun487,List.cons_append,
     List.append_assoc] at *
   rw [ih]
   simp [endBlock320]

theorem weighted_blocks320 (w : ℕ → ℝ) (n : ℕ) (v tail : List Bool) :
 weightedOne320 (fun k => C (w k)) X 0 0
   (v.flatMap (fun r => endBlock320 (n+if r then 1 else 0))++tail)=
 (v.map (fun r => resetWeighted320 w (n+if r then 1 else 0))).sum+
 weightedOne320 (fun k => C (w k)) X 0 0 tail := by
 induction v with
 | nil => simp [weightedOne320]
 | cons r rs ih =>
   simp only [List.flatMap_cons,List.map_cons,List.sum_cons,
     List.append_assoc,endBlock320,List.cons_append,List.nil_append]
   rw [weighted_reset_block320,ih]
   ring

theorem source_weighted_runs320 (w : ℕ → ℝ) (n : ℕ) (rest : List Bool) :
 weightedOne320 (fun k => C (w k)) X X 1
   (central28 (List.replicate n true++false::rest)++[true])=
 initialWeighted320 w n+finalWeighted320 w (n+1)+
 ((central28 rest).map (fun r => resetWeighted320 w (n+if r then 1 else 0))).sum := by
 have hw := source_run_substitutionBF n rest
 rw [sourceWord_central28,sourceWord_central28] at hw
 simp only [lowerSub487,List.flatMap_cons,lowerRun487,Bool.false_eq_true,if_false,
   Nat.add_zero,List.cons_append] at hw
 have he := List.cons.inj hw
 have hw' := he.2
 have ht : (central28 rest++[true]).flatMap
     (fun r => false::List.replicate (n+if r then 1 else 0) true)=
     false::((central28 rest).flatMap (fun r => endBlock320 (n+if r then 1 else 0))++
       List.replicate (n+1) true) := by
   have hh := rotate_blocks320 n (central28 rest)
   simpa [lowerSub487,lowerRun487,List.flatMap_append,List.append_assoc] using
     congrArg (fun v => v++List.replicate (n+1) true) hh
 rw [hw',ht,weighted_initial_block320,weighted_blocks320,weighted_reset_run320]
 ring

theorem weighted_runs_counts320 (w : ℕ → ℝ) (n : ℕ) (v : List Bool) :
 (v.map (fun r => resetWeighted320 w (n+if r then 1 else 0))).sum=
 C (v.count false:ℝ)*resetWeighted320 w n+
 C (v.count true:ℝ)*resetWeighted320 w (n+1) := by
 induction v with
 | nil => simp
 | cons r rs ih => cases r <;> simp [ih,List.count_cons,map_add] <;> ring

#print axioms source_weighted_runs320
#print axioms weighted_runs_counts320
end
end MathGKM.Markov
