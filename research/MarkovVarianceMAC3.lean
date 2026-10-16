import MarkovBinomialGapMAC3
/-! Machine-authored ac3d4ab9. Weighted bounded-support variance criterion.
All weights can vanish; no normalization by their sum is used. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem bounded_momentsMAC3 {ι : Type*} (s : Finset ι) (q x : ι → ℝ)
 (A B H : ℝ) (hA : 0 ≤ A) (hBH : B ≤ H) (hH : 0 ≤ H)
 (hq : ∀ r∈s, 0 ≤ q r) (hx : ∀ r∈s, A ≤ x r ∧ x r ≤ B)
 (hgap : H*(B-A)^2 ≤ 4*A*(H-B)) :
 let Q := ∑ r∈s, q r
 let U := ∑ r∈s, q r*x r
 let V := ∑ r∈s, q r*x r^2
 H*(Q*V-U^2) ≤ U*(H*Q-U) := by
 dsimp only
 let Q := ∑ r∈s, q r
 let U := ∑ r∈s, q r*x r
 let V := ∑ r∈s, q r*x r^2
 change H*(Q*V-U^2) ≤ U*(H*Q-U)
 have hQ : 0 ≤ Q := Finset.sum_nonneg hq
 have hUlo : A*Q ≤ U := by
   dsimp [Q,U]
   rw [Finset.mul_sum]
   exact Finset.sum_le_sum (fun r hr => by nlinarith [mul_nonneg (hq r hr) (sub_nonneg.mpr (hx r hr).1)])
 have hUhi : U ≤ B*Q := by
   dsimp [Q,U]
   rw [Finset.mul_sum]
   exact Finset.sum_le_sum (fun r hr => by nlinarith [mul_nonneg (hq r hr) (sub_nonneg.mpr (hx r hr).2)])
 have hV : V ≤ (A+B)*U-A*B*Q := by
   have hh := Finset.sum_nonneg (s := s) (f := fun r => q r*((x r-A)*(B-x r)))
     (fun r hr => mul_nonneg (hq r hr) (mul_nonneg (sub_nonneg.mpr (hx r hr).1) (sub_nonneg.mpr (hx r hr).2)))
   have he : (∑ r∈s, q r*((x r-A)*(B-x r)))=(A+B)*U-A*B*Q-V := by
     dsimp [Q,U,V]
     simp only [Finset.mul_sum,←Finset.sum_sub_distrib]
     apply Finset.sum_congr rfl
     intro r hr
     ring
   rw [he] at hh
   linarith
 have hv : 4*(Q*V-U^2) ≤ (B-A)^2*Q^2 := by
   have hh := mul_le_mul_of_nonneg_left hV hQ
   nlinarith [sq_nonneg (2*U-(A+B)*Q)]
 have hu0 : 0 ≤ U := le_trans (mul_nonneg hA hQ) hUlo
 have hlo : A*(H-B)*Q^2 ≤ U*(H*Q-U) := by
   have hz : 0 ≤ (H-B)*Q := mul_nonneg (sub_nonneg.mpr hBH) hQ
   have h1 := mul_le_mul_of_nonneg_right hUlo hz
   have h2 := mul_le_mul_of_nonneg_left (show (H-B)*Q ≤ H*Q-U by nlinarith) hu0
   nlinarith only [h1,h2]
 have hh := mul_le_mul_of_nonneg_left hv hH
 have hg := mul_le_mul_of_nonneg_right hgap (sq_nonneg Q)
 nlinarith only [hh,hg,hlo]

theorem moment_mixture_lcMAC3 {ι : Type*} (s : Finset ι) (q x : ι → ℝ)
 (A B H : ℝ) (hA : 0 ≤ A) (hBH : B ≤ H) (hH : 1 ≤ H)
 (hq : ∀ r∈s, 0 ≤ q r) (hx : ∀ r∈s, A ≤ x r ∧ x r ≤ B)
 (hgap : H*(B-A)^2 ≤ 4*A*(H-B)) :
 (∑ r∈s, q r*x r*(x r-1)) *
 (∑ r∈s, q r*(H-x r)*(H-x r-1)) ≤
 (∑ r∈s, q r*x r*(H-x r))^2 := by
 let Q := ∑ r∈s, q r
 let U := ∑ r∈s, q r*x r
 let V := ∑ r∈s, q r*x r^2
 have hh := bounded_momentsMAC3 s q x A B H hA hBH (by linarith) hq hx hgap
 change H*(Q*V-U^2) ≤ U*(H*Q-U) at hh
 have heL : (∑ r∈s, q r*x r*(x r-1))=V-U := by
   dsimp [V,U]; rw [←Finset.sum_sub_distrib]
   apply Finset.sum_congr rfl; intro r hr; ring
 have heM : (∑ r∈s, q r*x r*(H-x r))=H*U-V := by
   dsimp [V,U]; rw [Finset.mul_sum,←Finset.sum_sub_distrib]
   apply Finset.sum_congr rfl; intro r hr; ring
 have heR : (∑ r∈s, q r*(H-x r)*(H-x r-1))=H*(H-1)*Q-(2*H-1)*U+V := by
   dsimp [Q,V,U]
   simp only [Finset.mul_sum,←Finset.sum_sub_distrib,←Finset.sum_add_distrib]
   apply Finset.sum_congr rfl; intro r hr; ring
 rw [heL,heM,heR]
 have hg := mul_nonneg (sub_nonneg.mpr hH) (sub_nonneg.mpr hh)
 nlinarith only [hg]
end
end MathGKM.Markov
