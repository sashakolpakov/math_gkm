import MarkovGeometricM679
/-! Machine-authored 6799c386. Explicit finite binomial kernels, including
the zero-exponent and zero-index cases. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 3000000

def risingM679 : ℕ → ℕ → ℕ
 | 0,n => if n=0 then 1 else 0
 | m+1,n => (m+n).choose m

theorem geo_power_coeffM679 {R : Type*} [CommRing R] (v : R) (m n : ℕ) :
 PowerSeries.coeff n (geoM679 v^m)=v^n*(risingM679 m n:R) := by
 cases m with
 | zero => simp only [pow_zero,PowerSeries.coeff_one,risingM679]; split_ifs with h <;> simp_all
 | succ m => exact geo_pow_coeffM679 v m n

def posKernelM679 {R : Type*} [CommRing R] (v : R) (m l s n : ℕ) : R :=
 ∑ ac∈antidiagonal n, ∑ ab∈antidiagonal ac.1,
   (risingM679 m ab.1:R)*(risingM679 l ab.2:R)*(risingM679 s ac.2:R)*
     v^(ab.2+2*ac.2)

theorem positive_kernel_coeffM679 {R : Type*} [CommRing R] (v : R) (m l s n : ℕ) :
 PowerSeries.coeff n (geoM679 (1:R)^m*geoM679 v^l*geoM679 (v^2)^s)=
 posKernelM679 v m l s n := by
 rw [PowerSeries.coeff_mul]
 unfold posKernelM679
 apply sum_congr rfl
 intro ac hac
 rw [PowerSeries.coeff_mul,geo_power_coeffM679,sum_mul]
 apply sum_congr rfl
 intro ab hab
 rw [geo_power_coeffM679,geo_power_coeffM679,one_pow,one_mul,pow_add,pow_mul]
 ring

def shiftKernelM679 {R : Type*} [CommRing R] (v : R) (m l s n : ℕ) : R :=
 posKernelM679 v m l s n+
   if n=0 then 0 else v*posKernelM679 v m l s (n-1)

theorem shifted_kernel_coeffM679 {R : Type*} [CommRing R] (v : R) (m l s n : ℕ) :
 PowerSeries.coeff n ((1+PowerSeries.C v*PowerSeries.X)*
   (geoM679 (1:R)^m*geoM679 v^l*geoM679 (v^2)^s))=
 shiftKernelM679 v m l s n := by
 rw [add_mul,one_mul,map_add,mul_assoc (PowerSeries.C v) PowerSeries.X,
   PowerSeries.coeff_C_mul]
 cases n with
 | zero => simp [shiftKernelM679,positive_kernel_coeffM679]
 | succ n => simp [shiftKernelM679,PowerSeries.coeff_succ_X_mul,positive_kernel_coeffM679]

theorem pos_kernel_mapM679 {R T : Type*} [CommRing R] [CommRing T]
 (f : R →+* T) (v : R) (m l s n : ℕ) :
 f (posKernelM679 v m l s n)=posKernelM679 (f v) m l s n := by
 simp only [posKernelM679,map_sum,map_mul,map_pow,map_natCast]

theorem shift_kernel_mapM679 {R T : Type*} [CommRing R] [CommRing T]
 (f : R →+* T) (v : R) (m l s n : ℕ) :
 f (shiftKernelM679 v m l s n)=shiftKernelM679 (f v) m l s n := by
 unfold shiftKernelM679
 split_ifs <;> simp only [map_add,map_mul,map_zero,pos_kernel_mapM679]

end
end MathGKM.Markov
