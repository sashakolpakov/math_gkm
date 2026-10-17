import MarkovMasterColumnM3AE
import MarkovRampGeoM3AE
import MarkovRationalResidualM13E
/-! Machine-authored 3ae33435. Finite sum extraction of the master series. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries Finset
set_option maxHeartbeats 6000000

def rampNatM3AE (s : ℕ) : ℕ := if s=0 then 1 else 4*s

theorem ramp_geo_coeff_natM3AE {R : Type*} [CommRing R] (a : R) (s : ℕ) :
 PowerSeries.coeff s (rampGeoM3AE a)=a^s*(rampNatM3AE s:R) := by
 rw [ramp_geo_coeffM3AE]
 by_cases h : s=0 <;> simp [rampNatM3AE,h]

theorem master_transpose_columnM3AE (t : ℕ) :
 seriesTransposeM3AE (masterColumnM3AE t)=
 C ((X:PowerSeries ℤ)^(t+1)*geoM679 (1:ℤ)^(t+1))*
 (rampGeoM3AE ((X:PowerSeries ℤ)^2)*geoM679 (X:PowerSeries ℤ)^(t+4)) := by
 simp only [masterColumnM3AE,map_mul,map_pow,map_add,map_one,series_transpose_XM3AE,
   series_transpose_innerXM3AE,series_transpose_geo_twoM3AE,
   series_transpose_geoM3AE,series_transpose_geo_oneM3AE,rampGeoM3AE]
 simp only [map_mul,map_pow]
 ring

theorem master_v_coefficientM3AE (t j : ℕ) :
 PowerSeries.coeff j (seriesTransposeM3AE (masterColumnM3AE t))=
 ∑ s ∈ range (j+1),
   X^(t+1+j+s)*C ((rampNatM3AE s:ℤ)*((t+3+(j-s)).choose (t+3):ℤ))*geoM679 (1:ℤ)^(t+1) := by
 rw [master_transpose_columnM3AE,coeff_C_mul,PowerSeries.coeff_mul,
   Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,mul_sum]
 apply sum_congr rfl
 intro s hs
 have hs : s ≤ j := by simpa using hs
 rw [ramp_geo_coeff_natM3AE,show t+4=(t+3)+1 by omega,geo_pow_coeffM679]
 have hex : t+1+(2*s+(j-s))=t+1+j+s := by omega
 simp only [←map_natCast (C:ℤ →+* PowerSeries ℤ),map_mul]
 calc
  _ = X^(t+1+(2*s+(j-s)))*
      C ((rampNatM3AE s:ℤ)*((t+3+(j-s)).choose (t+3):ℤ))*geoM679 (1:ℤ)^(t+1) := by
    simp only [pow_add,pow_mul,map_mul]; ring
  _ = _ := by rw [hex]

theorem geo_shift_realM3AE (n a t : ℕ) :
 (PowerSeries.coeff n (X^a*geoM679 (1:ℤ)^(t+1)):ℝ)=nbSeqMDB9 t ((n:ℤ)-a) := by
 rw [coeff_X_pow_mul']
 by_cases h : a ≤ n
 · rw [if_pos h,geo_pow_coeffM679]
   simp only [one_pow,one_mul]
   rw [nbSeqMDB9,if_neg (by omega)]
   norm_cast
   congr 1
   omega
 · rw [if_neg h,Int.cast_zero,nbSeq_zeroMDB9 t _ (by omega)]

theorem master_sum_realM3AE (n t j : ℕ) :
 ((PowerSeries.coeff n (masterColumnM3AE t)).coeff j:ℝ)=
 ∑ s ∈ range (j+1), rampWeightMF88 s*nbSeqMDB9 (t+3) ((j:ℤ)-s)*
   nbSeqMDB9 t ((n:ℤ)-(t+1+j+s)) := by
 rw [←series_transpose_coeffM3AE,master_v_coefficientM3AE,map_sum,Int.cast_sum]
 apply sum_congr rfl
 intro s hs
 have hs : s ≤ j := by simpa using hs
 have he : X^(t+1+j+s)*C ((rampNatM3AE s:ℤ)*((t+3+(j-s)).choose (t+3):ℤ))*geoM679 (1:ℤ)^(t+1)=
     C ((rampNatM3AE s:ℤ)*((t+3+(j-s)).choose (t+3):ℤ))*(X^(t+1+j+s)*geoM679 (1:ℤ)^(t+1)) := by ring
 rw [he,coeff_C_mul,Int.cast_mul,geo_shift_realM3AE]
 have hr : (rampNatM3AE s:ℝ)=rampWeightMF88 s := by
   by_cases h : s=0 <;> simp [rampNatM3AE,rampWeightMF88,h]
 have hb : nbSeqMDB9 (t+3) ((j:ℤ)-s)=((t+3+(j-s)).choose (t+3):ℝ) := by
   rw [nbSeqMDB9,if_neg (by omega)]
   congr 2
   omega
 simp only [Int.cast_mul,Int.cast_natCast,hr,hb]

end
end MathGKM.Markov
