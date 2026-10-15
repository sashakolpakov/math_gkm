import MarkovWeightedRunE45e
/-! Machine-authored e45ef6ac. Literal repeated-right source layers and arbitrary
nonnegative log-concave finite degree weights. All masks retain multiplicity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 3000000

def weightedSourceRunE45 (n s N : ℕ) (W : ℝ[X]) : ℝ[X] :=
 ∑ r ∈ range (N+1), C (W.coeff (N-r))*degreeLayer07a7 (X:ℝ[X])
   (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+r)

theorem weightedSourceRun_formulaE45 (n s N : ℕ) (h : s+N≤n) (W : ℝ[X]) :
 weightedSourceRunE45 n s N W=(1+X)^(2*s+2)*weightedRunResidualE45 s N W := by
 unfold weightedSourceRunE45 weightedRunResidualE45
 rw [Finset.mul_sum]
 apply sum_congr rfl
 intro r hr
 have hr' : r≤N := by simpa using hr
 rw [central_right0618,←List.replicate_succ']
 have hh := run_layer_formula6d34 (n+1) (s+r) s (by omega) (by omega)
 rw [show s+r+s+2=2*s+2+r by omega,show s+r-s=r by omega] at hh
 rw [hh]
 ring

theorem weightedSourceRun_lcE45 (n s N j : ℕ) (h : s+N≤n) (W : ℝ[X])
 (hn : ∀ k,0≤W.coeff k) (hc : CrossLC (CoeffSeq W)) :
 (weightedSourceRunE45 n s N W).coeff j*
   (weightedSourceRunE45 n s N W).coeff (j+2)≤
   (weightedSourceRunE45 n s N W).coeff (j+1)^2 := by
 rw [weightedSourceRun_formulaE45 n s N h W]
 exact weightedRunResidual_lcE45 s N (2*s+2) j W hn hc

theorem run_layer_belowE45 {R : Type*} [CommRing R] (y : R)
 (n s d : ℕ) (hd : d<2*s+2) :
 degreeLayer07a7 y (List.replicate n true) (s+1) d=0 := by
 induction n with
 | zero => simp [degreeLayer07a7,cutMasksFe01]
 | succ n ih =>
   rw [layer_run_step6d34,ih,zero_add]
   by_cases he : d=n+s+2
   · rw [if_pos he,cutCoeff_boundA27 _ _ _ _ _ (by simp; omega),
       cutCoeff_boundA27 _ _ _ _ _ (by simp; omega),sub_self]
   · rw [if_neg he]

theorem source_layer_outsideE45 (n s d : ℕ)
 (hd : d<2*s+2 ∨ n+s+2<d) :
 degreeLayer07a7 (X:ℝ[X]) (central28 (List.replicate n true)++[true]) (s+1) d=0 := by
 rw [central_right0618,←List.replicate_succ']
 rcases hd with hd|hd
 · exact run_layer_belowE45 X (n+1) s d hd
 · exact layer_run_above6d34 X (n+1) s d (by omega)

def weightedSourceRunIntE45 (n s N : ℕ) (W : ℤ[X]) : ℤ[X] :=
 ∑ r ∈ range (N+1), C (W.coeff (N-r))*degreeLayer07a7 (X:ℤ[X])
   (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+r)

theorem weightedSourceRun_castE45 (n s N j : ℕ) (W : ℤ[X]) :
 ((weightedSourceRunIntE45 n s N W).coeff j:ℝ)=
   (weightedSourceRunE45 n s N (W.map (Int.castRingHom ℝ))).coeff j := by
 simp only [weightedSourceRunIntE45,weightedSourceRunE45,
   Polynomial.finsetSum_coeff,Polynomial.coeff_C_mul,Polynomial.coeff_map]
 push_cast
 apply sum_congr rfl
 intro r hr
 rw [degreeLayer_cast_coeff9c20]
 rfl

theorem weightedSourceRun_integer_lcE45 (n s N j : ℕ) (h : s+N≤n) (W : ℤ[X])
 (hn : ∀ k,0≤W.coeff k)
 (hc : CrossLC (CoeffSeq (W.map (Int.castRingHom ℝ)))) :
 (weightedSourceRunIntE45 n s N W).coeff j*
   (weightedSourceRunIntE45 n s N W).coeff (j+2)≤
   (weightedSourceRunIntE45 n s N W).coeff (j+1)^2 := by
 have hh := weightedSourceRun_lcE45 n s N j h (W.map (Int.castRingHom ℝ))
   (by intro k; simpa using (show (0:ℝ)≤(W.coeff k:ℝ) by exact_mod_cast hn k)) hc
 rw [←weightedSourceRun_castE45,←weightedSourceRun_castE45,
   ←weightedSourceRun_castE45] at hh
 exact_mod_cast hh

#print axioms weightedSourceRun_formulaE45
#print axioms weightedSourceRun_lcE45
#print axioms source_layer_outsideE45
#print axioms weightedSourceRun_integer_lcE45
end
end MathGKM.Markov
