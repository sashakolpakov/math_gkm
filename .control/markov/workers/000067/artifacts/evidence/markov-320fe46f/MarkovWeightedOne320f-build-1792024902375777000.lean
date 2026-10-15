import MarkovMarkedOneCutC416
/-! Machine-authored request 320fe46f. Exact one-cut aggregation with arbitrary
weights on entire degree layers. No weight changes the pinned raw target. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def weightedOne320 {R : Type*} [CommRing R] (w : ℕ → R) (y p : R)
 (d : ℕ) : List Bool → R
 | [] => 0
 | r::rs => w (d+if r then 1 else 0)*cutFactorA27 y r*(p+1)+
     weightedOne320 w y (cutChargeA27 y p 1 r) (if r then d+1 else 0) rs

theorem weightedOne_degree320 {R : Type*} [CommRing R] (z y p : R)
 (d : ℕ) (v : List Bool) :
 weightedOne320 (fun k => z^k) y p d v=degreeCoeff07a7 y z p 1 d v 1 := by
 induction v generalizing p d with
 | nil => rfl
 | cons r rs ih =>
   simp only [weightedOne320,degreeCoeff07a7,degree_zeroC416,ih,mul_one]

theorem weightedOne_append320 {R : Type*} [CommRing R] (w : ℕ → R)
 (y p : R) (d : ℕ) (u v : List Bool) :
 weightedOne320 w y p d (u++v)=weightedOne320 w y p d u+
 weightedOne320 w y (gapChargeA27 y p 1 u) (skipDegreeC416 d u) v := by
 induction u generalizing p d with
 | nil => simp [weightedOne320,gapChargeA27,skipDegreeC416]
 | cons r rs ih =>
   simp only [List.cons_append,weightedOne320,gapChargeA27,skipDegreeC416,ih]
   ring

theorem weightedOne_run320 {R : Type*} [CommRing R] (w : ℕ → R)
 (y p : R) (d n : ℕ) :
 weightedOne320 w y p d (List.replicate n true)=
 ∑ k ∈ range n,w (d+k+1)*(1+y)*(y^k*p+2*runSumA27 y k+1) := by
 induction n with
 | zero => simp [weightedOne320]
 | succ n ih =>
   rw [List.replicate_succ',weightedOne_append320,ih,
     gapCharge_runA27,skipDegree_runC416,Finset.sum_range_succ]
   simp [weightedOne320,cutFactorA27]

def resetWeighted320 (w : ℕ → ℝ) (n : ℕ) : ℝ[X] :=
 (∑ k ∈ range n,C (w (k+1))*((1+X)*resetPolyFe01 k))+
 C (w n)*resetPolyFe01 n

def initialWeighted320 (w : ℕ → ℝ) (n : ℕ) : ℝ[X] :=
 (∑ k ∈ range n,C (w (k+2))*((1+X)*purePolyFe01 k))+
 C (w (n+1))*purePolyFe01 n

def finalWeighted320 (w : ℕ → ℝ) (n : ℕ) : ℝ[X] :=
 ∑ k ∈ range n,C (w (k+1))*((1+X)*resetPolyFe01 k)

theorem weighted_reset_run320 (w : ℕ → ℝ) (n : ℕ) :
 weightedOne320 (fun k => C (w k)) X 0 0 (List.replicate n true)=
 finalWeighted320 w n := by
 rw [weightedOne_run320]
 apply sum_congr rfl
 intro k hk
 simp [finalWeighted320,resetPolyFe01]
 <;> ring

theorem weighted_reset_block320 (w : ℕ → ℝ) (n : ℕ) (v : List Bool) :
 weightedOne320 (fun k => C (w k)) X 0 0 (List.replicate n true++false::v)=
 resetWeighted320 w n+weightedOne320 (fun k => C (w k)) X 0 0 v := by
 rw [weightedOne_append320,weighted_reset_run320,gapCharge_runA27,skipDegree_runC416]
 simp [weightedOne320,cutFactorA27,cutChargeA27,resetWeighted320,
   finalWeighted320,resetPolyFe01]
 <;> ring

theorem weighted_initial_block320 (w : ℕ → ℝ) (n : ℕ) (v : List Bool) :
 weightedOne320 (fun k => C (w k)) X X 1 (List.replicate n true++false::v)=
 initialWeighted320 w n+weightedOne320 (fun k => C (w k)) X 0 0 v := by
 rw [weightedOne_append320,weightedOne_run320,gapCharge_runA27,skipDegree_runC416]
 simp only [weightedOne320,cutFactorA27,cutChargeA27,Bool.false_eq_true,
   if_false,Nat.add_zero,one_mul,mul_one,initialWeighted320]
 have hp (k : ℕ) : (X:ℝ[X])^k*X+2*runSumA27 X k+1=purePolyFe01 k := by
   simp [purePolyFe01,resetPolyFe01,pow_succ]; ring
 rw [hp]
 have hs : (∑ k ∈ range n,C (w (1+k+1))*(1+X)*purePolyFe01 k)=
     ∑ k ∈ range n,C (w (k+2))*((1+X)*purePolyFe01 k) := by
   apply sum_congr rfl
   intro k hk
   rw [show 1+k+1=k+2 by omega]
   ring
 simp only [hp,hs,show 1+n=n+1 by omega]

theorem weighted_oneA320 (w : ℕ → ℝ) (n : ℕ) :
 weightedOne320 (fun k => C (w k)) X X 1 (central28 (oneAPath68 n)++[true])=
 initialWeighted320 w n+finalWeighted320 w (n+1) := by
 rw [oneA_word68,weighted_initial_block320,weighted_reset_run320]

#print axioms weightedOne_degree320
#print axioms weighted_reset_block320
#print axioms weighted_oneA320
end
end MathGKM.Markov
