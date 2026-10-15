import MarkovRunInterval6d34
/-! Machine-authored c4169865. Exact weighted convolution for repeated-B
degree layers. Arbitrary nonnegative PF2 degree weights are allowed here;
no corresponding claim is made for general source words. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def weightedResidualC416 (s N : ℕ) (q : ℝ[X]) : ℝ[X] :=
 ∑ r ∈ range (N+1),C (q.coeff r)*intervalPoly6d34 s (N-r) 0

theorem weightedResidual_coeffC416 (s N k : ℕ) (q : ℝ[X]) :
 (weightedResidualC416 s N q).coeff k=
 if k≤N then ((k+s).choose s:ℝ)*(nbPoly6d34 s N*q).coeff (N-k) else 0 := by
 have hi (M : ℕ) : (intervalPoly6d34 s M 0).coeff k=
     if k≤M then ((k+s).choose s:ℝ)*((M-k+s).choose s:ℝ) else 0 := by
   rw [intervalPoly_coeff6d34]
   by_cases h : k≤M <;> simp [intervalCoeff6d34,h]
 simp only [weightedResidualC416,Polynomial.finsetSum_coeff,
   Polynomial.coeff_C_mul,hi]
 by_cases hk : k≤N
 · rw [if_pos hk,mul_comm (nbPoly6d34 s N) q,Polynomial.coeff_mul,
     Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
   rw [Finset.mul_sum]
   have hsub : range (N-k+1) ⊆ range (N+1) := by
     intro r hr; simp only [mem_range] at *; omega
   rw [←Finset.sum_subset hsub]
   · apply sum_congr rfl
     intro r hr
     have hr' : r≤N-k := by simpa using hr
     simp only [if_pos (show k≤N-r by omega),nbPoly_coeff6d34,
       if_pos (show N-k-r≤N by omega)]
     rw [show N-r-k=N-k-r by omega]
     ring
   · intro r hr hn
     have hr' : N-k<r := by simpa using hn
     have hrN : r≤N := by simpa using hr
     simp [show ¬k≤N-r by omega]
 · rw [if_neg hk]
   apply sum_eq_zero
   intro r hr
   simp [show ¬k≤N-r by omega]

theorem weightedResidual_seqC416 (s N : ℕ) (q : ℝ[X]) :
 CoeffSeq (weightedResidualC416 s N q)=fun k =>
   CoeffSeq (nbPoly6d34 s N) k *
     CoeffSeq (nbPoly6d34 s N*q) ((N:ℤ)-k) := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,hk]
 · lift k to ℕ using (show 0≤k by omega)
   simp only [CoeffSeq,Int.natCast_nonneg,not_lt.mpr,if_false,
     Int.toNat_natCast,weightedResidual_coeffC416,nbPoly_coeff6d34]
   by_cases h : k≤N
   · simp [h,show ¬(N:ℤ)-k<0 by omega,show ((N:ℤ)-k).toNat=N-k by omega]
   · simp [h]

theorem weightedResidual_crossC416 (s N : ℕ) (q : ℝ[X])
 (hq : CrossLC (CoeffSeq q)) (hnq : ∀ k,0≤q.coeff k) :
 CrossLC (CoeffSeq (weightedResidualC416 s N q)) := by
 rw [weightedResidual_seqC416]
 apply crossLC_product6d34 (nbPoly_cross6d34 s N)
   (crossLC_reverse6d34 (crossLC_poly_mul6d34 _ _ (nbPoly_cross6d34 s N)
     hq (nbPoly_nonneg6d34 s N) hnq) N)
 · exact coeffSeq_nonneg6d34 _ (nbPoly_nonneg6d34 s N)
 · intro k
   apply coeffSeq_nonneg6d34
   intro j
   rw [Polynomial.coeff_mul]
   exact sum_nonneg (fun x _ => mul_nonneg (nbPoly_nonneg6d34 s N x.1) (hnq x.2))

theorem weightedResidual_smoothedC416 (s N t j : ℕ) (q : ℝ[X])
 (hq : CrossLC (CoeffSeq q)) (hnq : ∀ k,0≤q.coeff k) :
 let p := (1+X)^t*weightedResidualC416 s N q
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 have h := crossLC_adjacent (crossLC_pascal
   (weightedResidual_crossC416 s N q hq hnq) t) ((j:ℤ)+1)
 rw [←coeffSeq_binomial_mul] at h
 simpa [CoeffSeq,show ¬(j:ℤ)<0 by omega,
   show ¬(j:ℤ)+1<0 by omega,show ¬(j:ℤ)+1+1<0 by omega,
   show ((j:ℤ)+1+1).toNat=j+2 by omega] using h

#print axioms weightedResidual_coeffC416
#print axioms weightedResidual_crossC416
#print axioms weightedResidual_smoothedC416
end
end MathGKM.Markov
