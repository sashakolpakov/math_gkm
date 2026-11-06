import MathGKM.Round94SupportedA

/- Machine-authored round94. Boundary-complete orientation-zero alpha-one
comparison. The fixed compensation weights and original fibers are unchanged. -/
namespace CompensationR94
open SparseRankR89 SparseCoupledR90 SparseCentralR91 FullFiberRankR80
noncomputable section
set_option maxHeartbeats 2000000

theorem one_support (n r j b : ℕ) (hn : 3 ≤ n)
    (h : oneCount n 0 r j b ≠ 0) :
    1 ≤ r ∧ b ≤ n-2 ∧ r+j+b+1=2*n ∧ r ≤ 2*(n-b-1)+1 := by
  rw [one_formula n r j b hn] at h
  by_cases hz : shifted 4 (n-3) r j b=0
  · have hp : punctured 2 (n-3) r j b ≠ 0 := by intro hh; simp [hz,hh] at h
    unfold punctured at hp
    split_ifs at hp with hb
    · contradiction
    unfold shifted at hp
    split_ifs at hp with hr
    · contradiction
    have hh := (count_positive 2 (n-3) (r-1) (j-1) (b-1)).mp
      (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm hp))
    omega
  · unfold shifted at hz
    split_ifs at hz with hr
    · contradiction
    have hh := (count_positive 4 (n-3) (r-1) j b).mp
      (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm hz))
    omega

theorem central (n j i b : ℕ) (hn : 3 ≤ n) :
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card  ≤ 
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card := by
  by_cases hz : (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card=0
  · rw [hz]; exact Nat.zero_le _
  have hcoef : (rankPoly (2*n) 0 j (2*i+2) 1 b).coeff i ≠ 0 := by
    rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 _ _ _ _ _ _ _).1]
    exact_mod_cast hz
  have hc := ((Accepted3c5512444ed7f17d3a8e718f.obligation n 0 (by omega)).2.2 j (2*i+2) b).2.1 i hcoef
  let q := 2*n-i-j
  have hd : i+j+q=2*n := by dsimp [q]; omega
  have hq : 2 ≤ q := by dsimp [q]; omega
  have hb : b+3=2*q := by omega
  have he := rank_two_allocations n 0 j (2*i+2) b i (by omega) (by omega)
  rw [show 2*i+2-i=i+2 by omega] at he
  have ha : allocation n 0 j i (i+2) b+allocation n 0 j (i+2) i b ≠ 0 := by
    rw [← he]; exact hcoef
  have hs : q ≤ n-1 ∧ i ≤ 2*(n-q)+1 := by
    by_cases hA : allocation n 0 j i (i+2) b=0
    · have hB : allocation n 0 j (i+2) i b ≠ 0 := by intro hh; simp [hA,hh] at ha
      unfold allocation at hB
      split_ifs at hB with hp
      · have hO := (mul_ne_zero_iff.mp hB).2
        rw [show b-(2*n-(i+2)-j)=q-1 by omega] at hO
        have hh := one_support n i j (q-1) hn hO
        omega
      · contradiction
    · unfold allocation at hA
      split_ifs at hA with hp
      · have hZ := (mul_ne_zero_iff.mp hA).1
        have hh := (count_positive (isolated n 0) (cells n 0) i j (2*n-i-j)).mp
          (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm hZ))
        have hz' : isolated n 0=2 ∧ cells n 0=n-1 := by simp [isolated,cells,show n ≠ 0 by omega]
        rw [hz'.1,hz'.2] at hh
        dsimp [q] at hd hq hb ⊢
        omega
      · contradiction
  exact supported n j i b q (n-q) hn hd (by omega) (by omega) hq hs.2 hb

theorem compensation (n j i b : ℕ) (hn : 3 ≤ n) : 0 ≤ W n j i b :=
  (compensation_iff n j i b hn).2 (central n j i b hn)
end
end CompensationR94
#print axioms CompensationR94.compensation
