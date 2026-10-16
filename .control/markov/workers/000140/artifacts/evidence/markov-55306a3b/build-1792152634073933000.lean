import MarkovMomentSlackM553
/-! Machine-authored 55306a3b. Center optimization is an equivalence,
not an unconditional sign theorem. All-zero weights remain included. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def optimalCenterM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) : ℝ :=
 1+2*(n+1)*firstM37B P n k/((n+2)*massM37B P n k)

theorem linear_square_identityM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (C : ℝ) :
 4*(n+1)*momentGapM37B P n k=
   (2*(n+1)*firstM37B P n k-(n+2)*(C-1)*massM37B P n k)^2+
   (n+2)*massM37B P n k*linearMomentM553 P n k C := by
 unfold momentGapM37B linearMomentM553
 ring

theorem optimal_linear_identityM553 (P : ℝ[X]) (n : ℕ) (k : ℤ)
 (hw : massM37B P n k≠0) :
 (n+2)*massM37B P n k*linearMomentM553 P n k (optimalCenterM553 P n k)=
   4*(n+1)*momentGapM37B P n k := by
 have h := linear_square_identityM553 P n k (optimalCenterM553 P n k)
 have hn : (n+2:ℝ)≠0 := by positivity
 have he : 2*(n+1)*firstM37B P n k-
   (n+2)*(optimalCenterM553 P n k-1)*massM37B P n k=0 := by
   unfold optimalCenterM553
   field_simp
   <;> ring
 rw [he,zero_pow (by decide : (2:ℕ)≠0),zero_add] at h
 exact h.symm

theorem zero_mass_momentsM553 (P : ℝ[X]) (n : ℕ) (k : ℤ)
 (hp : ∀ r, 0≤P.coeff r) (hw : massM37B P n k=0) :
 firstM37B P n k=0 ∧ secondM37B P n k=0 := by
 have hz : ∀ r∈P.support, weightM37B P n k r=0 :=
   (Finset.sum_eq_zero_iff_of_nonneg (fun r _ => weight_nonnegM37B P n k hp r)).mp hw
 constructor
 · exact Finset.sum_eq_zero (fun r hr => by rw [hz r hr,mul_zero,zero_mul])
 · exact Finset.sum_eq_zero (fun r hr => by rw [hz r hr,mul_zero,zero_mul])

theorem moment_iff_optimal_linearM553 (P : ℝ[X]) (n : ℕ) (k : ℤ)
 (hp : ∀ r, 0≤P.coeff r) :
 0≤momentGapM37B P n k ↔
   0≤linearMomentM553 P n k (optimalCenterM553 P n k) := by
 by_cases hw : massM37B P n k=0
 · obtain ⟨hu,hv⟩ := zero_mass_momentsM553 P n k hp hw
   simp [momentGapM37B,linearMomentM553,hw,hu,hv]
 · have hw0 : 0<massM37B P n k := lt_of_le_of_ne
     (Finset.sum_nonneg (fun r _ => weight_nonnegM37B P n k hp r)) (Ne.symm hw)
   have h := optimal_linear_identityM553 P n k hw
   have h1 : (0:ℝ)<(n+2)*massM37B P n k := by positivity
   have h2 : (0:ℝ)<4*(n+1) := by positivity
   constructor
   · intro hg
     exact (mul_nonneg_iff_of_pos_left h1).mp (by rw [h]; positivity)
   · intro hl
     exact (mul_nonneg_iff_of_pos_left h2).mp (by rw [←h]; positivity)

end
end MathGKM.Markov
