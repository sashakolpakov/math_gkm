import MathGKM.Round89ExtractionA
import MathGKM.Accepted0beeba7c6244e2295e3e804c

/- Machine-authored round89. Actual rank correspondence and guarded support. -/
namespace SparseRankR89
open Polynomial SparseColorR88 MatchingProjectionR64 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1500000
theorem rank_nonneg (N sigma j L a b r : ℕ) :
    0 ≤ (rankPoly N sigma j L a b).coeff r := by
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L a b r).1]
  positivity
theorem rank_symmetry (N sigma j L a b r : ℕ) (hr : r ≤ L) :
    (rankPoly N sigma j L a b).coeff r=
      (rankPoly N sigma j L a b).coeff (L-r) := by
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L a b r).2 hr,
    (Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L a b (L-r)).2 (by omega),
    Nat.sub_sub_self hr,mul_comm]
theorem rank_tail (N sigma j L a b r : ℕ) (hr : L < r) :
    (rankPoly N sigma j L a b).coeff r=0 := by
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L a b r).1,
    FullFiberRankR80.card_above N sigma j L a b r hr]
  rfl
theorem rank_zero_sum (n sigma j L b r : ℕ) (hs : sigma ≤ 1) (hr : r ≤ L) :
    (rankPoly (2*n) sigma j L 0 b).coeff r=
      ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
        count (isolated n sigma) (cells n sigma) r j q.1 *
        count (isolated n sigma) (cells n sigma) (L-r) j q.2 := by
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 (2*n) sigma j L 0 b r).2 hr,
    mul_coeff_zero,coeff_mul]
  apply Finset.sum_congr rfl
  intro q hq
  rw [zero_count n sigma r j q.1 hs,zero_count n sigma (L-r) j q.2 hs]
theorem dimension (n sigma : ℕ) : isolated n sigma+2*cells n sigma=2*n := by
  rcases n with _|n <;> simp [isolated,cells] <;> split_ifs <;> omega
theorem count_positive_even (n sigma i j b : ℕ) :
    0 < count (isolated n sigma) (cells n sigma) i j b ↔
      b ≤ cells n sigma ∧ b ≤ j ∧ i+j+b=2*n := by
  rw [count_positive,dimension]
  have hd := dimension n sigma
  constructor
  · tauto
  · rintro ⟨h1,h2,h3⟩
    exact ⟨h1,h2,h3,by omega⟩
def Supported (n sigma j L b r : ℕ) : Prop :=
  r ≤ L ∧ L+2*j+b=4*n ∧ r+j ≤ 2*n ∧ (L-r)+j ≤ 2*n ∧
    2*n ≤ r+j+cells n sigma ∧ 2*n ≤ (L-r)+j+cells n sigma ∧
    2*n ≤ r+2*j ∧ 2*n ≤ (L-r)+2*j
theorem zero_positive (n sigma j L b r : ℕ) (hs : sigma ≤ 1) :
    0 < (rankPoly (2*n) sigma j L 0 b).coeff r ↔ Supported n sigma j L b r := by
  classical
  by_cases hr : r ≤ L
  · rw [rank_zero_sum n sigma j L b r hs hr]
    rw [Finset.sum_pos_iff_of_nonneg]
    · constructor
      · rintro ⟨⟨p,q⟩,hpq,hpos⟩
        have hpq' := Finset.HasAntidiagonal.mem_antidiagonal.mp hpq
        have hp : 0 < count (isolated n sigma) (cells n sigma) r j p :=
          pos_of_mul_pos_left hpos (count_nonneg _ _ _ _ _)
        have hq : 0 < count (isolated n sigma) (cells n sigma) (L-r) j q :=
          pos_of_mul_pos_right hpos (count_nonneg _ _ _ _ _)
        rw [count_positive_even] at hp hq
        dsimp [Supported]
        omega
      · intro h
        dsimp [Supported] at h
        refine ⟨(2*n-r-j,2*n-(L-r)-j),Finset.HasAntidiagonal.mem_antidiagonal.mpr (by omega),?_⟩
        apply mul_pos <;> rw [count_positive_even] <;> omega
    · intro q hq
      exact mul_nonneg (count_nonneg _ _ _ _ _) (count_nonneg _ _ _ _ _)
  · rw [rank_tail _ _ _ _ _ _ _ (by omega)]
    simp only [lt_self_iff_false,false_iff,Supported]
    tauto
theorem zero_interval (n sigma j L b x y z : ℕ) (hs : sigma ≤ 1)
    (hxy : x < y) (hyz : y < z)
    (hx : 0 < (rankPoly (2*n) sigma j L 0 b).coeff x)
    (hz : 0 < (rankPoly (2*n) sigma j L 0 b).coeff z) :
    0 < (rankPoly (2*n) sigma j L 0 b).coeff y := by
  rw [zero_positive _ _ _ _ _ _ hs] at hx hz ⊢
  dsimp [Supported] at hx hz ⊢
  omega
theorem central_transport (N sigma j i a b : ℕ)
    (h : (rankPoly N sigma j (2*i+2) a b).coeff i ≤
      (rankPoly N sigma j (2*i+2) a b).coeff (i+1)) :
    (PairConvolutionR78.P N sigma j (2*i+2) a b i).card ≤
      (PairConvolutionR78.P N sigma j (2*i+2) a b (i+1)).card := by
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j (2*i+2) a b i).1,
    (Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j (2*i+2) a b (i+1)).1] at h
  exact_mod_cast h
end
end SparseRankR89
#print axioms SparseRankR89.zero_positive
#print axioms SparseRankR89.zero_interval
