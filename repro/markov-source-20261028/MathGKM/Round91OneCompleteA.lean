import MathGKM.Round91OneOrientationA

/- Machine-authored round91. Boundary-complete orientation-one central proof. -/
namespace SparseCentralR91
open SparseRankR89 SparseCoupledR90 FullFiberRankR80
noncomputable section
set_option maxHeartbeats 2000000

theorem one_min_size (n r j b : ℕ) (h : oneCount n 1 r j b ≠ 0) : 2 ≤ n := by
  rcases n with _|(_|n)
  · simp [oneCount] at h
  · simp [oneCount] at h
  · omega

theorem one_support (n r j b : ℕ) (h : oneCount n 1 r j b ≠ 0) :
    2 ≤ n ∧ 1 ≤ r ∧ b ≤ n-2 ∧ r+j+b+1=2*n ∧ r ≤ 2*(n-b-1)+1 := by
  have hn := one_min_size n r j b h
  rw [one_formula n r j b hn] at h
  have hs := (mul_ne_zero_iff.mp h).2
  unfold shifted at hs
  split_ifs at hs with hr
  · contradiction
  · have hp := (count_positive 2 (n-2) (r-1) j b).mp
      (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm hs))
    omega

theorem alpha_one_orientation_one (n j i b : ℕ) :
    (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b i).card  ≤ 
      (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b (i+1)).card := by
  by_cases hz : (PairConvolutionR78.P (2*n) 1 j (2*i+2) 1 b i).card=0
  · rw [hz]
    exact Nat.zero_le _
  have hcoef : (rankPoly (2*n) 1 j (2*i+2) 1 b).coeff i ≠ 0 := by
    rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 _ _ _ _ _ _ _).1]
    exact_mod_cast hz
  have hc := ((Accepted3c5512444ed7f17d3a8e718f.obligation n 1 (by omega)).2.2 j (2*i+2) b).2.1 i hcoef
  let q := 2*n-i-j
  have hd : i+j+q=2*n := by dsimp [q]; omega
  have hq : 2 ≤ q := by dsimp [q]; omega
  have hb : b+3=2*q := by omega
  have he := rank_two_allocations n 1 j (2*i+2) b i (by omega) (by omega)
  rw [show 2*i+2-i=i+2 by omega] at he
  have ha : allocation n 1 j i (i+2) b + allocation n 1 j (i+2) i b ≠ 0 := by
    rw [← he]
    exact hcoef
  have hs : 2 ≤ n ∧ q ≤ n ∧ i ≤ 2*(n-q)+1 := by
    by_cases hA : allocation n 1 j i (i+2) b=0
    · have hB : allocation n 1 j (i+2) i b ≠ 0 := by intro hh; simp [hA,hh] at ha
      unfold allocation at hB
      split_ifs at hB with hp
      · have hO := (mul_ne_zero_iff.mp hB).2
        rw [show b-(2*n-(i+2)-j)=q-1 by omega] at hO
        have hh := one_support n i j (q-1) hO
        omega
      · contradiction
    · unfold allocation at hA
      split_ifs at hA with hp
      · have hZ := (mul_ne_zero_iff.mp hA).1
        have hO := (mul_ne_zero_iff.mp hA).2
        have hn := one_min_size n (i+2) j (b-(2*n-i-j)) hO
        have hh := (count_positive (isolated n 1) (cells n 1) i j (2*n-i-j)).mp
          (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm hZ))
        simp only [isolated,cells,or_true,if_true] at hh
        dsimp [q] at hd hq hb ⊢
        omega
      · contradiction
  exact supported_one_central n j i b q (n-q) hs.1 hd (by omega) hq hs.2.2 hb

end
end SparseCentralR91
#print axioms SparseCentralR91.alpha_one_orientation_one
