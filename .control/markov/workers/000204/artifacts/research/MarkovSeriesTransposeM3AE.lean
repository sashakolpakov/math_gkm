import MarkovGFSectionM13E
import MarkovQuadraticKernelM9E2
/-! Machine-authored request 3ae33435. Exact coefficient transposition;
the two formal variables are interchanged without specialization. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries Finset
set_option maxHeartbeats 4000000

def seriesTransposeM3AE {R : Type*} [CommRing R] :
 PowerSeries (Polynomial R) →+* PowerSeries (PowerSeries R) where
 toFun f := PowerSeries.mk fun i => PowerSeries.mk fun n => (PowerSeries.coeff n f).coeff i
 map_one' := by
  apply PowerSeries.ext; intro i
  apply PowerSeries.ext; intro n
  simp only [coeff_mk,coeff_one,Polynomial.coeff_one]
  split_ifs <;> simp_all [Polynomial.coeff_one]
 map_mul' f g := by
  apply PowerSeries.ext; intro i
  apply PowerSeries.ext; intro n
  simp only [coeff_mk,PowerSeries.coeff_mul,map_sum,Polynomial.finsetSum_coeff,
    Polynomial.coeff_mul]
  exact Finset.sum_comm
 map_zero' := by
  apply PowerSeries.ext; intro i
  apply PowerSeries.ext; intro n
  simp
 map_add' f g := by
  apply PowerSeries.ext; intro i
  apply PowerSeries.ext; intro n
  simp

theorem series_transpose_coeffM3AE {R : Type*} [CommRing R]
 (f : PowerSeries (Polynomial R)) (i n : ℕ) :
 PowerSeries.coeff n (PowerSeries.coeff i (seriesTransposeM3AE f))=
 (PowerSeries.coeff n f).coeff i := by simp [seriesTransposeM3AE]

theorem series_transpose_XM3AE {R : Type*} [CommRing R] :
 seriesTransposeM3AE (X : PowerSeries (Polynomial R))=C (X : PowerSeries R) := by
 apply PowerSeries.ext; intro i
 apply PowerSeries.ext; intro n
 simp [series_transpose_coeffM3AE,coeff_X,coeff_C,Polynomial.coeff_one]
 split_ifs <;> simp_all [Polynomial.coeff_one,coeff_X]

theorem series_transpose_CM3AE {R : Type*} [CommRing R] (p : Polynomial R) :
 seriesTransposeM3AE (C p)=PowerSeries.map (C : R →+* PowerSeries R) p.toPowerSeries := by
 apply PowerSeries.ext; intro i
 apply PowerSeries.ext; intro n
 simp [series_transpose_coeffM3AE,coeff_C,coeff_map]
 split_ifs <;> simp_all

theorem series_transpose_uM3AE : seriesTransposeM3AE (C U)=X := by
 rw [series_transpose_CM3AE]
 simp [U]

theorem series_transpose_vM3AE : seriesTransposeM3AE (C V)=C (C Polynomial.X) := by
 rw [series_transpose_CM3AE]
 simp [V]

end
end MathGKM.Markov
