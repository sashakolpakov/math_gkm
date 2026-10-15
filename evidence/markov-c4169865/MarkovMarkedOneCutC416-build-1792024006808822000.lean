import MarkovSingleLayer9c20
import MarkovSourceCount68a4
/-! Machine-authored c4169865. Exact one-cut degree marker on two runs. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def skipDegreeC416 (d : ℕ) : List Bool → ℕ
 | [] => d
 | r::rs => skipDegreeC416 (if r then d+1 else 0) rs

theorem degree_zeroC416 {R : Type*} [CommRing R] (y z p q : R)
 (d : ℕ) (w : List Bool) : degreeCoeff07a7 y z p q d w 0=q := by
 induction w generalizing p d with
 | nil => rfl
 | cons r rs ih => exact ih _ _

theorem degree_one_appendC416 {R : Type*} [CommRing R] (y z p : R)
 (d : ℕ) (u v : List Bool) :
 degreeCoeff07a7 y z p 1 d (u++v) 1=
 degreeCoeff07a7 y z p 1 d u 1+
 degreeCoeff07a7 y z (gapChargeA27 y p 1 u) 1 (skipDegreeC416 d u) v 1 := by
 induction u generalizing p d with
 | nil => simp [degreeCoeff07a7,gapChargeA27,skipDegreeC416]
 | cons r rs ih =>
   simp only [List.cons_append,degreeCoeff07a7,degree_zeroC416,
     gapChargeA27,skipDegreeC416]
   rw [ih]
   ring

theorem skipDegree_runC416 (d n : ℕ) :
 skipDegreeC416 d (List.replicate n true)=d+n := by
 induction n generalizing d with
 | zero => simp [skipDegreeC416]
 | succ n ih => simp [List.replicate_succ,skipDegreeC416,ih]; omega

theorem marked_run_oneC416 {R : Type*} [CommRing R] (y z p : R) (d n : ℕ) :
 degreeCoeff07a7 y z p 1 d (List.replicate n true) 1=
 ∑ k ∈ range n,z^(d+k+1)*(1+y)*(y^k*p+2*runSumA27 y k+1) := by
 induction n with
 | zero => simp [degreeCoeff07a7]
 | succ n ih =>
   rw [List.replicate_succ',degree_one_appendC416,ih,
     gapCharge_runA27,skipDegree_runC416,Finset.sum_range_succ]
   simp [degreeCoeff07a7,cutFactorA27]

theorem marked_oneA_formulaC416 (n : ℕ) (z : ℝ) :
 degreeCoeff07a7 (X:ℝ[X]) (C z) X 1 1
   (central28 (oneAPath68 n)++[true]) 1=
 (∑ k ∈ range n,C (z^(k+2))*((1+X)*purePolyFe01 k))+
 C (z^(n+1))*purePolyFe01 n+
 ∑ k ∈ range (n+1),C (z^(k+1))*((1+X)*resetPolyFe01 k) := by
 rw [oneA_word68,degree_one_appendC416,marked_run_oneC416,
   gapCharge_runA27,skipDegree_runC416]
 simp only [degreeCoeff07a7,cutChargeA27,cutFactorA27,Bool.false_eq_true,
   if_false,degree_zeroC416,mul_one,Nat.add_zero]
 rw [marked_run_oneC416]
 simp only [zero_add,mul_zero,zero_mul,pow_zero,map_pow]
 have hP (k : ℕ) : (X:ℝ[X])^k*X+2*runSumA27 X k+1=purePolyFe01 k := by
   simp [purePolyFe01,resetPolyFe01,pow_succ]; ring
 simp only [hP]
 have hs : (∑ k ∈ range n,C (z^(1+k+1))*(1+X)*purePolyFe01 k)=
     ∑ k ∈ range n,C (z^(k+2))*((1+X)*purePolyFe01 k) := by
   apply sum_congr rfl
   intro k hk
   rw [show 1+k+1=k+2 by omega]
   ring
 rw [hs]
 have hs2 : (∑ k ∈ range (n+1),C (z^(k+1))*(1+X)*(2*runSumA27 X k+1))=
     ∑ k ∈ range (n+1),C (z^(k+1))*((1+X)*resetPolyFe01 k) := by
   apply sum_congr rfl
   intro k hk
   simp only [resetPolyFe01]
   ring
 rw [hs2]
 rw [show 1+n=n+1 by omega]
 ring

#print axioms marked_run_oneC416
#print axioms marked_oneA_formulaC416
end
end MathGKM.Markov
