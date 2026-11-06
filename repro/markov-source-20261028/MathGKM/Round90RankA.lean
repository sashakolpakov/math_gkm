import MathGKM.Round90RowA

/- Machine-authored round90. Single supported allocation and rank transport. -/
namespace SparseRankR90
open Polynomial SparseRankR89 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 2000000
attribute [local instance] Classical.propDecidable

theorem rank_zero_product (n sigma j L b r : ℕ) (hs : sigma≤1)
    (h : Supported n sigma j L b r) :
    (rankPoly (2*n) sigma j L 0 b).coeff r = row n sigma j r*row n sigma j (L-r) := by
  classical
  have hh := h
  dsimp [Supported] at hh
  rw [rank_zero_sum _ _ _ _ _ _ hs hh.1]
  have he : (2*n-r-j)+(2*n-(L-r)-j)=b := by omega
  have hmem : (2*n-r-j,2*n-(L-r)-j) ∈ Finset.HasAntidiagonal.antidiagonal b :=
    Finset.HasAntidiagonal.mem_antidiagonal.mpr he
  change _ = count _ _ _ _ _*count _ _ _ _ _
  apply Finset.sum_eq_single (2*n-r-j,2*n-(L-r)-j)
  · intro z hz hne
    by_cases h0 : count (isolated n sigma) (cells n sigma) r j z.1=0
    · simp [h0]
    by_cases h1 : count (isolated n sigma) (cells n sigma) (L-r) j z.2=0
    · simp [h1]
    have hp0 := (count_positive_even n sigma r j z.1).mp
      (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm h0))
    have hp1 := (count_positive_even n sigma (L-r) j z.2).mp
      (lt_of_le_of_ne (count_nonneg _ _ _ _ _) (Ne.symm h1))
    exact False.elim (hne (Prod.ext (by omega) (by omega)))
  · intro hn
    exact False.elim (hn hmem)

theorem rank_zero_closed (n sigma j L b r : ℕ) (hs : sigma≤1) :
    (rankPoly (2*n) sigma j L 0 b).coeff r =
      if Supported n sigma j L b r then row n sigma j r*row n sigma j (L-r) else 0 := by
  classical
  by_cases h : Supported n sigma j L b r
  · rw [if_pos h]; exact rank_zero_product _ _ _ _ _ _ hs h
  · rw [if_neg h]
    have hn := rank_nonneg (2*n) sigma j L 0 b r
    have hp := (zero_positive n sigma j L b r hs).not.mpr h
    omega

theorem rank_zero_lc (n sigma j L b r : ℕ) (hs : sigma≤1) :
    (rankPoly (2*n) sigma j L 0 b).coeff r*
      (rankPoly (2*n) sigma j L 0 b).coeff (r+2) ≤
      (rankPoly (2*n) sigma j L 0 b).coeff (r+1)^2 := by
  by_cases h0 : (rankPoly (2*n) sigma j L 0 b).coeff r=0
  · rw [h0,zero_mul]; positivity
  by_cases h2 : (rankPoly (2*n) sigma j L 0 b).coeff (r+2)=0
  · rw [h2,mul_zero]; positivity
  have hp0 : 0<(rankPoly (2*n) sigma j L 0 b).coeff r :=
    lt_of_le_of_ne (rank_nonneg _ _ _ _ _ _ _) (Ne.symm h0)
  have hp2 : 0<(rankPoly (2*n) sigma j L 0 b).coeff (r+2) :=
    lt_of_le_of_ne (rank_nonneg _ _ _ _ _ _ _) (Ne.symm h2)
  have hp1 := zero_interval n sigma j L b r (r+1) (r+2) hs (by omega) (by omega) hp0 hp2
  have hs0 := (zero_positive _ _ _ _ _ _ hs).mp hp0
  have hs1 := (zero_positive _ _ _ _ _ _ hs).mp hp1
  have hs2 := (zero_positive _ _ _ _ _ _ hs).mp hp2
  rw [rank_zero_product _ _ _ _ _ _ hs hs0,rank_zero_product _ _ _ _ _ _ hs hs1,
    rank_zero_product _ _ _ _ _ _ hs hs2]
  have hr : r+2≤L := hs2.1
  have ha := row_lc n sigma j r hs
  have hb := row_lc n sigma j (L-r-2) hs
  rw [show L-r-2+2=L-r by omega,show L-r-2+1=L-(r+1) by omega,
    show L-r-2=L-(r+2) by omega] at hb
  have hh := mul_le_mul ha hb
    (mul_nonneg (row_nonneg _ _ _ _) (row_nonneg _ _ _ _))
    (sq_nonneg (row n sigma j (r+1)))
  nlinarith only [hh]

