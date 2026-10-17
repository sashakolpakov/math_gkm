import MarkovSecondClosedMC3E
/-! Machine-authored 9647c1ba. Quantitative coefficientwise robustness of
all lower cuts. The perturbation hypotheses are explicit, with zeros retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 5000000

theorem product_coeff_monoM964 (A B C D : ℝ[X])
 (hA : ∀ k, 0 ≤ A.coeff k) (hD : ∀ k, 0 ≤ D.coeff k)
 (hAC : ∀ k, A.coeff k ≤ C.coeff k) (hBD : ∀ k, B.coeff k ≤ D.coeff k)
 (k : ℕ) : (A*B).coeff k ≤ (C*D).coeff k := by
 rw [coeff_mul,coeff_mul]
 apply sum_le_sum
 intro p hp
 simpa only [mul_comm] using mul_le_mul (hBD p.2) (hAC p.1) (hA p.1) (hD p.2)

theorem scaled_product_coeffM964 (A C A' C' : ℝ[X]) (x y : ℝ)
 (hx : 0 ≤ x) (hy : 0 ≤ y)
 (hA' : ∀ k, 0 ≤ A'.coeff k) (hC : ∀ k, 0 ≤ C.coeff k)
 (ha : ∀ k, x*A'.coeff k ≤ y*A.coeff k)
 (hc : ∀ k, x*C'.coeff k ≤ y*C.coeff k) (k : ℕ) :
 x^2*(A'*C').coeff k ≤ y^2*(A*C).coeff k := by
 rw [coeff_mul,coeff_mul,mul_sum,mul_sum]
 apply sum_le_sum
 intro p hp
 have h := mul_le_mul (hc p.2) (ha p.1)
   (mul_nonneg hx (hA' p.1)) (mul_nonneg hy (hC p.2))
 nlinarith only [h]

theorem robust_cutM964 (A B C A' B' C' : ℝ[X]) (M N x y : ℝ)
 (hM : 0 < M) (hx : 0 < x) (hy : 0 ≤ y)
 (hA' : ∀ k, 0 ≤ A'.coeff k) (hB : ∀ k, 0 ≤ B.coeff k)
 (hC : ∀ k, 0 ≤ C.coeff k)
 (ha : ∀ k, x*A'.coeff k ≤ y*A.coeff k)
 (hb : ∀ k, B.coeff k ≤ B'.coeff k)
 (hc : ∀ k, x*C'.coeff k ≤ y*C.coeff k)
 (hmargin : y^2*M ≤ x^2*M+y^2*N)
 (hbase : ∀ h k, N*((cutPolyMFEE h B)^2).coeff k ≤
   M*((cutPolyMFEE h B)^2-cutPolyMFEE h A*cutPolyMFEE h C).coeff k)
 (h k : ℕ) :
 0 ≤ ((cutPolyMFEE h B')^2-cutPolyMFEE h A'*cutPolyMFEE h C').coeff k := by
 have hnn (P : ℝ[X]) (hp : ∀ i, 0 ≤ P.coeff i) (i : ℕ) :
     0 ≤ (cutPolyMFEE h P).coeff i := by
   rw [cut_poly_coeffMFEE]; split_ifs; exact hp i; exact le_rfl
 have hsc (P Q : ℝ[X]) (hs : ∀ i, x*P.coeff i ≤ y*Q.coeff i) (i : ℕ) :
     x*(cutPolyMFEE h P).coeff i ≤ y*(cutPolyMFEE h Q).coeff i := by
   simp only [cut_poly_coeffMFEE]; split_ifs; exact hs i; simp
 have hmid (i : ℕ) : (cutPolyMFEE h B).coeff i ≤ (cutPolyMFEE h B').coeff i := by
   simp only [cut_poly_coeffMFEE]; split_ifs; exact hb i; exact le_rfl
 have hb' (i : ℕ) : 0 ≤ (cutPolyMFEE h B').coeff i := (hnn B hB i).trans (hmid i)
 have hp := scaled_product_coeffM964 _ _ _ _ x y hx.le hy
   (hnn A' hA') (hnn C hC) (hsc A' A ha) (hsc C' C hc) k
 have hm := product_coeff_monoM964 _ _ _ _ (hnn B hB) hb' hmid hmid k
 rw [←pow_two,←pow_two] at hm
 have hbn : 0 ≤ ((cutPolyMFEE h B)^2).coeff k := by
   rw [pow_two,coeff_mul]
   exact sum_nonneg (fun p _ => mul_nonneg (hnn B hB _) (hnn B hB _))
 have h0 := mul_le_mul_of_nonneg_left (hbase h k) (sq_nonneg y)
 have h1 := mul_le_mul_of_nonneg_right hmargin hbn
 have h2 := mul_le_mul_of_nonneg_left hp hM.le
 have h3 := mul_le_mul_of_nonneg_left hm (mul_nonneg (sq_nonneg x) hM.le)
 rw [coeff_sub] at h0 ⊢
 have hn : 0 < x^2*M := mul_pos (sq_pos_of_pos hx) hM
 have H : 0 ≤ (x^2*M)*(((cutPolyMFEE h B')^2).coeff k-
     (cutPolyMFEE h A'*cutPolyMFEE h C').coeff k) := by
   nlinarith only [h0,h1,h2,h3]
 exact (mul_nonneg_iff_of_pos_left hn).mp H

end
end MathGKM.Markov
