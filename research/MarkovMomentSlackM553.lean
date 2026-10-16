import MarkovMomentSupportM37B
/-! Machine-authored 55306a3b. Exact interior-slack identity and a linear
weighted-moment certificate. This proves no universal source sign. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

def slackM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ) : ℝ :=
 ∑ r∈P.support, weightM37B P n k r*(((k:ℝ)+2-r)-A)*(B-((k:ℝ)+2-r))

theorem slack_identityM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ) :
 slackM553 P n k A B = (A+B)*firstM37B P n k-
   A*B*massM37B P n k-secondM37B P n k := by
 unfold slackM553 firstM37B massM37B secondM37B
 simp only [Finset.mul_sum,←Finset.sum_sub_distrib]
 apply Finset.sum_congr rfl
 intro r hr
 ring

theorem moment_slack_identityM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ) :
 let W := massM37B P n k
 let U := firstM37B P n k
 momentGapM37B P n k =
 (n+1)*U^2-(n+2)*(A+B-1)*W*U+(n+2)*A*B*W^2+
   (n+2)*W*slackM553 P n k A B := by
 rw [slack_identityM553]
 dsimp [momentGapM37B]
 ring

theorem moment_slack_squareM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ) :
 let W := massM37B P n k
 let U := firstM37B P n k
 4*(n+1)*momentGapM37B P n k =
 (2*(n+1)*U-(n+2)*(A+B-1)*W)^2+
 (n+2)*W*(4*(n+1)*slackM553 P n k A B-
   ((n+2)*(A+B-1)^2-4*(n+1)*A*B)*W) := by
 rw [moment_slack_identityM553 P n k A B]
 dsimp only
 ring

theorem moment_slack_nonnegM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ)
 (hp : ∀ r, 0 ≤ P.coeff r)
 (hs : ((n+2:ℝ)*(A+B-1)^2-4*(n+1)*A*B)*massM37B P n k ≤
   4*(n+1)*slackM553 P n k A B) : 0 ≤ momentGapM37B P n k := by
 have hw : 0 ≤ massM37B P n k :=
   Finset.sum_nonneg (fun r _ => weight_nonnegM37B P n k hp r)
 have h := moment_slack_squareM553 P n k A B
 dsimp only at h
 have hn : 0 ≤ 4*(n+1:ℝ)*momentGapM37B P n k := by
   rw [h]
   exact add_nonneg (sq_nonneg _) (mul_nonneg (mul_nonneg (by positivity) hw)
     (sub_nonneg.mpr hs))
 exact (mul_nonneg_iff_of_pos_left (by positivity : (0:ℝ)<4*(n+1))).mp hn

/-- A linear functional of the residual coefficients, at a chosen real center. -/
def linearMomentM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (C : ℝ) : ℝ :=
 4*(n+1)*(C*firstM37B P n k-secondM37B P n k)-
   (n+2)*(C-1)^2*massM37B P n k

theorem linearMoment_slackM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ) :
 linearMomentM553 P n k (A+B)=4*(n+1)*slackM553 P n k A B-
   ((n+2)*(A+B-1)^2-4*(n+1)*A*B)*massM37B P n k := by
 rw [slack_identityM553]
 unfold linearMomentM553
 ring

theorem linearMoment_sumM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (C : ℝ) :
 linearMomentM553 P n k C = ∑ r∈P.support, weightM37B P n k r*
   (4*(n+1)*(C*((k:ℝ)+2-r)-((k:ℝ)+2-r)^2)-(n+2)*(C-1)^2) := by
 unfold linearMomentM553 firstM37B secondM37B massM37B
 simp only [Finset.mul_sum,←Finset.sum_sub_distrib]
 apply Finset.sum_congr rfl
 intro r hr
 ring

theorem linearMoment_nonnegM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (C : ℝ)
 (hp : ∀ r, 0 ≤ P.coeff r) (hc : 0 ≤ linearMomentM553 P n k C) :
 0 ≤ momentGapM37B P n k := by
 apply moment_slack_nonnegM553 P n k C 0 hp
 rw [show C+0=C by ring] at *
 have h := linearMoment_slackM553 P n k C 0
 simp only [add_zero] at h
 linarith

theorem binomial_linearMoment_lcM553 (P : ℝ[X]) (n : ℕ) (k : ℤ) (C : ℝ)
 (hp : ∀ r, 0 ≤ P.coeff r) (hc : 0 ≤ linearMomentM553 P n k C) :
 CoeffSeq ((1+X)^n*P) k*CoeffSeq ((1+X)^n*P) (k+2) ≤
   CoeffSeq ((1+X)^n*P) (k+1)^2 :=
 (moment_lc_iffM37B P n k).mpr (linearMoment_nonnegM553 P n k C hp hc)

end
end MathGKM.Markov
