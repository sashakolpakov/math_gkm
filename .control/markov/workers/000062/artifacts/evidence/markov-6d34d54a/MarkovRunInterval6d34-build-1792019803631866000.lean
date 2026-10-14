import MarkovRunLayerLC6d34
import MarkovSingleLayerInteger9c20
/-! Machine-authored 6d34. Exact higher-cut aggregation over degree intervals
in repeated-B source words. Only the constant-i+j direction is addressed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem intervalPoly_sum6d34 (s L width : ℕ) :
    (∑ r ∈ range (width+1),intervalPoly6d34 s (L+r) 0)=
      intervalPoly6d34 s (L+width) width := by
  ext q
  simp only [Polynomial.finsetSum_coeff,intervalPoly_coeff6d34]
  rw [←Finset.sum_range_reflect]
  by_cases hq : q≤L+width
  · unfold intervalCoeff6d34
    rw [if_pos hq,Finset.mul_sum]
    apply sum_congr rfl
    intro r hr
    have hr' : r≤width := by simpa using hr
    have he : width+1-1-r=width-r := by omega
    rw [he]
    by_cases h : q+r≤L+width
    · have h' : q≤L+(width-r) := by omega
      have e : L+(width-r)-q=L+width-q-r := by omega
      simp [h,h',e]
    · have h' : ¬q≤L+(width-r) := by omega
      simp [h,h']
  · rw [intervalCoeff6d34,if_neg hq]
    apply sum_eq_zero
    intro r hr
    have hr' : r≤width := by simpa using hr
    simp [intervalCoeff6d34,show ¬q≤L+(width-r) by omega]

def runDegreeInterval6d34 {R : Type*} [CommRing R] (y : R)
    (n s L width : ℕ) : R :=
    ∑ r ∈ range (width+1),degreeLayer07a7 y (List.replicate n true)
      (s+1) (2*s+2+L+r)

theorem runDegreeInterval_formula6d34 (n s L width : ℕ)
    (h : s+L+width<n) :
    runDegreeInterval6d34 (X:ℝ[X]) n s L width=
      (1+X)^(2*s+2)*intervalPoly6d34 s (L+width) width := by
  unfold runDegreeInterval6d34
  have he : (∑ r ∈ range (width+1),degreeLayer07a7 (X:ℝ[X])
      (List.replicate n true) (s+1) (2*s+2+L+r)) =
      ∑ r ∈ range (width+1),(1+X)^(2*s+2)*intervalPoly6d34 s (L+r) 0 := by
    apply sum_congr rfl
    intro r hr
    have hr' : r≤width := by simpa using hr
    have hh := run_layer_formula6d34 n (s+L+r) s (by omega) (by omega)
    simpa only [show s+L+r+s+2=2*s+2+L+r by omega,
      show s+L+r-s=L+r by omega] using hh
  rw [he,←Finset.mul_sum,intervalPoly_sum6d34]

theorem runDegreeInterval_lc6d34 (n s L width j : ℕ)
    (h : s+L+width<n) :
    let p := runDegreeInterval6d34 (X:ℝ[X]) n s L width
    p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
  dsimp only
  rw [runDegreeInterval_formula6d34 n s L width h]
  exact intervalPoly_smoothed_lc6d34 s (L+width) width (2*s+2) j

theorem sourceRun_degreeInterval_lc6d34 (n s L width j : ℕ)
    (h : s+L+width≤n) :
    let p := ∑ r ∈ range (width+1),degreeLayer07a7 (X:ℝ[X])
      (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+L+r)
    p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
  dsimp only
  rw [central_right0618,←List.replicate_succ']
  exact runDegreeInterval_lc6d34 (n+1) s L width j (by omega)

theorem runDegreeInterval_cast6d34 (n s L width j : ℕ) :
    ((runDegreeInterval6d34 (X:ℤ[X]) n s L width).coeff j : ℝ)=
      (runDegreeInterval6d34 (X:ℝ[X]) n s L width).coeff j := by
  simp only [runDegreeInterval6d34,Polynomial.finsetSum_coeff]
  push_cast
  apply sum_congr rfl
  intro r hr
  exact degreeLayer_cast_coeff9c20 _ _ _ _

theorem sourceRun_degreeInterval_integer_lc6d34 (n s L width j : ℕ)
    (h : s+L+width≤n) :
    let p := ∑ r ∈ range (width+1),degreeLayer07a7 (X:ℤ[X])
      (central28 (List.replicate n true)++[true]) (s+1) (2*s+2+L+r)
    p.coeff j*p.coeff (j+2)≤p.coeff (j+1)^2 := by
  dsimp only
  rw [central_right0618,←List.replicate_succ']
  have hh := runDegreeInterval_lc6d34 (n+1) s L width j (by omega)
  dsimp only at hh
  rw [←runDegreeInterval_cast6d34,←runDegreeInterval_cast6d34,
    ←runDegreeInterval_cast6d34] at hh
  exact_mod_cast hh

#print axioms runDegreeInterval_formula6d34
#print axioms sourceRun_degreeInterval_lc6d34
#print axioms sourceRun_degreeInterval_integer_lc6d34
end
end MathGKM.Markov
