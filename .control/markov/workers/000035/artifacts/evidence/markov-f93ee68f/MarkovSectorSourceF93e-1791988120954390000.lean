import MarkovSectorWitnessF93e
/-! Machine-authored f93ee68f. The sector witness is a literal raw source row.
The row satisfies raw log-concavity; the stronger root-sector strategy fails. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 0
set_option maxRecDepth 10000

def sectorRowF93e : Polynomial ℤ :=
 (Bivariate.swap (frame (List.replicate 22 true)).mid.p).coeff 26

theorem sector_int_degreeF93e :
 (hornerPolyF93e ℤ sectorListF93e).natDegree=20 := by
 unfold sectorListF93e
 simp only [hornerPolyF93e,mul_zero,add_zero]
 compute_degree!

theorem sector_source_rowF93e :
 sectorRowF93e=hornerPolyF93e ℤ sectorListF93e := by
 ext i
 rw [sectorRowF93e,swap_coeff46,right_coeff_sum9a72]
 by_cases hi : i≤20
 · interval_cases i <;>
     norm_num [pellSum9a72,Finset.sum_range_succ,Nat.choose,
       hornerPolyF93e,sectorListF93e,Polynomial.coeff_X_mul]
 · rw [Polynomial.coeff_eq_zero_of_natDegree_lt (by rw [sector_int_degreeF93e]; omega)]
   simp [pellSum9a72,hi]

theorem sector_map_rowF93e :
 sectorRowF93e.map (Int.castRingHom ℂ)=sectorPolyF93e := by
 rw [sector_source_rowF93e]
 norm_num [sectorPolyF93e,sectorListF93e,hornerPolyF93e,Polynomial.C_ofNat]

theorem source_horizontal_sector_failureF93e : ∃ z : ℂ,
 (sectorRowF93e.map (Int.castRingHom ℂ)).eval z=0 ∧
 z.re<0 ∧ 3*z.re^2<z.im^2 := by
 rw [sector_map_rowF93e]
 exact sector_root_outsideF93e

theorem sector_source_labelsF93e :
 (frame (List.replicate 22 true)).mid.a=23 ∧
 (frame (List.replicate 22 true)).mid.b=24 := by
 exact right_labels650 22

theorem sector_row_polygonF93e (i : ℕ) :
 InPolygon 23 24 i 26 ↔ i≤20 := by
 unfold InPolygon
 omega

theorem sector_source_row_lcF93e (i : ℕ) :
 coeff (frame (List.replicate 22 true)).mid.p i 26 *
 coeff (frame (List.replicate 22 true)).mid.p (i+2) 26 ≤
 coeff (frame (List.replicate 22 true)).mid.p (i+1) 26 ^ 2 := by
 have he (k : ℕ) : coeff (frame (List.replicate 22 true)).mid.p k 26 =
     (hornerPolyF93e ℤ sectorListF93e).coeff k := by
   rw [← sector_source_rowF93e]
   exact (swap_coeff46 _ _ _).symm
 simp only [he]
 by_cases hi : i≤20
 · interval_cases i <;>
     norm_num [hornerPolyF93e,sectorListF93e,Polynomial.coeff_X_mul,Polynomial.coeff_X]
 · rw [Polynomial.coeff_eq_zero_of_natDegree_lt (by rw [sector_int_degreeF93e]; omega),zero_mul]
   exact sq_nonneg _

#print axioms sector_source_rowF93e
#print axioms source_horizontal_sector_failureF93e
#print axioms sector_source_row_lcF93e
end
end MathGKM.Markov
