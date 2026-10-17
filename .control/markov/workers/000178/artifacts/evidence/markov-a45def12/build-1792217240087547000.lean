import MarkovUpperReductionMA45
/-! Machine-authored a45def12. Exact weight-series representation and vanishing
determinants. No Schur positivity or remaining ratio inequality is assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem q_weight_nat_positiveMA45 (n : ℕ) : qWeightM7E2 (n+1) = 4*(n+1:ℝ) := by
 simp only [qWeightM7E2,if_neg (by omega : ¬(n:ℤ)+1<0),
   if_neg (by omega : (n:ℤ)+1≠0),Int.cast_add,Int.cast_natCast,Int.cast_one]

def weightSeriesMA45 : PowerSeries ℝ := PowerSeries.mk (fun n => qWeightM7E2 n)

theorem weight_series_splitMA45 : weightSeriesMA45 =
 1+PowerSeries.C (4:ℝ)*(negBinMA45 1*PowerSeries.X) := by
 ext n
 cases n with
 | zero => simp [weightSeriesMA45,qWeightM7E2]
 | succ n =>
   have hx := PowerSeries.coeff_mul_X_pow (negBinMA45 1) 1 n
   simp only [pow_one] at hx
   simp only [weightSeriesMA45,PowerSeries.coeff_mk,map_add,
     PowerSeries.coeff_one,show n+1≠0 by omega,ite_false,zero_add,
     PowerSeries.coeff_C_mul,hx,Nat.cast_add,Nat.cast_one,q_weight_nat_positiveMA45,
     negBin_coeffMA45]
   rw [show 1+n=n+1 by omega,Nat.choose_succ_self_right]
   push_cast
   ring

theorem geom_squared_inverseMA45 : negBinMA45 1*(1-PowerSeries.X)^2=1 := by
 have h : geomMA45*(1-PowerSeries.X)=1 := PowerSeries.mk_one_mul_one_sub_eq_one ℝ
 unfold negBinMA45
 norm_num only [show 1+1=2 by omega]
 rw [← mul_pow,h,one_pow]

theorem weight_series_factorMA45 : weightSeriesMA45 =
 (1+PowerSeries.X)^2*negBinMA45 1 := by
 rw [weight_series_splitMA45]
 have h := geom_squared_inverseMA45
 have hc : PowerSeries.C (4:ℝ)=(4:PowerSeries ℝ) := map_ofNat _ _
 rw [hc]
 calc
  _ = negBinMA45 1*(1-PowerSeries.X)^2+4*(negBinMA45 1*PowerSeries.X) := by rw [h]
  _ = _ := by ring

theorem weight_series_rationalMA45 :
 weightSeriesMA45*(1-PowerSeries.X)^2=(1+PowerSeries.X)^2 := by
 rw [weight_series_factorMA45,mul_assoc,geom_squared_inverseMA45,mul_one]

theorem affine_three_det_zeroMA45 (a b c x y z : ℝ) :
 Matrix.det !![a+x,a+y,a+z; b+x,b+y,b+z; c+x,c+y,c+z]=0 := by
 simp only [Matrix.det_fin_three,Matrix.of_apply,Matrix.cons_val',Matrix.cons_val_zero,
   Matrix.cons_val_fin_one,Matrix.cons_val_one,Matrix.cons_val]
 ring

theorem affine_four_det_zeroMA45 (a b c x y z t d e f g : ℝ) :
 Matrix.det !![a+x,a+y,a+z,a+t; b+x,b+y,b+z,b+t; c+x,c+y,c+z,c+t; d,e,f,g]=0 := by
 rw [Matrix.det_succ_row _ 3]
 apply Finset.sum_eq_zero
 intro j hj
 have he : (Matrix.submatrix
     !![a+x,a+y,a+z,a+t; b+x,b+y,b+z,b+t; c+x,c+y,c+z,c+t; d,e,f,g]
     (Fin.succAbove 3) (Fin.succAbove j)).det=0 := by
   fin_cases j <;> simp [Matrix.det_fin_three,Matrix.submatrix,Fin.succAbove,Fin.lt_def,
     Matrix.cons_val',Matrix.cons_val,Matrix.cons_val_fin_one] <;> ring
 rw [he,mul_zero]

theorem weight_333_det_zeroMA45 :
 Matrix.det !![qWeightM7E2 3,qWeightM7E2 4,qWeightM7E2 5;
   qWeightM7E2 2,qWeightM7E2 3,qWeightM7E2 4;
   qWeightM7E2 1,qWeightM7E2 2,qWeightM7E2 3]=0 := by
 norm_num [qWeightM7E2,Matrix.det_fin_three,Matrix.cons_val',Matrix.cons_val,
   Matrix.cons_val_fin_one]

end
end MathGKM.Markov
