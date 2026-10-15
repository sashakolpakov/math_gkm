import MarkovWeightedWindowC416
/-! Machine-authored c4169865. Actual source-layer weighted aggregation on
every repeated-right path. This is an auxiliary diagonal theorem only. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def weightedRunC416 (n s N : ℕ) (q : ℝ[X]) : ℝ[X] :=
 ∑ r ∈ range (N+1),C (q.coeff r)*degreeLayer07a7 (X:ℝ[X])
   (List.replicate n true) (s+1) (2*s+2+(N-r))

theorem weightedRun_formulaC416 (n s N : ℕ) (q : ℝ[X]) (h : s+N<n) :
 weightedRunC416 n s N q=(1+X)^(2*s+2)*weightedResidualC416 s N q := by
 unfold weightedRunC416 weightedResidualC416
 rw [Finset.mul_sum]
 apply sum_congr rfl
 intro r hr
 have hr' : r≤N := by simpa using hr
 have hh := run_layer_formula6d34 n (s+(N-r)) s (by omega) (by omega)
 rw [show s+(N-r)+s+2=2*s+2+(N-r) by omega,
   show s+(N-r)-s=N-r by omega] at hh
 rw [hh]
 ring

theorem weightedRun_lcC416 (n s N j : ℕ) (q : ℝ[X]) (h : s+N<n)
 (hq : CrossLC (CoeffSeq q)) (hnq : ∀ k,0≤q.coeff k) :
 (weightedRunC416 n s N q).coeff j*(weightedRunC416 n s N q).coeff (j+2)≤
 (weightedRunC416 n s N q).coeff (j+1)^2 := by
 rw [weightedRun_formulaC416 n s N q h]
 exact weightedResidual_smoothedC416 s N (2*s+2) j q hq hnq

theorem source_weightedRun_lcC416 (n s N j : ℕ) (q : ℝ[X]) (h : s+N≤n)
 (hq : CrossLC (CoeffSeq q)) (hnq : ∀ k,0≤q.coeff k) :
 let p := ∑ r ∈ range (N+1),C (q.coeff r)*degreeLayer07a7 (X:ℝ[X])
   (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+(N-r))
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 dsimp only
 rw [central_right0618,←List.replicate_succ']
 exact weightedRun_lcC416 (n+1) s N j q (by omega) hq hnq

/-- Integer raw layer coefficients, with weights also integers. The real
cast only states the PF2 condition; it does not normalize any coefficient. -/
theorem source_weightedRun_integer_lcC416 (n s N j : ℕ) (q : ℤ[X])
 (h : s+N≤n) (hq : CrossLC (CoeffSeq (q.map (Int.castRingHom ℝ))))
 (hnq : ∀ k,0≤q.coeff k) :
 let p := ∑ r ∈ range (N+1),C (q.coeff r)*degreeLayer07a7 (X:ℤ[X])
   (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+(N-r))
 p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
 have hnqr (k : ℕ) : 0≤(q.map (Int.castRingHom ℝ)).coeff k := by
   simp only [Polynomial.coeff_map,Int.coe_castRingHom]
   exact_mod_cast hnq k
 have hh := source_weightedRun_lcC416 n s N j (q.map (Int.castRingHom ℝ)) h hq hnqr
 dsimp only at hh ⊢
 simp only [Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,
   Polynomial.coeff_map,Int.coe_castRingHom] at hh ⊢
 have hc (k : ℕ) :
   ((∑ r ∈ range (N+1),q.coeff r*(degreeLayer07a7 (X:ℤ[X])
     (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+(N-r))).coeff k):ℝ)=
   ∑ r ∈ range (N+1),(q.coeff r:ℝ)*(degreeLayer07a7 (X:ℝ[X])
     (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+(N-r))).coeff k := by
   push_cast
   apply sum_congr rfl
   intro r hr
   rw [degreeLayer_cast_coeff9c20]
 rw [←hc j,←hc (j+2),←hc (j+1)] at hh
 exact_mod_cast hh

#print axioms weightedRun_formulaC416
#print axioms source_weightedRun_lcC416
#print axioms source_weightedRun_integer_lcC416
end
end MathGKM.Markov
