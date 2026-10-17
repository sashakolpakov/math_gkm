import MarkovCorrectionGeoMED6
/-! Machine-authored ed6bdbeb. Finite affine convolution with zero extension. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries Finset
set_option maxHeartbeats 4000000

theorem correction_core_transposeMED6 (t d : ℕ) (e : ℤ) :
 seriesTransposeM3AE (correctionCoreMED6 t d e)=
 C ((X:PowerSeries ℤ)^d*geoM679 (1:ℤ)^(t+2))*
   (affineGeoMED6 ((X:PowerSeries ℤ)^2) e*geoM679 (X:PowerSeries ℤ)^(t+3)) := by
 simp only [correctionCoreMED6,map_mul,map_pow,map_add,map_sub,map_intCast,
   series_transpose_XM3AE,series_transpose_innerXM3AE,series_transpose_geo_twoM3AE,
   series_transpose_geoM3AE,series_transpose_geo_oneM3AE,affineGeoMED6]
 ring

theorem correction_core_v_coeffMED6 (t d j : ℕ) (e : ℤ) :
 PowerSeries.coeff j (seriesTransposeM3AE (correctionCoreMED6 t d e))=
 ∑ s ∈ range (j+1),
   X^(d+j+s)*C ((3*(s:ℤ)+e)*((t+2+(j-s)).choose (t+2):ℤ))*geoM679 (1:ℤ)^(t+2) := by
 rw [correction_core_transposeMED6,coeff_C_mul,PowerSeries.coeff_mul,
   Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk,mul_sum]
 apply sum_congr rfl
 intro s hs
 have hs : s ≤ j := by simpa using hs
 rw [affine_geo_coeffMED6,show t+3=(t+2)+1 by omega,geo_pow_coeffM679]
 have hex : d+(2*s+(j-s))=d+j+s := by omega
 simp only [←map_natCast (C:ℤ →+* PowerSeries ℤ),←map_intCast (C:ℤ →+* PowerSeries ℤ),map_mul,map_add,map_ofNat]
 calc
  _ = X^(d+(2*s+(j-s)))*
      C ((3*(s:ℤ)+e)*((t+2+(j-s)).choose (t+2):ℤ))*geoM679 (1:ℤ)^(t+2) := by
    simp only [pow_add,pow_mul,map_mul,map_add,map_ofNat,map_intCast]; ring
  _ = _ := by rw [hex]

theorem correction_core_sumMED6 (q t d j : ℕ) (e : ℤ) :
 ((PowerSeries.coeff q (correctionCoreMED6 t d e)).coeff j:ℝ)=
 ∑ s ∈ range (j+1), (3*(s:ℝ)+(e:ℝ))*nbSeqMDB9 (t+2) ((j:ℤ)-s)*
   nbSeqMDB9 (t+1) ((q:ℤ)-(d+j+s)) := by
 rw [←series_transpose_coeffM3AE,correction_core_v_coeffMED6,map_sum,Int.cast_sum]
 apply sum_congr rfl
 intro s hs
 have hs : s ≤ j := by simpa using hs
 have he : X^(d+j+s)*C ((3*(s:ℤ)+e)*((t+2+(j-s)).choose (t+2):ℤ))*geoM679 (1:ℤ)^(t+2)=
   C ((3*(s:ℤ)+e)*((t+2+(j-s)).choose (t+2):ℤ))*(X^(d+j+s)*geoM679 (1:ℤ)^((t+1)+1)) := by ring
 rw [he,coeff_C_mul,Int.cast_mul,geo_shift_realM3AE]
 have hb : nbSeqMDB9 (t+2) ((j:ℤ)-s)=((t+2+(j-s)).choose (t+2):ℝ) := by
   rw [nbSeqMDB9,if_neg (by omega)]
   congr 2
   omega
 simp only [Int.cast_mul,Int.cast_add,Int.cast_ofNat,Int.cast_natCast,hb,Nat.cast_add,Nat.cast_one]

theorem correction_core_kernelMED6 (q t d j : ℕ) (e : ℤ) (h : d+j ≤ q) :
 ((PowerSeries.coeff q (correctionCoreMED6 t d e)).coeff j:ℝ)=
 affineKernelM13E e (t+2) (t+1) j (q-d-j) := by
 rw [correction_core_sumMED6,affineKernelM13E,
   diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _) _ _ (j+1) (by omega)]
 apply sum_congr rfl
 intro s hs
 rw [affineWeightM13E,if_neg (by omega)]
 congr 2
 push_cast
 omega

theorem correction_core_zeroMED6 (q t d j : ℕ) (e : ℤ) (h : q<d+j) :
 ((PowerSeries.coeff q (correctionCoreMED6 t d e)).coeff j:ℝ)=0 := by
 rw [correction_core_sumMED6]
 apply sum_eq_zero
 intro s hs
 rw [nbSeq_zeroMDB9 (t+1) _ (by omega),mul_zero]

end
end MathGKM.Markov