theorem nat_inward (a : ℕ → ℤ) (hn : ∀ x,0≤a x)
    (hlc : ∀ x,a x*a (x+2)≤a (x+1)^2)
    (hint : ∀ x y z,x<y → y<z → 0<a x → 0<a z → 0<a y)
    (d x : ℕ) : a x*a (x+d+2)≤a (x+1)*a (x+d+1) := by
  induction d generalizing x with
  | zero => simpa [pow_two] using hlc x
  | succ d ih =>
    by_cases h0 : a x=0
    · rw [h0,zero_mul]; exact mul_nonneg (hn _) (hn _)
    by_cases h1 : a (x+(d+1)+2)=0
    · rw [h1,mul_zero]; exact mul_nonneg (hn _) (hn _)
    have hp0 : 0<a x := lt_of_le_of_ne (hn _) (Ne.symm h0)
    have hp1 : 0<a (x+(d+1)+2) := lt_of_le_of_ne (hn _) (Ne.symm h1)
    have hp2 : 0<a (x+d+1) := hint x (x+d+1) (x+(d+1)+2) (by omega) (by omega) hp0 hp1
    have hp3 : 0<a (x+d+2) := hint x (x+d+2) (x+(d+1)+2) (by omega) (by omega) hp0 hp1
    have hlocal := hlc (x+d+1)
    have hprev := ih x
    have hp := mul_le_mul hprev hlocal
      (mul_nonneg (hn _) (hn _)) (mul_nonneg (hn _) (hn _))
    simp only [Nat.add_assoc,Nat.reduceAdd] at hp hp2 hp3 ⊢
    apply le_of_mul_le_mul_right _ (mul_pos hp2 hp3)
    nlinarith only [hp]

theorem rank_zero_increasing (n sigma j L b r : ℕ) (hs : sigma≤1) (hr : 2*r<L) :
    (rankPoly (2*n) sigma j L 0 b).coeff r ≤
      (rankPoly (2*n) sigma j L 0 b).coeff (r+1) := by
  by_cases he : L=2*r+1
  · have hh := rank_symmetry (2*n) sigma j L 0 b r (by omega)
    rw [show L-r=r+1 by omega] at hh
    exact hh.le
  have hh := nat_inward (fun r => (rankPoly (2*n) sigma j L 0 b).coeff r)
    (rank_nonneg (2*n) sigma j L 0 b) (rank_zero_lc n sigma j L b · hs)
    (fun x y z hxy hyz hx hz => zero_interval n sigma j L b x y z hs hxy hyz hx hz)
    (L-2*r-2) r
  rw [show r+(L-2*r-2)+2=L-r by omega,show r+(L-2*r-2)+1=L-(r+1) by omega,
    ← rank_symmetry (2*n) sigma j L 0 b r (by omega),
    ← rank_symmetry (2*n) sigma j L 0 b (r+1) (by omega)] at hh
  nlinarith [rank_nonneg (2*n) sigma j L 0 b r,rank_nonneg (2*n) sigma j L 0 b (r+1)]

theorem alpha_zero_central (n sigma j i b : ℕ) (hs : sigma≤1) :
    (PairConvolutionR78.P (2*n) sigma j (2*i+2) 0 b i).card ≤
      (PairConvolutionR78.P (2*n) sigma j (2*i+2) 0 b (i+1)).card := by
  apply central_transport
  exact rank_zero_increasing n sigma j (2*i+2) b i hs (by omega)

end
end SparseRankR90
#print axioms SparseRankR90.rank_zero_lc
#print axioms SparseRankR90.alpha_zero_central
