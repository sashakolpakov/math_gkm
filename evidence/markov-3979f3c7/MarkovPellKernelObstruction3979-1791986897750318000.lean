import MarkovPellMixture3979
/-! Machine-authored 3979f3c7. Multiplying the exact excess series by one
additional positive geometric factor does not preserve the requested cross-strip LC.
The deformed series is not asserted to be a source family. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def prefixSeries3979 (s : ℕ) : BiSeries00b3 := excessSeries00b3 s*geomX00b3
def prefixCoeff3979 (s i j : ℕ) : ℤ :=
 PowerSeries.coeff j (PowerSeries.coeff i (prefixSeries3979 s))

theorem prefix_coeff_sum3979 (s i j : ℕ) :
 prefixCoeff3979 s i j=∑ k ∈ Finset.range (i+1), excessCoeff00b3 s k j := by
 unfold prefixCoeff3979 prefixSeries3979
 rw [PowerSeries.coeff_mul]
 simp only [geomX00b3,PowerSeries.coeff_mk,Pi.one_apply,mul_one,map_sum]
 rw [Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
 rfl

theorem excess_pos_coeff3979 (s i j : ℕ) :
 excessCoeff00b3 (s+1) i j=lowerCoeff00b3 s i j := by
 rw [excessCoeff00b3,excess_succ00b3,lower_series_coeff00b3]

theorem prefix_values3979 :
 prefixCoeff3979 0 10 0=11 ∧ prefixCoeff3979 1 10 1=155 ∧
 prefixCoeff3979 2 10 2=2202 := by
 constructor
 · simp [prefix_coeff_sum3979,excess_zero00b3]
 constructor
 · rw [prefix_coeff_sum3979]
   change (∑ k ∈ Finset.range 11, excessCoeff00b3 (0+1) k 1)=155
   simp only [excess_pos_coeff3979]
   norm_num [lowerCoeff00b3,lowerTerm00b3,Finset.sum_range_succ,Nat.choose]
 · rw [prefix_coeff_sum3979]
   change (∑ k ∈ Finset.range 11, excessCoeff00b3 (1+1) k 2)=2202
   simp only [excess_pos_coeff3979]
   norm_num [lowerCoeff00b3,lowerTerm00b3,Finset.sum_range_succ,Nat.choose]

theorem positive_geometric_smoothing_failure3979 :
 prefixCoeff3979 1 10 1^2 < prefixCoeff3979 0 10 0*prefixCoeff3979 2 10 2 := by
 rw [prefix_values3979.1,prefix_values3979.2.1,prefix_values3979.2.2]
 norm_num

#print axioms prefix_coeff_sum3979
#print axioms positive_geometric_smoothing_failure3979
end
end MathGKM.Markov
