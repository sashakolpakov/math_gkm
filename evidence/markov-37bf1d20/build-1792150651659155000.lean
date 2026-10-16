import MarkovMomentAllM37B
/-! Machine-authored 37bf1d20. A discriminant support criterion for the
unnormalized weighted-moment gap. No universal source-sign assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem support_moment_gapM37B {ι : Type*} (s : Finset ι) (q x : ι → ℝ)
 (A B H : ℝ) (hH : 1 < H)
 (hq : ∀ r∈s, 0 ≤ q r)
 (hx : ∀ r∈s, q r≠0 → A ≤ x r ∧ x r ≤ B)
 (hd : H*(A+B-1)^2 ≤ 4*(H-1)*A*B) :
 let W := ∑ r∈s, q r
 let U := ∑ r∈s, q r*x r
 let V := ∑ r∈s, q r*x r^2
 H*(W*V-U^2) ≤ U*(H*W-U) := by
 dsimp only
 let W := ∑ r∈s, q r
 let U := ∑ r∈s, q r*x r
 let V := ∑ r∈s, q r*x r^2
 change H*(W*V-U^2) ≤ U*(H*W-U)
 have hW : 0 ≤ W := Finset.sum_nonneg hq
 have hV : V ≤ (A+B)*U-A*B*W := by
   have hh := Finset.sum_nonneg (s := s) (f := fun r => q r*((x r-A)*(B-x r)))
     (fun r hr => by
       by_cases hz : q r=0
       · simp [hz]
       · exact mul_nonneg (hq r hr)
           (mul_nonneg (sub_nonneg.mpr (hx r hr hz).1) (sub_nonneg.mpr (hx r hr hz).2)))
   have he : (∑ r∈s, q r*((x r-A)*(B-x r)))=(A+B)*U-A*B*W-V := by
     dsimp [W,U,V]
     simp only [Finset.mul_sum,←Finset.sum_sub_distrib]
     apply Finset.sum_congr rfl
     intro r hr
     ring
   rw [he] at hh
   linarith
 let F := U*(H*W-U)-H*(W*V-U^2)
 let Q := (H-1)*U^2-H*(A+B-1)*W*U+H*A*B*W^2
 have hF : Q ≤ F := by
   have hh := mul_le_mul_of_nonneg_left hV (mul_nonneg (by linarith : 0≤H) hW)
   dsimp [Q,F]
   nlinarith only [hh]
 have he : 4*(H-1)*Q = (2*(H-1)*U-H*(A+B-1)*W)^2+
   H*(4*(H-1)*A*B-H*(A+B-1)^2)*W^2 := by dsimp [Q]; ring
 have hn : 0 ≤ 4*(H-1)*Q := by
   rw [he]
   exact add_nonneg (sq_nonneg _) (mul_nonneg
     (mul_nonneg (by linarith) (sub_nonneg.mpr hd)) (sq_nonneg _))
 have hQ : 0 ≤ Q := (mul_nonneg_iff_of_pos_left (by linarith : 0<4*(H-1))).mp hn
 have hf0 : 0 ≤ F := le_trans hQ hF
 exact sub_nonneg.mp hf0

theorem weight_nonnegM37B (P : ℝ[X]) (n : ℕ) (k : ℤ)
 (hp : ∀ r, 0 ≤ P.coeff r) (r : ℕ) : 0 ≤ weightM37B P n k r := by
 unfold weightM37B zchooseM37B
 split_ifs
 · simp
 · exact mul_nonneg (hp r) (by positivity)

theorem binomial_lc_supportM37B (P : ℝ[X]) (n : ℕ) (k : ℤ) (A B : ℝ)
 (hp : ∀ r, 0 ≤ P.coeff r)
 (hx : ∀ r∈P.support, weightM37B P n k r≠0 →
   A ≤ (k:ℝ)+2-r ∧ (k:ℝ)+2-r ≤ B)
 (hd : (n+2:ℝ)*(A+B-1)^2 ≤ 4*(n+1)*A*B) :
 CoeffSeq ((1+X)^n*P) k*CoeffSeq ((1+X)^n*P) (k+2) ≤
 CoeffSeq ((1+X)^n*P) (k+1)^2 := by
 apply (moment_lc_iffM37B P n k).mpr
 have h := support_moment_gapM37B P.support (weightM37B P n k)
   (fun r => (k:ℝ)+2-r) A B (n+2) (by have := Nat.cast_nonneg (α := ℝ) n; linarith)
   (fun r _ => weight_nonnegM37B P n k hp r) hx (by convert hd using 1 <;> ring)
 change (n+2)*(massM37B P n k*secondM37B P n k-(firstM37B P n k)^2) ≤
   firstM37B P n k*((n+2)*massM37B P n k-firstM37B P n k) at h
 exact sub_nonneg.mpr h

end
end MathGKM.Markov
