import MarkovTopSectorM55C
/-! Machine-authored 55cf20d2. Two false auxiliary shortcuts, with an exact
positive source gap. Neither obstruction is a refutation of Conjecture63. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 6000000
set_option maxRecDepth 10000

def topTermM55C (d T i s : ℕ) : ℤ :=
 (if s=T then 1 else if s < T then 4*((T:ℤ)-s) else 0)*topKernelM55C d i s

theorem top_midpoint_failureM55C :
 topTermM55C 2 4 0 0*topTermM55C 2 4 2 3=69189120 ∧
 topTermM55C 2 4 1 1*topTermM55C 2 4 1 2=67953600 ∧
 topTermM55C 2 4 1 1*topTermM55C 2 4 1 2 <
 topTermM55C 2 4 0 0*topTermM55C 2 4 2 3 := by
 norm_num [topTermM55C,topKernelM55C,Nat.choose]

def geometricWeightM55C (s : ℕ) : ℤ := if s ≤ 5 then 10^(5-s) else 0

theorem geometric_weight_nonnegM55C (s : ℕ) : 0 ≤ geometricWeightM55C s := by
 unfold geometricWeightM55C
 split_ifs <;> positivity

theorem geometric_weight_supportM55C (s : ℕ) :
 0 < geometricWeightM55C s ↔ s ≤ 5 := by
 unfold geometricWeightM55C
 split_ifs <;> simp_all

theorem geometric_weight_crossM55C (i j : ℕ) (hij : i ≤ j) :
 geometricWeightM55C i*geometricWeightM55C (j+1) ≤
 geometricWeightM55C (i+1)*geometricWeightM55C j := by
 by_cases hj : j ≤ 4
 · have hi : i ≤ 4 := by omega
   interval_cases i <;> interval_cases j <;> norm_num [geometricWeightM55C] at *
 · have hz : geometricWeightM55C (j+1)=0 := by
     simp [geometricWeightM55C,show ¬j+1 ≤ 5 by omega]
   rw [hz,mul_zero]
   exact mul_nonneg (geometric_weight_nonnegM55C _) (geometric_weight_nonnegM55C _)

def geometricOutputM55C (i : ℕ) : ℤ :=
 ∑ s ∈ range 6, geometricWeightM55C s*topKernelM55C 0 i s

theorem geometric_transform_failureM55C :
 geometricOutputM55C 0=6578986 ∧ geometricOutputM55C 1=2942105 ∧
 geometricOutputM55C 2=1328250 ∧
 geometricOutputM55C 1^2-geometricOutputM55C 0*geometricOutputM55C 2= -82556323475 := by
 norm_num [geometricOutputM55C,geometricWeightM55C,topKernelM55C,sum_range_succ,Nat.choose]

theorem source_obstruction_rowM55C (i : ℕ) :
 threeRawM9E2 5 true (i+3) 11=topMassM55C 2 4 i := by
 have h := source_top_coeffMB3E 5 7 (i+3) true (by norm_num) (by norm_num)
 norm_num [sourceNME9C] at h
 rw [h]
 exact top_mass_coeffM55C 2 4 i

theorem source_obstruction_gapM55C :
 threeRawM9E2 5 true 3 11=7168 ∧ threeRawM9E2 5 true 4 11=34852 ∧
 threeRawM9E2 5 true 5 11=78260 ∧
 threeRawM9E2 5 true 4 11^2-threeRawM9E2 5 true 3 11*threeRawM9E2 5 true 5 11=653694224 := by
 have h0 := source_obstruction_rowM55C 0
 have h1 := source_obstruction_rowM55C 1
 have h2 := source_obstruction_rowM55C 2
 norm_num [topMassM55C,topLinearM55C,topKernelM55C,sum_range_succ,Nat.choose] at h0 h1 h2
 rw [h0,h1,h2]
 norm_num

theorem source_obstruction_polygonM55C :
 InPolygon 3 16 3 11 ∧ InPolygon 3 16 4 11 ∧ InPolygon 3 16 5 11 := by
 norm_num [InPolygon]

end
end MathGKM.Markov
