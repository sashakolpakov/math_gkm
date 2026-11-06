import MathGKM.Accepted3c5512444ed7f17d3a8e718f

/- Machine-authored round91: collapse each of the two alpha-one allocations.
All natural subtraction and beta-allocation guards are retained. -/
namespace SparseCentralR91
open Polynomial SparseRankR89 SparseCoupledR90 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000

def allocation (n sigma j r k b : ℕ) : ℤ :=
  if 2*n-r-j ≤ b then
    count (isolated n sigma) (cells n sigma) r j (2*n-r-j) *
      oneCount n sigma k j (b-(2*n-r-j))
  else 0

theorem count_support (n sigma r j q : ℕ)
    (h : count (isolated n sigma) (cells n sigma) r j q ≠ 0) :
    q=2*n-r-j := by
  have hp := (count_positive_even n sigma r j q).mp
    (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm h))
  omega

theorem single_convolution (f g : ℕ → ℤ) (p b : ℕ)
    (hf : ∀ q, f q ≠ 0 → q=p) :
    (∑ q ∈ Finset.HasAntidiagonal.antidiagonal b, f q.1*g q.2) =
      if p≤b then f p*g (b-p) else 0 := by
  classical
  by_cases hp : p≤b
  · rw [if_pos hp]
    apply Finset.sum_eq_single (p,b-p)
    · intro q hq hne
      have he := Finset.HasAntidiagonal.mem_antidiagonal.mp hq
      by_cases hz : f q.1=0
      · simp [hz]
      · have hqp := hf q.1 hz
        exact False.elim (hne (Prod.ext hqp (by omega)))
    · intro hnot
      exact False.elim (hnot (Finset.HasAntidiagonal.mem_antidiagonal.mpr (by omega)))
  · rw [if_neg hp]
    apply Finset.sum_eq_zero
    intro q hq
    have he := Finset.HasAntidiagonal.mem_antidiagonal.mp hq
    have hz : f q.1=0 := by
      by_contra hh
      have hqp := hf q.1 hh
      omega
    simp [hz]

theorem rank_two_allocations (n sigma j L b r : ℕ) (hs : sigma≤1) (hr : r≤L) :
    (rankPoly (2*n) sigma j L 1 b).coeff r =
      allocation n sigma j r (L-r) b + allocation n sigma j (L-r) r b := by
  classical
  rw [(Accepted3c5512444ed7f17d3a8e718f.obligation n sigma hs).2.2 j L b |>.1 r hr,
    Finset.sum_add_distrib]
  have h0 := single_convolution
    (count (isolated n sigma) (cells n sigma) r j)
    (oneCount n sigma (L-r) j) (2*n-r-j) b (count_support n sigma r j)
  have h1 := single_convolution
    (count (isolated n sigma) (cells n sigma) (L-r) j)
    (oneCount n sigma r j) (2*n-(L-r)-j) b (count_support n sigma (L-r) j)
  rw [h0]
  change allocation n sigma j r (L-r) b + _ = _
  congr 1
  change _ = allocation n sigma j (L-r) r b at h1
  rw [← h1]
  rw [← Finset.Nat.sum_antidiagonal_swap]
  apply Finset.sum_congr rfl
  intro q hq
  dsimp only [Prod.swap]
  ring

theorem central_iff (n sigma j i b : ℕ) (hs : sigma≤1) :
    ((PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b i).card ≤
      (PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b (i+1)).card) ↔
    allocation n sigma j i (i+2) b + allocation n sigma j (i+2) i b ≤
      2*allocation n sigma j (i+1) (i+1) b := by
  have h0 := rank_two_allocations n sigma j (2*i+2) b i hs (by omega)
  have h1 := rank_two_allocations n sigma j (2*i+2) b (i+1) hs (by omega)
  rw [show 2*i+2-i=i+2 by omega] at h0
  rw [show 2*i+2-(i+1)=i+1 by omega] at h1
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 (2*n) sigma j (2*i+2) 1 b i).1] at h0
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 (2*n) sigma j (2*i+2) 1 b (i+1)).1] at h1
  constructor
  · intro h
    have hh : ((PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b i).card : ℤ) ≤
        ((PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b (i+1)).card : ℤ) := by exact_mod_cast h
    omega
  · intro h
    have hh : ((PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b i).card : ℤ) ≤
        ((PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b (i+1)).card : ℤ) := by omega
    exact_mod_cast hh

theorem central_zero (n sigma j i b : ℕ) (hs : sigma≤1)
    (hout : 2*i+2+2*j+b+1≠4*n) :
    (PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b i).card=0 ∧
    (PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 b (i+1)).card=0 := by
  have hz := ((Accepted3c5512444ed7f17d3a8e718f.obligation n sigma hs).2.2 j (2*i+2) b).2.2 hout
  constructor
  all_goals
    apply Int.natCast_inj.mp
    rw [← (Accepted0beeba7c6244e2295e3e804c.obligation.1 _ _ _ _ _ _ _).1,hz]
    rfl

theorem even_beta_zero (n sigma j i c : ℕ) (hs : sigma≤1) :
    (PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 (2*c) i).card=0 ∧
    (PairConvolutionR78.P (2*n) sigma j (2*i+2) 1 (2*c) (i+1)).card=0 := by
  exact central_zero n sigma j i (2*c) hs (by omega)

end
end SparseCentralR91
#print axioms SparseCentralR91.central_iff
#print axioms SparseCentralR91.even_beta_zero
