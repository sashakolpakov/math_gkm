import MarkovCutSourceFe01
/-! Machine-authored fe01d46b. Positivity and anchored interval support of
every individual cut weight, with zeros kept throughout. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

def PolyNonnegFe01 (p : ℝ[X]) : Prop := ∀ k, 0≤p.coeff k
theorem polyNN_addFe01 {p q : ℝ[X]} (hp : PolyNonnegFe01 p)
 (hq : PolyNonnegFe01 q) : PolyNonnegFe01 (p+q) := by
 intro k; simpa only [Polynomial.coeff_add] using add_nonneg (hp k) (hq k)
theorem polyNN_mulFe01 {p q : ℝ[X]} (hp : PolyNonnegFe01 p)
 (hq : PolyNonnegFe01 q) : PolyNonnegFe01 (p*q) := by
 intro k
 rw [Polynomial.coeff_mul]
 exact sum_nonneg (fun ij _ => mul_nonneg (hp ij.1) (hq ij.2))
theorem polyNN_XFe01 : PolyNonnegFe01 (X:ℝ[X]) := by
 intro k; simp only [Polynomial.coeff_X]; split_ifs <;> norm_num
theorem polyNN_natFe01 (n : ℕ) : PolyNonnegFe01 (n:ℝ[X]) := by
 intro k; simp only [Polynomial.coeff_natCast]; split_ifs <;> positivity

theorem mask_nonneg_generalFe01 (m : List (Bool × Bool)) (p q : ℝ[X])
 (hp : PolyNonnegFe01 p) (hq : PolyNonnegFe01 q) :
 PolyNonnegFe01 (maskWeight340 X p q m) := by
 induction m generalizing p q with
 | nil => exact hq
 | cons rb rs ih =>
   obtain ⟨r,b⟩ := rb
   have hc : PolyNonnegFe01 (cutChargeA27 X p q r) := by
     cases r
     · exact polyNN_natFe01 0
     · exact polyNN_mulFe01 polyNN_XFe01
         (polyNN_addFe01 hp (polyNN_mulFe01 (polyNN_natFe01 2) hq))
   have hf : PolyNonnegFe01 (cutFactorA27 (X:ℝ[X]) r) := by
     cases r
     · exact polyNN_natFe01 1
     · exact polyNN_addFe01 (polyNN_natFe01 1) polyNN_XFe01
   cases b
   · exact ih _ q hc hq
   · exact polyNN_mulFe01 (polyNN_mulFe01 hf (polyNN_addFe01 hp hq))
       (ih X 1 polyNN_XFe01 (polyNN_natFe01 1))

theorem mask_coeff_nonnegFe01 (m : List (Bool × Bool)) (k : ℕ) :
 0≤(maskWeight340 (X:ℝ[X]) X 1 m).coeff k :=
 mask_nonneg_generalFe01 m X 1 polyNN_XFe01 (polyNN_natFe01 1) k

theorem mask_zero_generalFe01 (m : List (Bool × Bool)) (p : ℝ[X])
 (hp : p.coeff 0=0) : (maskWeight340 X p 1 m).coeff 0=1 := by
 induction m generalizing p with
 | nil => simp [maskWeight340]
 | cons rb rs ih =>
   obtain ⟨r,b⟩ := rb
   cases b with
   | false =>
     apply ih
     cases r <;> simp [cutChargeA27,Polynomial.mul_coeff_zero]
   | true =>
     have hf : (cutFactorA27 (X:ℝ[X]) r).coeff 0=1 := by
       cases r <;> simp [cutFactorA27]
     simp only [maskWeight340,if_true,Polynomial.mul_coeff_zero,
       Polynomial.coeff_add,hp,hf,ih X (by simp)]
     norm_num

theorem mask_coeff_zeroFe01 (m : List (Bool × Bool)) :
 (maskWeight340 (X:ℝ[X]) X 1 m).coeff 0=1 :=
 mask_zero_generalFe01 m X (by simp)

theorem mask_no_gapsFe01 (m : List (Bool × Bool)) (j k : ℕ) (hjk : j≤k)
 (hk : 0<(maskWeight340 (X:ℝ[X]) X 1 m).coeff k) :
 0<(maskWeight340 (X:ℝ[X]) X 1 m).coeff j := by
 have h := mask_pf2Fe01 m 0 j j k (by omega) hjk
 simp [toeFe01,hjk,mask_coeff_zeroFe01] at h
 have hn := mask_coeff_nonnegFe01 m (k-j)
 by_contra hj
 have hj' : (maskWeight340 (X:ℝ[X]) X 1 m).coeff j≤0 := by linarith
 have hp := mul_nonpos_of_nonpos_of_nonneg hj' hn
 nlinarith only [h,hk,hp]

theorem sourceTerms_nonnegFe01 (path : List Bool) (s : ℕ)
 (p : ℝ[X]) (hp : p ∈ sourceTermsFe01 path s) : PolyNonnegFe01 p := by
 obtain ⟨m,hm,rfl⟩ := List.mem_map.mp hp
 exact mask_coeff_nonnegFe01 m

#print axioms mask_coeff_nonnegFe01
#print axioms mask_coeff_zeroFe01
#print axioms mask_no_gapsFe01
#print axioms sourceTerms_nonnegFe01
end
end MathGKM.Markov
