import MarkovRowParameterM468
/-! Machine-authored 4687d03f. Diagonally reindexed formal series.
The coefficient ring retains the raw row variable. -/
namespace MathGKM.Markov
noncomputable section
open PowerSeries
set_option maxHeartbeats 4000000

def rowJSeriesM468 (N : ℕ) : PowerSeries (Polynomial ℤ) :=
 mk (fun j => rowJMFFD (N+j+1) j)
def rowHSeriesM468 (N : ℕ) : PowerSeries (Polynomial ℤ) :=
 mk (fun j => rowHMFFD (N+j+1) j)
def rowAM468 : PowerSeries (Polynomial ℤ) := 1-C (Polynomial.X+1)*X

theorem rowJ_series_shiftM468 (N : ℕ) :
 rowAM468*rowJSeriesM468 (N+1)=(1-X)*rowJSeriesM468 N := by
 apply PowerSeries.ext
 intro j
 simp only [rowAM468,sub_mul,one_mul,mul_assoc,map_sub,coeff_C_mul]
 cases j with
 | zero => simp [rowJSeriesM468,rowJ_zeroM468]
 | succ j =>
   simp only [coeff_succ_X_mul,rowJSeriesM468,coeff_mk]
   have h := rowJ_parameterM468 (N+j+1) j (by omega)
   simpa only [Nat.add_assoc,Nat.add_left_comm,Nat.add_comm,Nat.reduceAdd] using
     (show rowJMFFD (N+j+1+2) (j+1)-(Polynomial.X+1)*rowJMFFD (N+j+1+1) j=
     rowJMFFD (N+j+1+1) (j+1)-rowJMFFD (N+j+1) j by linear_combination h)

theorem rowH_series_shiftM468 (N : ℕ) :
 rowAM468*rowHSeriesM468 (N+1)=(1-X)*rowHSeriesM468 N := by
 apply PowerSeries.ext
 intro j
 simp only [rowAM468,sub_mul,one_mul,mul_assoc,map_sub,coeff_C_mul]
 cases j with
 | zero => simp [rowHSeriesM468,rowHMFFD,rowJ_zeroM468]
 | succ j =>
   simp only [coeff_succ_X_mul,rowHSeriesM468,coeff_mk]
   have h := rowH_parameterM468 (N+j+1) j (by omega)
   simpa only [Nat.add_assoc,Nat.add_left_comm,Nat.add_comm,Nat.reduceAdd] using
     (show rowHMFFD (N+j+1+2) (j+1)-(Polynomial.X+1)*rowHMFFD (N+j+1+1) j=
     rowHMFFD (N+j+1+1) (j+1)-rowHMFFD (N+j+1) j by linear_combination h)

theorem rowJ_initialM468 (j : ℕ) :
 rowJMFFD (j+1) j=Polynomial.C ((j+3).choose 3:ℤ)*(Polynomial.X+1)^j := by
 unfold rowJMFFD
 rw [show j+1-j-1=0 by omega]
 rw [Finset.sum_eq_single 0]
 · simp only [Nat.sub_zero,Nat.choose_zero_right,Nat.cast_one,mul_one,pow_zero]
   rw [← Nat.choose_symm (by omega : j ≤ j+3),show j+3-j=3 by omega]
 · intro s hs hne
   rw [Nat.choose_eq_zero_of_lt (by omega : 0<s)]
   simp
 · simp

theorem rowJ_series_baseM468 : rowAM468^4*rowJSeriesM468 0=1 := by
 have he : rowJSeriesM468 0 = rescale (Polynomial.X+1)
     (mk (fun j => ((3+j).choose 3 : Polynomial ℤ))) := by
   apply PowerSeries.ext
   intro j
   simp only [rowJSeriesM468,coeff_mk,zero_add,coeff_rescale,rowJ_initialM468]
   simp [Nat.add_comm,mul_comm]
 rw [he]
 have h := congrArg (rescale (Polynomial.X+1))
   (mk_add_choose_mul_one_sub_pow_eq_one (Polynomial ℤ) 3)
 simpa [rowAM468,mul_comm] using h

theorem rowJ_resolventM468 (N : ℕ) :
 rowAM468^(N+4)*rowJSeriesM468 N=(1-X)^N := by
 induction N with
 | zero => simpa using rowJ_series_baseM468
 | succ N ih =>
   calc
    rowAM468^(N+1+4)*rowJSeriesM468 (N+1)=
      rowAM468^(N+4)*(rowAM468*rowJSeriesM468 (N+1)) := by
        rw [show N+1+4=(N+4)+1 by omega,pow_succ]; ring
    _ = rowAM468^(N+4)*((1-X)*rowJSeriesM468 N) := by rw [rowJ_series_shiftM468]
    _ = (1-X)*(rowAM468^(N+4)*rowJSeriesM468 N) := by ring
    _ = (1-X)^(N+1) := by rw [ih,pow_succ]; ring

end
end MathGKM.Markov
