import MarkovRunPrefix6d34
/-! Machine-authored 6d34. Actual repeated-B fixed-degree layers. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

def runResidual6d34 (n s : ℕ) : ℝ[X] :=
  ∑ q ∈ range (n+2),monomial q
    (((n+1-q).choose (s+1) : ℝ)*((s+q).choose q : ℝ))

theorem runResidual_coeff6d34 (n s q : ℕ) :
    (runResidual6d34 n s).coeff q=
      ((n+1-q).choose (s+1) : ℝ)*((s+q).choose q : ℝ) := by
  classical
  simp only [runResidual6d34,Polynomial.finsetSum_coeff,Polynomial.coeff_monomial]
  rw [sum_ite_eq']
  by_cases hq : q<n+2
  · simp [hq]
  · have hz : n+1-q=0 := by omega
    simp [hq,hz]

theorem runPrefix_all6d34 (n s : ℕ) :
    cutCoeffA27 (X:ℝ[X]) X 1 (List.replicate (n+1) true) (s+1)=
      runPrefixPoly6d34 n s := by
  by_cases hs : s≤n
  · exact runPrefix_exact6d34 n s hs
  · rw [cutCoeff_boundA27 _ _ _ _ _ (by simp; omega)]
    unfold runPrefixPoly6d34
    have hz : runResidual6d34 n s=0 := by
      ext q
      rw [runResidual_coeff6d34]
      simp [Nat.choose_eq_zero_of_lt (show n+1-q<s+1 by omega)]
    change 0=(1+X)^(2*s+2)*runResidual6d34 n s
    rw [hz,mul_zero]

theorem runResidual_increment6d34 (k s : ℕ) (hk : 1≤k) (hs : s≤k) :
    runResidual6d34 k s-runResidual6d34 (k-1) s=
      intervalPoly6d34 s (k-s) 0 := by
  ext q
  rw [Polynomial.coeff_sub,runResidual_coeff6d34,runResidual_coeff6d34,
    intervalPoly_coeff6d34]
  rw [show k-1+1=k by omega]
  by_cases hq : q≤k
  · have e : k+1-q=(k-q)+1 := by omega
    rw [e,Nat.choose_succ_succ]
    push_cast
    have hsym : (s+q).choose q=(q+s).choose s := by
      rw [Nat.add_comm,Nat.choose_symm_add]
    rw [hsym]
    by_cases hqs : q≤k-s
    · have e2 : k-s-q+s=k-q := by omega
      simp [intervalCoeff6d34,hqs,e2]
      ring
    · have hz : (k-q).choose s=0 := Nat.choose_eq_zero_of_lt (by omega)
      simp [intervalCoeff6d34,hqs,hz]
      ring
  · have e0 : k+1-q=0 := by omega
    have e1 : k-q=0 := by omega
    simp [e0,e1,intervalCoeff6d34,show ¬q≤k-s by omega]

theorem cut_run_increment_formula6d34 (k s : ℕ) (hs : s≤k) :
    cutCoeffA27 (X:ℝ[X]) X 1 (List.replicate (k+1) true) (s+1)-
      cutCoeffA27 (X:ℝ[X]) X 1 (List.replicate k true) (s+1)=
      (1+X)^(2*s+2)*intervalPoly6d34 s (k-s) 0 := by
  cases k with
  | zero =>
    have hs0 : s=0 := by omega
    subst s
    have hp : intervalPoly6d34 0 0 0=(1:ℝ[X]) := by
      simp [intervalPoly6d34,intervalCoeff6d34]
    simp [cutCoeffA27,cutFactorA27,cutChargeA27,hp,List.replicate_succ]
    ring
  | succ k =>
    rw [runPrefix_all6d34,runPrefix_all6d34]
    change (1+X)^(2*s+2)*runResidual6d34 (k+1) s-
      (1+X)^(2*s+2)*runResidual6d34 k s=_
    rw [←mul_sub]
    have h := runResidual_increment6d34 (k+1) s (by omega) hs
    simpa using congrArg (fun p : ℝ[X] => (1+X)^(2*s+2)*p) h

theorem run_layer_formula6d34 (n k s : ℕ) (hk : k<n) (hs : s≤k) :
    degreeLayer07a7 (X:ℝ[X]) (List.replicate n true) (s+1) (k+s+2)=
      (1+X)^(2*s+2)*intervalPoly6d34 s (k-s) 0 := by
  rw [layer_run_exact6d34 _ n k s hk,cut_run_increment_formula6d34 k s hs]

theorem run_layer_lc6d34 (n k s j : ℕ) (hk : k<n) (hs : s≤k) :
    let p := degreeLayer07a7 (X:ℝ[X]) (List.replicate n true) (s+1) (k+s+2)
    p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
  dsimp only
  rw [run_layer_formula6d34 n k s hk hs]
  exact intervalPoly_smoothed_lc6d34 s (k-s) 0 (2*s+2) j

#print axioms run_layer_formula6d34
#print axioms run_layer_lc6d34
end
end MathGKM.Markov
