import MarkovHighDefsM81F
import MarkovFallingSeed3M81F
import MarkovFallingSeed5M81F
import MarkovFallingSeed7M81F
import MarkovStripGeneralSourceMCE8
import MarkovBinomialRatios6a40
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
theorem high_seed2_scaledM81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) (a q : ℝ) :
 ((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*(((1+(X:ℝ[X]))^(k+l-3)*stripSecondSeedMCE8 a (k+l+2) q).coeff (k+0))=
 ((k+l).choose k:ℝ)*highJM81F a k l q := by
 have h := falling_seed3M81F (k+0) (l-0) (by omega) (8*q) (9*a^2-5*a+2) (6*a^2+6*a*(k+l+2)-16*a+4) ((a+k+l+1)*(a+k+l))
 rw [show k+0+(l-0)=k+l by omega] at h
 push_cast [Nat.cast_sub (show 0 ≤ l by omega)] at h
 have he : stripSecondSeedMCE8 a (k+l+2) q=C (8*q)*X^0+C (9*a^2-5*a+2)*X^1+C (6*a^2+6*a*(k+l+2)-16*a+4)*X^2+C ((a+k+l+1)*(a+k+l))*X^3 := by
  simp only [stripSecondSeedMCE8,stripQuadMB9D,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
  ring
 rw [←he] at h
 unfold highJM81F at ⊢
 linear_combination h
theorem high_seed3_scaledM81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) (a q t u : ℝ) :
 ((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*((k:ℝ)+l-3)*((k:ℝ)+l-4)*(k+1)*(((1+(X:ℝ[X]))^(k+l-5)*h3seedM13D a (k+l+2) q t u).coeff (k+1))=
 ((k+l).choose k:ℝ)*l*highHM81F a k l q t u := by
 have h := falling_seed5M81F (k+1) (l-1) (by omega) (h3c0M13D u) (h3c1M13D a q t) (h3c2M13D a (k+l+2) q) (h3c3M13D a (k+l+2)) (h3c4M13D a (k+l+2)) (h3c5M13D a (k+l+2))
 rw [show k+1+(l-1)=k+l by omega] at h
 push_cast [Nat.cast_sub (show 1 ≤ l by omega)] at h
 have he : h3seedM13D a (k+l+2) q t u=C (h3c0M13D u)*X^0+C (h3c1M13D a q t)*X^1+C (h3c2M13D a (k+l+2) q)*X^2+C (h3c3M13D a (k+l+2))*X^3+C (h3c4M13D a (k+l+2))*X^4+C (h3c5M13D a (k+l+2))*X^5 := by
  simp only [h3seedM13D,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
  ring
 rw [←he] at h
 have hb0 := bc_lower6 (k+l) k
 unfold bc6 at hb0
 push_cast at hb0
 unfold highHM81F at ⊢
 linear_combination (norm := (simp only [highHM81F]; ring_nf)) ((k:ℝ)+1)*h+(highHM81F a k l q t u)*hb0
theorem high_seed4_scaledM81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) (a q t u v w z : ℝ) :
 ((k:ℝ)+l)*((k:ℝ)+l-1)*((k:ℝ)+l-2)*((k:ℝ)+l-3)*((k:ℝ)+l-4)*((k:ℝ)+l-5)*((k:ℝ)+l-6)*(k+1)*(k+2)*(((1+(X:ℝ[X]))^(k+l-7)*h4seedM511 a (k+l+2) q t u v w z).coeff (k+2))=
 ((k+l).choose k:ℝ)*l*(l-1)*highIM81F a k l q t u v w z := by
 have h := falling_seed7M81F (k+2) (l-2) (by omega) (h4c0M511 a (k+l+2) q t u v w z) (h4c1M511 a (k+l+2) q t u v w z) (h4c2M511 a (k+l+2) q t u v w z) (h4c3M511 a (k+l+2) q t u v w z) (h4c4M511 a (k+l+2) q t u v w z) (h4c5M511 a (k+l+2) q t u v w z) (h4c6M511 a (k+l+2) q t u v w z) (h4c7M511 a (k+l+2) q t u v w z)
 rw [show k+2+(l-2)=k+l by omega] at h
 push_cast [Nat.cast_sub (show 2 ≤ l by omega)] at h
 have he : h4seedM511 a (k+l+2) q t u v w z=C (h4c0M511 a (k+l+2) q t u v w z)*X^0+C (h4c1M511 a (k+l+2) q t u v w z)*X^1+C (h4c2M511 a (k+l+2) q t u v w z)*X^2+C (h4c3M511 a (k+l+2) q t u v w z)*X^3+C (h4c4M511 a (k+l+2) q t u v w z)*X^4+C (h4c5M511 a (k+l+2) q t u v w z)*X^5+C (h4c6M511 a (k+l+2) q t u v w z)*X^6+C (h4c7M511 a (k+l+2) q t u v w z)*X^7 := by
  simp only [h4seedM511,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one]
  ring
 rw [←he] at h
 have hb0 := bc_lower6 (k+l) k
 unfold bc6 at hb0
 push_cast at hb0
 have hb1 := bc_lower6 (k+l) (k+1)
 unfold bc6 at hb1
 push_cast at hb1
 unfold highIM81F at ⊢
 linear_combination (norm := (simp only [highIM81F]; ring_nf)) ((k:ℝ)+1)*(k+2)*h+(highIM81F a k l q t u v w z)*((l-1)*hb0+(k+1)*hb1)
end
end MathGKM.Markov
