import MathGKM.Round91AllocationsA
/- Machine-authored round93. Universal boundary obligation, not a diagnostic scan. -/
namespace BoundarySmallR93
open SparseCentralR91 SparseRankR89 SparseCoupledR90 FullFiberRankR80
noncomputable section
set_option maxHeartbeats 2000000

theorem alpha_one_small (n j i b : ℕ) (hn : n<3) :
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card ≤
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card := by
  by_cases hz : (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card=0
  · rw [hz]; exact Nat.zero_le _
  have hcoef : (rankPoly (2*n) 0 j (2*i+2) 1 b).coeff i ≠ 0 := by
    rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 _ _ _ _ _ _ _).1]
    exact_mod_cast hz
  have hc := ((Accepted3c5512444ed7f17d3a8e718f.obligation n 0 (by omega)).2.2 j (2*i+2) b).2.1 i hcoef
  apply (central_iff n 0 j i b (by omega)).2
  have hi : i≤2 := by omega
  have hj : j≤2 := by omega
  have hb : b≤5 := by omega
  interval_cases n <;> interval_cases i <;> interval_cases j <;> interval_cases b <;>
    norm_num [allocation,oneCount,isolated,cells,shifted,count] at *
end
end BoundarySmallR93
#print axioms BoundarySmallR93.alpha_one_small
