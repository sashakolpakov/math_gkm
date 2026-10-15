import MarkovRunInterval6d34
/-! Machine-authored e45ef6ac. Weighted repeated-right degree aggregation.
The finite weight polynomial has nonnegative CrossLC coefficients; no monotonicity
is assumed. This does not establish the general source transport hypothesis. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def weightedRunResidualE45 (s N : ℕ) (W : ℝ[X]) : ℝ[X] :=
 ∑ r ∈ range (N+1), C (W.coeff (N-r))*intervalPoly6d34 s r 0

def weightedRunSeqE45 (s N : ℕ) (W : ℝ[X]) (k : ℤ) : ℝ :=
 CoeffSeq (nbPoly6d34 s N) k *
   CoeffSeq (nbPoly6d34 s N*W) ((N:ℤ)-k)

theorem weightedRunSeq_crossE45 (s N : ℕ) (W : ℝ[X])
 (hn : ∀ k,0≤W.coeff k) (hc : CrossLC (CoeffSeq W)) :
 CrossLC (weightedRunSeqE45 s N W) := by
 apply crossLC_product6d34 (nbPoly_cross6d34 s N)
   (crossLC_reverse6d34 (crossLC_poly_mul6d34 _ _ (nbPoly_cross6d34 s N)
     hc (nbPoly_nonneg6d34 s N) hn) N)
 · exact coeffSeq_nonneg6d34 _ (nbPoly_nonneg6d34 s N)
 · intro k
   apply coeffSeq_nonneg6d34
   intro j
   rw [Polynomial.coeff_mul]
   exact sum_nonneg (fun x _ => mul_nonneg (nbPoly_nonneg6d34 s N x.1) (hn x.2))

theorem weightedRunResidual_coeffE45 (s N q : ℕ) (W : ℝ[X]) :
 (weightedRunResidualE45 s N W).coeff q=
 if q≤N then ((q+s).choose s:ℝ)*(nbPoly6d34 s N*W).coeff (N-q) else 0 := by
 classical
 simp only [weightedRunResidualE45,Polynomial.finsetSum_coeff,
   Polynomial.coeff_C_mul,intervalPoly_coeff6d34]
 by_cases hq : q≤N
 · rw [if_pos hq,Polynomial.coeff_mul,
     Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,Finset.mul_sum]
   have he : (∑ r ∈ range (N+1),W.coeff (N-r)*intervalCoeff6d34 s r 0 q)=
       ∑ r ∈ Ico q (N+1),W.coeff (N-r)*intervalCoeff6d34 s r 0 q := by
     apply (sum_subset (by intro r hr; simp only [mem_Ico,mem_range] at *; omega) ?_).symm
     intro r hr hnr
     have h : ¬q≤r := by simp only [mem_Ico,mem_range] at *; omega
     simp [intervalCoeff6d34,h]
   rw [he,sum_Ico_eq_sum_range,show N+1-q=N-q+1 by omega]
   apply sum_congr rfl
   intro r hr
   have hr' : r≤N-q := by simp only [mem_range] at hr; omega
   simp only [intervalCoeff6d34,show q≤q+r by omega,if_true,
     sum_range_succ,sum_range_zero,zero_add,Nat.add_zero,Nat.add_sub_cancel_left]
   rw [nbPoly_coeff6d34,if_pos (show r≤N by omega)]
   rw [show N-(q+r)=N-q-r by omega]
   simp only [Nat.sub_zero]
   ring
 · rw [if_neg hq]
   apply sum_eq_zero
   intro r hr
   simp [intervalCoeff6d34,show ¬q≤r by simp only [mem_range] at hr; omega]

theorem weightedRunResidual_seqE45 (s N : ℕ) (W : ℝ[X]) :
 CoeffSeq (weightedRunResidualE45 s N W)=weightedRunSeqE45 s N W := by
 funext k
 by_cases hk : k<0
 · simp [CoeffSeq,weightedRunSeqE45,hk]
 · lift k to ℕ using (show 0≤k by omega)
   simp only [weightedRunSeqE45,CoeffSeq,Int.natCast_nonneg,not_lt.mpr,
     if_false,Int.toNat_natCast,weightedRunResidual_coeffE45,nbPoly_coeff6d34]
   by_cases h : k≤N
   · simp [h,show ¬(N:ℤ)-k<0 by omega,show ((N:ℤ)-k).toNat=N-k by omega]
   · simp [h]

theorem weightedRunResidual_lcE45 (s N t j : ℕ) (W : ℝ[X])
 (hn : ∀ k,0≤W.coeff k) (hc : CrossLC (CoeffSeq W)) :
 let p := (1+X)^t*weightedRunResidualE45 s N W
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 have h := crossLC_adjacent
   (crossLC_pascal (weightedRunSeq_crossE45 s N W hn hc) t) ((j:ℤ)+1)
 rw [←weightedRunResidual_seqE45,←coeffSeq_binomial_mul] at h
 simpa [CoeffSeq,show ¬(j:ℤ)<0 by omega,
   show ¬(j:ℤ)+1<0 by omega,show ¬(j:ℤ)+1+1<0 by omega,
   show ((j:ℤ)+1+1).toNat=j+2 by omega] using h

#print axioms weightedRunResidual_coeffE45
#print axioms weightedRunResidual_lcE45
end
end MathGKM.Markov
