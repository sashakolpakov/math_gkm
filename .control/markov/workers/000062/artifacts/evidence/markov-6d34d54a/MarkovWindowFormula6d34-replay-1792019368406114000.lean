import MarkovWindowLC6d34
/-! Machine-authored 6d34. Explicit raw-coefficient finite-window formula.
Its identification with arbitrary source cut layers is NOT assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem coeffSeq_X_mul6d34 (p : ℝ[X]) (r : ℕ) (k : ℤ) :
    CoeffSeq (p*X^r) k=CoeffSeq p (k-r) := by
  by_cases hk : k<0
  · simp [CoeffSeq,hk,show k-(r:ℤ)<0 by omega]
  · simp only [CoeffSeq,hk,if_false,Polynomial.coeff_mul_X_pow']
    by_cases hr : r≤k.toNat
    · simp [hr,show ¬k-(r:ℤ)<0 by omega,show (k-(r:ℤ)).toNat=k.toNat-r by omega]
    · simp [hr,show k-(r:ℤ)<0 by omega]

theorem coeffSeq_sum6d34 (p : ℕ → ℝ[X]) (n : ℕ) (k : ℤ) :
    CoeffSeq (∑ r ∈ range n,p r) k=∑ r ∈ range n,CoeffSeq (p r) k := by
  by_cases hk : k<0 <;> simp [CoeffSeq,hk,Polynomial.finsetSum_coeff]

theorem nb_zero6d34 (width : ℕ) :
    nbPoly6d34 0 width=∑ r ∈ range (width+1),(X:ℝ[X])^r := by
  simp [nbPoly6d34,← Polynomial.C_mul_X_pow_eq_monomial]

theorem window_coeff6d34 (p : ℝ[X]) (width : ℕ) (k : ℤ) :
    CoeffSeq (p*nbPoly6d34 0 width) k=
      ∑ r ∈ range (width+1),CoeffSeq p (k-r) := by
  rw [nb_zero6d34,Finset.mul_sum,coeffSeq_sum6d34]
  apply sum_congr rfl
  intro r hr
  exact coeffSeq_X_mul6d34 p r k

def intervalCoeff6d34 (s N width k : ℕ) : ℝ :=
  if k≤N then ((k+s).choose s : ℝ)*
    ∑ r ∈ range (width+1), if k+r≤N then ((N-k-r+s).choose s : ℝ) else 0
  else 0

def intervalPoly6d34 (s N width : ℕ) : ℝ[X] :=
  ∑ k ∈ range (N+1),monomial k (intervalCoeff6d34 s N width k)

theorem intervalPoly_coeff6d34 (s N width k : ℕ) :
    (intervalPoly6d34 s N width).coeff k=intervalCoeff6d34 s N width k := by
  classical
  simp only [intervalPoly6d34,Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
  rw [Finset.sum_ite_eq']
  by_cases hk : k≤N
  · simp [hk]
  · simp [hk,intervalCoeff6d34]

theorem runInterval_nat6d34 (s N width k : ℕ) :
    runIntervalSeq6d34 s N width k=intervalCoeff6d34 s N width k := by
  unfold runIntervalSeq6d34
  simp only [CoeffSeq,Int.natCast_nonneg,not_lt.mpr,if_false,
    Int.toNat_natCast,nbPoly_coeff6d34]
  by_cases hk : k≤N
  · rw [if_pos hk]
    change ((k+s).choose s : ℝ)*
      CoeffSeq (nbPoly6d34 s N*nbPoly6d34 0 width) ((N:ℤ)-k)=_
    rw [window_coeff6d34]
    unfold intervalCoeff6d34
    rw [if_pos hk]
    congr 1
    apply sum_congr rfl
    intro r hr
    by_cases h : k+r≤N
    · simp [CoeffSeq,show ¬(N:ℤ)-k-r<0 by omega,
        show ((N:ℤ)-k-r).toNat=N-k-r by omega,nbPoly_coeff6d34,h,
        show N-k-r≤N by omega]
    · simp [CoeffSeq,show (N:ℤ)-k-r<0 by omega,h]
  · simp [hk,intervalCoeff6d34]

theorem intervalPoly_seq6d34 (s N width : ℕ) :
    CoeffSeq (intervalPoly6d34 s N width)=runIntervalSeq6d34 s N width := by
  funext k
  by_cases hk : k<0
  · simp [CoeffSeq,runIntervalSeq6d34,hk]
  · lift k to ℕ using (show 0≤k by omega)
    simpa only [CoeffSeq,show ¬(k:ℤ)<0 by omega,if_false,Int.toNat_natCast,
      intervalPoly_coeff6d34] using (runInterval_nat6d34 s N width k).symm

theorem intervalPoly_smoothed_lc6d34 (s N width t k : ℕ) :
    (((1+X)^t*intervalPoly6d34 s N width):ℝ[X]).coeff k*
      (((1+X)^t*intervalPoly6d34 s N width):ℝ[X]).coeff (k+2) ≤
      (((1+X)^t*intervalPoly6d34 s N width):ℝ[X]).coeff (k+1)^2 := by
  have h := crossLC_adjacent
    (crossLC_pascal (runInterval_cross6d34 s N width) t) ((k:ℤ)+1)
  rw [← intervalPoly_seq6d34,← coeffSeq_binomial_mul] at h
  simpa [CoeffSeq,show ¬(k:ℤ)<0 by omega,
    show ¬(k:ℤ)+1<0 by omega,show ¬(k:ℤ)+1+1<0 by omega,
    show ((k:ℤ)+1+1).toNat=k+2 by omega] using h

#print axioms intervalPoly_seq6d34
#print axioms intervalPoly_smoothed_lc6d34
end
end MathGKM.Markov
