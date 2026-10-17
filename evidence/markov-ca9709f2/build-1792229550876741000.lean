import MarkovTopBetaMeanMCA9
/-! Machine-authored ca9709f2. Finite symmetric inward comparison with zeros.
No support positions are removed and no probability assumptions are used. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

theorem inward_orderMCA9 (m : ℕ) (f : ℕ → ℝ)
 (hs : ∀ k, k ≤ m → f (m-k)=f k)
 (hi : ∀ k, 2*k+1 ≤ m → f k ≤ f (k+1))
 (k l : ℕ) (hk : k ≤ m) (hl : l ≤ m)
 (hkl : min k (m-k) ≤ min l (m-l)) : f k ≤ f l := by
 have hf (x : ℕ) (hx : x ≤ m) : f x=f (min x (m-x)) := by
   rcases le_total x (m-x) with h|h
   · rw [min_eq_left h]
   · rw [min_eq_right h,hs x hx]
 rw [hf k hk,hf l hl]
 have ht : ∀ a b, a ≤ b → 2*b ≤ m → f a ≤ f b := by
   intro a b hab hb
   induction b, hab using Nat.le_induction with
   | base => exact le_rfl
   | succ b hab ih =>
     exact (ih (by omega)).trans (hi b (by omega))
 apply ht _ _ hkl
 have h0 := min_le_left l (m-l)
 have h1 := min_le_right l (m-l)
 omega

theorem radial_covarianceMCA9 (m : ℕ) (w f g : ℕ → ℝ)
 (hw : ∀ k, k ≤ m → 0 ≤ w k)
 (hfs : ∀ k, k ≤ m → f (m-k)=f k)
 (hfi : ∀ k, 2*k+1 ≤ m → f k ≤ f (k+1))
 (hgs : ∀ k, k ≤ m → g (m-k)=g k)
 (hgi : ∀ k, 2*k+1 ≤ m → g k ≤ g (k+1)) :
 (∑ k ∈ range (m+1), w k*f k)*(∑ k ∈ range (m+1), w k*g k) ≤
 (∑ k ∈ range (m+1), w k)*(∑ k ∈ range (m+1), w k*f k*g k) := by
 have hpair (k l : ℕ) (hk : k ≤ m) (hl : l ≤ m) :
   0 ≤ (f k-f l)*(g k-g l) := by
   rcases le_total (min k (m-k)) (min l (m-l)) with h|h
   · exact mul_nonneg_of_nonpos_of_nonpos
       (sub_nonpos.mpr (inward_orderMCA9 m f hfs hfi k l hk hl h))
       (sub_nonpos.mpr (inward_orderMCA9 m g hgs hgi k l hk hl h))
   · exact mul_nonneg
       (sub_nonneg.mpr (inward_orderMCA9 m f hfs hfi l k hl hk h))
       (sub_nonneg.mpr (inward_orderMCA9 m g hgs hgi l k hl hk h))
 have hh : 0 ≤ ∑ k ∈ range (m+1), ∑ l ∈ range (m+1),
   w k*w l*((f k-f l)*(g k-g l)) := by
   apply sum_nonneg; intro k hk
   apply sum_nonneg; intro l hl
   have hk' : k ≤ m := by simpa using hk
   have hl' : l ≤ m := by simpa using hl
   exact mul_nonneg (mul_nonneg (hw k hk') (hw l hl')) (hpair k l hk' hl')
 have he : (∑ k ∈ range (m+1), ∑ l ∈ range (m+1),
   w k*w l*((f k-f l)*(g k-g l)))=
   2*((∑ k ∈ range (m+1), w k)*(∑ k ∈ range (m+1), w k*f k*g k)-
   (∑ k ∈ range (m+1), w k*f k)*(∑ k ∈ range (m+1), w k*g k)) := by
   calc
    _ = ∑ k ∈ range (m+1), ∑ l ∈ range (m+1),
      ((w k*f k*g k)*w l+w k*(w l*f l*g l)-
      (w k*f k)*(w l*g l)-(w k*g k)*(w l*f l)) := by
      apply sum_congr rfl; intro k hk
      apply sum_congr rfl; intro l hl; ring
    _ = _ := by
      simp only [sum_sub_distrib,sum_add_distrib,←mul_sum,←sum_mul]
      ring
 rw [he] at hh
 linarith

theorem beta_scalar_symmetricMCA9 (a H k l : ℤ) :
 betaScalarMCA9 a H k l=betaScalarMCA9 a H l k := by
 unfold betaScalarMCA9; ring

theorem beta_scalar_radialMCA9 (a H k l : ℤ) :
 betaScalarMCA9 a H k l=
 2*(2*a+4)*(k*l)^2+
 2*((a+1)*(a+4)*(H^2+H*(k+l))+
 a*(a+3)*(2*(k+l)^2+3*H*(k+l)+H^2-H-1))*(k*l)-
 a*(a+3)*(k+l)*(k+l-1)*(H+k+l)*(H+k+l+1) := by
 unfold betaScalarMCA9; ring

theorem beta_scalar_inwardMCA9 (a H : ℤ) (m k : ℕ)
 (ha : 1 ≤ a) (hH : 2 ≤ H) (hk : 2*k+1 ≤ m) :
 betaScalarMCA9 a H k ((m-k:ℕ):ℤ) ≤ betaScalarMCA9 a H ((k+1:ℕ):ℤ) ((m-(k+1):ℕ):ℤ) := by
 have hk0 : k ≤ m := by omega
 have hk1 : k+1 ≤ m := by omega
 rw [beta_scalar_radialMCA9,beta_scalar_radialMCA9]
 rw [Nat.cast_sub hk0,Nat.cast_sub hk1]
 push_cast
 have hs0 : (k:ℤ)+((m:ℤ)-k)=(m:ℤ) := by ring
 have hs1 : ((k:ℤ)+1)+((m:ℤ)-((k:ℤ)+1))=(m:ℤ) := by ring
 rw [hs0,hs1]
 have hp0 : 0 ≤ (k:ℤ)*((m:ℤ)-k) := by
   apply mul_nonneg (by positivity); omega
 have hp : (k:ℤ)*((m:ℤ)-k) ≤ ((k:ℤ)+1)*((m:ℤ)-((k:ℤ)+1)) := by
   have hk' : 2*(k:ℤ)+1 ≤ m := by exact_mod_cast hk
   nlinarith
 have hB : 0 ≤ (a+1)*(a+4)*(H^2+H*m)+
   a*(a+3)*(2*(m:ℤ)^2+3*H*m+H^2-H-1) := by
   have hsmall : 0 ≤ H^2-H-1 := by nlinarith
   have hbig : 0 ≤ 2*(m:ℤ)^2+3*H*m+H^2-H-1 := by
     have h0 : 0 ≤ 2*(m:ℤ)^2+3*H*m := by positivity
     linarith
   exact add_nonneg (by positivity) (mul_nonneg (by positivity) hbig)
 have hsq := sq_le_sq₀ hp0 (hp0.trans hp) |>.mpr hp
 nlinarith [mul_nonneg (by omega : 0 ≤ 2*(2*a+4)) (sub_nonneg.mpr hsq),
   mul_nonneg (mul_nonneg (by norm_num : (0:ℤ) ≤ 2) hB) (sub_nonneg.mpr hp)]

end
end MathGKM.Markov
