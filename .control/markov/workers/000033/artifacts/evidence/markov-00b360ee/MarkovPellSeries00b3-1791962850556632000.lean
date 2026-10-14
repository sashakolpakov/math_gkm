import MarkovPellLowerAll00b3
/-! Machine-authored request 00b360ee. Lower-excess rational generating
functions as ordinary nested formal power series over the integers. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

abbrev BiSeries00b3 := PowerSeries (PowerSeries ℤ)
def seriesX00b3 : BiSeries00b3 := PowerSeries.X
def seriesY00b3 : BiSeries00b3 := PowerSeries.C PowerSeries.X
def negativeBinomial00b3 (s : ℕ) : PowerSeries ℤ :=
 PowerSeries.mk (fun n => ((s+n).choose s : ℤ))
def outerBinomial00b3 (s : ℕ) : BiSeries00b3 :=
 PowerSeries.mk (fun n => (((s+n).choose s : ℤ) : PowerSeries ℤ))
def lowerSeries00b3 (s : ℕ) : BiSeries00b3 :=
 (seriesX00b3+seriesY00b3)^(2*s+2)*outerBinomial00b3 (s+1)*
   PowerSeries.C (negativeBinomial00b3 s)

theorem lower_series_denominator00b3 (s : ℕ) :
 lowerSeries00b3 s*(1-seriesX00b3)^(s+2)*(1-seriesY00b3)^(s+1)=
 (seriesX00b3+seriesY00b3)^(2*s+2) := by
 have hx : outerBinomial00b3 (s+1)*(1-seriesX00b3)^(s+2)=1 := by
   simpa [outerBinomial00b3,seriesX00b3,Nat.add_assoc] using
     PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one (PowerSeries ℤ) (s+1)
 have hy : PowerSeries.C (negativeBinomial00b3 s)*(1-seriesY00b3)^(s+1)=1 := by
   have h := congrArg (PowerSeries.C (R:=PowerSeries ℤ))
     (PowerSeries.mk_add_choose_mul_one_sub_pow_eq_one ℤ s)
   simpa [negativeBinomial00b3,seriesY00b3] using h
 calc
  _ = (seriesX00b3+seriesY00b3)^(2*s+2)*
      (outerBinomial00b3 (s+1)*(1-seriesX00b3)^(s+2))*
      (PowerSeries.C (negativeBinomial00b3 s)*(1-seriesY00b3)^(s+1)) := by
    unfold lowerSeries00b3; ring
  _ = _ := by rw [hx,hy]; ring

theorem series_monomial_coeff00b3 (s i j k : ℕ) (hk : k ≤ 2*s+2) :
 PowerSeries.coeff j (PowerSeries.coeff i
   (seriesX00b3^(2*s+2-k)*seriesY00b3^k *
     outerBinomial00b3 (s+1)*PowerSeries.C (negativeBinomial00b3 s))) *
   ((2*s+2).choose k : ℤ) = lowerTerm00b3 s i j k := by
 have he : seriesX00b3^(2*s+2-k)*seriesY00b3^k *
     outerBinomial00b3 (s+1)*PowerSeries.C (negativeBinomial00b3 s) =
   seriesX00b3^(2*s+2-k) *
     (outerBinomial00b3 (s+1)*
       PowerSeries.C (PowerSeries.X^k*negativeBinomial00b3 s)) := by
   simp only [seriesY00b3,map_mul,map_pow]; ring
 rw [he]
 simp only [seriesX00b3,PowerSeries.coeff_X_pow_mul']
 by_cases hi : 2*s+2-k ≤ i
 · rw [if_pos hi,PowerSeries.coeff_mul_C,outerBinomial00b3,PowerSeries.coeff_mk]
   rw [show (((s+1+(i-(2*s+2-k))).choose (s+1) : ℤ) : PowerSeries ℤ) =
     PowerSeries.C (((s+1+(i-(2*s+2-k))).choose (s+1) : ℤ)) by simp]
   rw [PowerSeries.coeff_C_mul,PowerSeries.coeff_X_pow_mul']
   have heq : s+1+(i-(2*s+2-k))=i+k-(s+1) := by omega
   by_cases hj : k ≤ j
   · simp only [if_pos hj,negativeBinomial00b3,PowerSeries.coeff_mk,lowerTerm00b3,heq]
     rw [show s+(j-k)=s+j-k by omega]
   · simp [hj,lowerTerm00b3]
 · rw [if_neg hi,map_zero,zero_mul]
   have hz : (i+k-(s+1)).choose (s+1)=0 := Nat.choose_eq_zero_of_lt (by omega)
   simp [lowerTerm00b3,hz]

theorem lower_series_coeff00b3 (s i j : ℕ) :
 PowerSeries.coeff j (PowerSeries.coeff i (lowerSeries00b3 s))=lowerCoeff00b3 s i j := by
 classical
 unfold lowerSeries00b3
 rw [add_pow,← Finset.sum_range_reflect]
 simp only [Finset.sum_mul,map_sum]
 unfold lowerCoeff00b3
 apply Finset.sum_congr rfl
 intro k hk
 have hkk : k ≤ 2*s+2 := by have := Finset.mem_range.mp hk; omega
 have he : 2*s+2+1-1-k=2*s+2-k := by omega
 simp only [he,Nat.sub_sub_self hkk,Nat.choose_symm hkk]
 have h := series_monomial_coeff00b3 s i j k hkk
 calc
  _ = PowerSeries.coeff j (PowerSeries.coeff i
    ((seriesX00b3^(2*s+2-k)*seriesY00b3^k *
     outerBinomial00b3 (s+1)*PowerSeries.C (negativeBinomial00b3 s))*
       ((2*s+2).choose k : BiSeries00b3))) := by
    apply congrArg (fun z : BiSeries00b3 => PowerSeries.coeff j (PowerSeries.coeff i z))
    ring
  _ = _ := by simpa only [← nsmul_eq_mul',map_nsmul] using h

theorem right_lower_series00b3 (n i j s : ℕ)
 (hs : s ≤ n) (hij : i+j=n+s+2) :
 coeff (frame (List.replicate n true)).mid.p i j =
 PowerSeries.coeff j (PowerSeries.coeff i (lowerSeries00b3 s)) := by
 rw [lower_series_coeff00b3]
 exact right_lower_all00b3 n i j s hs hij

#print axioms lower_series_denominator00b3
#print axioms right_lower_series00b3
end
end MathGKM.Markov
