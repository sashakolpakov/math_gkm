import MathGKM.Target1701fb950d8b7e014ae8bddb
import MathGKM.Round80RankA
import Lean
def Accepted0beeba7c6244e2295e3e804c.interface : MathGKM.Target1701fb950d8b7e014ae8bddb.Interface :=
  (
    True.intro
  )
theorem Accepted0beeba7c6244e2295e3e804c.transport : MathGKM.Target1701fb950d8b7e014ae8bddb.Transport Accepted0beeba7c6244e2295e3e804c.interface :=
  (
    True.intro
  )
theorem Accepted0beeba7c6244e2295e3e804c.obligation : MathGKM.Target1701fb950d8b7e014ae8bddb.Goal Accepted0beeba7c6244e2295e3e804c.interface :=
  (
    by
      refine ⟨?_, FullFiberRankR80.conditional_comparison, FullFiberRankR80.central_comparison⟩
      intro N sigma j L a b r
      exact ⟨FullFiberRankR80.rank_coeff N sigma j L a b r,
        FullFiberRankR80.projected_coeff N sigma j L a b r⟩
  )
